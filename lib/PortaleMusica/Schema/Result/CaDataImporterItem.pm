use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterItem

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

=head1 TABLE: C<ca_data_importer_items>

=cut

__PACKAGE__->table("ca_data_importer_items");

=head1 ACCESSORS

=head2 item_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 importer_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 source

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 destination

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 settings

  data_type: 'longtext'
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
  "importer_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "group_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "source",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "destination",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "settings",
  { data_type => "longtext", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</item_id>

=back

=cut

__PACKAGE__->set_primary_key("item_id");

=head1 RELATIONS

=head2 group

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterGroup>

=cut

__PACKAGE__->belongs_to(
  "group",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterGroup",
  { group_id => "group_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 importer

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporter>

=cut

__PACKAGE__->belongs_to(
  "importer",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporter",
  { importer_id => "importer_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aVSBHr+jTmlnn9WCeTW24Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
