use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaUserGroup;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaUserGroup

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

=head1 TABLE: C<ca_user_groups>

=cut

__PACKAGE__->table("ca_user_groups");

=head1 ACCESSORS

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 parent_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

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

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 rank

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 vars

  data_type: 'text'
  is_nullable: 0

=head2 hier_left

  data_type: 'decimal'
  is_nullable: 0
  size: [30,20]

=head2 hier_right

  data_type: 'decimal'
  is_nullable: 0
  size: [30,20]

=cut

__PACKAGE__->add_columns(
  "group_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "parent_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "code",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "user_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "rank",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "vars",
  { data_type => "text", is_nullable => 0 },
  "hier_left",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
  "hier_right",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
);

=head1 PRIMARY KEY

=over 4

=item * L</group_id>

=back

=cut

__PACKAGE__->set_primary_key("group_id");

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

=head2 ca_acls

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaAcl>

=cut

__PACKAGE__->has_many(
  "ca_acls",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaAcl",
  { "foreign.group_id" => "self.group_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_groups_x_roles

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaGroupsXRole>

=cut

__PACKAGE__->has_many(
  "ca_groups_x_roles",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaGroupsXRole",
  { "foreign.group_id" => "self.group_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_user_groups

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUserGroup>

=cut

__PACKAGE__->has_many(
  "ca_user_groups",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUserGroup",
  { "foreign.parent_id" => "self.group_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_users_x_groups

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUsersXGroup>

=cut

__PACKAGE__->has_many(
  "ca_users_x_groups",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUsersXGroup",
  { "foreign.group_id" => "self.group_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parent

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUserGroup>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUserGroup",
  { group_id => "parent_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AuswX1HuMqTyOB2M/zGbjw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
