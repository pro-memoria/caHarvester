
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:08 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::DL::haPercorsoTematico;

use SAN::DL::Type::haPercorsoTematico;

our @ISA=qw(SAN::DL::Type::haPercorsoTematico XML::Pastor::Element);

SAN::DL::haPercorsoTematico->XmlSchemaElement( bless( {
         'baseClasses' => [
                            'SAN::DL::Type::haPercorsoTematico',
                            'XML::Pastor::Element'
                          ],
         'class' => 'SAN::DL::haPercorsoTematico',
         'isRedefinable' => 1,
         'metaClass' => 'SAN::DL::Pastor::Meta',
         'name' => 'haPercorsoTematico',
         'scope' => 'global',
         'targetNamespace' => 'http://mibac.it/san/dl#',
         'type' => 'haPercorsoTematico|http://mibac.it/san/dl#'
       }, 'XML::Pastor::Schema::Element' ) );

1;


__END__



=head1 NAME

B<SAN::DL::haPercorsoTematico>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<SAN::DL::Type::haPercorsoTematico>, L<XML::Pastor::Element>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:08 2015'


=head1 SEE ALSO

L<SAN::DL::Type::haPercorsoTematico>, L<XML::Pastor::Element>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut