
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:44:48 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAD::Type::archdesc;

use SAN::EAD::Type::archdesc_processinfo;
use SAN::EAD::Type::did;
use SAN::EAD::Type::otherfindaid;
use SAN::EAD::Type::relatedmaterial;
use SAN::EAD::Type::stringNotEmpty;
use SAN::EAD::did;
use SAN::EAD::otherfindaid;
use SAN::EAD::relatedmaterial;

our @ISA=qw(XML::Pastor::ComplexType);

SAN::EAD::Type::archdesc->mk_accessors( qw(_level _otherlevel did processinfo relatedmaterial otherfindaid));

# Attribute accessor aliases

sub level { &_level; }
sub otherlevel { &_otherlevel; }

SAN::EAD::Type::archdesc->XmlSchemaType( bless( {
         'attributeInfo' => {
                              'level' => bless( {
                                                'class' => 'SAN::EAD::Type::stringNotEmpty',
                                                'fixed' => 'otherlevel',
                                                'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                'name' => 'level',
                                                'scope' => 'local',
                                                'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                'use' => 'required'
                                              }, 'XML::Pastor::Schema::Attribute' ),
                              'otherlevel' => bless( {
                                                     'class' => 'SAN::EAD::Type::stringNotEmpty',
                                                     'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                     'name' => 'otherlevel',
                                                     'scope' => 'local',
                                                     'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                     'type' => 'stringNotEmpty|http://san.mibac.it/ead-san/',
                                                     'use' => 'required'
                                                   }, 'XML::Pastor::Schema::Attribute' )
                            },
         'attributePrefix' => '_',
         'attributes' => [
                           'level',
                           'otherlevel'
                         ],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::EAD::Type::archdesc',
         'contentType' => 'complex',
         'elementInfo' => {
                            'did' => bless( {
                                            'class' => 'SAN::EAD::Type::did',
                                            'definition' => bless( {
                                                                     'baseClasses' => [
                                                                                        'SAN::EAD::Type::did',
                                                                                        'XML::Pastor::Element'
                                                                                      ],
                                                                     'class' => 'SAN::EAD::did',
                                                                     'isRedefinable' => 1,
                                                                     'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                                     'name' => 'did',
                                                                     'scope' => 'global',
                                                                     'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                                     'type' => 'did|http://san.mibac.it/ead-san/'
                                                                   }, 'XML::Pastor::Schema::Element' ),
                                            'metaClass' => 'SAN::EAD::Pastor::Meta',
                                            'name' => 'did',
                                            'nameIsAutoGenerated' => 1,
                                            'ref' => 'did|http://san.mibac.it/ead-san/',
                                            'scope' => 'local',
                                            'targetNamespace' => 'http://san.mibac.it/ead-san/'
                                          }, 'XML::Pastor::Schema::Element' ),
                            'otherfindaid' => bless( {
                                                     'class' => 'SAN::EAD::Type::otherfindaid',
                                                     'definition' => bless( {
                                                                              'baseClasses' => [
                                                                                                 'SAN::EAD::Type::otherfindaid',
                                                                                                 'XML::Pastor::Element'
                                                                                               ],
                                                                              'class' => 'SAN::EAD::otherfindaid',
                                                                              'isRedefinable' => 1,
                                                                              'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                                              'name' => 'otherfindaid',
                                                                              'scope' => 'global',
                                                                              'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                                              'type' => 'otherfindaid|http://san.mibac.it/ead-san/'
                                                                            }, 'XML::Pastor::Schema::Element' ),
                                                     'maxOccurs' => 'unbounded',
                                                     'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                     'minOccurs' => '0',
                                                     'name' => 'otherfindaid',
                                                     'nameIsAutoGenerated' => 1,
                                                     'ref' => 'otherfindaid|http://san.mibac.it/ead-san/',
                                                     'scope' => 'local',
                                                     'targetNamespace' => 'http://san.mibac.it/ead-san/'
                                                   }, 'XML::Pastor::Schema::Element' ),
                            'processinfo' => bless( {
                                                    'class' => 'SAN::EAD::Type::archdesc_processinfo',
                                                    'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                    'name' => 'processinfo',
                                                    'scope' => 'local',
                                                    'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                    'type' => 'archdesc_processinfo|http://san.mibac.it/ead-san/'
                                                  }, 'XML::Pastor::Schema::Element' ),
                            'relatedmaterial' => bless( {
                                                        'class' => 'SAN::EAD::Type::relatedmaterial',
                                                        'definition' => bless( {
                                                                                 'baseClasses' => [
                                                                                                    'SAN::EAD::Type::relatedmaterial',
                                                                                                    'XML::Pastor::Element'
                                                                                                  ],
                                                                                 'class' => 'SAN::EAD::relatedmaterial',
                                                                                 'isRedefinable' => 1,
                                                                                 'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                                                 'name' => 'relatedmaterial',
                                                                                 'scope' => 'global',
                                                                                 'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                                                 'type' => 'relatedmaterial|http://san.mibac.it/ead-san/'
                                                                               }, 'XML::Pastor::Schema::Element' ),
                                                        'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                        'name' => 'relatedmaterial',
                                                        'nameIsAutoGenerated' => 1,
                                                        'ref' => 'relatedmaterial|http://san.mibac.it/ead-san/',
                                                        'scope' => 'local',
                                                        'targetNamespace' => 'http://san.mibac.it/ead-san/'
                                                      }, 'XML::Pastor::Schema::Element' )
                          },
         'elements' => [
                         'did',
                         'processinfo',
                         'relatedmaterial',
                         'otherfindaid'
                       ],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAD::Pastor::Meta',
         'name' => 'archdesc',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/ead-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::EAD::Type::archdesc>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:44:48 2015'


=head1 ATTRIBUTE ACCESSORS

=over

=item B<_level>(), B<level>()

=item B<_otherlevel>(), B<otherlevel>()      - See L<SAN::EAD::Type::stringNotEmpty>.

=back


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<did>()      - See L<SAN::EAD::Type::did>.

=item B<otherfindaid>()      - See L<SAN::EAD::Type::otherfindaid>.

=item B<processinfo>()      - See L<SAN::EAD::Type::archdesc_processinfo>.

=item B<relatedmaterial>()      - See L<SAN::EAD::Type::relatedmaterial>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
