
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Thu Jul  9 15:48:25 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::SCONS::formeparallele;

use SAN::SCONS::Type::formeparallele;

our @ISA=qw(SAN::SCONS::Type::formeparallele XML::Pastor::Element);

SAN::SCONS::formeparallele->XmlSchemaElement( bless( {
         'baseClasses' => [
                            'SAN::SCONS::Type::formeparallele',
                            'XML::Pastor::Element'
                          ],
         'class' => 'SAN::SCONS::formeparallele',
         'isRedefinable' => 1,
         'metaClass' => 'SAN::SCONS::Pastor::Meta',
         'name' => 'formeparallele',
         'scope' => 'global',
         'targetNamespace' => 'http://san.mibac.it/scons-san/',
         'type' => 'formeparallele|http://san.mibac.it/scons-san/'
       }, 'XML::Pastor::Schema::Element' ) );

1;


__END__



=head1 NAME

B<SAN::SCONS::formeparallele>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<SAN::SCONS::Type::formeparallele>, L<XML::Pastor::Element>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Thu Jul  9 15:48:25 2015'


=head1 SEE ALSO

L<SAN::SCONS::Type::formeparallele>, L<XML::Pastor::Element>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
