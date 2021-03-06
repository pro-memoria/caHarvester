
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:06 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAC::cpfRelation;

use SAN::EAC::Type::cpfRelation;

our @ISA=qw(SAN::EAC::Type::cpfRelation XML::Pastor::Element);

SAN::EAC::cpfRelation->XmlSchemaElement( bless( {
         'baseClasses' => [
                            'SAN::EAC::Type::cpfRelation',
                            'XML::Pastor::Element'
                          ],
         'class' => 'SAN::EAC::cpfRelation',
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAC::Pastor::Meta',
         'name' => 'cpfRelation',
         'scope' => 'global',
         'targetNamespace' => 'http://san.mibac.it/eac-san/',
         'type' => 'cpfRelation|http://san.mibac.it/eac-san/'
       }, 'XML::Pastor::Schema::Element' ) );

1;


__END__



=head1 NAME

B<SAN::EAC::cpfRelation>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<SAN::EAC::Type::cpfRelation>, L<XML::Pastor::Element>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:06 2015'


=head1 SEE ALSO

L<SAN::EAC::Type::cpfRelation>, L<XML::Pastor::Element>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
