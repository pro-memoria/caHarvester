
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:09 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::METS::RDF::Type::rdfProperty;


our @ISA=qw(XML::Pastor::ComplexType);

SAN::METS::RDF::Type::rdfProperty->mk_accessors( qw(_resource));

# Attribute accessor aliases

sub resource { &_resource; }

SAN::METS::RDF::Type::rdfProperty->XmlSchemaType( bless( {
         'attributeInfo' => {
                              'resource' => bless( {
                                                   'class' => 'XML::Pastor::Builtin::string',
                                                   'form' => 'qualified',
                                                   'metaClass' => 'SAN::METS::RDF::Pastor::Meta',
                                                   'name' => 'resource',
                                                   'scope' => 'local',
                                                   'targetNamespace' => 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
                                                   'type' => 'string|http://www.w3.org/2001/XMLSchema',
                                                   'use' => 'required'
                                                 }, 'XML::Pastor::Schema::Attribute' )
                            },
         'attributePrefix' => '_',
         'attributes' => [
                           'resource'
                         ],
         'baseClasses' => [
                            'XML::Pastor::ComplexType'
                          ],
         'class' => 'SAN::METS::RDF::Type::rdfProperty',
         'contentType' => 'complex',
         'elementInfo' => {},
         'elements' => [],
         'isRedefinable' => 1,
         'metaClass' => 'SAN::METS::RDF::Pastor::Meta',
         'name' => 'rdfProperty',
         'scope' => 'global',
         'targetNamespace' => 'http://www.w3.org/1999/02/22-rdf-syntax-ns#'
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::METS::RDF::Type::rdfProperty>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:09 2015'


=head1 ATTRIBUTE ACCESSORS

=over

=item B<_resource>(), B<resource>()      - See L<XML::Pastor::Builtin::string>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
