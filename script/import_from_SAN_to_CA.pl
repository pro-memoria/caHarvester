#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

use Modern::Perl;
use FindBin qw/$Bin/;
use HTTP::OAI;
use Unicode::UTF8;
use DBI;

BEGIN {
    unshift(@INC, '$Bin/../../lib');
    unshift(@INC, '$Bin/../lib');
}

my @TRACCIATI = (qw/scons eac ead/);

unless(grep {/^$ARGV[0]$/} @TRACCIATI){
    die("Formato non accettato! $ARGV[0]");
}

my $SOGGETTO = $ARGV[0];

use Config::JFDI;

my $config = Config::JFDI->new(name=>'ca_oai_conf', path=>$Bin);

require UNIVERSAL::require;

my $CLASS = $config->get->{$SOGGETTO}{module};
$CLASS->use;
my $META = $config->get->{$SOGGETTO}{meta};
$META->use;

my $model = $META->Model;     # costruttori
my $class = $model->xml_item_class($config->get->{$SOGGETTO}{class});

use CollectiveAccess::PortaleMusica::Schema;
use Promemoria::SAN;

use constant {
    NOT_RECURSIVE=>0,
    RECURSIVE=>1,
};
 
my $dbi_dns = $config->get->{connect_info}{dbi_dns};
my $user    = $config->get->{connect_info}{dbi_user};
my $passwd  = $config->get->{connect_info}{dbi_passwd};
my $options  = $config->get->{connect_info}{dbi_options};
my $harvester_baseurl = $config->get->{harvester}{baseurl};


my %args;

$args{set}            = $config->get->{$SOGGETTO}{set}            || 'Musica-eac-san';
$args{metadataPrefix} = $config->get->{$SOGGETTO}{metadataPrefix} || 'eac-san';
#$ARGV[0] //= '2001-04-01';
#$ARGV[1] //= '2015-08-31';

if (defined $ARGV[0] && validate_date($ARGV[0])) {
    $args{from}=$ARGV[0];
}
if (defined $ARGV[1] && validate_date($ARGV[1])) {
    $args{until}=$ARGV[1];
}


my $h = new HTTP::OAI::Harvester(baseURL=>$harvester_baseurl, force=>1);

my @tutti_i_record = ();

=head2 parse

Poiché l'harvester non decifra i record, lo usiamo per gestire l'envelope e per ciclare sui record che decifriamo e memorizziamo con questo "observer".

=cut

sub _parse {
    $DB::single=1;
    my ($content, $response) = @_;
    unless (Unicode::UTF8::valid_utf8(Encode::encode('utf8', $content->dom->getFirstChild->getChildNodes->[1]->getFirstChild->toStringC14N))) {
	print $content->dom->getFirstChild->getChildNodes->[1]->getFirstChild->toStringC14N;
    }
    my $data = $class->from_xml_fragment($content->dom->getFirstChild->getChildNodes->[1]->getFirstChild);

    ## $content contiene $content->datestamp, $content->identifier
    ## creare una funziona per gestire cancellazione/reinserimento
    push (@tutti_i_record, $data);
#    $response->content->record($data);
    ;
}

# Using a handler
my $response = $h->ListRecords(
    %args,      # deve contenere: metadataPrefix e set, può contentere from e until
    force=>1,   # 1 per forza se non riceverà dublin core
    onRecord=>\&_parse,
    );

if( $response->is_error ) {
    die $response->message;
} elsif (defined $response->error && ('HTTP::OAI::Error' eq ref $response->header->{error})) {
    die("OAI-PMH Error: " . $response->error->code . " - " . $response->error->message);
}

$DB::single=1;
while( my $id = $response->next ) {
                print "identifier => ", $id->identifier;
                # Only available from OAI 2.0 repositories
                print " (", $id->datestamp, ")" if $id->datestamp;
                print " (", $id->status, ")" if $id->status;
                print "\n";
}


#print($response->id."\n");
say scalar @tutti_i_record . " " . $SOGGETTO . " trovati";
my $schema = CollectiveAccess::PortaleMusica::Schema->connect($dbi_dns, $user, $passwd, $options) || die ("Cannot open db connection $dbi_dns.");


my $codici=$config->get->{$SOGGETTO}{element_code_list};

my $dbh = DBI->connect($dbi_dns,$user,$passwd) || die "Could not connect to database: $DBI::errstr";

Promemoria::SAN::set_up($codici, $schema, 'http://www.san.beniculturali.it/oaicat/OAIHandler', RECURSIVE, $dbh);

# la lista che otteniamo e' fatta in modo che appaiono prima i padri dei figli, o almeno questo
# e' il presupposto con cui abbiamo sviluppato l'algoritmo di inserimento.

=head2 _apply

Dato un oggetto e una list di nomi di metodi li applica all'oggetto
in sequenza ritornando l'ultimo valore.

=cut

sub _apply {
    my ($obj, @accessors) = @_;
    my $method;
    for (@accessors) {
	$method = $obj->can($_);
	$obj = &$method($obj) if ($method);
    }
    return $obj;
}

my %metodiImport = (
    scons=>'insert_conservatore',
    eac=>'insert_produttore',
    ead=>'insert_ead',
);

my @accessors = @{$config->get->{$SOGGETTO}{identity}};
unless( Promemoria::SAN->can($metodiImport{$SOGGETTO}) ){
    die("Metodo non implementato! $metodiImport{$SOGGETTO}");
}

my $metodo = $metodiImport{$SOGGETTO};
#my $tnx_guard = $schema->txn_scope_guard;


$DB::single=1;
for my $rec (@tutti_i_record) {
    print STDERR _apply($rec, @accessors), "\t";
    Promemoria::SAN->$metodo($rec);
    #$rec->datestamp, "\n",
    #$rec->metadata, "\n";
    #print join(',', @{$rec->metadata->dc->{'title'}}), "\n";
    print "===========================================================================================\n";
}

#$tnx_guard->commit;

if ($SOGGETTO eq 'eac') {
	#Promemoria::SAN->printRelazioniProduttoreHash();	
	Promemoria::SAN->INSERTentitiesXentities();
}


# Offline parsing
#$I = HTTP::OAI::Identify->new();
#$I->parse_string($content);
#$I->parse_file($fh);

exit(1);

sub validate_date {
    $_ = shift;
    if (/(\d{4}-\d{2}-\d{2})/) {
	return $1;
    }
}

sub nice_string {
 join("",
 map { $_ > 255 ?                  # if wide character...
       sprintf("\\x{%04X}", $_) :  # \x{...}
	   chr($_) =~ /[[:cntrl:]]/ ?  # else if control character...
	       sprintf("\\x%02X", $_) :    # \x..
		   quotemeta(chr($_))          # else quoted or as themselves
	       } unpack("W*", $_[0]));           # unpack Unicode characters
}


__END__

