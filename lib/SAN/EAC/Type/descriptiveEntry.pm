
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:06 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAC::Type::descriptiveEntry;

use SAN::EAC::Type::descriptiveEntry_descriptiveNote;
use SAN::EAC::Type::stringNotEmpty;

our @ISA=qw(XML::Pastor::ComplexType);

SAN::EAC::Type::descriptiveEntry->mk_accessors( qw(term descriptiveNote));

SAN::EAC::Type::descriptiveEntry->XmlSchemaType( bless( {
         'attributeInfo' => {},
         'attributePrefix' => '_',
         'attributes' => [],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::EAC::Type::descriptiveEntry',
         'contentType' => 'complex',
         'elementInfo' => {
                            'descriptiveNote' => bless( {
                                                        'class' => 'SAN::EAC::Type::descriptiveEntry_descriptiveNote',
                                                        'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                        'minOccurs' => '0',
                                                        'name' => 'descriptiveNote',
                                                        'scope' => 'local',
                                                        'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                                        'type' => 'descriptiveEntry_descriptiveNote|http://san.mibac.it/eac-san/'
                                                      }, 'XML::Pastor::Schema::Element' ),
                            'term' => bless( {
                                             'class' => 'SAN::EAC::Type::stringNotEmpty',
                                             'metaClass' => 'SAN::EAC::Pastor::Meta',
                                             'name' => 'term',
                                             'scope' => 'local',
                                             'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                             'type' => 'stringNotEmpty|http://san.mibac.it/eac-san/'
                                           }, 'XML::Pastor::Schema::Element' )
                          },
         'elements' => [
                         'term',
                         'descriptiveNote'
                       ],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAC::Pastor::Meta',
         'name' => 'descriptiveEntry',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/eac-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::EAC::Type::descriptiveEntry>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:06 2015'


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<descriptiveNote>()      - See L<SAN::EAC::Type::descriptiveEntry_descriptiveNote>.

=item B<term>()      - See L<SAN::EAC::Type::stringNotEmpty>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut