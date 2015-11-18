package Promemoria::SAN::Mets;

use strict;
use warnings;

use FindBin qw/$Bin/;
use feature qw(say switch);
no warnings qw(experimental);

use XML::LibXML;
use XML::LibXML::Reader qw(
			   XML_READER_TYPE_ELEMENT
			   XML_READER_TYPE_END_ELEMENT
			   XML_READER_TYPE_TEXT
);

use Data::Dumper;
use utf8;

sub parse_record {
    my ($xml_fragment) = @_;
    my $reader = XML::LibXML::Reader->new( string => $xml_fragment );

    my $rec={};
    my @fileGrp;

    my $processRecordNode = sub {
	my $readerI = shift;
	# $DB::single=1;
	if ($readerI->nodeType == XML_READER_TYPE_ELEMENT) {
	    given($readerI->name) {

		when (/^ead-noarch:prefercite/){
		   #$DB::single=1;
		   $rec->{noarch_prefercite}=parse_ead_noarch_prefercite($readerI);
		}
		when (/^ead-noarch:abstract/){
		  # $DB::single=1;
		   $rec->{noarch_abstract}=parse_ead_noarch_abstract($readerI);
		}
		when (/^ead-context:ead$/) {
		    # scartiamo 
		    # parse_ead_context($readerI->readInnerXML);
		}
		when (/^ead:did$/) {
		    #$DB::single=1;
		    $rec->{did}=process_ead_did($readerI);
		}
		when (/^ead:prefercite$/) {
		    #$DB::single=1;
		    #$readerI->read;
		    $readerI->read; # ead:p
		    $rec->{prefercite}=parse_ead_prefercite($readerI);
		    #$rec->{prefercite}=$readerI->readInnerXml();
		}
		when (/^ead:controlaccess$/) {
		    $rec->{controlaccess}=parse_controlaccess($readerI);
		}
		when (/^mets:fileGrp$/) {
		    push(@fileGrp, parse_fileGrp($readerI));
		}
		when (/^rdf:Description$/) {
		    my $dl =parse_dl($readerI);
		    $rec->{Description}=$dl;
		}
		default {
		    
		}
	    }
	}
    };

    while ($reader->read) {
	&$processRecordNode($reader);
    }

    $rec->{fileGrp}=\@fileGrp;

    #$DB::single=1;
    return $rec;
}




=head2 parse_ead_did

Attributi: 
Elementi:
 - ead:unittitle
 - ead:abstract
 - ead:unitdate
    * datechar = "principale"
    * normal="AAAAMMGG/AAAAMMGG"
 - ead:physdesc:
   - ead:extent
   - ead:genreform[]:
     * source
     * type
   - ead:langmaterial:
     * langcode
 -
 -

=cut

sub process_ead_did {
    my ($oreader) = @_;
    my %attrs = ();
    $attrs{genreform}=[];
#    $DB::single=1;
    my $mreader = XML::LibXML::Reader->new( string => $oreader->readOuterXml );
    while ($mreader->read) {
	if ($mreader->nodeType == XML_READER_TYPE_ELEMENT) {
	    given($mreader->name) {
		when (/^ead:unittitle$/) {
		    if (defined $mreader->readInnerXml() && length($mreader->readInnerXml()) > 0) {
			$attrs{unittitle} = $mreader->readInnerXml();
		    }
		}
		when (/^ead:abstract$/) {
		    if (defined $mreader->readInnerXml() && length($mreader->readInnerXml()) > 0) {
			$attrs{abstract} = $mreader->readInnerXml();
		    }
		}
		when (/^ead:unitdate$/) {
#		    $DB::single=1;
		    # dobbiamo prendere gli attributi datechar (ma anche no, tanto e' una costante)
		    # e normal ="AAAAMMGG/AAAAMMGG"
		    $attrs{unitdate}={attrs=>$mreader->getAttributeHash, value=>$mreader->readInnerXml};
		}
		when (/^ead:physdesc$/) {
		}
		when (/^ead:extent$/) {
		    if (defined $mreader->readInnerXml() && length($mreader->readInnerXml()) > 0) {
			$attrs{extent} = $mreader->readInnerXml();
		    }
		}
		when (/^ead:genreform$/) {
#		    $DB::single=1;
		    # dobbiamo prendere gli attributi source
		    # e type
		    # genreform e' ripetibile, dobbiamo ficcarli in un array
		    push(@{$attrs{genreform}}, {attrs=>$mreader->getAttributeHash, value=>$mreader->readInnerXml});
		}
		when (/^ead:language$/) {
#		    say Data::Dumper::Dump($mreader->getAttributeHash);
#		    say "in language: langcode";
		    $attrs{langcode} = $mreader->getAttribute('langcode');
		}
	    }
	}
    }
    
    return \%attrs;
}

