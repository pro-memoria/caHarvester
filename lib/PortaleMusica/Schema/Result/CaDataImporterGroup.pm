use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterGroup;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterGroup

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

=head1 TABLE: C<ca_data_importer_groups>

=cut

__PACKAGE__->table("ca_data_importer_groups");

=head1 ACCESSORS

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 importer_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 group_code

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 destination

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 settings

  data_type: 'longtext'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "group_id",
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
  "group_code",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "destination",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "settings",
  { data_type => "longtext", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</group_id>

=back

=cut

__PACKAGE__->set_primary_key("group_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_group_code>

=over 4

=item * L</importer_id>

=item * L</group_code>

=back

=cut

__PACKAGE__->add_unique_constraint("u_group_code", ["importer_id", "group_code"]);

=head1 RELATIONS

=head2 ca_data_importer_items

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterItem>

=cut

__PACKAGE__->has_many(
  "ca_data_importer_items",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterItem",
  { "foreign.group_id" => "self.group_id" },
  { cascade_copy => 0, cascade_delete => 0 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:W+4jIWCa3VHD97WY5IG4GQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
