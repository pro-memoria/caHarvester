use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaIp;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaIp

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

=head1 TABLE: C<ca_ips>

=cut

__PACKAGE__->table("ca_ips");

=head1 ACCESSORS

=head2 ip_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ip1

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ip2

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 ip3

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 ip4s

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 ip4e

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 notes

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "ip_id",
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
  "ip1",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "ip2",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "ip3",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "ip4s",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "ip4e",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "notes",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</ip_id>

=back

=cut

__PACKAGE__->set_primary_key("ip_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_ip>

=over 4

=item * L</ip1>

=item * L</ip2>

=item * L</ip3>

=item * L</ip4s>

=item * L</ip4e>

=back

=cut

__PACKAGE__->add_unique_constraint("u_ip", ["ip1", "ip2", "ip3", "ip4s", "ip4e"]);

=head1 RELATIONS

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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:d2u5qc6lzcmFwAzDUU2GoA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
