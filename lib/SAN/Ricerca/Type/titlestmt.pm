
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:08 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::Ricerca::Type::titlestmt;

use SAN::Ricerca::Type::stringNotEmpty;

our @ISA=qw(XML::Pastor::ComplexType);

SAN::Ricerca::Type::titlestmt->mk_accessors( qw(author titleproper));

SAN::Ricerca::Type::titlestmt->XmlSchemaType( bless( {
         'attributeInfo' => {},
         'attributePrefix' => '_',
         'attributes' => [],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::Ricerca::Type::titlestmt',
         'contentType' => 'complex',
         'elementInfo' => {
                            'author' => bless( {
                                               'class' => 'SAN::Ricerca::Type::stringNotEmpty',
                                               'metaClass' => 'SAN::Ricerca::Pastor::Meta',
                                               'minOccurs' => '0',
                                               'name' => 'author',
                                               'scope' => 'local',
                                               'targetNamespace' => 'http://san.mibac.it/ricerca-san/',
                                               'type' => 'stringNotEmpty|http://san.mibac.it/ricerca-san/'
                                             }, 'XML::Pastor::Schema::Element' ),
                            'titleproper' => bless( {
                                                    'class' => 'SAN::Ricerca::Type::stringNotEmpty',
                                                    'metaClass' => 'SAN::Ricerca::Pastor::Meta',
                                                    'name' => 'titleproper',
                                                    'scope' => 'local',
                                                    'targetNamespace' => 'http://san.mibac.it/ricerca-san/',
                                                    'type' => 'stringNotEmpty|http://san.mibac.it/ricerca-san/'
                                                  }, 'XML::Pastor::Schema::Element' )
                          },
         'elements' => [
                         'author',
                         'titleproper'
                       ],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::Ricerca::Pastor::Meta',
         'name' => 'titlestmt',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/ricerca-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::Ricerca::Type::titlestmt>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:08 2015'


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<author>()      - See L<SAN::Ricerca::Type::stringNotEmpty>.

=item B<titleproper>()      - See L<SAN::Ricerca::Type::stringNotEmpty>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut