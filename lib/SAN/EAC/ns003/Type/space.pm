
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:06 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAC::ns003::Type::space;


our @ISA=qw(XML::Pastor::Builtin::NCName);

SAN::EAC::ns003::Type::space->XmlSchemaType( bless( {
         'base' => 'NCName|http://www.w3.org/2001/XMLSchema',
         'baseClasses' => [
                            'XML::Pastor::Builtin::NCName'
                          ],
         'class' => 'SAN::EAC::ns003::Type::space',
         'contentType' => 'simple',
         'derivedBy' => 'restriction',
         'enumeration' => {
                            'default' => 1,
                            'preserve' => 1
                          },
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAC::Pastor::Meta',
         'name' => 'space',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://www.w3.org/XML/1998/namespace'
       }, 'XML::Pastor::Schema::SimpleType' ) );

1;


__END__



=head1 NAME

B<SAN::EAC::ns003::Type::space>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::Builtin::NCName>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:06 2015'


=head1 SEE ALSO

L<XML::Pastor::Builtin::NCName>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
