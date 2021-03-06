
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:44:48 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAD::Type::unittitle;

use SAN::EAD::Type::stringNotEmpty;

our @ISA=qw(SAN::EAD::Type::stringNotEmpty);

SAN::EAD::Type::unittitle->mk_accessors( qw(_type));

# Attribute accessor aliases

sub type { &_type; }

SAN::EAD::Type::unittitle->XmlSchemaType( bless( {
         'attributeInfo' => {
                              'type' => bless( {
                                               'class' => 'XML::Pastor::Builtin::string',
                                               'metaClass' => 'SAN::EAD::Pastor::Meta',
                                               'name' => 'type',
                                               'scope' => 'local',
                                               'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                               'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                             }, 'XML::Pastor::Schema::Attribute' )
                            },
         'attributePrefix' => '_',
         'attributes' => [
                           'type'
                         ],
         'base' => 'stringNotEmpty|http://san.mibac.it/ead-san/',
         'baseClasses' => [
                            'SAN::EAD::Type::stringNotEmpty'
                          ],
         'class' => 'SAN::EAD::Type::unittitle',
         'contentType' => 'complex',
         'derivedBy' => 'extension',
         'elementInfo' => {},
         'elements' => [],
         'isRedefinable' => 1,
         'isSimpleContent' => 1,
         'metaClass' => 'SAN::EAD::Pastor::Meta',
         'name' => 'unittitle',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/ead-san/',
         'xAttributeInfo' => {
                               'type' => bless( {
                                                'class' => 'XML::Pastor::Builtin::string',
                                                'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                'name' => 'type',
                                                'scope' => 'local',
                                                'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                              }, 'XML::Pastor::Schema::Attribute' )
                             },
         'xAttributes' => [
                            'type'
                          ]
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::EAD::Type::unittitle>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<SAN::EAD::Type::stringNotEmpty>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:44:48 2015'


=head1 ATTRIBUTE ACCESSORS

=over

=item B<_type>(), B<type>()      - See L<XML::Pastor::Builtin::string>.

=back


=head1 SEE ALSO

L<SAN::EAD::Type::stringNotEmpty>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
