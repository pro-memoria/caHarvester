use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaBatchLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaBatchLog

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

=head1 TABLE: C<ca_batch_log>

=cut

__PACKAGE__->table("ca_batch_log");

=head1 ACCESSORS

=head2 batch_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 log_datetime

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 notes

  data_type: 'text'
  is_nullable: 0

=head2 batch_type

  data_type: 'char'
  is_nullable: 0
  size: 2

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 elapsed_time

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "batch_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "log_datetime",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "notes",
  { data_type => "text", is_nullable => 0 },
  "batch_type",
  { data_type => "char", is_nullable => 0, size => 2 },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "elapsed_time",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</batch_id>

=back

=cut

__PACKAGE__->set_primary_key("batch_id");

=head1 RELATIONS

=head2 ca_batch_log_items

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaBatchLogItem>

=cut

__PACKAGE__->has_many(
  "ca_batch_log_items",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaBatchLogItem",
  { "foreign.batch_id" => "self.batch_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUser>

=cut

__PACKAGE__->belongs_to(
  "user",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUser",
  { user_id => "user_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iclnKtejACeYkr9pDooIjg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
