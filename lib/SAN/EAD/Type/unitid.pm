
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:44:48 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAD::Type::unitid;


our @ISA=qw(XML::Pastor::Builtin::NMTOKEN);

SAN::EAD::Type::unitid->mk_accessors( qw(_type _identifier));

# Attribute accessor aliases

sub type { &_type; }
sub identifier { &_identifier; }

SAN::EAD::Type::unitid->XmlSchemaType( bless( {
         'attributeInfo' => {
                              'identifier' => bless( {
                                                     'class' => 'XML::Pastor::Builtin::anyURI',
                                                     'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                     'name' => 'identifier',
                                                     'scope' => 'local',
                                                     'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                     'type' => 'anyURI|http://www.w3.org/2001/XMLSchema',
                                                     'use' => 'required'
                                                   }, 'XML::Pastor::Schema::Attribute' ),
                              'type' => bless( {
                                               'class' => 'XML::Pastor::Builtin::NMTOKEN',
                                               'metaClass' => 'SAN::EAD::Pastor::Meta',
                                               'name' => 'type',
                                               'scope' => 'local',
                                               'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                               'type' => 'NMTOKEN|http://www.w3.org/2001/XMLSchema',
                                               'use' => 'required'
                                             }, 'XML::Pastor::Schema::Attribute' )
                            },
         'attributePrefix' => '_',
         'attributes' => [
                           'type',
                           'identifier'
                         ],
         'base' => 'NMTOKEN|http://www.w3.org/2001/XMLSchema',
         'baseClasses' => [
                            'XML::Pastor::Builtin::NMTOKEN'
                          ],
         'class' => 'SAN::EAD::Type::unitid',
         'contentType' => 'complex',
         'derivedBy' => 'extension',
         'elementInfo' => {},
         'elements' => [],
         'isRedefinable' => 1,
         'isSimpleContent' => 1,
         'metaClass' => 'SAN::EAD::Pastor::Meta',
         'name' => 'unitid',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/ead-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::EAD::Type::unitid>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::Builtin::NMTOKEN>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:44:48 2015'


=head1 ATTRIBUTE ACCESSORS

=over

=item B<_identifier>(), B<identifier>()      - See L<XML::Pastor::Builtin::anyURI>.

=item B<_type>(), B<type>()      - See L<XML::Pastor::Builtin::NMTOKEN>.

=back


=head1 SEE ALSO

L<XML::Pastor::Builtin::NMTOKEN>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
