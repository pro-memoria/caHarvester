
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Thu Jul  9 15:48:25 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::SCONS::Type::formeparallele_formaautorizzata;


our @ISA=qw(XML::Pastor::Builtin::string);

SAN::SCONS::Type::formeparallele_formaautorizzata->mk_accessors( qw(_language));

# Attribute accessor aliases

sub language { &_language; }

SAN::SCONS::Type::formeparallele_formaautorizzata->XmlSchemaType( bless( {
         'attributeInfo' => {
                              'language' => bless( {
                                                   'class' => 'XML::Pastor::Builtin::NMTOKEN',
                                                   'metaClass' => 'SAN::SCONS::Pastor::Meta',
                                                   'name' => 'language',
                                                   'scope' => 'local',
                                                   'targetNamespace' => 'http://san.mibac.it/scons-san/',
                                                   'type' => 'NMTOKEN|http://www.w3.org/2001/XMLSchema'
                                                 }, 'XML::Pastor::Schema::Attribute' )
                            },
         'attributePrefix' => '_',
         'attributes' => [
                           'language'
                         ],
         'base' => 'string|http://www.w3.org/2001/XMLSchema',
         'baseClasses' => [
                            'XML::Pastor::Builtin::string'
                          ],
         'class' => 'SAN::SCONS::Type::formeparallele_formaautorizzata',
         'contentType' => 'complex',
         'derivedBy' => 'extension',
         'elementInfo' => {},
         'elements' => [],
         'isRedefinable' => 1,
         'isSimpleContent' => 1,
         'metaClass' => 'SAN::SCONS::Pastor::Meta',
         'name' => 'formeparallele_formaautorizzata',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/scons-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::SCONS::Type::formeparallele_formaautorizzata>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::Builtin::string>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Thu Jul  9 15:48:25 2015'


=head1 ATTRIBUTE ACCESSORS

=over

=item B<_language>(), B<language>()      - See L<XML::Pastor::Builtin::NMTOKEN>.

=back


=head1 SEE ALSO

L<XML::Pastor::Builtin::string>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut