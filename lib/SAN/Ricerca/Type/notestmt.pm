
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:08 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::Ricerca::Type::notestmt;

use SAN::Ricerca::Type::note;
use SAN::Ricerca::note;

our @ISA=qw(XML::Pastor::ComplexType);

SAN::Ricerca::Type::notestmt->mk_accessors( qw(note));

SAN::Ricerca::Type::notestmt->XmlSchemaType( bless( {
         'attributeInfo' => {},
         'attributePrefix' => '_',
         'attributes' => [],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::Ricerca::Type::notestmt',
         'contentType' => 'complex',
         'elementInfo' => {
                            'note' => bless( {
                                             'class' => 'SAN::Ricerca::Type::note',
                                             'definition' => bless( {
                                                                      'baseClasses' => [
                                                                                         'SAN::Ricerca::Type::note',
                                                                                         'XML::Pastor::Element'
                                                                                       ],
                                                                      'class' => 'SAN::Ricerca::note',
                                                                      'isRedefinable' => 1,
                                                                      'metaClass' => 'SAN::Ricerca::Pastor::Meta',
                                                                      'name' => 'note',
                                                                      'scope' => 'global',
                                                                      'targetNamespace' => 'http://san.mibac.it/ricerca-san/',
                                                                      'type' => 'note|http://san.mibac.it/ricerca-san/'
                                                                    }, 'XML::Pastor::Schema::Element' ),
                                             'metaClass' => 'SAN::Ricerca::Pastor::Meta',
                                             'name' => 'note',
                                             'nameIsAutoGenerated' => 1,
                                             'ref' => 'note|http://san.mibac.it/ricerca-san/',
                                             'scope' => 'local',
                                             'targetNamespace' => 'http://san.mibac.it/ricerca-san/'
                                           }, 'XML::Pastor::Schema::Element' )
                          },
         'elements' => [
                         'note'
                       ],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::Ricerca::Pastor::Meta',
         'name' => 'notestmt',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/ricerca-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::Ricerca::Type::notestmt>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:08 2015'


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<note>()      - See L<SAN::Ricerca::Type::note>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
