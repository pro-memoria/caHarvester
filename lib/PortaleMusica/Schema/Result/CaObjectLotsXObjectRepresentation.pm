use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectRepresentation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectRepresentation

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

=head1 TABLE: C<ca_object_lots_x_object_representations>

=cut

__PACKAGE__->table("ca_object_lots_x_object_representations");

=head1 ACCESSORS

=head2 relation_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 representation_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 lot_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 source_info

  accessor: 'column_source_info'
  data_type: 'longtext'
  is_nullable: 0

=head2 sdatetime

  data_type: 'decimal'
  is_nullable: 1
  size: [30,20]

=head2 edatetime

  data_type: 'decimal'
  is_nullable: 1
  size: [30,20]

=head2 label_left_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 label_right_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 rank

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 is_primary

  data_type: 'tinyint'
  default_value: 0
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
  "representation_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "lot_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "type_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "source_info",
  {
    accessor    => "column_source_info",
    data_type   => "longtext",
    is_nullable => 0,
  },
  "sdatetime",
  { data_type => "decimal", is_nullable => 1, size => [30, 20] },
  "edatetime",
  { data_type => "decimal", is_nullable => 1, size => [30, 20] },
  "label_left_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "label_right_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "rank",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "is_primary",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</relation_id>

=back

=cut

__PACKAGE__->set_primary_key("relation_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_all>

=over 4

=item * L</type_id>

=item * L</representation_id>

=item * L</lot_id>

=item * L</sdatetime>

=item * L</edatetime>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "u_all",
  [
    "type_id",
    "representation_id",
    "lot_id",
    "sdatetime",
    "edatetime",
  ],
);

=head1 RELATIONS

=head2 label_left

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationLabel>

=cut

__PACKAGE__->belongs_to(
  "label_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationLabel",
  { label_id => "label_left_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 label_right

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotLabel>

=cut

__PACKAGE__->belongs_to(
  "label_right",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotLabel",
  { label_id => "label_right_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 lot

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLot>

=cut

__PACKAGE__->belongs_to(
  "lot",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLot",
  { lot_id => "lot_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 representation

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation>

=cut

__PACKAGE__->belongs_to(
  "representation",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation",
  { representation_id => "representation_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 type

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipType>

=cut

__PACKAGE__->belongs_to(
  "type",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipType",
  { type_id => "type_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:obFzq67TVc2OszavC68AYw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
