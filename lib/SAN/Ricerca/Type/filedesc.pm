
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:08 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::Ricerca::Type::filedesc;

use SAN::Ricerca::Type::editionstmt;
use SAN::Ricerca::Type::notestmt;
use SAN::Ricerca::Type::publicationstmt;
use SAN::Ricerca::Type::titlestmt;
use SAN::Ricerca::editionstmt;
use SAN::Ricerca::notestmt;
use SAN::Ricerca::publicationstmt;
use SAN::Ricerca::titlestmt;

our @ISA=qw(XML::Pastor::ComplexType);

SAN::Ricerca::Type::filedesc->mk_accessors( qw(titlestmt publicationstmt notestmt editionstmt));

SAN::Ricerca::Type::filedesc->XmlSchemaType( bless( {
         'attributeInfo' => {},
         'attributePrefix' => '_',
         'attributes' => [],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::Ricerca::Type::filedesc',
         'contentType' => 'complex',
         'elementInfo' => {
                            'editionstmt' => bless( {
                                                    'class' => 'SAN::Ricerca::Type::editionstmt',
                                                    'definition' => bless( {
                                                                             'baseClasses' => [
                                                                                                'SAN::Ricerca::Type::editionstmt',
                                                                                                'XML::Pastor::Element'
                                                                                              ],
                                                                             'class' => 'SAN::Ricerca::editionstmt',
                                                                             'isRedefinable' => 1,
                                                                             'metaClass' => 'SAN::Ricerca::Pastor::Meta',
                                                                             'name' => 'editionstmt',
                                                                             'scope' => 'global',
                                                                             'targetNamespace' => 'http://san.mibac.it/ricerca-san/',
                                                                             'type' => 'editionstmt|http://san.mibac.it/ricerca-san/'
                                                                           }, 'XML::Pastor::Schema::Element' ),
                                                    'metaClass' => 'SAN::Ricerca::Pastor::Meta',
                                                    'minOccurs' => '0',
                                                    'name' => 'editionstmt',
                                                    'nameIsAutoGenerated' => 1,
                                                    'ref' => 'editionstmt|http://san.mibac.it/ricerca-san/',
                                                    'scope' => 'local',
                                                    'targetNamespace' => 'http://san.mibac.it/ricerca-san/'
                                                  }, 'XML::Pastor::Schema::Element' ),
                            'notestmt' => bless( {
                                                 'class' => 'SAN::Ricerca::Type::notestmt',
                                                 'definition' => bless( {
                                                                          'baseClasses' => [
                                                                                             'SAN::Ricerca::Type::notestmt',
                                                                                             'XML::Pastor::Element'
                                                                                           ],
                                                                          'class' => 'SAN::Ricerca::notestmt',
                                                                          'isRedefinable' => 1,
                                                                          'metaClass' => 'SAN::Ricerca::Pastor::Meta',
                                                                          'name' => 'notestmt',
                                                                          'scope' => 'global',
                                                                          'targetNamespace' => 'http://san.mibac.it/ricerca-san/',
                                                                          'type' => 'notestmt|http://san.mibac.it/ricerca-san/'
                                                                        }, 'XML::Pastor::Schema::Element' ),
                                                 'metaClass' => 'SAN::Ricerca::Pastor::Meta',
                                                 'minOccurs' => '0',
                                                 'name' => 'notestmt',
                                                 'nameIsAutoGenerated' => 1,
                                                 'ref' => 'notestmt|http://san.mibac.it/ricerca-san/',
                                                 'scope' => 'local',
                                                 'targetNamespace' => 'http://san.mibac.it/ricerca-san/'
                                               }, 'XML::Pastor::Schema::Element' ),
                            'publicationstmt' => bless( {
                                                        'class' => 'SAN::Ricerca::Type::publicationstmt',
                                                        'definition' => bless( {
                                                                                 'baseClasses' => [
                                                                                                    'SAN::Ricerca::Type::publicationstmt',
                                                                                                    'XML::Pastor::Element'
                                                                                                  ],
                                                                                 'class' => 'SAN::Ricerca::publicationstmt',
                                                                                 'isRedefinable' => 1,
                                                                                 'metaClass' => 'SAN::Ricerca::Pastor::Meta',
                                                                                 'name' => 'publicationstmt',
                                                                                 'scope' => 'global',
                                                                                 'targetNamespace' => 'http://san.mibac.it/ricerca-san/',
                                                                                 'type' => 'publicationstmt|http://san.mibac.it/ricerca-san/'
                                                                               }, 'XML::Pastor::Schema::Element' ),
                                                        'metaClass' => 'SAN::Ricerca::Pastor::Meta',
                                                        'name' => 'publicationstmt',
                                                        'nameIsAutoGenerated' => 1,
                                                        'ref' => 'publicationstmt|http://san.mibac.it/ricerca-san/',
                                                        'scope' => 'local',
                                                        'targetNamespace' => 'http://san.mibac.it/ricerca-san/'
                                                      }, 'XML::Pastor::Schema::Element' ),
                            'titlestmt' => bless( {
                                                  'class' => 'SAN::Ricerca::Type::titlestmt',
                                                  'definition' => bless( {
                                                                           'baseClasses' => [
                                                                                              'SAN::Ricerca::Type::titlestmt',
                                                                                              'XML::Pastor::Element'
                                                                                            ],
                                                                           'class' => 'SAN::Ricerca::titlestmt',
                                                                           'isRedefinable' => 1,
                                                                           'metaClass' => 'SAN::Ricerca::Pastor::Meta',
                                                                           'name' => 'titlestmt',
                                                                           'scope' => 'global',
                                                                           'targetNamespace' => 'http://san.mibac.it/ricerca-san/',
                                                                           'type' => 'titlestmt|http://san.mibac.it/ricerca-san/'
                                                                         }, 'XML::Pastor::Schema::Element' ),
                                                  'metaClass' => 'SAN::Ricerca::Pastor::Meta',
                                                  'name' => 'titlestmt',
                                                  'nameIsAutoGenerated' => 1,
                                                  'ref' => 'titlestmt|http://san.mibac.it/ricerca-san/',
                                                  'scope' => 'local',
                                                  'targetNamespace' => 'http://san.mibac.it/ricerca-san/'
                                                }, 'XML::Pastor::Schema::Element' )
                          },
         'elements' => [
                         'titlestmt',
                         'publicationstmt',
                         'notestmt',
                         'editionstmt'
                       ],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::Ricerca::Pastor::Meta',
         'name' => 'filedesc',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/ricerca-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::Ricerca::Type::filedesc>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:08 2015'


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<editionstmt>()      - See L<SAN::Ricerca::Type::editionstmt>.

=item B<notestmt>()      - See L<SAN::Ricerca::Type::notestmt>.

=item B<publicationstmt>()      - See L<SAN::Ricerca::Type::publicationstmt>.

=item B<titlestmt>()      - See L<SAN::Ricerca::Type::titlestmt>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
