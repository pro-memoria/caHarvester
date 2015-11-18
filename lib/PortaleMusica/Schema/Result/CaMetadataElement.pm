use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement

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

=head1 TABLE: C<ca_metadata_elements>

=cut

__PACKAGE__->table("ca_metadata_elements");

=head1 ACCESSORS

=head2 element_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 parent_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 list_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 element_code

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 documentation_url

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 datatype

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 settings

  data_type: 'longtext'
  is_nullable: 0

=head2 rank

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 hier_left

  data_type: 'decimal'
  is_nullable: 0
  size: [30,20]

=head2 hier_right

  data_type: 'decimal'
  is_nullable: 0
  size: [30,20]

=head2 hier_element_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "element_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "parent_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "list_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "element_code",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "documentation_url",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "datatype",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "settings",
  { data_type => "longtext", is_nullable => 0 },
  "rank",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "hier_left",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
  "hier_right",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
  "hier_element_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</element_id>

=back

=cut

__PACKAGE__->set_primary_key("element_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_name_short>

=over 4

=item * L</element_code>

=back

=cut

__PACKAGE__->add_unique_constraint("u_name_short", ["element_code"]);

=head1 RELATIONS

=head2 ca_attribute_values

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaAttributeValue>

=cut

__PACKAGE__->has_many(
  "ca_attribute_values",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaAttributeValue",
  { "foreign.element_id" => "self.element_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_attributes

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaAttribute>

=cut

__PACKAGE__->has_many(
  "ca_attributes",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaAttribute",
  { "foreign.element_id" => "self.element_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_metadata_element_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElementLabel>

=cut

__PACKAGE__->has_many(
  "ca_metadata_element_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElementLabel",
  { "foreign.element_id" => "self.element_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_metadata_elements

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement>

=cut

__PACKAGE__->has_many(
  "ca_metadata_elements",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement",
  { "foreign.parent_id" => "self.element_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_metadata_type_restrictions

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataTypeRestriction>

=cut

__PACKAGE__->has_many(
  "ca_metadata_type_restrictions",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataTypeRestriction",
  { "foreign.element_id" => "self.element_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 list

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaList>

=cut

__PACKAGE__->belongs_to(
  "list",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaList",
  { list_id => "list_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 parent

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement",
  { element_id => "parent_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3MUQ3jh6mhjaHTqR5dwKBg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
