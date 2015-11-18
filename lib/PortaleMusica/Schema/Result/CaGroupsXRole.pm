use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaGroupsXRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaGroupsXRole

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

=head1 TABLE: C<ca_groups_x_roles>

=cut

__PACKAGE__->table("ca_groups_x_roles");

=head1 ACCESSORS

=head2 relation_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 role_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 rank

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "relation_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "group_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "role_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "rank",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</relation_id>

=back

=cut

__PACKAGE__->set_primary_key("relation_id");

=head1 RELATIONS

=head2 group

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUserGroup>

=cut

__PACKAGE__->belongs_to(
  "group",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUserGroup",
  { group_id => "group_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 role

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUserRole>

=cut

__PACKAGE__->belongs_to(
  "role",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUserRole",
  { role_id => "role_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:G9pOugH1eM4xTopANw5uUw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
