use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaSet;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaSet

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

=head1 TABLE: C<ca_sets>

=cut

__PACKAGE__->table("ca_sets");

=head1 ACCESSORS

=head2 set_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 parent_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 hier_set_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 commenting_status

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 tagging_status

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 rating_status

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 set_code

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 access

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 status

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 hier_left

  data_type: 'decimal'
  extra: {unsigned => 1}
  is_nullable: 0
  size: [30,20]

=head2 hier_right

  data_type: 'decimal'
  extra: {unsigned => 1}
  is_nullable: 0
  size: [30,20]

=head2 deleted

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 rank

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "set_id",
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
  "hier_set_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "user_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "type_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "commenting_status",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "tagging_status",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "rating_status",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "set_code",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "access",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "status",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "hier_left",
  {
    data_type => "decimal",
    extra => { unsigned => 1 },
    is_nullable => 0,
    size => [30, 20],
  },
  "hier_right",
  {
    data_type => "decimal",
    extra => { unsigned => 1 },
    is_nullable => 0,
    size => [30, 20],
  },
  "deleted",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
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

=item * L</set_id>

=back

=cut

__PACKAGE__->set_primary_key("set_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_set_code>

=over 4

=item * L</set_code>

=back

=cut

__PACKAGE__->add_unique_constraint("u_set_code", ["set_code"]);

=head1 RELATIONS

=head2 ca_commerce_transactions

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceTransaction>

=cut

__PACKAGE__->has_many(
  "ca_commerce_transactions",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceTransaction",
  { "foreign.set_id" => "self.set_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_sets

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaSet>

=cut

__PACKAGE__->has_many(
  "ca_sets",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaSet",
  { "foreign.parent_id" => "self.set_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parent

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaSet>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaSet",
  { set_id => "parent_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Q/6tpzVie38tRUaCZhwyEQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
