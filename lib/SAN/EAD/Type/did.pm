
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:44:48 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAD::Type::did;

use SAN::EAD::Type::abstract;
use SAN::EAD::Type::datetype;
use SAN::EAD::Type::physdesc;
use SAN::EAD::Type::repository;
use SAN::EAD::Type::unitid;
use SAN::EAD::Type::unittitle;
use SAN::EAD::abstract;
use SAN::EAD::physdesc;
use SAN::EAD::repository;
use SAN::EAD::unitid;
use SAN::EAD::unittitle;

our @ISA=qw(XML::Pastor::ComplexType);

SAN::EAD::Type::did->mk_accessors( qw(unitid unittitle unitdate physdesc abstract origination repository));

SAN::EAD::Type::did->XmlSchemaType( bless( {
         'attributeInfo' => {},
         'attributePrefix' => '_',
         'attributes' => [],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::EAD::Type::did',
         'contentType' => 'complex',
         'elementInfo' => {
                            'abstract' => bless( {
                                                 'class' => 'SAN::EAD::Type::abstract',
                                                 'definition' => bless( {
                                                                          'baseClasses' => [
                                                                                             'SAN::EAD::Type::abstract',
                                                                                             'XML::Pastor::Element'
                                                                                           ],
                                                                          'class' => 'SAN::EAD::abstract',
                                                                          'isRedefinable' => 1,
                                                                          'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                                          'name' => 'abstract',
                                                                          'scope' => 'global',
                                                                          'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                                          'type' => 'abstract|http://san.mibac.it/ead-san/'
                                                                        }, 'XML::Pastor::Schema::Element' ),
                                                 'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                 'minOccurs' => '0',
                                                 'name' => 'abstract',
                                                 'nameIsAutoGenerated' => 1,
                                                 'ref' => 'abstract|http://san.mibac.it/ead-san/',
                                                 'scope' => 'local',
                                                 'targetNamespace' => 'http://san.mibac.it/ead-san/'
                                               }, 'XML::Pastor::Schema::Element' ),
                            'origination' => bless( {
                                                    'class' => 'XML::Pastor::Builtin::NMTOKEN',
                                                    'maxOccurs' => 'unbounded',
                                                    'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                    'minOccurs' => '0',
                                                    'name' => 'origination',
                                                    'scope' => 'local',
                                                    'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                    'type' => 'NMTOKEN|http://www.w3.org/2001/XMLSchema'
                                                  }, 'XML::Pastor::Schema::Element' ),
                            'physdesc' => bless( {
                                                 'class' => 'SAN::EAD::Type::physdesc',
                                                 'definition' => bless( {
                                                                          'baseClasses' => [
                                                                                             'SAN::EAD::Type::physdesc',
                                                                                             'XML::Pastor::Element'
                                                                                           ],
                                                                          'class' => 'SAN::EAD::physdesc',
                                                                          'isRedefinable' => 1,
                                                                          'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                                          'name' => 'physdesc',
                                                                          'scope' => 'global',
                                                                          'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                                          'type' => 'physdesc|http://san.mibac.it/ead-san/'
                                                                        }, 'XML::Pastor::Schema::Element' ),
                                                 'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                 'name' => 'physdesc',
                                                 'nameIsAutoGenerated' => 1,
                                                 'ref' => 'physdesc|http://san.mibac.it/ead-san/',
                                                 'scope' => 'local',
                                                 'targetNamespace' => 'http://san.mibac.it/ead-san/'
                                               }, 'XML::Pastor::Schema::Element' ),
                            'repository' => bless( {
                                                   'class' => 'SAN::EAD::Type::repository',
                                                   'definition' => bless( {
                                                                            'baseClasses' => [
                                                                                               'SAN::EAD::Type::repository',
                                                                                               'XML::Pastor::Element'
                                                                                             ],
                                                                            'class' => 'SAN::EAD::repository',
                                                                            'isRedefinable' => 1,
                                                                            'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                                            'name' => 'repository',
                                                                            'scope' => 'global',
                                                                            'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                                            'type' => 'repository|http://san.mibac.it/ead-san/'
                                                                          }, 'XML::Pastor::Schema::Element' ),
                                                   'maxOccurs' => 'unbounded',
                                                   'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                   'name' => 'repository',
                                                   'nameIsAutoGenerated' => 1,
                                                   'ref' => 'repository|http://san.mibac.it/ead-san/',
                                                   'scope' => 'local',
                                                   'targetNamespace' => 'http://san.mibac.it/ead-san/'
                                                 }, 'XML::Pastor::Schema::Element' ),
                            'unitdate' => bless( {
                                                 'class' => 'SAN::EAD::Type::datetype',
                                                 'maxOccurs' => 'unbounded',
                                                 'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                 'name' => 'unitdate',
                                                 'scope' => 'local',
                                                 'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                 'type' => 'datetype|http://san.mibac.it/ead-san/'
                                               }, 'XML::Pastor::Schema::Element' ),
                            'unitid' => bless( {
                                               'class' => 'SAN::EAD::Type::unitid',
                                               'definition' => bless( {
                                                                        'baseClasses' => [
                                                                                           'SAN::EAD::Type::unitid',
                                                                                           'XML::Pastor::Element'
                                                                                         ],
                                                                        'class' => 'SAN::EAD::unitid',
                                                                        'isRedefinable' => 1,
                                                                        'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                                        'name' => 'unitid',
                                                                        'scope' => 'global',
                                                                        'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                                        'type' => 'unitid|http://san.mibac.it/ead-san/'
                                                                      }, 'XML::Pastor::Schema::Element' ),
                                               'metaClass' => 'SAN::EAD::Pastor::Meta',
                                               'name' => 'unitid',
                                               'nameIsAutoGenerated' => 1,
                                               'ref' => 'unitid|http://san.mibac.it/ead-san/',
                                               'scope' => 'local',
                                               'targetNamespace' => 'http://san.mibac.it/ead-san/'
                                             }, 'XML::Pastor::Schema::Element' ),
                            'unittitle' => bless( {
                                                  'class' => 'SAN::EAD::Type::unittitle',
                                                  'definition' => bless( {
                                                                           'baseClasses' => [
                                                                                              'SAN::EAD::Type::unittitle',
                                                                                              'XML::Pastor::Element'
                                                                                            ],
                                                                           'class' => 'SAN::EAD::unittitle',
                                                                           'isRedefinable' => 1,
                                                                           'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                                           'name' => 'unittitle',
                                                                           'scope' => 'global',
                                                                           'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                                           'type' => 'unittitle|http://san.mibac.it/ead-san/'
                                                                         }, 'XML::Pastor::Schema::Element' ),
                                                  'maxOccurs' => 'unbounded',
                                                  'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                  'name' => 'unittitle',
                                                  'nameIsAutoGenerated' => 1,
                                                  'ref' => 'unittitle|http://san.mibac.it/ead-san/',
                                                  'scope' => 'local',
                                                  'targetNamespace' => 'http://san.mibac.it/ead-san/'
                                                }, 'XML::Pastor::Schema::Element' )
                          },
         'elements' => [
                         'unitid',
                         'unittitle',
                         'unitdate',
                         'physdesc',
                         'abstract',
                         'origination',
                         'repository'
                       ],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAD::Pastor::Meta',
         'name' => 'did',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/ead-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::EAD::Type::did>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:44:48 2015'


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<abstract>()      - See L<SAN::EAD::Type::abstract>.

=item B<origination>()      - See L<XML::Pastor::Builtin::NMTOKEN>.

=item B<physdesc>()      - See L<SAN::EAD::Type::physdesc>.

=item B<repository>()      - See L<SAN::EAD::Type::repository>.

=item B<unitdate>()      - See L<SAN::EAD::Type::datetype>.

=item B<unitid>()      - See L<SAN::EAD::Type::unitid>.

=item B<unittitle>()      - See L<SAN::EAD::Type::unittitle>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
