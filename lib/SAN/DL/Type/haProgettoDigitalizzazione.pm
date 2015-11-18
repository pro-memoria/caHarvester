
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:08 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::DL::Type::haProgettoDigitalizzazione;

use SAN::DL::Type::rdfProperty;

our @ISA=qw(SAN::DL::Type::rdfProperty);

SAN::DL::Type::haProgettoDigitalizzazione->XmlSchemaType( bless( {
         'attributeInfo' => {},
         'attributePrefix' => '_',
         'attributes' => [],
         'base' => 'rdfProperty|http://www.w3.org/1999/02/22-rdf-syntax-ns#',
         'baseClasses' => [
                            'SAN::DL::Type::rdfProperty'
                          ],
         'class' => 'SAN::DL::Type::haProgettoDigitalizzazione',
         'contentType' => 'complex',
         'derivedBy' => 'extension',
         'elementInfo' => {},
         'elements' => [],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::DL::Pastor::Meta',
         'name' => 'haProgettoDigitalizzazione',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://mibac.it/san/dl#'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::DL::Type::haProgettoDigitalizzazione>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<SAN::DL::Type::rdfProperty>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:08 2015'


=head1 SEE ALSO

L<SAN::DL::Type::rdfProperty>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
