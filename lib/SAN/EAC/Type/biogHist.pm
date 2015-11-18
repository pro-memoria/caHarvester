
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:06 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAC::Type::biogHist;

use SAN::EAC::Type::stringNotEmpty;

our @ISA=qw(XML::Pastor::ComplexType);

SAN::EAC::Type::biogHist->mk_accessors( qw(abstract));

SAN::EAC::Type::biogHist->XmlSchemaType( bless( {
         'attributeInfo' => {},
         'attributePrefix' => '_',
         'attributes' => [],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::EAC::Type::biogHist',
         'contentType' => 'complex',
         'elementInfo' => {
                            'abstract' => bless( {
                                                 'class' => 'SAN::EAC::Type::stringNotEmpty',
                                                 'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                 'name' => 'abstract',
                                                 'scope' => 'local',
                                                 'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                                 'type' => 'stringNotEmpty|http://san.mibac.it/eac-san/'
                                               }, 'XML::Pastor::Schema::Element' )
                          },
         'elements' => [
                         'abstract'
                       ],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAC::Pastor::Meta',
         'name' => 'biogHist',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/eac-san/'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::EAC::Type::biogHist>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:06 2015'


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<abstract>()      - See L<SAN::EAC::Type::stringNotEmpty>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut