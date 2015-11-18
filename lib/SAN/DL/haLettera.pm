
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:08 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::DL::haLettera;

use SAN::DL::Type::haLettera;

our @ISA=qw(SAN::DL::Type::haLettera XML::Pastor::Element);

SAN::DL::haLettera->XmlSchemaElement( bless( {
         'baseClasses' => [
                            'SAN::DL::Type::haLettera',
                            'XML::Pastor::Element'
                          ],
         'class' => 'SAN::DL::haLettera',
         'isRedefinable' => 1,
         'metaClass' => 'SAN::DL::Pastor::Meta',
         'name' => 'haLettera',
         'scope' => 'global',
         'targetNamespace' => 'http://mibac.it/san/dl#',
         'type' => 'haLettera|http://mibac.it/san/dl#'
       }, 'XML::Pastor::Schema::Element' ) );

1;


__END__



=head1 NAME

B<SAN::DL::haLettera>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<SAN::DL::Type::haLettera>, L<XML::Pastor::Element>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:08 2015'


=head1 SEE ALSO

L<SAN::DL::Type::haLettera>, L<XML::Pastor::Element>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