=head2 parse_ead_prefercite

- Elementi:
   - ead:p

Se presente diventa ca_object_labels/is_preferred

=cut

sub parse_ead_prefercite {
    my ($reader) = @_;
#    $xml =~ s/^\s+</</; # toglie gli spazi prima dell'elemento
#    $xml =~ s/\s+/ /g;  # toglie gli spazi in eccesso dentro la stringa
#    $xml =~ s/\s+$//;   # toglie gli spazi alla fine, potrebbe esserne rimasto 1
   # $reader->nextElement;
    return { prefercite => $reader->readInnerXml } if (defined $reader->readInnerXml && length($reader->readInnerXml)>0);
}

sub parse_ead_noarch_prefercite {
    my ($reader) = @_;
#    $xml =~ s/^\s+</</; # toglie gli spazi prima dell'elemento
#    $xml =~ s/\s+/ /g;  # toglie gli spazi in eccesso dentro la stringa
#    $xml =~ s/\s+$//;   # toglie gli spazi alla fine, potrebbe esserne rimasto 1
    $reader->nextElement;
    return { prefercite => $reader->readInnerXml } if (defined $reader->readInnerXml && length($reader->readInnerXml)>0);
}

sub parse_ead_noarch_abstract {
    my ($reader) = @_;
#    $xml =~ s/^\s+</</; # toglie gli spazi prima dell'elemento
#    $xml =~ s/\s+/ /g;  # toglie gli spazi in eccesso dentro la stringa
#    $xml =~ s/\s+$//;   # toglie gli spazi alla fine, potrebbe esserne rimasto 1
   # $reader->nextElement;
    return { abstract => $reader->readInnerXml } if (defined $reader->readInnerXml && length($reader->readInnerXml)>0);
}


=head2 parse_controlaccess

Detti indici in gergo.

Attributi:
Elementi:
 - ead:corpname:
   * id
   * role
   * source
 - ead:geogname:
   * id
   * role
   * source
 - ead:subject[]:
   * id
   * source
   - ead:emph

=cut

sub parse_controlaccess {
    my ($oreader) = @_;
    my %attrs = ();
    $attrs{subject}=[];
    $attrs{persname}=[];
    $attrs{corpname}=[];
    $attrs{geogname}=[];
    my $rec;
#    $DB::single=1;
    my $mreader = XML::LibXML::Reader->new( string => $oreader->readOuterXml );
    while ($mreader->read) {
	if ($mreader->nodeType == XML_READER_TYPE_ELEMENT) {
	    given($mreader->name) {
		when (/^ead:corpname$/) {
		    if (defined $mreader->readInnerXml() && length($mreader->readInnerXml()) > 0) {
			push(@{$attrs{corpname}}, $mreader->readInnerXml());
		    }
		}
		when (/^ead:persname$/) {
		    if (defined $mreader->readInnerXml() && length($mreader->readInnerXml()) > 0) {
			$mreader->read;
			$rec = {value => $mreader->value};			
			push(@{$attrs{persname}}, $rec);
		    }
		}
		when (/^ead:geogname$/) {
		    if (defined $mreader->readInnerXml() && length($mreader->readInnerXml()) > 0) {
			push(@{$attrs{geogname}}, $mreader->readInnerXml());
		    }
		}
		when (/^ead:subject$/) {
		    # dobbiamo prendere gli attributi id e source
		    $rec = {attrs=>$mreader->getAttributeHash};
		    $mreader->read;
		    $rec->{value} = $mreader->value;
		    push (@{$attrs{subject}}, $rec);
		}
		when (/^ead:emph$/) {
		    # si apporta all'ultimo ead:subject
		    if (defined $mreader->readInnerXml() && length($mreader->readInnerXml()) > 0) {
			$rec->{emph} = $mreader->readInnerXml();
		    }
		}
	    }
	}
    }
    return \%attrs;
}

