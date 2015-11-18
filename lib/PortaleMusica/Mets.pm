package CollectiveAccess::PortaleMusica::Mets;

use strict;
use warnings;

use utf8;
use Encode qw( decode_utf8 encode_utf8 );
use Data::Dumper;

my %ELEMENT_ID;
my @CODICI;

use constant RELATION_TYPE_PARTE_DI  => '122';
my $dbhSQLstandard;
sub set_up {
    my ($codici, $dbischema, $dbh) = @_;
    my $schema = $dbischema;
    {
	my $rs = $schema->resultset('CaMetadataElement')->search({element_code=>$codici},{columns=>[qw/element_id element_code/ ]});
	while (my $element = $rs->next) {
	    $ELEMENT_ID{$element->element_code}=$element->element_id;
	}
    }
    @CODICI = (keys %ELEMENT_ID);
    $dbhSQLstandard = $dbh;
}

=head2 date_is_real

I campi data nei record di origine possono avere almeno 3 attributi, in particolare nel <date> abbiamo un attributo XML
che formalizza la data in AAAAMMGG

esempi:
<date localType="date di esistenza" standardDate="18000101/99999999">sec. XIX - </date>
<existDates><dateSet>
<date localType="data di morte" standardDate="19731011">1973 ott 11</date>
<date localType="data di nascita" standardDate="18830606">1883 giu 06</date></dateSet></existDates><placeDates>

Nel caso una data '99999999' abbia un 9 come primo carattere
possiamo considerarla undef.

=cut

sub date_is_real {
   my($data) = @_;
   return ('9' ne substr($data, 0, 1) ? $data : undef);
}

sub INSERTobjectsXobjects {
    my ($obj_id,$ide_idno,$type) = @_;

    my $dbh = $dbhSQLstandard;
    my $insertWarnings=0;
    my $sth;

    # query per cercare l'entity_id$ELEMENT_ID
    my $sql = "SELECT object_id FROM ca_objects WHERE idno='$ide_idno' LIMIT 1";
    $sth = $dbh->prepare($sql);
    $sth->execute();
    my $data = $sth->fetchall_arrayref;
    $sth->finish;

    # query di inserimento
    $sql = "INSERT INTO ca_objects_x_objects (object_left_id,object_right_id,type_id,source_info) VALUES ('".$data->[0][0]."','$obj_id','$type','')";
    $sth = $dbh->prepare($sql);
    if($sth->execute()){
	print "Relation OBJ:". $obj_id." -> METS:".$data->[0][0]. " inserted successfully type:$type\n";
    } else {
	print "ERROR relation OBJ:". $obj_id." -> METS:".$data->[0][0]. " type:$type\n";
	$insertWarnings++;
    }
    $sth->finish;

    if ($insertWarnings) {print "Sono stati rilevati $insertWarnings problemi\n";}
}

=head2 insert 


