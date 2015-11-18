use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaDataImportEventLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaDataImportEventLog

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

=head1 TABLE: C<ca_data_import_event_log>

=cut

__PACKAGE__->table("ca_data_import_event_log");

=head1 ACCESSORS

=head2 log_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 event_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 item_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 type_code

  data_type: 'char'
  is_nullable: 0
  size: 10

=head2 date_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 message

  data_type: 'text'
  is_nullable: 0

=head2 source

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "log_id",
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
  "item_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "type_code",
  { data_type => "char", is_nullable => 0, size => 10 },
  "date_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "message",
  { data_type => "text", is_nullable => 0 },
  "source",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</log_id>

=back

=cut

__PACKAGE__->set_primary_key("log_id");

=head1 RELATIONS

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

=head2 item

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataImportItem>

=cut

__PACKAGE__->belongs_to(
  "item",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataImportItem",
  { item_id => "item_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GzcAbNrUF0FNJxpomQtQ2Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
