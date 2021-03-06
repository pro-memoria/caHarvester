
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:44:48 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAD::Type::datetype;

use SAN::EAD::Type::datetype_datechar;
use SAN::EAD::Type::datetype_normal;

our @ISA=qw(XML::Pastor::Builtin::string);

SAN::EAD::Type::datetype->mk_accessors( qw(_normal _datechar));

# Attribute accessor aliases

sub normal { &_normal; }
sub datechar { &_datechar; }

SAN::EAD::Type::datetype->XmlSchemaType( bless( {
         'attributeInfo' => {
                              'datechar' => bless( {
                                                   'class' => 'SAN::EAD::Type::datetype_datechar',
                                                   'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                   'name' => 'datechar',
                                                   'scope' => 'local',
                                                   'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                   'type' => 'datetype_datechar|http://san.mibac.it/ead-san/',
                                                   'use' => 'required'
                                                 }, 'XML::Pastor::Schema::Attribute' ),
                              'normal' => bless( {
                                                 'class' => 'SAN::EAD::Type::datetype_normal',
                                                 'metaClass' => 'SAN::EAD::Pastor::Meta',
                                                 'name' => 'normal',
                                                 'scope' => 'local',
                                                 'targetNamespace' => 'http://san.mibac.it/ead-san/',
                                                 'type' => 'datetype_normal|http://san.mibac.it/ead-san/',
                                                 'use' => 'required'
                                               }, 'XML::Pastor::Schema::Attribute' )
                            },
         'attributePrefix' => '_',
         'attributes' => [
                           'normal',
                           'datechar'
                         ],
         'base' => 'string|http://www.w3.org/2001/XMLSchema',
         'baseClasses' => [
                            'XML::Pastor::Builtin::string'
                          ],
         'class' => 'SAN::EAD::Type::datetype',
         'contentType' => 'complex',
         'derivedBy' => 'extension',
         'elementInfo' => {},
         'elements' => [],
         'isRedefinable' => 1,
         'isSimpleContent' => 1,
         'metaClass' => 'SAN::EAD::Pastor::Meta',
         'name' => 'datetype',
         'scope' => 'global',
         'targetNamespace' => 'http://san.mibac.it/ead-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::EAD::Type::datetype>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::Builtin::string>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:44:48 2015'


=head1 ATTRIBUTE ACCESSORS

=over

=item B<_datechar>(), B<datechar>()      - See L<SAN::EAD::Type::datetype_datechar>.

=item B<_normal>(), B<normal>()      - See L<SAN::EAD::Type::datetype_normal>.

=back


=head1 SEE ALSO

L<XML::Pastor::Builtin::string>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
