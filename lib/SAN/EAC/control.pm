
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:06 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAC::control;

use SAN::EAC::Type::control;

our @ISA=qw(SAN::EAC::Type::control XML::Pastor::Element);

SAN::EAC::control->XmlSchemaElement( bless( {
         'baseClasses' => [
                            'SAN::EAC::Type::control',
                            'XML::Pastor::Element'
                          ],
         'class' => 'SAN::EAC::control',
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAC::Pastor::Meta',
         'name' => 'control',
         'scope' => 'global',
         'targetNamespace' => 'http://san.mibac.it/eac-san/',
         'type' => 'control|http://san.mibac.it/eac-san/'
       }, 'XML::Pastor::Schema::Element' ) );

1;


__END__



=head1 NAME

B<SAN::EAC::control>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<SAN::EAC::Type::control>, L<XML::Pastor::Element>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:06 2015'


=head1 SEE ALSO

L<SAN::EAC::Type::control>, L<XML::Pastor::Element>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
