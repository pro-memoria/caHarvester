use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaAttribute;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaAttribute

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<ca_attributes>

=cut

__PACKAGE__->table("ca_attributes");

=head1 ACCESSORS

=head2 attribute_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 element_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 locale_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "attribute_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "element_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "locale_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "row_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</attribute_id>

=back

=cut

__PACKAGE__->set_primary_key("attribute_id");

=head1 RELATIONS

=head2 ca_attribute_values

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaAttributeValue>

=cut

__PACKAGE__->has_many(
  "ca_attribute_values",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaAttributeValue",
  { "foreign.attribute_id" => "self.attribute_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 element

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement>

=cut

__PACKAGE__->belongs_to(
  "element",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement",
  { element_id => "element_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 locale

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLocale>

=cut

__PACKAGE__->belongs_to(
  "locale",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLocale",
  { locale_id => "locale_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9Aip4hdpi0S5aKTLcvgrrg

=head2 ca_entity

Quando table_num=20 il record e' relazionato con la ca_entities

=cut 

__PACKAGE__->belongs_to(
  "ca_entity",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntity",
  { "foreign.entity_id" => "self.row_id" },
#  { entity_id => "row_id" },
#  { where=> { "me.table_num" => 20 }},
  { on_delete => 0, on_update => 0 },
);

=head2 to be continued
  sub {
             my $args = shift;
             return {
               "$args->{foreign_alias}.entity_id" => "$args->{self_alias}.row_id" ,
               "$args->{self_alias}.table_num"   => 20,
             };
},
=cut



=head2 ca_entity

Quando table_num=57 il record e' relazionato con la ca_objects

=cut 

__PACKAGE__->belongs_to(
  "ca_object",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObject",
  { "foreign.object_id" => "self.row_id" },
);

=head2 to be continued
  sub {
             my $args = shift;
             return {
               "$args->{self_alias}.table_num"   => {'-=' => 57},
               "$args->{foreign_alias}.object_id" => "$args->{self_alias}.row_id",
             };
  },
=cut


=head2 ca_values

Alias per la ca_attribute_values, non avevo voglia di scrivere troppo :D

=cut 


__PACKAGE__->has_many(
  "ca_values",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaAttributeValue",
  { "foreign.attribute_id" => "self.attribute_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_value

Versione della relazione 1:1, quando la ca_attributes non e' un container:
volevo evitare di dover essere verboso.

=cut 


__PACKAGE__->belongs_to(
  "ca_value",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaAttributeValue",
  { "foreign.attribute_id" => "self.attribute_id",
    "foreign.element_id"   => "self.element_id" },
  { left_join=>1 },
);


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
