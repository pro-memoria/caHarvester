
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:44:48 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAD::archdesc;

use SAN::EAD::Type::archdesc;

our @ISA=qw(SAN::EAD::Type::archdesc XML::Pastor::Element);

SAN::EAD::archdesc->XmlSchemaElement( bless( {
         'baseClasses' => [
                            'SAN::EAD::Type::archdesc',
                            'XML::Pastor::Element'
                          ],
         'class' => 'SAN::EAD::archdesc',
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAD::Pastor::Meta',
         'name' => 'archdesc',
         'scope' => 'global',
         'targetNamespace' => 'http://san.mibac.it/ead-san/',
         'type' => 'archdesc|http://san.mibac.it/ead-san/'
       }, 'XML::Pastor::Schema::Element' ) );

1;


__END__



=head1 NAME

B<SAN::EAD::archdesc>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<SAN::EAD::Type::archdesc>, L<XML::Pastor::Element>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:44:48 2015'


=head1 SEE ALSO

L<SAN::EAD::Type::archdesc>, L<XML::Pastor::Element>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut