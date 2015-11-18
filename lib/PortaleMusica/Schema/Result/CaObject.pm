use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaObject;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaObject

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

=head1 TABLE: C<ca_objects>

=cut

__PACKAGE__->table("ca_objects");

=head1 ACCESSORS

=head2 object_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 parent_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 lot_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 locale_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 source_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

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

=head2 type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 idno

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 idno_sort

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 acquisition_type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 item_status_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 source_info

  accessor: 'column_source_info'
  data_type: 'longtext'
  is_nullable: 0

=head2 hier_object_id

  data_type: 'integer'
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

=head2 extent

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 extent_units

  data_type: 'varchar'
  is_nullable: 0
  size: 255

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

=head2 acl_inherit_from_ca_collections

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 acl_inherit_from_parent

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 access_inherit_from_parent

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 home_location_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 accession_sdatetime

  data_type: 'decimal'
  is_nullable: 1
  size: [30,20]

=head2 accession_edatetime

  data_type: 'decimal'
  is_nullable: 1
  size: [30,20]

=head2 deaccession_sdatetime

  data_type: 'decimal'
  is_nullable: 1
  size: [30,20]

=head2 deaccession_edatetime

  data_type: 'decimal'
  is_nullable: 1
  size: [30,20]

=head2 is_deaccessioned

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=head2 deaccession_notes

  data_type: 'text'
  is_nullable: 0

=head2 deaccession_type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 current_loc_class

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 current_loc_subclass

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 current_loc_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 posizione

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "object_id",
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
  "lot_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "locale_id",
  {
    data_type => "smallint",
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
  "type_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "idno",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "idno_sort",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "acquisition_type_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "item_status_id",
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
  "hier_object_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
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
  "extent",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "extent_units",
  { data_type => "varchar", is_nullable => 0, size => 255 },
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
  "acl_inherit_from_ca_collections",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "acl_inherit_from_parent",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "access_inherit_from_parent",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "home_location_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "accession_sdatetime",
  { data_type => "decimal", is_nullable => 1, size => [30, 20] },
  "accession_edatetime",
  { data_type => "decimal", is_nullable => 1, size => [30, 20] },
  "deaccession_sdatetime",
  { data_type => "decimal", is_nullable => 1, size => [30, 20] },
  "deaccession_edatetime",
  { data_type => "decimal", is_nullable => 1, size => [30, 20] },
  "is_deaccessioned",
  { data_type => "tinyint", default_value => 0, is_nullable => 0 },
  "deaccession_notes",
  { data_type => "text", is_nullable => 0 },
  "deaccession_type_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "current_loc_class",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 1 },
  "current_loc_subclass",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "current_loc_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "posizione",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</object_id>

=back

=cut

__PACKAGE__->set_primary_key("object_id");

=head1 RELATIONS

=head2 acquisition_type

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->belongs_to(
  "acquisition_type",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { item_id => "acquisition_type_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 ca_commerce_order_items

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItem>

=cut

__PACKAGE__->has_many(
  "ca_commerce_order_items",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItem",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObject>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObject",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObject>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObject",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_checkouts

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectCheckout>

=cut

__PACKAGE__->has_many(
  "ca_object_checkouts",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectCheckout",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLabel>

=cut

__PACKAGE__->has_many(
  "ca_object_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLabel",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObject>

=cut

__PACKAGE__->has_many(
  "ca_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObject",
  { "foreign.parent_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXCollection>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXCollection",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXEntity",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXObjectRepresentation",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_objects_object_rights

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXObject>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_objects_object_rights",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXObject",
  { "foreign.object_right_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_objects_objects_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXObject>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_objects_objects_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXObject",
  { "foreign.object_left_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXOccurrence",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectXPlaces",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXStorageLocation",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXVocabularyTerm",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXObject>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXObject",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXObject>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXObject",
  { "foreign.object_id" => "self.object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 deaccession_type

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->belongs_to(
  "deaccession_type",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { item_id => "deaccession_type_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 home_location

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocation>

=cut

__PACKAGE__->belongs_to(
  "home_location",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocation",
  { location_id => "home_location_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 item_status

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->belongs_to(
  "item_status",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { item_id => "item_status_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 locale

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLocale>

=cut

__PACKAGE__->belongs_to(
  "locale",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLocale",
  { locale_id => "locale_id" },
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
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 parent

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObject>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObject",
  { object_id => "parent_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UFeWtc95HiHy9sDGU+JSHw

__PACKAGE__->add_unique_constraint(ca_idno => [ qw/idno/ ]);

__PACKAGE__->has_many(
  "ca_attributes",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaAttribute",
    { "foreign.row_id" => "self.object_id",
    },
    { where=> { "foreign.table_num" => 57 },
      cascade_copy => 0, cascade_delete => 1 },
);

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
