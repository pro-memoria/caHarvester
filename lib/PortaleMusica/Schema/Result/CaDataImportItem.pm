use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaDataImportItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaDataImportItem

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

=head1 TABLE: C<ca_data_import_items>

=cut

__PACKAGE__->table("ca_data_import_items");

=head1 ACCESSORS

=head2 item_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 event_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 source_ref

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 type_code

  data_type: 'char'
  is_nullable: 1
  size: 1

=head2 started_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 completed_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 elapsed_time

  data_type: 'decimal'
  is_nullable: 1
  size: [8,4]

=head2 success

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 message

  data_type: 'text'
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
  "event_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "source_ref",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "row_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "type_code",
  { data_type => "char", is_nullable => 1, size => 1 },
  "started_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "completed_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "elapsed_time",
  { data_type => "decimal", is_nullable => 1, size => [8, 4] },
  "success",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "message",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</item_id>

=back

=cut

__PACKAGE__->set_primary_key("item_id");

=head1 RELATIONS

=head2 ca_data_import_event_logs

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataImportEventLog>

=cut

__PACKAGE__->has_many(
  "ca_data_import_event_logs",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataImportEventLog",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 event

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataImportEvent>

=cut

__PACKAGE__->belongs_to(
  "event",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataImportEvent",
  { event_id => "event_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/EQRDMFBI2nILpZiTaTwfg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
