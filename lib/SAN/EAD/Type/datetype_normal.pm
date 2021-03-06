
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:44:48 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAD::Type::datetype_normal;

use SAN::EAD::Type::datetype_normal_item_0001;
use SAN::EAD::Type::datetype_normal_item_0002;

our @ISA=qw(XML::Pastor::Builtin::Union);

SAN::EAD::Type::datetype_normal->XmlSchemaType( bless( {
         'base' => 'Union|http://www.w3.org/2001/XMLSchema',
         'baseClasses' => [
                            'XML::Pastor::Builtin::Union'
                          ],
         'class' => 'SAN::EAD::Type::datetype_normal',
         'contentType' => 'simple',
         'derivedBy' => 'union',
         'isRedefinable' => 1,
         'memberClasses' => [
                              'SAN::EAD::Type::datetype_normal_item_0001',
                              'SAN::EAD::Type::datetype_normal_item_0002'
                            ],
         'memberTypes' => 'datetype_normal_item_0001 datetype_normal_item_0002',
         'metaClass' => 'SAN::EAD::Pastor::Meta',
         'name' => 'datetype_normal',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/ead-san/'
       }, 'XML::Pastor::Schema::SimpleType' ) );

1;


__END__



=head1 NAME

B<SAN::EAD::Type::datetype_normal>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::Builtin::Union>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:44:48 2015'


=head1 SEE ALSO

L<XML::Pastor::Builtin::Union>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
