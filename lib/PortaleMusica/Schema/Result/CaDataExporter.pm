use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporter;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporter

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

=head1 TABLE: C<ca_data_exporters>

=cut

__PACKAGE__->table("ca_data_exporters");

=head1 ACCESSORS

=head2 exporter_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 exporter_code

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

=cut

__PACKAGE__->add_columns(
  "exporter_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "exporter_code",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "settings",
  { data_type => "longtext", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</exporter_id>

=back

=cut

__PACKAGE__->set_primary_key("exporter_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_exporter_code>

=over 4

=item * L</exporter_code>

=back

=cut

__PACKAGE__->add_unique_constraint("u_exporter_code", ["exporter_code"]);

=head1 RELATIONS

=head2 ca_data_exporter_items

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporterItem>

=cut

__PACKAGE__->has_many(
  "ca_data_exporter_items",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporterItem",
  { "foreign.exporter_id" => "self.exporter_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_data_exporter_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporterLabel>

=cut

__PACKAGE__->has_many(
  "ca_data_exporter_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporterLabel",
  { "foreign.exporter_id" => "self.exporter_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nChtYiKKact/vXDNfExPHw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
