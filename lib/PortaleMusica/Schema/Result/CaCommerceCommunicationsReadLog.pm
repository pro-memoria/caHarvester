use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunicationsReadLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunicationsReadLog

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

=head1 TABLE: C<ca_commerce_communications_read_log>

=cut

__PACKAGE__->table("ca_commerce_communications_read_log");

=head1 ACCESSORS

=head2 log_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 communication_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 read_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 read_by_user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "log_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "communication_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "read_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "read_by_user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</log_id>

=back

=cut

__PACKAGE__->set_primary_key("log_id");

=head1 RELATIONS

=head2 communication

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunication>

=cut

__PACKAGE__->belongs_to(
  "communication",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunication",
  { communication_id => "communication_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 read_by_user

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUser>

=cut

__PACKAGE__->belongs_to(
  "read_by_user",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUser",
  { user_id => "read_by_user_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:c/SIk2EM1KKHi+v3ilhMRA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
