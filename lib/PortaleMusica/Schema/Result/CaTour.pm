use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaTour;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaTour

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

=head1 TABLE: C<ca_tours>

=cut

__PACKAGE__->table("ca_tours");

=head1 ACCESSORS

=head2 tour_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 tour_code

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 rank

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 color

  data_type: 'char'
  is_nullable: 1
  size: 6

=head2 icon

  data_type: 'longblob'
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

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 source_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 source_info

  accessor: 'column_source_info'
  data_type: 'longtext'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "tour_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "tour_code",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "type_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "rank",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "color",
  { data_type => "char", is_nullable => 1, size => 6 },
  "icon",
  { data_type => "longblob", is_nullable => 0 },
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
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "source_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "source_info",
  {
    accessor    => "column_source_info",
    data_type   => "longtext",
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</tour_id>

=back

=cut

__PACKAGE__->set_primary_key("tour_id");

=head1 RELATIONS

=head2 ca_tour_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourLabel>

=cut

__PACKAGE__->has_many(
  "ca_tour_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourLabel",
  { "foreign.tour_id" => "self.tour_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStop>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStop",
  { "foreign.tour_id" => "self.tour_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 source

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->belongs_to(
  "source",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { item_id => "source_id" },
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


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jb+lGw/TRebuIZxixa1KSg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
