
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:08 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::Ricerca::editionstmt;

use SAN::Ricerca::Type::editionstmt;

our @ISA=qw(SAN::Ricerca::Type::editionstmt XML::Pastor::Element);

SAN::Ricerca::editionstmt->XmlSchemaElement( bless( {
         'baseClasses' => [
                            'SAN::Ricerca::Type::editionstmt',
                            'XML::Pastor::Element'
                          ],
         'class' => 'SAN::Ricerca::editionstmt',
         'isRedefinable' => 1,
         'metaClass' => 'SAN::Ricerca::Pastor::Meta',
         'name' => 'editionstmt',
         'scope' => 'global',
         'targetNamespace' => 'http://san.mibac.it/ricerca-san/',
         'type' => 'editionstmt|http://san.mibac.it/ricerca-san/'
       }, 'XML::Pastor::Schema::Element' ) );

1;


__END__



=head1 NAME

B<SAN::Ricerca::editionstmt>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<SAN::Ricerca::Type::editionstmt>, L<XML::Pastor::Element>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:08 2015'


=head1 SEE ALSO

L<SAN::Ricerca::Type::editionstmt>, L<XML::Pastor::Element>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
