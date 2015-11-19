#!/usr/bin/env perl
use strict;
use warnings;
use utf8;

use Modern::Perl;
use FindBin qw/$Bin/;
use HTTP::OAI;
use Unicode::UTF8;

BEGIN {
    unshift(@INC, '$Bin/../../lib');
    unshift(@INC, '$Bin/../lib');
}

my @TRACCIATI = (qw/mets/);

my $SOGGETTO = $ARGV[0] || 'mets';

unless(grep {/^$SOGGETTO$/} @TRACCIATI){
    die("Formato non accettato! $ARGV[0]");
}

use Config::JFDI;

my $config = Config::JFDI->new(name=>'CA_OAI_conf', path=>$Bin);

use CollectiveAccess::PortaleMusica::Schema; # schema del db
use CollectiveAccess::PortaleMusica::Mets;   # operazioni di scrittura nel db
use Promemoria::SAN::Mets;                   # parsing dei dati mets.
 
my $dbi_dns = $config->get->{connect_info}{dbi_dns};
my $user    = $config->get->{connect_info}{dbi_user};
my $passwd  = $config->get->{connect_info}{dbi_passwd};
my $options  = $config->get->{connect_info}{dbi_options};
my $harvester_baseurl = $config->get->{harvester}{baseurl};

my %args;

$args{set}            = $config->get->{$SOGGETTO}{set}            || 'Musica-mets-san';
$args{metadataPrefix} = $config->get->{$SOGGETTO}{metadataPrefix} || 'mets-san';

my $codici=$config->get->{$SOGGETTO}{element_code_list};

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
    my ($content, $response) = @_;
   # $DB::single=1;
    my $data = Promemoria::SAN::Mets::parse_record($content->dom->getFirstChild->toString);
    push (@tutti_i_record, $data);
}

# Using a handler
my $response = $h->ListRecords(
    %args,      # deve contenere: metadataPrefix e set, può contentere from e until
    force=>1,   # 1 per forza se non riceverà dublin core
    onRecord=>\&_parse,
    );

if( $response->is_error ) {
    for ($response->errors) {
	print "Err: Msg:" . $_->message;
    }
    die ("Errori");
} elsif (defined $response->error && ('HTTP::OAI::Error' eq ref $response->header->{error})) {
    die("OAI-PMH Error: " . $response->error->code . " - " . $response->error->message);
}

say scalar @tutti_i_record . " " . $SOGGETTO . " trovati";
#$DB::single=1;
my $schema = CollectiveAccess::PortaleMusica::Schema->connect($dbi_dns, $user, $passwd, $options) || die ("Cannot open db connection $dbi_dns.");

CollectiveAccess::PortaleMusica::Mets::set_up($codici, $schema, $dbi_dns);

my $tnx_guard = $schema->txn_scope_guard;

for my $rec (@tutti_i_record) {
    ## controlla data se non è presente lo inserisco se 
    ## se è cambiata rimuovo gli attributi eliminabili e 
    ## riassocio gli attributi.
    CollectiveAccess::PortaleMusica::Mets::insert($schema, $rec);
}

$tnx_guard->commit;

sub validate_date {
    $_ = shift;
    if (/(\d{4}-\d{2}-\d{2})/) {
	return $1;
    }
}


__END__

