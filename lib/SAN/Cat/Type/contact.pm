
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:44:47 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::Cat::Type::contact;


our @ISA=qw(XML::Pastor::ComplexType);

SAN::Cat::Type::contact->mk_accessors( qw(name mail phone fax));

SAN::Cat::Type::contact->XmlSchemaType( bless( {
         'attributeInfo' => {},
         'attributePrefix' => '_',
         'attributes' => [],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::Cat::Type::contact',
         'contentType' => 'complex',
         'elementInfo' => {
                            'fax' => bless( {
                                            'class' => 'XML::Pastor::Builtin::string',
                                            'maxOccurs' => 'unbounded',
                                            'metaClass' => 'SAN::Cat::Pastor::Meta',
                                            'minOccurs' => '0',
                                            'name' => 'fax',
                                            'scope' => 'local',
                                            'targetNamespace' => 'http://san.mibac.it/cat-import',
                                            'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                          }, 'XML::Pastor::Schema::Element' ),
                            'mail' => bless( {
                                             'class' => 'XML::Pastor::Builtin::string',
                                             'maxOccurs' => 'unbounded',
                                             'metaClass' => 'SAN::Cat::Pastor::Meta',
                                             'minOccurs' => '1',
                                             'name' => 'mail',
                                             'scope' => 'local',
                                             'targetNamespace' => 'http://san.mibac.it/cat-import',
                                             'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                           }, 'XML::Pastor::Schema::Element' ),
                            'name' => bless( {
                                             'class' => 'XML::Pastor::Builtin::string',
                                             'maxOccurs' => 'unbounded',
                                             'metaClass' => 'SAN::Cat::Pastor::Meta',
                                             'minOccurs' => '0',
                                             'name' => 'name',
                                             'scope' => 'local',
                                             'targetNamespace' => 'http://san.mibac.it/cat-import',
                                             'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                           }, 'XML::Pastor::Schema::Element' ),
                            'phone' => bless( {
                                              'class' => 'XML::Pastor::Builtin::string',
                                              'maxOccurs' => 'unbounded',
                                              'metaClass' => 'SAN::Cat::Pastor::Meta',
                                              'minOccurs' => '0',
                                              'name' => 'phone',
                                              'scope' => 'local',
                                              'targetNamespace' => 'http://san.mibac.it/cat-import',
                                              'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                            }, 'XML::Pastor::Schema::Element' )
                          },
         'elements' => [
                         'name',
                         'mail',
                         'phone',
                         'fax'
                       ],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::Cat::Pastor::Meta',
         'name' => 'contact',
         'scope' => 'global',
         'targetNamespace' => 'http://san.mibac.it/cat-import'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::Cat::Type::contact>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:44:47 2015'


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<fax>()      - See L<XML::Pastor::Builtin::string>.

=item B<mail>()      - See L<XML::Pastor::Builtin::string>.

=item B<name>()      - See L<XML::Pastor::Builtin::string>.

=item B<phone>()      - See L<XML::Pastor::Builtin::string>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
