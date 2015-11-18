use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaPlace;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaPlace

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

=head1 TABLE: C<ca_places>

=cut

__PACKAGE__->table("ca_places");

=head1 ACCESSORS

=head2 place_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 parent_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 locale_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 source_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 hierarchy_id

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

=head2 source_info

  accessor: 'column_source_info'
  data_type: 'longtext'
  is_nullable: 0

=head2 lifespan_sdate

  data_type: 'decimal'
  is_nullable: 1
  size: [30,20]

=head2 lifespan_edate

  data_type: 'decimal'
  is_nullable: 1
  size: [30,20]

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

=head2 hier_left

  data_type: 'decimal'
  is_nullable: 0
  size: [30,20]

=head2 hier_right

  data_type: 'decimal'
  is_nullable: 0
  size: [30,20]

=head2 rank

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "place_id",
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
  "locale_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "type_id",
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
  "hierarchy_id",
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
  "source_info",
  {
    accessor    => "column_source_info",
    data_type   => "longtext",
    is_nullable => 0,
  },
  "lifespan_sdate",
  { data_type => "decimal", is_nullable => 1, size => [30, 20] },
  "lifespan_edate",
  { data_type => "decimal", is_nullable => 1, size => [30, 20] },
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
  "hier_left",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
  "hier_right",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
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

=item * L</place_id>

=back

=cut

__PACKAGE__->set_primary_key("place_id");

=head1 RELATIONS

=head2 ca_entities_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntityXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntityXPlaces",
  { "foreign.place_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoanXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoanXPlaces",
  { "foreign.place_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementXPlaces",
  { "foreign.place_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotXPlaces",
  { "foreign.place_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationXPlaces",
  { "foreign.place_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectXPlaces",
  { "foreign.place_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_place_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlaceLabel>

=cut

__PACKAGE__->has_many(
  "ca_place_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlaceLabel",
  { "foreign.place_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlace>

=cut

__PACKAGE__->has_many(
  "ca_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlace",
  { "foreign.parent_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXCollection>

=cut

__PACKAGE__->has_many(
  "ca_places_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXCollection",
  { "foreign.place_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_places_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXOccurrence",
  { "foreign.place_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_places_place_rights

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlaceXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_places_x_places_place_rights",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlaceXPlaces",
  { "foreign.place_right_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_places_places_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlaceXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_places_x_places_places_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlaceXPlaces",
  { "foreign.place_left_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_places_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXStorageLocation",
  { "foreign.place_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_places_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXVocabularyTerm",
  { "foreign.place_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationXPlaces",
  { "foreign.place_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopXPlaces",
  { "foreign.place_id" => "self.place_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hierarchy

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->belongs_to(
  "hierarchy",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { item_id => "hierarchy_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
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

=head2 parent

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlace>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlace",
  { place_id => "parent_id" },
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
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SFoSkfbKUUS9X3B0RO9plg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