=cut
sub insert {
    my ($schema,$mets) = @_;
    
    unless( defined($schema) && defined($mets)) {
    	die ("Schema o record mets non definito");
    }

    unless (exists $mets->{Description}{haComplesso} && exists $mets->{Description}{haComplesso}{attrs}{'rdf:resource'} && exists $mets->{Description}{haConservatore} && exists $mets->{Description}{haConservatore}{attrs}{'rdf:resource'}) {
	
	warn("Warning: senza complesso e senza soggetto conservatore! non lo inserisco: $mets->{Description}{about}");
	return;
    
    }

    # verifico se il record e' presente nel db:
    my $idno;
    {
	my $field = $mets->{Description}{about};
	if ($field =~ /^\w+:(.*)$/) {
	    $idno=$1;
	}
    }


    my $tnx_guard = $schema->txn_scope_guard;
    my $mets_rec = $schema->resultset('CaObject')->find({idno=>$idno});

    if ($mets_rec) {
	# il recordo potrebbe essere cambiato??
	# cancello tutti i suoi attributi e li reinserisco.
	my $sql = q(delete from ca_attribute_values where attribute_id in
		    (select attribute_id from ca_attributes where row_id=? and table_num=57));
	my $sth = $schema->storage->dbh->prepare($sql);
	$sth->execute($mets_rec->object_id);
	$sth->finish;
	$sth = $schema->storage->dbh->prepare(q(delete from ca_attributes where row_id=? and table_num=57));
	$sth->execute($mets_rec->object_id);
	#my $rs = $mets_rec->search_related('ca_attributes');
	#$rs->search_related('ca_attribute_values')->delete();
	#$rs->delete();
	$mets_rec->search_related('ca_object_labels')->delete;
    }


    # if (mets.padre) # 
    my $padre_id;
    {
	my $field = $mets->{Description}{haComplesso}{attrs}{'rdf:resource'};
	if ($field =~ /^\w+:(.*)$/) {
	    $padre_id=$1;
	}
    }

    my $padre = $schema->resultset('CaObject')->find({idno=>$padre_id});
    unless ($padre) {
	print("Padre mancante nel db:\n");
	print $idno . " ha padre: \n$padre_id\n";
	print("#######\n");
	return;
    }
    

   # if($idno eq 'oai:san.beniculturali.it:san.dl.SAN:VIDEO-00438108' || $idno eq 'san.dl.SAN:VIDEO-00438108'){

	#$DB::single=1;
   # }

    my $type_id=172;

    $mets_rec=$schema->resultset('CaObject')
	->update_or_create({
	    idno=>$idno,
	    parent_id=> $padre->object_id,
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
    if ($mets_rec->in_storage) {
	# e' avvenuta l'update
    } else {
	$mets_rec->insert();
	# mi sono assicurato che sia avvenuta la scrittura nel db.
    }
    
=head1 old code
    my $denominazione = 
	exists $mets->{did}{unittitle} ? $mets->{did}{unittitle} : 
	exists $mets->{prefercite} && length($mets->{prefercite}) > 0 ? $mets->{prefercite} : substr($mets->{did}{abstract}, 0, 30);
	#Eliminato 'mets - titolo mancante' e aggiunto substring del contenuto come titolo;
=cut

 #  my $denominazione = exists $mets->{did}{abstract} ? substr($mets->{did}{abstract}, 0, 30)."..." : "";

    my $denominazione = "";
    if( exists $mets->{did}{unittitle} ){
	#$DB::single=1;
	$denominazione= $mets->{did}{unittitle}
    
    } elsif( exists $mets->{prefercite} ){
	#$DB::single=1;
	$denominazione = $mets->{prefercite}{prefercite}

    } elsif ( exists $mets->{noarch_prefercite}){
	#$DB::single=1;
	$denominazione = $mets->{noarch_prefercite}{prefercite}

    } else{
	
	$denominazione ="Senza titolo";

    }

    $mets_rec->search_related('ca_object_labels')->create(
	{
	    locale_id    => 9,
	   # type_id      => $type_id,
	    name          => $denominazione,
	    name_sort      => $denominazione,
	    source_info     => '',
	    is_preferred    => 1,
	}
	);
    my $abstract = '';
    if( exists $mets->{did}{abstract} && $mets->{did}{abstract} ne '' ){
	$abstract = $mets->{did}{abstract};
    }elsif( exists $mets->{noarch_abstract} ){
	#$DB::single=1;
	$abstract =  $mets->{noarch_abstract}{abstract};
    }

    {
	my $attrs = [
	    {
		element_id=>$ELEMENT_ID{scopecontent},
		locale_id=>9,
		table_num=>57,
		ca_attribute_values=>[{
		    element_id=>$ELEMENT_ID{scopecontent},
		    value_longtext1=>$abstract,
		    source_info=>'SAN',
				      }],
	    },
	    {
		element_id=>$ELEMENT_ID{archdesc_level},
		locale_id=>9,
		table_num=>57,
		ca_attribute_values=>[{
		    element_id=>$ELEMENT_ID{archdesc_level},
		    value_longtext1=>'Unità documentale',
		    source_info=>'SAN',
				      }],
	    },
	    {
		element_id=>$ELEMENT_ID{relazioni_san},
		locale_id=>9,
		table_num=>57,
		ca_attribute_values=>[
		    {
			element_id=>$ELEMENT_ID{relazioni_san_comparch},
			value_longtext1=>$padre_id,
			source_info=>'SAN',
		    },
		    {
			element_id=>$ELEMENT_ID{relazioni_san_prodig},
			value_longtext1=>$mets->{Description}{haProgettoDigitalizzazione}{attrs}{'rdf:resource'},
			source_info=>'SAN',
		    },
		    {
			element_id=>$ELEMENT_ID{relazioni_san_scons},
			value_longtext1=>$mets->{Description}{haConservatore}{attrs}{'rdf:resource'},
			source_info=>'SAN',
		    },

		    ],
	    },
	    {
		element_id=>$ELEMENT_ID{unitdate},
		locale_id=>9,
		table_num=>57,
		ca_attribute_values=>[
		    {
			element_id=>$ELEMENT_ID{dates_text},
			value_longtext1=>$mets->{did}{unitdate}{value},
			source_info=>'SAN',
		    },
		    ]
	    },
			# va ripetuto, genreform e' una lista
	    (map 
	    {{
		element_id=>$ELEMENT_ID{genreform},
		locale_id=>9,
		table_num=>57,
		ca_attribute_values=>[
		    {
			element_id=>$ELEMENT_ID{genreform_type},
			value_longtext1=>$_->{attrs}{type},
			source_info=>'SAN',
		    },
		    {
			element_id=>$ELEMENT_ID{genreform_value},
			value_longtext1=>$_->{value},
			source_info=>'SAN',
		    }],
		}} @{$mets->{did}{genreform}}
	    ),

	    # controllaccess->{subject} e' una lista
	    (map
	     {{
		element_id=>$ELEMENT_ID{subject},
		locale_id=>9,
		table_num=>57,
		ca_attribute_values=>[
		    {
			element_id=>$ELEMENT_ID{subject_emph},
			value_longtext1=>$_->{attrs}{emph},
			source_info=>'SAN',
		    },
		    {
			element_id=>$ELEMENT_ID{subject_value},
			value_longtext1=>$_->{attrs}{value},
			source_info=>'SAN',
		    }],
	    }} @{$mets->{controlaccess}{subject}}
	    ),
 
	    # persname
	    (map
	     {{
		element_id=>$ELEMENT_ID{index},
		locale_id=>9,
		table_num=>57,
		ca_attribute_values=>[
		    {
			element_id=>$ELEMENT_ID{index_emph},
			value_longtext1=>$_->{emph},
			source_info=>'SAN',
		    },
		    {
			element_id=>$ELEMENT_ID{index_value},
			value_longtext1=>$_->{value},
			source_info=>'SAN',
		    }],
	    }} @{$mets->{controlaccess}{persname}}
	     ), 

	    # corpname
	    (map
	     {{
		element_id=>$ELEMENT_ID{index},
		locale_id=>9,
		table_num=>57,
		ca_attribute_values=>[
		    {
			element_id=>$ELEMENT_ID{index_value},
			value_longtext1=>$_,
			source_info=>'SAN',
		    }],
	    }} @{$mets->{controlaccess}{corpname}}
	     ), 

	    # geogname
	    (map
	     {{
		element_id=>$ELEMENT_ID{index},
		locale_id=>9,
		table_num=>57,
		ca_attribute_values=>[
		    {
			element_id=>$ELEMENT_ID{index_value},
			value_longtext1=>$_,
			source_info=>'SAN',
		    }],
	    }} @{$mets->{controlaccess}{geogname}}
	     ), 

	    # fileGrp
	    (map
	     {{
		 element_id=>$ELEMENT_ID{external_link},
		 locale_id=>9,
		 table_num=>57,
		 ca_attribute_values=>[
		     {
			 element_id=>$ELEMENT_ID{url_entry},
			 value_longtext1=>$_->{mets_file}{mets_FLocat}{attrs}{'xlink:href'},
			 source_info=>'SAN',
		     },
		     {
			 element_id=>$ELEMENT_ID{url_source},
			 value_longtext1=>$_->{mets_file}{attrs}{ID},
			 source_info=>'SAN',
		     }],
		 }} @{$mets->{fileGrp}}
	    ), 
	    
	    ];
	$mets_rec->search_related('ca_attributes')->populate($attrs);
	
    }
    
    $tnx_guard->commit;


=head1
    ## Insert Complesso Archivistico
    {
	my $relationNodeArray = $padre_id;
	if (defined $relationNodeArray and $relationNodeArray ne '') {
		    $relationHash = $relationNodeArray->hash('__value');
		    foreach $relationKey ( keys  $relationHash ){
			    INSERTobjectsXobjects($mets_rec->object_id,$relationKey,RELATION_TYPE_PARTE_DI);
		    }
	    }
    }
=cut
    return $mets_rec;
}


1;

