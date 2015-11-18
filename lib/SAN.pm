package Promemoria::SAN;

use utf8;
use SAN::EAD;
use SAN::EAD::Pastor::Meta;
use SAN::EAC;
use SAN::EAC::Pastor::Meta;
use SAN::SCONS;
use SAN::SCONS::Pastor::Meta;
use HTTP::OAI;
use Encode qw( decode_utf8 encode_utf8 );
use Data::Dumper;
use HTML::Entities;

my $model = SAN::EAD::Pastor::Meta->Model;         # Note that this is $class_prefix . 'Pastor::Meta'
my $class = $model->xml_item_class('ead');
BEGIN { $ENV{DBIC_TRACE} = 1 }

our %relazioniProduttoreHash = ();
our @EXPORT = qw($relazioniProduttoreHash);

use constant RELATION_TYPE_PROD  => '193';
use constant RELATION_TYPE_SCONS => '194';

=head1  SAN import

Ricorsivamente importa dati dal SAN per i dati musicali:
 se il padre di un EAD non e' in archivio come Object lo importa
 se un costruttore di un EAD non e' in archivio come Entità lo importa
 se un conservatarore di un EAD non e' in archivio come entità lo importa

E' un pattern dati in Collective Access:

 ca_attributes +-> ca_attribute_values
               +-> ca_metadata_elements

 si collegano a ca_objects e ca_entities in base al ca_attributes.table_num


 etichetta_attributo va cercato in ca_metadata_elements in base all'element_code,
 trovato il quale si registra in ca_attribute_values il suo valore

 ogni attributo viene memorizzato in questo insieme di tabelle
 usando i seguenti attributi:

  (valore, element_code, table_num, row_id)

 posso mettere nel modello una funzione che prenda questo input.

2015/09/06 Aggiornamento: gli attributi container non sono in relazione
1:1 con ca_attribute_values, ma in relazione 1:N, dove attribute_id e'
l'unica foreign key da ca_attribute_values verso ca_attributes,
mentre l'element_id non coincide tra le due tabelle.

Alla luce di questa informazione il pattern che avevo richiuso nel Moose Role
va rivisto.


 Altra funzione potrebbe essere quella che per un oggetto
 prende una lista di nomi e li inserisce in ca_object_labels,
 impostando la prima come preferita e le altre come alias.
 Gli alias hanno un otherlevel come attributo quando arrivano
 dal SAN.

 Ho preparato due ruoli:

  Role::CollectiveAccess::Labels
  Role::CollectiveAccess::Attributes

che si occupano di gestire i metodi di inserimento, questo semplifica il codice in questo modulo.

