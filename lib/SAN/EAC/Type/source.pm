
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:06 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAC::Type::source;

use SAN::EAC::ns002::Type::hrefType;

our @ISA=qw(XML::Pastor::ComplexType);

SAN::EAC::Type::source->mk_accessors( qw(_href));

# Attribute accessor aliases

sub href { &_href; }

SAN::EAC::Type::source->XmlSchemaType( bless( {
         'attributeInfo' => {
                              'href' => bless( {
                                               'class' => 'SAN::EAC::ns002::Type::hrefType',
                                               'definition' => bless( {
                                                                        'class' => 'SAN::EAC::ns002::Type::hrefType',
                                                                        'isRedefinable' => 1,
                                                                        'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                                        'name' => 'href',
                                                                        'scope' => 'global',
                                                                        'targetNamespace' => 'http://www.w3.org/1999/xlink',
                                                                        'type' => 'hrefType|http://www.w3.org/1999/xlink'
                                                                      }, 'XML::Pastor::Schema::Attribute' ),
                                               'metaClass' => 'SAN::EAC::Pastor::Meta',
                                               'name' => 'href',
                                               'nameIsAutoGenerated' => 1,
                                               'ref' => 'href|http://www.w3.org/1999/xlink',
                                               'scope' => 'local',
                                               'targetNamespace' => 'http://www.w3.org/1999/xlink',
                                               'use' => 'required'
                                             }, 'XML::Pastor::Schema::Attribute' )
                            },
         'attributePrefix' => '_',
         'attributes' => [
                           'href'
                         ],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::EAC::Type::source',
         'contentType' => 'complex',
         'elementInfo' => {},
         'elements' => [],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAC::Pastor::Meta',
         'name' => 'source',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/eac-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::EAC::Type::source>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:06 2015'


=head1 ATTRIBUTE ACCESSORS

=over

=item B<_href>(), B<href>()      - See L<SAN::EAC::ns002::Type::hrefType>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
