
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:44:47 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::Cat::Type::catRecordBody;


our @ISA=qw(XML::Pastor::ComplexType);

SAN::Cat::Type::catRecordBody->mk_accessors( qw(ead ead eac-cpf scons));

SAN::Cat::Type::catRecordBody->XmlSchemaType( bless( {
         'attributeInfo' => {},
         'attributePrefix' => '_',
         'attributes' => [],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::Cat::Type::catRecordBody',
         'contentType' => 'complex',
         'elementInfo' => {
                            'eac-cpf' => bless( {
                                                'class' => 'SAN::EAC::eac',
                                                'definition' => undef,
                                                'metaClass' => 'SAN::Cat::Pastor::Meta',
                                                'name' => 'eac-cpf',
                                                'nameIsAutoGenerated' => 1,
                                                'ref' => 'eac-cpf|http://san.mibac.it/eac-san/',
                                                'scope' => 'local',
                                                'targetNamespace' => 'http://san.mibac.it/eac-san/'
                                              }, 'XML::Pastor::Schema::Element' ),
                            'eac' => bless( {
                                                'class' => 'SAN::EAC::eac',
                                                'definition' => undef,
                                                'metaClass' => 'SAN::Cat::Pastor::Meta',
                                                'name' => 'eac-cpf',
                                                'nameIsAutoGenerated' => 1,
                                                'ref' => 'eac-cpf|http://san.mibac.it/eac-san/',
                                                'scope' => 'local',
                                                'targetNamespace' => 'http://san.mibac.it/eac-san/'
                                              }, 'XML::Pastor::Schema::Element' ),
                            'ead' => bless( {
                                            'class' => 'SAN::EAD::ead',
                                            'definition' => undef,
                                            'metaClass' => 'SAN::EAD::Pastor::Meta',
                                            'name' => 'ead',
                                            'nameIsAutoGenerated' => 1,
                                            'ref' => 'ead|http://san.mibac.it/ricerca-san/',
                                            'scope' => 'local',
                                            'targetNamespace' => 'http://san.mibac.it/ricerca-san/'
                                          }, 'XML::Pastor::Schema::Element' ),
                            'scons' => bless( {
                                              'class' => undef,
                                              'definition' => undef,
                                              'metaClass' => 'SAN::Cat::Pastor::Meta',
                                              'name' => 'scons',
                                              'nameIsAutoGenerated' => 1,
                                              'ref' => 'scons|http://san.mibac.it/scons-san/',
                                              'scope' => 'local',
                                              'targetNamespace' => 'http://san.mibac.it/scons-san/'
                                            }, 'XML::Pastor::Schema::Element' )
                          },
         'elements' => [
                         'ead',
                         'ead',
                         'eac-cpf',
                         'scons'
                       ],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::Cat::Pastor::Meta',
         'name' => 'catRecordBody',
         'scope' => 'global',
         'targetNamespace' => 'http://san.mibac.it/cat-import'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::Cat::Type::catRecordBody>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:44:47 2015'


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<eac-cpf>()

=item B<ead>()

=item B<ead>()

=item B<scons>()

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
