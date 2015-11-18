use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaAcl;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaAcl

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

=head1 TABLE: C<ca_acl>

=cut

__PACKAGE__->table("ca_acl");

=head1 ACCESSORS

=head2 acl_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 access

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 notes

  data_type: 'char'
  is_nullable: 0
  size: 10

=head2 inherited_from_table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 inherited_from_row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "acl_id",
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
    is_nullable => 1,
  },
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "row_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "access",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "notes",
  { data_type => "char", is_nullable => 0, size => 10 },
  "inherited_from_table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "inherited_from_row_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</acl_id>

=back

=cut

__PACKAGE__->set_primary_key("acl_id");

=head1 RELATIONS

=head2 group

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUserGroup>

=cut

__PACKAGE__->belongs_to(
  "group",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUserGroup",
  { group_id => "group_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 user

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUser>

=cut

__PACKAGE__->belongs_to(
  "user",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUser",
  { user_id => "user_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:L8xJxOStNMKy7s9P5cC5nw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
