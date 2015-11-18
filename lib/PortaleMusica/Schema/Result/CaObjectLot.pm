use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLot;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLot

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

=head1 TABLE: C<ca_object_lots>

=cut

__PACKAGE__->table("ca_object_lots");

=head1 ACCESSORS

=head2 lot_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 lot_status_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 idno_stub

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 idno_stub_sort

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 is_template

  data_type: 'tinyint'
  default_value: 0
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

=head2 extent

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 extent_units

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 access

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 status

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 source_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 source_info

  accessor: 'column_source_info'
  data_type: 'longtext'
  is_nullable: 0

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
  "lot_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "type_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "lot_status_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "idno_stub",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "idno_stub_sort",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "is_template",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
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
  "extent",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "extent_units",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "access",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "status",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
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

=item * L</lot_id>

=back

=cut

__PACKAGE__->set_primary_key("lot_id");

=head1 RELATIONS

=head2 ca_loans_x_object_lots

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObjectLot>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_object_lots",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObjectLot",
  { "foreign.lot_id" => "self.lot_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_object_lots

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObjectLot>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_object_lots",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObjectLot",
  { "foreign.lot_id" => "self.lot_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lot_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotLabel>

=cut

__PACKAGE__->has_many(
  "ca_object_lot_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotLabel",
  { "foreign.lot_id" => "self.lot_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXCollection>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXCollection",
  { "foreign.lot_id" => "self.lot_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXEntity",
  { "foreign.lot_id" => "self.lot_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_object_lots_lot_rights

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectLot>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_object_lots_lot_rights",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectLot",
  { "foreign.lot_right_id" => "self.lot_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_object_lots_lots_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectLot>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_object_lots_lots_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectLot",
  { "foreign.lot_left_id" => "self.lot_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectRepresentation",
  { "foreign.lot_id" => "self.lot_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXOccurrence",
  { "foreign.lot_id" => "self.lot_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotXPlaces",
  { "foreign.lot_id" => "self.lot_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXStorageLocation",
  { "foreign.lot_id" => "self.lot_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXVocabularyTerm",
  { "foreign.lot_id" => "self.lot_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObject>

=cut

__PACKAGE__->has_many(
  "ca_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObject",
  { "foreign.lot_id" => "self.lot_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 lot_status

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->belongs_to(
  "lot_status",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { item_id => "lot_status_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
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

=head2 type

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->belongs_to(
  "type",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { item_id => "type_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SWAUjUOPpWa6wZaw+jfFNg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
