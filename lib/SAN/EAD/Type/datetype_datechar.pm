
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:44:48 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAD::Type::datetype_datechar;


our @ISA=qw(XML::Pastor::Builtin::string);

SAN::EAD::Type::datetype_datechar->XmlSchemaType( bless( {
         'base' => 'string|http://www.w3.org/2001/XMLSchema',
         'baseClasses' => [
                            'XML::Pastor::Builtin::string'
                          ],
         'class' => 'SAN::EAD::Type::datetype_datechar',
         'contentType' => 'simple',
         'derivedBy' => 'restriction',
         'enumeration' => {
                            'con documentazione dal' => 1,
                            'con documentazione fino al' => 1,
                            'con documentazione in copia dal' => 1,
                            'con lacuna' => 1,
                            'data della documentazione compresa' => 1,
                            'non indicata' => 1,
                            'principale' => 1
                          },
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAD::Pastor::Meta',
         'name' => 'datetype_datechar',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/ead-san/'
       }, 'XML::Pastor::Schema::SimpleType' ) );

1;


__END__



=head1 NAME

B<SAN::EAD::Type::datetype_datechar>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::Builtin::string>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:44:48 2015'


=head1 SEE ALSO

L<XML::Pastor::Builtin::string>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
