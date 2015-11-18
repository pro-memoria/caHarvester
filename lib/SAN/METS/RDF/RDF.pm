
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:09 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::METS::RDF::RDF;

use SAN::METS::RDF::Type::RDF;

our @ISA=qw(SAN::METS::RDF::Type::RDF XML::Pastor::Element);

SAN::METS::RDF::RDF->XmlSchemaElement( bless( {
         'baseClasses' => [
                            'SAN::METS::RDF::Type::RDF',
                            'XML::Pastor::Element'
                          ],
         'class' => 'SAN::METS::RDF::RDF',
         'isRedefinable' => 1,
         'metaClass' => 'SAN::METS::RDF::Pastor::Meta',
         'name' => 'RDF',
         'scope' => 'global',
         'targetNamespace' => 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
         'type' => 'RDF|http://www.w3.org/1999/02/22-rdf-syntax-ns#'
       }, 'XML::Pastor::Schema::Element' ) );

1;


__END__



=head1 NAME

B<SAN::METS::RDF::RDF>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<SAN::METS::RDF::Type::RDF>, L<XML::Pastor::Element>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:09 2015'


=head1 SEE ALSO

L<SAN::METS::RDF::Type::RDF>, L<XML::Pastor::Element>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut