
#PASTOR: Code generated by XML::Pastor/1.0.4 at 'Sun Jun 28 20:45:06 2015'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package SAN::EAC::Type::dateSet_date;

use SAN::EAC::Type::dateSet_date_localType;
use SAN::EAC::Type::date_standardDate;
use SAN::EAC::Type::stringNotEmpty;

our @ISA=qw(SAN::EAC::Type::stringNotEmpty);

SAN::EAC::Type::dateSet_date->mk_accessors( qw(_localType _standardDate));

# Attribute accessor aliases

sub localType { &_localType; }
sub standardDate { &_standardDate; }

SAN::EAC::Type::dateSet_date->XmlSchemaType( bless( {
         'attributeInfo' => {
                              'date' => bless( {
                                               'attributeInfo' => {},
                                               'attributes' => [],
                                               'class' => undef,
                                               'contentType' => 'attributeGroup',
                                               'definition' => bless( {
                                                                        'attributeInfo' => {
                                                                                             'standardDate' => bless( {
                                                                                                                      'class' => 'SAN::EAC::Type::date_standardDate',
                                                                                                                      'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                                                                                      'name' => 'standardDate',
                                                                                                                      'scope' => 'local',
                                                                                                                      'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                                                                                                      'type' => 'date_standardDate|http://san.mibac.it/eac-san/'
                                                                                                                    }, 'XML::Pastor::Schema::Attribute' )
                                                                                           },
                                                                        'attributes' => [
                                                                                          'standardDate'
                                                                                        ],
                                                                        'class' => undef,
                                                                        'contentType' => 'attributeGroup',
                                                                        'isRedefinable' => 1,
                                                                        'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                                        'name' => 'date',
                                                                        'scope' => 'global',
                                                                        'targetNamespace' => 'http://san.mibac.it/eac-san/'
                                                                      }, 'XML::Pastor::Schema::AttributeGroup' ),
                                               'metaClass' => 'SAN::EAC::Pastor::Meta',
                                               'name' => 'date',
                                               'nameIsAutoGenerated' => 1,
                                               'ref' => 'date|http://san.mibac.it/eac-san/',
                                               'scope' => 'local',
                                               'targetNamespace' => 'http://san.mibac.it/eac-san/'
                                             }, 'XML::Pastor::Schema::AttributeGroup' ),
                              'localType' => bless( {
                                                    'class' => 'SAN::EAC::Type::dateSet_date_localType',
                                                    'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                    'name' => 'localType',
                                                    'scope' => 'local',
                                                    'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                                    'type' => 'dateSet_date_localType|http://san.mibac.it/eac-san/',
                                                    'use' => 'required'
                                                  }, 'XML::Pastor::Schema::Attribute' ),
                              'standardDate' => bless( {
                                                       'class' => 'SAN::EAC::Type::date_standardDate',
                                                       'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                       'name' => 'standardDate',
                                                       'scope' => 'local',
                                                       'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                                       'type' => 'date_standardDate|http://san.mibac.it/eac-san/'
                                                     }, 'XML::Pastor::Schema::Attribute' )
                            },
         'attributePrefix' => '_',
         'attributes' => [
                           'localType',
                           'standardDate'
                         ],
         'base' => 'stringNotEmpty|http://san.mibac.it/eac-san/',
         'baseClasses' => [
                            'SAN::EAC::Type::stringNotEmpty'
                          ],
         'class' => 'SAN::EAC::Type::dateSet_date',
         'contentType' => 'complex',
         'derivedBy' => 'extension',
         'elementInfo' => {},
         'elements' => [],
         'isRedefinable' => 1,
         'isSimpleContent' => 1,
         'metaClass' => 'SAN::EAC::Pastor::Meta',
         'name' => 'dateSet_date',
         'nameIsAutoGenerated' => 1,
         'scope' => 'local',
         'targetNamespace' => 'http://san.mibac.it/eac-san/',
         'xAttributeInfo' => {
                               'date' => bless( {
                                                'attributeInfo' => {},
                                                'attributes' => [],
                                                'class' => undef,
                                                'contentType' => 'attributeGroup',
                                                'definition' => bless( {
                                                                         'attributeInfo' => {
                                                                                              'standardDate' => bless( {
                                                                                                                       'class' => 'SAN::EAC::Type::date_standardDate',
                                                                                                                       'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                                                                                       'name' => 'standardDate',
                                                                                                                       'scope' => 'local',
                                                                                                                       'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                                                                                                       'type' => 'date_standardDate|http://san.mibac.it/eac-san/'
                                                                                                                     }, 'XML::Pastor::Schema::Attribute' )
                                                                                            },
                                                                         'attributes' => [
                                                                                           'standardDate'
                                                                                         ],
                                                                         'class' => undef,
                                                                         'contentType' => 'attributeGroup',
                                                                         'isRedefinable' => 1,
                                                                         'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                                         'name' => 'date',
                                                                         'scope' => 'global',
                                                                         'targetNamespace' => 'http://san.mibac.it/eac-san/'
                                                                       }, 'XML::Pastor::Schema::AttributeGroup' ),
                                                'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                'name' => 'date',
                                                'nameIsAutoGenerated' => 1,
                                                'ref' => 'date|http://san.mibac.it/eac-san/',
                                                'scope' => 'local',
                                                'targetNamespace' => 'http://san.mibac.it/eac-san/'
                                              }, 'XML::Pastor::Schema::AttributeGroup' ),
                               'localType' => bless( {
                                                     'class' => 'SAN::EAC::Type::dateSet_date_localType',
                                                     'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                     'name' => 'localType',
                                                     'scope' => 'local',
                                                     'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                                     'type' => 'dateSet_date_localType|http://san.mibac.it/eac-san/',
                                                     'use' => 'required'
                                                   }, 'XML::Pastor::Schema::Attribute' ),
                               'standardDate' => bless( {
                                                        'class' => 'SAN::EAC::Type::date_standardDate',
                                                        'metaClass' => 'SAN::EAC::Pastor::Meta',
                                                        'name' => 'standardDate',
                                                        'scope' => 'local',
                                                        'targetNamespace' => 'http://san.mibac.it/eac-san/',
                                                        'type' => 'date_standardDate|http://san.mibac.it/eac-san/'
                                                      }, 'XML::Pastor::Schema::Attribute' )
                             },
         'xAttributes' => [
                            'localType',
                            'standardDate'
                          ]
       }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<SAN::EAC::Type::dateSet_date>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<SAN::EAC::Type::stringNotEmpty>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.4 at 'Sun Jun 28 20:45:06 2015'


=head1 ATTRIBUTE ACCESSORS

=over

=item B<_localType>(), B<localType>()      - See L<SAN::EAC::Type::dateSet_date_localType>.

=item B<_standardDate>(), B<standardDate>()      - See L<SAN::EAC::Type::date_standardDate>.

=back


=head1 SEE ALSO

L<SAN::EAC::Type::stringNotEmpty>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut