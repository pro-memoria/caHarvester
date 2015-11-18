use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaUserRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaUserRole

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

=head1 TABLE: C<ca_user_roles>

=cut

__PACKAGE__->table("ca_user_roles");

=head1 ACCESSORS

=head2 role_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 code

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 rank

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 vars

  data_type: 'text'
  is_nullable: 0

=head2 field_access

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "role_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "code",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "rank",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "vars",
  { data_type => "text", is_nullable => 0 },
  "field_access",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</role_id>

=back

=cut

__PACKAGE__->set_primary_key("role_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_code>

=over 4

=item * L</code>

=back

=cut

__PACKAGE__->add_unique_constraint("u_code", ["code"]);

=head2 C<u_name>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("u_name", ["name"]);

=head1 RELATIONS

=head2 ca_groups_x_roles

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaGroupsXRole>

=cut

__PACKAGE__->has_many(
  "ca_groups_x_roles",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaGroupsXRole",
  { "foreign.role_id" => "self.role_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_users_x_roles

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUsersXRole>

=cut

__PACKAGE__->has_many(
  "ca_users_x_roles",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUsersXRole",
  { "foreign.role_id" => "self.role_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+GUGJzpvSU56VVWw5h1VTQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
