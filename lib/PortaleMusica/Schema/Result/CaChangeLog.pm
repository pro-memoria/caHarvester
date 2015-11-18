use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaChangeLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaChangeLog

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

=head1 TABLE: C<ca_change_log>

=cut

__PACKAGE__->table("ca_change_log");

=head1 ACCESSORS

=head2 log_id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0

=head2 log_datetime

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 changetype

  data_type: 'char'
  is_nullable: 0
  size: 1

=head2 logged_table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 logged_row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 rolledback

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 unit_id

  data_type: 'char'
  is_nullable: 1
  size: 32

=head2 batch_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "log_id",
  { data_type => "bigint", is_auto_increment => 1, is_nullable => 0 },
  "log_datetime",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "user_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "changetype",
  { data_type => "char", is_nullable => 0, size => 1 },
  "logged_table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "logged_row_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "rolledback",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "unit_id",
  { data_type => "char", is_nullable => 1, size => 32 },
  "batch_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</log_id>

=back

=cut

__PACKAGE__->set_primary_key("log_id");

=head1 RELATIONS

=head2 ca_change_log_snapshots

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaChangeLogSnapshot>

=cut

__PACKAGE__->has_many(
  "ca_change_log_snapshots",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaChangeLogSnapshot",
  { "foreign.log_id" => "self.log_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_change_log_subjects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaChangeLogSubject>

=cut

__PACKAGE__->has_many(
  "ca_change_log_subjects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaChangeLogSubject",
  { "foreign.log_id" => "self.log_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oK1NmQU7YMmLRWOmOXXLkw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