2015/09/06 Aggiornamento:
Ora alla connessione con il DB imposto delle variabili di sessione che rendono più consono
il comportamento di mysql (non e' ancora un RDBMS vero, ma inizia a somigliargli).
Ora gli attributi NOT NULL vanno inseriti con un valore.
Alla luce anche di questa informazione pure il Role per le Labels va rivisto.

=cut

#
# Costruttori e conservatori saranno ospitati dentro Ca_Entity
#
my $model_eac = SAN::EAC::Pastor::Meta->Model;     # costruttori
my $class_eac = $model_eac->xml_item_class('eac-cpf');

my $model_scons = SAN::SCONS::Pastor::Meta->Model; # conservatori
my $class_scons = $model_scons->xml_item_class('scons');


my $schema;
my $h;
my @CODICI;
my %ELEMENT_ID=();
my $RECURSIVE=0;
my $dbhSQLstandard;

sub set_up {
    my ($codici, $dbischema, $OAIPmh_endpoint, $recursive,$dbh) = @_;
    $schema = $dbischema;
     $h = new HTTP::OAI::Harvester(baseURL=>$OAIPmh_endpoint, force=>1);
    {
	my $rs = $schema->resultset('CaMetadataElement')->search({element_code=>$codici},{columns=>[qw/element_id element_code/ ]});
	while (my $element = $rs->next) {
	    $ELEMENT_ID{$element->element_code}=$element->element_id;
	}
    }
    @CODICI = (keys %ELEMENT_ID);
    $RECURSIVE = 1 if ($recursive);
    $dbhSQLstandard=$dbh;
}

sub add_namespace {
  my ($id) = @_;
  unless ($id =~ /^oai:san\.beniculturali\.it:/) {
      if ($id =~ /san\.cat/) {
	  return "oai:san.beniculturali.it:" . $id;
      }
  }
  return $id;
}

=head2 date_is_real

I campi data nei record di origine possono avere almeno 3 attributi, in particolare nel <date> abbiamo un attributo XML
che formalizza la data in AAAAMMGG

esempi:$ELEMENT_ID
<date localType="date di esistenza" standardDate="18000101/99999999">sec. XIX - </date>
<existDates><dateSet>
<date localType="data di morte" standardDate="19731011">1973 ott 11</date>
<date localType="datx $relationa di nascita" standardDate="18830606">1883 giu 06</date></dateSet></existDates><placeDates>

Nel caso una data '99999999' abbia un 9 come primo carattere
possiamo considerarla undef.

=cut

sub date_is_real {
   my($data) = @_;
   return ('9' ne substr($data, 0, 1) ? $data : undef);
}



=head2 insert_ead

Partendo dal metacodice scritto in Lavoro.org passiamo in data 28/05/2015 all'implementazione.

ead.padre

=cut
sub insert_ead {
    my($ns,$ead) = @_;

    #unless( defined($ead) && $ead->can('identifier') && $scons->identifier->can('recordId')){
    #	print Data::Dumper->Dump($ead);
    #	die ("Scons vuoto o non utilizzabile!");
    #   }

    # verifico se il record e' presente nel db:
    #$DB::single=1;
    my $ead_id = $ead->archdesc->did->unitid->get('__value');
    my $tnx_guard = $schema->txn_scope_guard;
    my $ead_rec = $schema->resultset('CaObject')->find({idno=>$ead_id});
    unless($ead_rec) {
	warn("non trovato $ead_id, aggiungo namespace");
	my $ns_ead_id = add_namespace($ead_id);
	$ead_rec = $schema->resultset('CaObject')->find({idno=>$ns_ead_id});
    }
    if ($ead_rec) { ## rivedere la cancellazione!!
	# il recordo potrebbe essere cambiato??
	# cancello tutti i suoi attributi e li reinserisco.
	#my $rs = $ead_rec->search_related('ca_attributes');
	#$rs->search_related('ca_attribute_values')->delete();
	#$rs->delete();
	#$ead_rec->search_related('ca_object_label')->delete;$ELEMENT_ID
    }

    my $padre;
    # if (ead.padre) # archdesc.relatedmaterial.archref
    #$DB::single=1;

    if (!$RECURSIVE || (!defined $ead->archdesc->relatedmaterial || ($ead->archdesc->relatedmaterial->archref eq $ead->archdesc->did->unitid))) {
	# non ha padre
	$padre = undef;
    } else {
	#$DB::single=1;
	my ($id_padre) = $ead->archdesc->relatedmaterial->archref;
	print $ead->archdesc->did->unitid . " ha padre: \n$id_padre\n";
	#$DB::single=1;
	$padre = $schema->resultset('CaObject')->find({idno=>$id_padre});
	unless ($padre) {
	    $id_padre = add_namespace( $id_padre );
	    $padre = $schema->resultset('CaObject')->find({idno=>$id_padre});
	}
	unless ($padre) {
	    #$DB::single=1;
	    print("Padre mancante!\n");
	    print $ead->archdesc->did->unitid . " ha padre: \n$id_padre\n";
	    print("#######\n");
=head1 Mi aspetto che i padri siano sempre stati inseriti prima!
	    my $response = $h->GetRecord(metadataPrefix=>'ead-san', identifier=>$id_padre, force=>1);
	    if( $response->is_error ) {
		warn "OAI GetRecord(metadataPrefix=>'ead-san', identifier=>$id_padre, force=>1)";
		die $response->message;
	    }

	    my $ead_padre = $class->from_xml_fragment($response->toDOM->getFirstChild->getChildNodes->[2]->getFirstChild->getChildNodes->[1]->getFirstChild);
	    print "inserisco $ead->archdesc->relatedmaterial->archref : padre di $ead->archdesc->did->unitid\n";
	    insert_ead($ead_padre);
	    # die("Manca padre");
	    # insert_ead(ead.padre); significa fare il fetch via OAI-PMH.
=cut
	}
    }
    my $produttore; # facoltativo e ripetibile
    # if (ead.produttore) { # produttore è did.origination

=head1 rivedere
    if (!$RECURSIVE || $ead->archdesc->did->origination && 'XML::Pastor::NodeArray' eq ref $ead->archdesc->did->origination) {
	for ($ead->archdesc->did->origination) {
	    ## fare la find per cercare il produttore, controllare se c'è il namespace oppure no
	    my $id_produttore = $_->get('__value');
	    my $id_produttore_ns = add_namespace($id_produttore);
	    #$produttore = insert_produttore($h, $schema, $class_eac, $id_produttore, $ead);
	    unless ($produttore) {
		#die("Manca produttore per EAD: " . $ead->archdesc->did->unitid);
		print("Manca produttore per EAD: " . $ead->archdesc->did->unitid. " - ". $id_produttore_ns);
	    }
	}
    }
    my $conservatore; # obbligatorio e ripetibile
    # if (ead.conservatore) { # did.repository.id(attributo)
    if (!$RECURSIVE || $ead->archdesc->did->repository->id  && 'XML::Pastor::NodeArray' eq ref $ead->archdesc->did->repository->id) {
	# foreach $ead->archdesc->did->repository
	for ($ead->archdesc->did->repository->id) {
	    ## idem come produttore
	    my $id_conservatore = $_->get('__value');

	    $conservatore = $schema->resultset('CaEntity')->find({idno=>$id_conservatore});
	    # non ricorsivo
	    unless ($conservatore) {
		# eac
		#my $response = $h->GetRecord(metadataPrefix=>'san-scons', identifier=>$id_conservatore, force=>1);
		#if( $response->is_error ) {
		#die "Manca il conservatore $id_conservatore";
		print("Manca conservatore");
		#}

		#my $scons = $class_scons->from_xml_fragment($response$ELEMENT_ID->toDOM->getFirstChild->getChildNodes->[2]->getFirstChild->getChildNodes->[1]->getFirstChild);
		#print "inserisco SCONS $id_conservatore : di $ead->archdesc->did->unitid\n";

		# insert_scons($scons);


		#die("Manca conservatore");
		# insert_conservatore(ead.conservatore);
	    }
	}
    }

    my $strumenti; # facoltativo e ripetibile, non ricorsivo
    # if (ead.strumento_di_ricerca) {  # archdesc.otherfaindid.extref
    if ($RECURSIVE && $ead->archdesc->otherfindaid && $ead->archdesc->otherfindaid->extref) {
	$strumenti = $schema->resultset('CaOccurrencies')->find({idno=>$ead->archdesc->otherfindaid->extref});
	unless ($strumenti) {
	    print("Manca strumento");ELEMENT_ID
	    #insert_strumento_di_ricerca(ead.strumento_di_ricerca);
	}
    }
=cut
    # alcuni attributi di ead sono ripetibili:
    # unittitle con differente type
    # unitdate
    # processinfo
    # relatedmaterial
    # level, otherleve

    my $type_id=172;
    my $idno = $ead_id;
    if ($idno =~ /^oai:san.beniculturali.it:/) { ## || $idno =~ /^san/i perchè l'abbiamo messo???
	$idno = substr($idno, 25);
    }

#$DB::single=1;
    my $denominazione =  decode_entities($ead->archdesc->did->unittitle->get('__value'));

    $ead_rec=$schema->resultset('CaObject')->update_or_create({
	    idno=>$idno,
	    parent_id=> (defined $padre ? $padre->object_id : $padre),
	    type_id=>$type_id,
	    idno_sort=>$idno,
	    source_info=>'Tjs=',
	    access=>1,
	    status=>4,
	    hier_left=>1.0, # sarà aggiornato con gli script php
	    hier_right=>101.0, # sarà aggiornato con gli script php
            hier_object_id=> 0, # sarà aggiornato con gli script php
	    extent=>0,
            deaccession_notes=>'', # not null ma senza default.
	    extent_units=>''
		},
		{key=>'ca_idno'}
	);
    if ($ead_rec->in_storage) {
	# e' avvenuta l'update
    } else {
	$ead_rec->insert();
	# mi sono assicurato che sia avvenuta la scrittura nel db.
    }

    $ead_rec->search_related('ca_object_labels')->create(
	{
	    locale_id    => 9,
	   # type_id      => $type_id,
	    name  => $denominazione,
	    name_sort      => $denominazione,
	    source_info     => '',
	    is_preferred    => 1,
	}
	);

#$DB::single=1;

    my $tipo_livello = $ead->archdesc->_otherlevel->get('__value');
    my $scopecontent = (defined $ead->archdesc->did->abstract) ?  $ead->archdesc->did->abstract->get('__value') : '';


    my @attrs = ();
    push(@attrs,
    {
	element_id=>$ELEMENT_ID{archdesc_level},
	locale_id=>9,
	table_num=>57,
	ca_values=>[{
	    element_id => $ELEMENT_ID{archdesc_level},
	    value_longtext1 => $tipo_livello,
	    source_info=>'',
	},],
    },
    {
	element_id=>$ELEMENT_ID{scopecontent},
	locale_id=>9,
	table_num=>57,
	ca_values=>[{
	    element_id => $ELEMENT_ID{scopecontent},
	    value_longtext1 => $scopecontent,
	    source_info=>'',
	},],
    });

#$DB::single=1;
    $identifier =  $ead->archdesc->did->unitid->identifier->get('__value');
    $extent =  $ead->archdesc->did->physdesc->extent->get('__value');
    $status = defined( $ead->archdesc->processinfo) ? $ead->archdesc->processinfo->get('__value') : '';

    push(@attrs,
	 {
	     element_id => $ELEMENT_ID{external_link},
	     table_num=>57,
	     ca_values  => [
		 {
		     element_id => $ELEMENT_ID{url_source},
		     value_longtext1      => "",
		     source_info=>'',
		 },
		 {
		     element_id => $ELEMENT_ID{url_entry},
		     value_longtext1      => "" . $identifier,
		     source_info=>'',
		 },
		 ],
	 },
	 {
	     element_id=>$ELEMENT_ID{extent},
	     locale_id=>9,
	     table_num=>57,
	     ca_values=>[{
		 element_id => $ELEMENT_ID{extent},
		 value_longtext1 => $extent,
		 source_info=>'',
			 },],
	 },
	 {
	     element_id=>$ELEMENT_ID{record_status},
	     locale_id=>9,
	     table_num=>57,
	     ca_values=>[{
		 element_id => $ELEMENT_ID{record_status},
		 value_longtext1 => $status,
		 source_info=>'',
			 },],
	 }
	);





## SAN
## <unitdate normal="17000101/19991231" datechar="principale">sec. XVIII - sec. XX fine</unitdate>
# $ead->archdesc->did->unitdate->get('__value')			'sec. XVIII - sec. XX fine'
# $ead->archdesc->did->unitdate->_datechar->get('__value')	'principale'
# $ead->archdesc->did->unitdate->_normal->get('__value')	'17000101/19991231'

#$DB::single=1 if  ($idno eq 'san.cat.complArch.79240' );


my $XMLdate = $ead->archdesc->did->unitdate->_normal->get('__value');
#$DB::single=1 if (defined (XMLdate));


    my ($datelongtext,$decStartDate,$decEndDate) = _parseDate($XMLdate);

    push(@attrs,
    {
	element_id=>$ELEMENT_ID{unitdate},
	locale_id=>9,
	table_num=>57,
	ca_values=>[
	    {
		element_id      => $ELEMENT_ID{date_value},
		value_longtext1 =>  $datelongtext,
		value_decimal1  => _decimalDate($decStartDate,1),
		value_decimal2  => _decimalDate($decEndDate,0),
	    },
	    {
		element_id      => $ELEMENT_ID{dateChar},
		value_longtext1 => $ead->archdesc->did->unitdate->_datechar->get('__value'),

	    },
	    {
		element_id      => $ELEMENT_ID{dates_text},
		value_longtext1 => $ead->archdesc->did->unitdate->get('__value'),
	    },
	],
    });



=head1 Inserimento attributi da rivedere

    {
	my $attrs;
	if ('XML::Pastor::NodeArray' eq ref $ead->archdesc->did->unittitle) {
	    my @etichette = map {{otherlevel => $_->otherlevel, nome=>$_->get('__value')}} $ead->archdesc->did->unittitle;
	    $ead_rec->set_names(@etichette);
	}
    }

    {
	my $attrs = {
	    consistenza=>{
		element_id=>$ELEMENT_ID{consistenza},
		locale_id=>9,
		table_num=>57,
		ca_attribute_values=>[{
		    element_id => $ELEMENT_ID{consistenza},
		    value_longtext => $ead->archdesc->did->physdesc->extent,
				      },
		    ],
	    },
	    # scopecontent puo' non esserci
	    scopecontent=>{
		element_id=>$ELEMENT_ID{scopecontent},
		locale_id=>9,
		table_num=>57,
		ca_attribute_values=>[{
		    element_id=>$ELEMENT_ID{scopecontent},
		    value_longtext=>$ead->archdesc->did->abstract,
				      }],
	    },

	    <unitdate normal="17000101/19991231" datechar="principale">sec. XVIII - sec. XX fine</unitdate>

	    data=>{
		element_id=>$ELEMENT_ID{data},
		locale_id=>9,
		table_num=>57,
		ca_attribute_values=>[# puo' esservi piu' di una data
				      {
					  # element_code=>'data_range',
					  element_id=>$ELEMENT_ID{data_range},
					  value_longtext=>$ead->archdesc->did->unitdate,
					  decimal_1 = _manageDate(),
					  decimal_2 = _manageDate(),
				      },
				      {
					  # x $relationelement_code=>'txNoteData',
					  element_id=>$ELEMENT_ID{txNodeData},
					  value_longtext=>undef
				      },
		    ]
	    },
	};

	# Nel file di configurazione c'e' scritto quali @CODICI sono gestiti per l'ead
	# come attributi

	# for my $codice (@CODICI) {
	#    $ead_rec->search_related('ca_attributes')->populate($attrs->{codice});
	# }
	$ead_rec->search_related('ca_attributes')->populate($attrs);

	## aggiungere insert relazioni con conservatore, produttori e strumenti
	$ead_rec->search_related('ca_objects_x_entities')->create();
    }

=cut

	for (@attrs) {
	    eval {
		$ead_rec->search_related('ca_attributes')->create($_);
	    };
	    if ($@) {
		die ("$@" . Data::Dumper::Dump($_));
	    }
	}


	$tnx_guard->commit;
	#$DB::single=1;

	## Insert Soggetto Produttore
	{
	    my $relationNodeArray = $ead->archdesc->did->origination;
	    if (defined $relationNodeArray and $relationNodeArray ne '') {
		    $relationHash = $relationNodeArray->hash('__value');
		    foreach $relationKey ( keys  $relationHash ){
			    INSERTobjectsXentities($ead_rec->object_id,$relationKey, RELATION_TYPE_PROD);
		    }
	    }
	}


	## Insert Soggetto Conservatore
	{
	    my $relationNodeArray = $ead->archdesc->did->repository;
	    if (defined $relationNodeArray and $relationNodeArray ne '' and $relationNodeArray->get('__value') ne 'Archivi della Musica GEA4' ) {
		    $relationHash = $relationNodeArray->hash('_id');
		    foreach $relationKey (keys $relationHash ) {
			    INSERTobjectsXentities($ead_rec->object_id,$relationKey, RELATION_TYPE_SCONS);
		    }
	    }
	}

    return $ead_rec;
}

sub printRelazioniProduttoreHash {
	if (%relazioniProduttoreHash){
		print Dumper(\%relazioniProduttoreHash);
	}
}

sub INSERTentitiesXentities {
	my $dbh = $dbhSQLstandard;
	my $insertWarnings = 0 ;

	if (%relazioniProduttoreHash) {
	    foreach $key ( keys %relazioniProduttoreHash ) {
		if (ref($relazioniProduttoreHash{$key}[1]) eq 'ARRAY'){
		    $relations = $relazioniProduttoreHash{$key}[1];
		    for $i (0 .. scalar @{ $relations } -1 ) {
			if (defined $relazioniProduttoreHash{$key}[0] and defined $relazioniProduttoreHash{$relations->[$i]}[0]){
			    my $right = $relazioniProduttoreHash{$key}[0];
			    my $left  = $relazioniProduttoreHash{$relations->[$i]}[0];
			    print '['.$key.']'.$right." -> ".'['.$relations->[$i].']'.$left. "\n";
			    my $sql  = "INSERT INTO ca_entities_x_entities (entity_left_id,entity_right_id,type_id,source_info) VALUES(?,?,?,?)";
			    my $stmt = $dbh->prepare($sql);
			    if($stmt->execute($right, $left, '143','')) {
			      print "rel ". $right." -> ".$left. " inserted successfully\n";
			      $stmt->finish;
			    }
			} else {
			    print 'ERROR: ['.$key.']'.$relazioniProduttoreHash{$key}[0].
				  " -> ".
					 '['.$relations->[$i].']'.$relazioniProduttoreHash{$relations->[$i]}[0]. "\n";
			    $insertWarnings++;
			}
		    }
		}
	    }
	    #$dbh->disconnect();
	}

	if ($insertWarnings) {print "Sono stati rilevati $insertWarnings problemi sui dati sorgenti\n";}
}

sub INSERTobjectsXentities {
    my ($obj_id,$ide_idno,$type) = @_;

    my $dbh = $dbhSQLstandard;
    my $insertWarnings=0;
    my $sth;

    # query per cercare l'entity_id$ELEMENT_ID
    my $sql = "SELECT entity_id FROM ca_entities WHERE idno='$ide_idno' LIMIT 1";
    $sth = $dbh->prepare($sql);
    $sth->execute();
    my $data = $sth->fetchall_arrayref;
    $sth->finish;

    # query di inserimento
    $sql = "INSERT INTO ca_objects_x_entities (entity_id,object_id,type_id,source_info) VALUES ('".$data->[0][0]."','$obj_id','$type','')";
    $sth = $dbh->prepare($sql);
    if($sth->execute()){
	print "Relation OBJ:". $obj_id." -> ENT:".$data->[0][0]. " inserted successfully type:$type\n";
    } else {
	print "ERROR relation OBJ:". $obj_id." -> ENT:".$data->[0][0]. " type:$type\n";
	$insertWarnings++;
    }
    $sth->finish;

    if ($insertWarnings) {print "Sono stati rilevati $insertWarnings problemi\n";}
}

sub insert_produttore {

    my ($ns,$eac) = @_;
    unless( defined($eac) && $eac->can('control') && $eac->control->can('otherRecordId')){
	print Data::Dumper->Dump($eac);
	die ("EAC vuoto o non utilizzabile!");
    }
    my $eac_id = "" . $eac->control->otherRecordId->__value;
#    $DB::single=1 if ('san.cat.sogC.18784' eq $scons_id);
    my $tnx_guard = $schema->txn_scope_guard;
    my $eac_rec = $schema->resultset('CaEntity')->find({idno=>$eac_id});

    unless($eac_rec) {
	warn("Warning: non trovato $eac_id, aggiungo namespace");
	$eac_rec = $schema->resultset('CaEntity')->find({idno=>add_namespace($eac_id)});
    }

    if ($eac_rec) { ## domanda: cancello solo gli attributi? Anche se ho relazioni con altri oggetti non ci sono problemi, giusto?
	# il recordo potrebbe essere cambiato??
	# cancello tutti i suoi attributi e li reinserisco.
	my $rs = $eac_rec->search_related('ca_attributes');
	$rs->search_related('ca_attribute_values')->delete();
	$rs->delete();
	$eac_rec->search_related('ca_entity_labels')->delete;
	$idno = $eac_rec->idno;
    }

    my $type_id = 174; # il type è sempre 174 soggetto produttore

    my @altre_denominazioni;
    my $denominazione;
    # nameentry e' una lista di nomi
    for my $nameEntry ($eac->cpfDescription->identity->nameEntry) {
	if (defined $nameEntry->localType) {
	    push(@altre_denominazioni, $nameEntry->part->get('__value'));
	    next;
	}

	$denominazione=$nameEntry->part->get('__value');
    }

    my $abstract = (defined $eac->cpfDescription->description->biogHist) ?
	$eac->cpfDescription->description->biogHist->abstract->get('__value') : '';
    my $tipologia = (defined $eac->cpfDescription->identity->entityType) ?
	$eac->cpfDescription->identity->entityType->get('__value') : ''; ## voglio cambiare il tipo di metadato da lista a stringa

    my $idno = $eac_id;
    $eac_rec=$schema->resultset('CaEntity')
	->update_or_create(
	{
	    idno             => $idno,
	    type_id          => $type_id,
	    idno_sort        => $idno,
	    hier_entity_id   => 0,
	    source_info      => 'Tjs=',
	    access           => 1,
	    status           => 0,
	    hier_left        => 1.0,
	    hier_right       => 101.0,
#	    extent           => 0,
#	    extent_units     => '',
	},
	{key=>'ca_idno'}
	);

    if ($eac_rec->in_storage) {
	# e' avvenuta l'update
    } else {
	$eac_rec->insert();
	# mi sono assicurato che sia avvenuta la scrittura nel db.
    }

    $eac_rec->search_related('ca_entity_labels')->create(
	{
	    locale_id    => 9,
	    type_id      => $type_id,
	    displayname  => $denominazione,
	    surname      => substr($denominazione,0,100),
	    # CollectiveAccess definisce come NOT NULL questi valori ma non gli assegna alcun default...
	    # in teoria dovrebbero essere valorizzati con qualcosa di sensato...
	    # e invece no. Sarebbe stato meglio premettere il NULL come valore.
	    name_sort       => $denominazione,
	    forename        => '',
	    other_forenames => '',
	    middlename      => '',
	    prefix          => '',
	    suffix          => '',
	    source_info     => '',
	    is_preferred    => 1,
	}
	);

    # inserimento attributi
     {
	my @attrs = ();
	push(@attrs,
	     {
		 element_id=>$ELEMENT_ID{perma_id},
		 table_num=>20,
		 ca_values=>[{
		     element_id=>$ELEMENT_ID{perma_id},
		     value_longtext1=>$idno,
		     source_info=>'',
		 }]
	     },
	     {
		 element_id=>$ELEMENT_ID{adminbiohist},
		 table_num=>20,
		 ca_values=>[{
		     element_id=>$ELEMENT_ID{adminbiohist},
		     value_longtext1=>$abstract,
		     source_info=>'',
		 }]
	     },
	     {
		 element_id=>$ELEMENT_ID{tipo_ent},
		 table_num=>20,
		 ca_values=>[{
		     element_id=>$ELEMENT_ID{tipo_ent},
		     value_longtext1=>$tipologia,
		     source_info=>'',
			     }]
	     },
	);

	for my $sito ($eac->control->sources) {
	    my $urlSource = URI->new( $sito->source->get('_href') );
	    push(@attrs,
		 {
		     element_id => $ELEMENT_ID{external_link},
		     table_num=>20,
		     ca_values  => [
			 {
			     element_id => $ELEMENT_ID{url_source},
			     value_longtext1      => "" . $urlSource->host,
			     source_info=>'',
			 },
			 {
			     element_id => $ELEMENT_ID{url_entry},
			     value_longtext1      => "" . $sito->source->get('_href'),
			     source_info=>'',
			 },
			 ],
		 },

		);
	}

$DB::single=1;
#	for my $places ($eac->cpfDescription->description->placeDates) {
	my $n = 0 ;
	$places = $eac->cpfDescription->description->placeDates->placeDate->hash('__value');
	while ( ($key, $value) = each $places ) {
	    my $PlaceSingolo = $eac->cpfDescription->description->placeDates->placeDate->[$n];

	    my $place_value = (defined $PlaceSingolo->place) ? $PlaceSingolo->place->get('__value') : '';
	    my $place_descriptiveNote = (defined $PlaceSingolo->descriptiveNote) ?
		$PlaceSingolo->descriptiveNote->get('__value') : '';
	    $n++;
	    push(@attrs,
		 {
		     element_id => $ELEMENT_ID{place},
		     table_num=>20,
		     ca_values  => [
			 {
			     element_id => $ELEMENT_ID{place_value},
			     value_longtext1      => "" .  $place_value,
			     source_info=>'',
			 },
			 {
			     element_id => $ELEMENT_ID{place_descriptiveNote},
			     value_longtext1      => "" . $place_descriptiveNote,
			     source_info=>'',
			 },
			 ],
		 },

		);
	}


=example
	$relationHash = $relationNodeArray->hash('__value');
	foreach $relationKey ( keys  $relationHash ){
		INSERTobjectsXentities($ead_rec->object_id,$relationKey, RELATION_TYPE_PROD);
	}
=cut


#$DB::single=1 if  ($idno eq 'san.cat.sogP.85275' );
#$DB::single=1;
#
# come si itera su un XML::Pastor::NodeArray ?!
# workaround: si trasforma in hash e $n scorre fino alla dimensione dell'hash.
#
	my $dates = $eac->cpfDescription->description->existDates->dateSet->date->hash('_localType');
	$n = 0 ;
	while ( ($key, $value) = each $dates ) {
	    my $DataSingola = $eac->cpfDescription->description->existDates->dateSet->date->[$n];
	    my $XMLdate = $DataSingola->standardDate->get('__value');
	    my ($datelongtext,$decStartDate,$decEndDate) = _parseDate($XMLdate);
	    $n++;

	    push(@attrs,
		 {
		     element_id=>$ELEMENT_ID{unitdate},
		     locale_id=>9,
		     table_num=>20,
		     ca_values=>[
			 {
			     element_id      =>  $ELEMENT_ID{date_value},
			     value_longtext1 =>  $datelongtext,
			     value_decimal1  => _decimalDate($decStartDate,1),
			     value_decimal2  => _decimalDate($decEndDate,0),
			 },
			 {
			     element_id      => $ELEMENT_ID{dateChar},
			     value_longtext1 => $DataSingola->localType->get('__value'),

			 },
			 {
			     element_id      => $ELEMENT_ID{dates_text},
			     value_longtext1 => $DataSingola->get('__value'),
			 },
			 ],
		 });
	}

	for (@attrs) {
	    eval {
		$eac_rec->search_related('ca_attributes')->create($_);
	    };
	    if ($@) {
		die ("$@" . Data::Dumper::Dump($_));
	    }
	}
     }

    $tnx_guard->commit;


=info
HASH %relazioniProduttoreHash esempio:
{
'san.cat.sogP.10778' => [
			  '14',
			  ['san.cat.sogP.10890','san.cat.sogP.99999']
			]
}
Chiave .: XML "otherRecordId"
Valore .: ARRAY composto da due elementi
		  ARRAY[0]: entity_id della tabella ca_entities
		  ARRAY[1]: ARRAY di otherRecordId con i quali si è in relazione
=cut

    $relazioniProduttoreHash{$eac_id} = [$eac_rec->entity_id];
    my $relationNodeArray = $eac->cpfDescription->relations->cpfRelation;
	if (defined $relationNodeArray) {
	    $relationHash = $relationNodeArray->hash('relationEntry');
	    foreach $relationKey ( keys $relationHash ) {
		if (!defined $relazioniProduttoreHash{$eac_id}[1]) {push($relazioniProduttoreHash{$eac_id}, []);}
		$relationKey =~ s/^\s+|\s+$//g;
		push( $relazioniProduttoreHash{$eac_id}[1], $relationKey );
	    }

	}

return $eac_rec;
}

sub insert_conservatore {
    my ($ns,$scons) = @_;
    unless( defined($scons) && $scons->can('identifier') && $scons->identifier->can('recordId')){
	print Data::Dumper->Dump($scons);
	die ("Scons vuoto o non utilizzabile!");
    }
    my $scons_id = "" . $scons->identifier->recordId;
#    $DB::single=1 if ('san.cat.sogC.18784' eq $scons_id);
    my $tnx_guard = $schema->txn_scope_guard;
    my $scons_rec = $schema->resultset('CaEntity')->find({idno=>$scons_id});

    unless($scons_rec) {
	warn("Warning: non trovato $scons_id, aggiungo namespace");
	$scons_rec = $schema->resultset('CaEntity')->find({idno=>add_namespace($scons_id)});
    }

    if ($scons_rec) {
	# il recordo potrebbe essere cambiato??
	# cancello tutti i suoi attributi e li reinserisco.
	my $rs = $scons_rec->search_related('ca_attributes');
	$rs->search_related('ca_attribute_values')->delete();
	$rs->delete();
	$scons_rec->search_related('ca_entity_labels')->delete;
	$idno = $scons_rec->idno;
    }

    # il type_id è sempre 173, cioè il type_id del soggetto conservatore
    my $type_id=173;

    my $denominazione = "" . $scons->formaautorizzata;
#    $DB::single=1 if ('san.cat.sogC.9036' eq $scons_id);
#    $DB::single=1 if ('san.cat.sogC.10956' eq $scons_id);
    my $descrizione = "" . $scons->descrizione;
    my $idno = $scons_id;

    $scons_rec=$schema->resultset('CaEntity')
	->update_or_create(
	{
	    idno             => $idno,
	    type_id          => $type_id,
	    idno_sort        => $idno,
	    hier_entity_id   => 0,
	    source_info      => 'Tjs=',
	    access           => 1,
	    status           => 0,
	    hier_left        => 1.0,
	    hier_right       => 101.0,
#	    extent           => 0,
#	    extent_units     => '',
	},
	{key=>'ca_idno'}
	);
    if ($scons_rec->in_storage) {
	# e' avvenuta l'update
    } else {
	$scons_rec->insert();
	# mi sono assicurato che sia avvenuta la scrittura nel db.
    }

    # alla faccia della normalizzazione del db: stesso valore in 3 campi diversi e nella stessa table.

    $scons_rec->search_related('ca_entity_labels')->create(
	{
	    locale_id    => 9,
	    type_id      => $type_id,
	    displayname  => $denominazione,
	    surname      => substr($denominazione,0,100),
	    # CollectiveAccess definisce come NOT NULL questi valori ma non gli assegna alcun default...
	    # in teoria dovrebbero essere valorizzati con qualcosa di sensato...
	    # e invece no. Sarebbe stato meglio premettere il NULL come valore.
	    name_sort       => $denominazione,
	    forename        => '',
	    other_forenames => '',
	    middlename      => '',
	    prefix          => '',
	    suffix          => '',
	    source_info     => '',
	    is_preferred    => 1,
	}
	);


    # ora dobbiamo inserire gli attributi:
    # <sitoweb> e <localizzazione> sono i due elementi che possono
    # essere ripetibili -> sono array.
    # In CA vanno inseriti via container e subcontainer.

    {
	my @attrs = ();
	for my $localizzazione (@{$scons->localizzazione}) {
	    my $rec = {element_id=>$ELEMENT_ID{localizzaz},
		       table_num=>20,
		       ca_values => [
			   {
			       element_id=>$ELEMENT_ID{localizzaz_paese},
			       value_longtext1=>$localizzazione->paese,
			       source_info=>'',
			   },
			   {
			       element_id=>$ELEMENT_ID{localizzaz_provincia},
			       value_longtext1=>$localizzazione->provincia,
			       source_info=>'',
			   },
			   {
			       element_id=>$ELEMENT_ID{localizzaz_cap},
			       value_longtext1=>$localizzazione->cap,
			       source_info=>'',
			   },
			   {
			       element_id=>$ELEMENT_ID{localizzaz_comune},
			       value_longtext1=>$localizzazione->comune,
			       source_info=>'',
			   },
			   {
			       element_id=>$ELEMENT_ID{localizzaz_value},
			       value_longtext1=>$localizzazione->get('__value'),
			       source_info=>'',
			   },
		  ]};
	    push(@attrs, $rec);
	}
	#$DB::single=1;
	for my $sito (@{$scons->sitoweb}) {
	    push(@attrs,
		 {
		     element_id => $ELEMENT_ID{site_scons},
		     table_num=>20,
		     ca_values  => [
			 {
			     element_id => $ELEMENT_ID{site_scons_name},
			     value_longtext1      => $sito->get('__value'),
			     source_info=>'',
			 },
			 {
			     element_id => $ELEMENT_ID{site_scons_url},
			     value_longtext1      => "" . $sito->href,
			     source_info=>'',
			 },
			 ],
		 },
		);
	}
	push(@attrs,
	     {
		 element_id=>$ELEMENT_ID{perma_id},
		 table_num=>20,
		 ca_values=>[{
		     element_id=>$ELEMENT_ID{perma_id},
		     value_longtext1=>$scons->identifier->recordId,
		     source_info=>'',
		 }]
	     },
	     {
		 element_id=>$ELEMENT_ID{sistemaId},
		 table_num=>20,
		 ca_values=>[{
		     element_id=>$ELEMENT_ID{sistemaId},
		     value_longtext1=>$scons->identifier->sistemaId,
		     source_info=>'',
		 }]
	     },
	     {
		 element_id=>$ELEMENT_ID{tipo_scons},
		 table_num=>20,
		 ca_values=>[{
		     element_id=>$ELEMENT_ID{tipo_scons},
		     value_longtext1=>$scons->tipologia,
		     source_info=>'',
		 }]
	     },
	     {
		 element_id=>$ELEMENT_ID{adminbiohist},
		 table_num=>20,
		 ca_values=>[{
		     element_id=>$ELEMENT_ID{adminbiohist},
		     value_longtext1=>$scons->descrizione,
		     source_info=>'',
		 }]
	     },
	    );
	if ('true' eq $scons->consultazione) {
	    push (@attrs,
	     {
		 element_id=>$ELEMENT_ID{servizi_pubbl},
		 table_num=>20,
		 ca_values=>[{
		     element_id=>$ELEMENT_ID{servizi_pubbl},
		     value_longtext1=>$scons->consultazione,
		     source_info=>'',
		 }]
	     });

	    if ('true' eq $scons->consultazione && $scons->orario) {
		push (@attrs,
		      {
			  element_id=>$ELEMENT_ID{orari},
			  table_num=>20,
			  ca_values=>[{
			      element_id=>$ELEMENT_ID{orari},
			      value_longtext1=>$scons->orario,
			      source_info=>'',
			  }]
		      });
	    }
	}
	if ($scons->acronimo) {
	    push(@attrs,
		 {
		     element_id=>$ELEMENT_ID{acronimo},
		     table_num=>20,
		     ca_values=>[{
			 element_id=>$ELEMENT_ID{acronimo},
			 value_longtext1=>$scons->acronimo,
			 source_info=>'',
		     }]
		 });
	}
	if ($scons->altroaccesso) {
	    push(@attrs,
		 {
		     element_id=>$ELEMENT_ID{altro_accesso},
		     table_num=>20,
		     ca_values=>[{
			 element_id=>$ELEMENT_ID{altro_accesso},
			 value_longtext1=>$scons->altroaccesso,
			 source_info=>'',
		     }]
		 });
	}
	if ($scons->servizi) {
	    push(@attrs,
		 {
		     element_id=>$ELEMENT_ID{servizi},
		     table_num=>20,
		     ca_values=>[{
			 element_id=>$ELEMENT_ID{servizi},
			 value_longtext1=>$scons->servizi,
			 source_info=>'',
		     }]
		 },
		);
	}
	fonr (@attrs) {
	    eval {
		$scons_rec->search_related('ca_attributes')->create($_);
	    };
	    if ($@) {
		die ("$@" . Data::Dumper::Dump($_));
	    }
	}
    }
    $tnx_guard->commit;
    return $scons_rec;

}

###################
#
=pod

=item _decimalDate

Usage:
	dataStart - tipo = 1
	dataEnd - tipo = 0

=cut
#
###################
sub _decimalDate(){

    my ($data, $tipo) = @_;

    unless( defined($data) ){
	return undef;
    }

    #trim
    $data =~ s/^\s+|\s+$//g;
    my $decimal;

    #$DB::single=1;
    my ($anno, $mese, $giorno) = unpack "A4A2A2", $data;

    # 20001231
    if( $anno ne '' and $mese ne '' and $giorno ne '' ){
	$decimal = ($tipo) ? $anno.".".$mese.$giorno."0000000000000000" : $anno.".".$mese.$giorno."2359590000000000";
    }

    # 2000
    elsif ($mese eq '' and $giorno eq '' and $anno ne '' ){
	$decimal = ($tipo) ? $anno . ".01010000000000000000" : $anno . ".12312359590000000000";
    }

    # 200012
    elsif( $mese ne '' and $anno ne '' and $giorno eq ''){
	$decimal = ($tipo) ? $anno.".".$mese."010000000000000000" : $anno.".".$mese."312359590000000000";
    }


    return $decimal;
}


###################
#
=pod

=item _parseDate

Usage:

INPUT: data nei formati supprtati
  SAN '17000101/19991231'
  GEA4: 1/12/1935-31/12/1935 ; !! possono mancare i giorni e i mesi !!

OUTPUT: array[value_longtext1,DecimalStartDate,DecimalEndDate]

    # value_longtext1 : formato data inglese su database
    # MM/DD/YYYY                  data semplice
    # MM/DD/YYYY [ - MM/DD/YYYY]  data range
    # MM/YYYY                     data senza giorno
    # YYYY

    # Decimal[Start|End]Date
    # formato decimale per le date di Collective Access
    # vedi _decimalDate()

=cut
#
###################
sub _parseDate {
    my ($data) = @_;
    my @result = ();

    my $StartDate = '';
    my $EndDate   = '';
    my $decStartDate = '';
    my $decEndDate   = '';
    my $datelongtext = '';
    my $StartYear = '';
    my $StartMonth= '';
    my $StartDay  = '';
    my $EndYear   = '';
    my $EndMonth  = '';
    my $EndDay    = '';

    # SAN: '17000101/19991231'
    if ($data =~ /(\d{8})\/(\d{8})/g) {
	($StartDate,$EndDate) = ($1,$2);
	$StartDate   =~ /(\d{4})(\d{2})(\d{2})/g ;
	($StartYear,$StartMonth,$StartDay) = ($1,$2,$3);
	$EndDate     =~ /(\d{4})(\d{2})(\d{2})/g ;
	($EndYear,$EndMonth,$EndDay) = ($1,$2,$3);
    # SAN: '19690914'
    } elsif ($data =~ /(^\d{8}$)/g) {
	($StartDate) = ($1,$2);
	$StartDate   =~ /(\d{4})(\d{2})(\d{2})/g ;
	($StartYear,$StartMonth,$StartDay) = ($1,$2,$3);
	$EndDate = '' ;
	($EndYear,$EndMonth,$EndDay) = ('','','');
    # GEA4: 1/12/1935-31/12/1935 ; !! possono mancare i giorni e i mesi !!
    } elsif ($data =~ /^(\d{0,2}\/?\d{0,2}\/?\d{0,4})-?(\d{0,2}\/?\d{0,2}\/?\d{0,4})/g){
	($StartDate,$EndDate) = ($1,$2);
	$StartDate   =~ /(\d{0,2})\/?(\d{0,2})\/?(\d{4})/g ;
	($StartYear,$StartMonth,$StartDay) = ($3,$2,$1);
	if ($StartMonth eq '' and $StartDay ne '') {$StartMonth=$StartDay; $StartDay='';} # day-month swap if missing
	$EndDate   =~ /(\d{0,2})\/?(\d{0,2})\/?(\d{4})/g ;
	($EndYear,$EndMonth,$EndDay) = ($3,$2,$1);
	if ($EndMonth eq '' and $EndDay ne '') {$EndMonth=$EndDay; $EndDay='';} # day-month swap if missing
    }

    # fix date su una cifra sola
    $StartDay = _fixdate($StartDay);
    $EndDay = _fixdate($EndDay);
    $StartMonth = _fixdate($StartMonth);
    $EndMonth = _fixdate($EndMonth);

    # Ricostruzione Date per calcolo decimali AAAAMMGG
    $decStartDate  = $StartYear;
    $decStartDate .= ($StartMonth ne '') ? "$StartMonth" : '';
    $decStartDate .= ($StartDay ne '')   ? "$StartDay"   : '';
    $decEndDate    = $EndYear;
    $decEndDate   .= ($EndMonth ne '')   ? "$EndMonth"   : '';
    $decEndDate   .= ($EndDay ne '')     ? "$EndDay"     : '';

    # Ricostruzione Date per value_longtext1
    $StartDate  = $StartMonth;
    $StartDate .= ($StartDate ne '' and $StartDay ne '') ? "/$StartDay" : '';
    $StartDate .= ($StartDate ne '' and $StartYear ne '')   ? "/$StartYear"   : $StartYear;
    $EndDate  = $EndMonth;
    $EndDate .= ($EndDate ne '' and $EndDay ne '') ? "/$EndDay" : '';
    $EndDate .= ($EndDate ne '' and $EndYear ne '')   ? "/$EndYear"   : $EndYear;

    # Se un estremo e' vuoto viene impostato come l'altro
    if ($decStartDate eq '') {$decStartDate=$decEndDate;}
    if ($decEndDate eq '') {$decEndDate=$decStartDate;}

    # value_longtext1 : formato data inglese su database
    # MM/DD/YYYY                  data semplice
    # MM/DD/YYYY [ - MM/DD/YYYY]  data range
    # MM/YYYY                     data senza giorno
    $datelongtext = ($StartDate ne '') ? $StartDate : '';
    $datelongtext .= ($EndDate ne '') ? " - $EndDate" : '';

    push(@result,$datelongtext);
    push(@result,$decStartDate);
    push(@result,$decEndDate);

    return @result;
}

#
# ritorna il giorno o mese completo di '0'
sub _fixdate(){
    my ($d) = @_;
    if ($d ne '' and $d < 10 and $d !~ /^0/){
	return "0".$d;
    } else {
	return $d;
    }
}

1;
