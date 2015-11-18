
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:06 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAC::Type::cpfDescription;

use SAN::EAC::Type::description;
use SAN::EAC::Type::identity;
use SAN::EAC::Type::relations;
use SAN::EAC::description;
use SAN::EAC::identity;
use SAN::EAC::relations;

our @ISA=qw(XML::Pastor::ComplexType);

SAN::EAC::Type::cpfDescription->mk_accessors( qw(identity description relations));

SAN::EAC::Type::cpfDescription->XmlSchemaType( bless( {
         'attributeInfo' => {},
         'attributePrefix' => '_',
         'attributes' => [],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::EAC::Type::cpfDescription',
         'contentType' => 'complex',
         'elementInfo' => {
                            'description' => bless( {
                                                    'class' => 'SAN::EAC::Type::description',
                                                    'definition' => bless( {
                                                                             'baseClasses' => [
                                                                                                'SAN::EAC::Type::description',
                                                                                                'XML::Pastor::Element'
                                                                                              ],
                                                                             'class' => 'SAN::EAC::description',
                                                                             'isRedefinable' => 1,
                                                                             'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                                             'name' => 'description',
                                                                             'scope' => 'global',
                                                                             'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                                                             'type' => 'description|http://san.mibac.it/eac-san/'
                                                                           }, 'XML::Pastor::Schema::Element' ),
                                                    'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                    'name' => 'description',
                                                    'nameIsAutoGenerated' => 1,
                                                    'ref' => 'description|http://san.mibac.it/eac-san/',
                                                    'scope' => 'local',
                                                    'targetNamespace' => 'http://san.mibac.it/eac-san/'
                                                  }, 'XML::Pastor::Schema::Element' ),
                            'identity' => bless( {
                                                 'class' => 'SAN::EAC::Type::identity',
                                                 'definition' => bless( {
                                                                          'baseClasses' => [
                                                                                             'SAN::EAC::Type::identity',
                                                                                             'XML::Pastor::Element'
                                                                                           ],
                                                                          'class' => 'SAN::EAC::identity',
                                                                          'isRedefinable' => 1,
                                                                          'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                                          'name' => 'identity',
                                                                          'scope' => 'global',
                                                                          'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                                                          'type' => 'identity|http://san.mibac.it/eac-san/'
                                                                        }, 'XML::Pastor::Schema::Element' ),
                                                 'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                 'name' => 'identity',
                                                 'nameIsAutoGenerated' => 1,
                                                 'ref' => 'identity|http://san.mibac.it/eac-san/',
                                                 'scope' => 'local',
                                                 'targetNamespace' => 'http://san.mibac.it/eac-san/'
                                               }, 'XML::Pastor::Schema::Element' ),
                            'relations' => bless( {
                                                  'class' => 'SAN::EAC::Type::relations',
                                                  'definition' => bless( {
                                                                           'baseClasses' => [
                                                                                              'SAN::EAC::Type::relations',
                                                                                              'XML::Pastor::Element'
                                                                                            ],
                                                                           'class' => 'SAN::EAC::relations',
                                                                           'isRedefinable' => 1,
                                                                           'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                                           'name' => 'relations',
                                                                           'scope' => 'global',
                                                                           'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                                                           'type' => 'relations|http://san.mibac.it/eac-san/'
                                                                         }, 'XML::Pastor::Schema::Element' ),
                                                  'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                  'minOccurs' => '0',
                                                  'name' => 'relations',
                                                  'nameIsAutoGenerated' => 1,
                                                  'ref' => 'relations|http://san.mibac.it/eac-san/',
                                                  'scope' => 'local',
                                                  'targetNamespace' => 'http://san.mibac.it/eac-san/'
                                                }, 'XML::Pastor::Schema::Element' )
                          },
         'elements' => [
                         'identity',
                         'description',
                         'relations'
                       ],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAC::Pastor::Meta',
         'name' => 'cpfDescription',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/eac-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::EAC::Type::cpfDescription>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:06 2015'


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<description>()      - See L<SAN::EAC::Type::description>.

=item B<identity>()      - See L<SAN::EAC::Type::identity>.

=item B<relations>()      - See L<SAN::EAC::Type::relations>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
