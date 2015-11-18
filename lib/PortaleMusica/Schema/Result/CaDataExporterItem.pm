use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporterItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporterItem

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

=head1 TABLE: C<ca_data_exporter_items>

=cut

__PACKAGE__->table("ca_data_exporter_items");

=head1 ACCESSORS

=head2 item_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 parent_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 exporter_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 element

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 context

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 source

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 settings

  data_type: 'longtext'
  is_nullable: 0

=head2 hier_item_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 hier_left

  data_type: 'decimal'
  extra: {unsigned => 1}
  is_nullable: 0
  size: [30,20]

=head2 hier_right

  data_type: 'decimal'
  extra: {unsigned => 1}
  is_nullable: 0
  size: [30,20]

=head2 rank

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "item_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "parent_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "exporter_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "element",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "context",
  { data_type => "varchar", is_nullable => 1, size => 1024 },
  "source",
  { data_type => "varchar", is_nullable => 1, size => 1024 },
  "settings",
  { data_type => "longtext", is_nullable => 0 },
  "hier_item_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "hier_left",
  {
    data_type => "decimal",
    extra => { unsigned => 1 },
    is_nullable => 0,
    size => [30, 20],
  },
  "hier_right",
  {
    data_type => "decimal",
    extra => { unsigned => 1 },
    is_nullable => 0,
    size => [30, 20],
  },
  "rank",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</item_id>

=back

=cut

__PACKAGE__->set_primary_key("item_id");

=head1 RELATIONS

=head2 ca_data_exporter_items

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporterItem>

=cut

__PACKAGE__->has_many(
  "ca_data_exporter_items",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporterItem",
  { "foreign.parent_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 exporter

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporter>

=cut

__PACKAGE__->belongs_to(
  "exporter",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporter",
  { exporter_id => "exporter_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 parent

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporterItem>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporterItem",
  { item_id => "parent_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:himNQnpybuaXzsV3H2VKHw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