=head2 parse_fileGrp

Ricorrenze multiple

Attributi:
 * USE
Elementi:
 - mets:file:
   * ID ("THUMB_1", "IMAGE_1")
   * MIMETYPE
   - mets:FLocat:
     * xlink:href
     * LOCTYPE = 'URL'
     value vuoto

=cut

sub parse_fileGrp {
    my ($oreader) = @_;
    my %attrs = ();
    my $file;
    my $mreader = XML::LibXML::Reader->new( string => $oreader->readOuterXml );
    while ($mreader->read) {
	if ($mreader->nodeType == XML_READER_TYPE_ELEMENT) {
	    given($mreader->name) {
		when (/^mets:file$/) {
		    $attrs{mets_file} = {attrs=>$mreader->getAttributeHash()};
		    $file = $attrs{mets_file};
		}
		when (/^mets:FLocat$/) {
		    $file->{mets_FLocat} = {attrs=>$mreader->getAttributeHash()};
		}
	    }
	}
    }
    return \%attrs;
}


=head2 parse_dl

Elementi:
 - san-dl:haSistemaAderente
   * rdf:resource   ("SAN:SAN")
 - san-dl:haProgettoDigitalizzazione
   * rdf:resource   ("SAN:san.cat.projDgt.6",)

=cut

sub parse_dl {
    my ($oreader) = @_;
    my %attrs = (about=>$oreader->getAttribute('rdf:about'),);
    my $mreader = XML::LibXML::Reader->new( string => $oreader->readOuterXml );
    while ($mreader->read) {
	if ($mreader->nodeType == XML_READER_TYPE_ELEMENT) {
	    given($mreader->name) {
		when (/^san-dl:haSistemaAderente$/) {
		    $attrs{haSistemaAderente} = {attrs=>$mreader->getAttributeHash()};
		}
		when (/^san-dl:haProgettoDigitalizzazione$/) {
		    $attrs{haProgettoDigitalizzazione} = {attrs=>$mreader->getAttributeHash()};
		}
		when (/^san-dl:haConservatore$/) {
		    $attrs{haConservatore} = {attrs=>$mreader->getAttributeHash()};
		}
		when (/^san-dl:haComplesso$/) {
		    $attrs{haComplesso} = {attrs=>$mreader->getAttributeHash()};
		}
		when (/^san-dl:haSigillo$/) {
		    $attrs{haSigillo} = {attrs=>$mreader->getAttributeHash()};
		}
		when (/^san-dl:haPergamena$/) {
		    $attrs{haPergamena} = {attrs=>$mreader->getAttributeHash()};
		}
		when (/^san-dl:haLettera$/) {
		    $attrs{haLettera} = {attrs=>$mreader->getAttributeHash()};
		}
		when (/^san-dl:haFrancobollo$/) {
		    $attrs{haFrancobollo} = {attrs=>$mreader->getAttributeHash()};
		}
		when (/^san-dl:haParte$/) {
		    $attrs{haParte} = {attrs=>$mreader->getAttributeHash()};
		}
		when (/^san-dl:haCollezioneVirtuale$/) {
		    $attrs{haCollezioneVirtuale} = {attrs=>$mreader->getAttributeHash()};
		}
	    }
	}
    }
    return \%attrs;
}

1;
