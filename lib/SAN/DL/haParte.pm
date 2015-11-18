
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:08 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::DL::haParte;

use SAN::DL::Type::haParte;

our @ISA=qw(SAN::DL::Type::haParte XML::Pastor::Element);

SAN::DL::haParte->XmlSchemaElement( bless( {
         'baseClasses' => [
                            'SAN::DL::Type::haParte',
                            'XML::Pastor::Element'
                          ],
         'class' => 'SAN::DL::haParte',
         'isRedefinable' => 1,
         'metaClass' => 'SAN::DL::Pastor::Meta',
         'name' => 'haParte',
         'scope' => 'global',
         'targetNamespace' => 'http://mibac.it/san/dl#',
         'type' => 'haParte|http://mibac.it/san/dl#'
       }, 'XML::Pastor::Schema::Element' ) );

1;


__END__



=head1 NAME

B<SAN::DL::haParte>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<SAN::DL::Type::haParte>, L<XML::Pastor::Element>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:08 2015'


=head1 SEE ALSO

L<SAN::DL::Type::haParte>, L<XML::Pastor::Element>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
