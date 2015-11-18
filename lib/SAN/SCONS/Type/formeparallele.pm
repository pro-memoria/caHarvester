
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Thu Jul  9 15:48:25 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::SCONS::Type::formeparallele;

use SAN::SCONS::Type::formeparallele_formaautorizzata;

our @ISA=qw(XML::Pastor::ComplexType);

SAN::SCONS::Type::formeparallele->mk_accessors( qw(formaautorizzata));

SAN::SCONS::Type::formeparallele->XmlSchemaType( bless( {
         'attributeInfo' => {},
         'attributePrefix' => '_',
         'attributes' => [],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::SCONS::Type::formeparallele',
         'contentType' => 'complex',
         'elementInfo' => {
                            'formaautorizzata' => bless( {
                                                         'class' => 'SAN::SCONS::Type::formeparallele_formaautorizzata',
                                                         'maxOccurs' => 'unbounded',
                                                         'metaClass' => 'SAN::SCONS::Pastor::Meta',
                                                         'minOccurs' => '2',
                                                         'name' => 'formaautorizzata',
                                                         'scope' => 'local',
                                                         'targetNamespace' => 'http://san.mibac.it/scons-san/',
                                                         'type' => 'formeparallele_formaautorizzata|http://san.mibac.it/scons-san/'
                                                       }, 'XML::Pastor::Schema::Element' )
                          },
         'elements' => [
                         'formaautorizzata'
                       ],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::SCONS::Pastor::Meta',
         'name' => 'formeparallele',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/scons-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::SCONS::Type::formeparallele>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Thu Jul  9 15:48:25 2015'


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<formaautorizzata>()      - See L<SAN::SCONS::Type::formeparallele_formaautorizzata>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
