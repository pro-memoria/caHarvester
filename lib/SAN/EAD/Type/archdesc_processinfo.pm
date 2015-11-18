
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:44:48 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAD::Type::archdesc_processinfo;


our @ISA=qw(XML::Pastor::Builtin::string);

SAN::EAD::Type::archdesc_processinfo->XmlSchemaType( bless( {
         'base' => 'string|http://www.w3.org/2001/XMLSchema',
         'baseClasses' => [
                            'XML::Pastor::Builtin::string'
                          ],
         'class' => 'SAN::EAD::Type::archdesc_processinfo',
         'contentType' => 'simple',
         'derivedBy' => 'restriction',
         'enumeration' => {
                            'da rivedere' => 1,
                            'non indicato' => 1,
                            'pubblicazione locale/interna' => 1,
                            'rivista' => 1,
                            'scheda di prova' => 1,
                            'scheda in via di compilazione' => 1,
                            'scheda in via di pubblicazione' => 1,
                            'scheda pubblicata' => 1
                          },
         'isRedefinable' => 1,
         'metaClass' => 'SAN::EAD::Pastor::Meta',
         'name' => 'archdesc_processinfo',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/ead-san/'
       }, 'XML::Pastor::Schema::SimpleType' ) );

1;


__END__



=head1 NAME

B<SAN::EAD::Type::archdesc_processinfo>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::Builtin::string>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:44:48 2015'


=head1 SEE ALSO

L<XML::Pastor::Builtin::string>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut