use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporter;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporter

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

=head1 TABLE: C<ca_data_importers>

=cut

__PACKAGE__->table("ca_data_importers");

=head1 ACCESSORS

=head2 importer_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 importer_code

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 settings

  data_type: 'longtext'
  is_nullable: 0

=head2 rules

  data_type: 'longtext'
  is_nullable: 0

=head2 worksheet

  data_type: 'longblob'
  is_nullable: 0

=head2 deleted

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "importer_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "importer_code",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "settings",
  { data_type => "longtext", is_nullable => 0 },
  "rules",
  { data_type => "longtext", is_nullable => 0 },
  "worksheet",
  { data_type => "longblob", is_nullable => 0 },
  "deleted",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</importer_id>

=back

=cut

__PACKAGE__->set_primary_key("importer_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_importer_code>

=over 4

=item * L</importer_code>

=back

=cut

__PACKAGE__->add_unique_constraint("u_importer_code", ["importer_code"]);

=head1 RELATIONS

=head2 ca_data_importer_groups

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterGroup>

=cut

__PACKAGE__->has_many(
  "ca_data_importer_groups",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterGroup",
  { "foreign.importer_id" => "self.importer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_data_importer_items

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterItem>

=cut

__PACKAGE__->has_many(
  "ca_data_importer_items",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterItem",
  { "foreign.importer_id" => "self.importer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_data_importer_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterLabel>

=cut

__PACKAGE__->has_many(
  "ca_data_importer_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterLabel",
  { "foreign.importer_id" => "self.importer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_data_importer_logs

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterLog>

=cut

__PACKAGE__->has_many(
  "ca_data_importer_logs",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterLog",
  { "foreign.importer_id" => "self.importer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7c6PcMXX2fZKbTWIXxhE1g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
