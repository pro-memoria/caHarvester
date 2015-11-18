use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaMediaReplicationStatusCheck;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaMediaReplicationStatusCheck

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

=head1 TABLE: C<ca_media_replication_status_check>

=cut

__PACKAGE__->table("ca_media_replication_status_check");

=head1 ACCESSORS

=head2 check_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 target

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 created_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 last_check

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "check_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "row_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "target",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "created_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "last_check",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</check_id>

=back

=cut

__PACKAGE__->set_primary_key("check_id");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n9znO5uwgEbiIspkUMuvAg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
