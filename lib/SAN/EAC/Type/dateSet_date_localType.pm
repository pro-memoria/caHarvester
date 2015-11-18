
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:06 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAC::Type::dateSet_date_localType;


our @ISA=qw(XML::Pastor::Builtin::string);

SAN::EAC::Type::dateSet_date_localType->XmlSchemaType( bless( {
         'base' => 'string|http://www.w3.org/2001/XMLSchema',
         'baseClasses' => [
                            'XML::Pastor::Builtin::string'
                          ],
         'class' => 'SAN::EAC::Type::dateSet_date_localType',
         'contentType' => 'simple',
         'derivedBy' => 'restriction',
         'enumeration' => {
                            'data di istituzione' => 1,
                            'data di morte' => 1,
                            'data di nascita' => 1,
                            'data di soppressione' => 1,
                            'date di esistenza' => 1,
                            'non indicata' => 1
                          },
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAC::Pastor::Meta',
         'name' => 'dateSet_date_localType',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/eac-san/'
       }, 'XML::Pastor::Schema::SimpleType' ) );

1;


__END__



=head1 NAME

B<SAN::EAC::Type::dateSet_date_localType>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::Builtin::string>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:06 2015'


=head1 SEE ALSO

L<XML::Pastor::Builtin::string>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
