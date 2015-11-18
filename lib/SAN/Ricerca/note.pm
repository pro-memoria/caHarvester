
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:08 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::Ricerca::note;

use SAN::Ricerca::Type::note;

our @ISA=qw(SAN::Ricerca::Type::note XML::Pastor::Element);

SAN::Ricerca::note->XmlSchemaElement( bless( {
         'baseClasses' => [
                            'SAN::Ricerca::Type::note',
                            'XML::Pastor::Element'
                          ],
         'class' => 'SAN::Ricerca::note',
         'isRedefinable' => 1,
         'metaClass' => 'SAN::Ricerca::Pastor::Meta',
         'name' => 'note',
         'scope' => 'global',
         'targetNamespace' => 'http://san.mibac.it/ricerca-san/',
         'type' => 'note|http://san.mibac.it/ricerca-san/'
       }, 'XML::Pastor::Schema::Element' ) );

1;


__END__



=head1 NAME

B<SAN::Ricerca::note>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<SAN::Ricerca::Type::note>, L<XML::Pastor::Element>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:08 2015'


=head1 SEE ALSO

L<SAN::Ricerca::Type::note>, L<XML::Pastor::Element>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
