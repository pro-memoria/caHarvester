
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:06 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAC::Type::placeDate;

use SAN::EAC::Type::placeDate_descriptiveNote;
use SAN::EAC::Type::stringNotEmpty;

our @ISA=qw(XML::Pastor::ComplexType);

SAN::EAC::Type::placeDate->mk_accessors( qw(place descriptiveNote));

SAN::EAC::Type::placeDate->XmlSchemaType( bless( {
         'attributeInfo' => {},
         'attributePrefix' => '_',
         'attributes' => [],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::EAC::Type::placeDate',
         'contentType' => 'complex',
         'elementInfo' => {
                            'descriptiveNote' => bless( {
                                                        'class' => 'SAN::EAC::Type::placeDate_descriptiveNote',
                                                        'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                        'minOccurs' => '0',
                                                        'name' => 'descriptiveNote',
                                                        'scope' => 'local',
                                                        'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                                        'type' => 'placeDate_descriptiveNote|http://san.mibac.it/eac-san/'
                                                      }, 'XML::Pastor::Schema::Element' ),
                            'place' => bless( {
                                              'class' => 'SAN::EAC::Type::stringNotEmpty',
                                              'metaClass' => 'SAN::EAC::Pastor::Meta',
                                              'name' => 'place',
                                              'scope' => 'local',
                                              'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                              'type' => 'stringNotEmpty|http://san.mibac.it/eac-san/'
                                            }, 'XML::Pastor::Schema::Element' )
                          },
         'elements' => [
                         'place',
                         'descriptiveNote'
                       ],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAC::Pastor::Meta',
         'name' => 'placeDate',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/eac-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::EAC::Type::placeDate>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:06 2015'


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<descriptiveNote>()      - See L<SAN::EAC::Type::placeDate_descriptiveNote>.

=item B<place>()      - See L<SAN::EAC::Type::stringNotEmpty>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
