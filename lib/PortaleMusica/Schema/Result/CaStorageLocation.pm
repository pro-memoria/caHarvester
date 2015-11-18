use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocation

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

=head1 TABLE: C<ca_storage_locations>

=cut

__PACKAGE__->table("ca_storage_locations");

=head1 ACCESSORS

=head2 location_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 parent_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

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

=head2 source_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 source_info

  accessor: 'column_source_info'
  data_type: 'longtext'
  is_nullable: 0

=head2 color

  data_type: 'char'
  is_nullable: 1
  size: 6

=head2 icon

  data_type: 'longblob'
  is_nullable: 0

=head2 hier_left

  data_type: 'decimal'
  is_nullable: 0
  size: [30,20]

=head2 hier_right

  data_type: 'decimal'
  is_nullable: 0
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

=head2 rank

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 is_enabled

  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "location_id",
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
  "type_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
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
  "color",
  { data_type => "char", is_nullable => 1, size => 6 },
  "icon",
  { data_type => "longblob", is_nullable => 0 },
  "hier_left",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
  "hier_right",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
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
  "is_enabled",
  {
    data_type => "tinyint",
    default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</location_id>

=back

=cut

__PACKAGE__->set_primary_key("location_id");

=head1 RELATIONS

=head2 ca_collections_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_collections_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionsXStorageLocation",
  { "foreign.location_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXStorageLocation",
  { "foreign.location_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXStorageLocation",
  { "foreign.location_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXStorageLocation",
  { "foreign.location_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXStorageLocation",
  { "foreign.location_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXStorageLocation",
  { "foreign.location_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObject>

=cut

__PACKAGE__->has_many(
  "ca_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObject",
  { "foreign.home_location_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXStorageLocation",
  { "foreign.location_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXStorageLocation",
  { "foreign.location_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_places_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXStorageLocation",
  { "foreign.location_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_storage_location_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationLabel>

=cut

__PACKAGE__->has_many(
  "ca_storage_location_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationLabel",
  { "foreign.location_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocation",
  { "foreign.parent_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_storage_locations_x_storage_locations_location_rights

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_storage_locations_x_storage_locations_location_rights",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXStorageLocation",
  { "foreign.location_right_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_storage_locations_x_storage_locations_locations_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_storage_locations_x_storage_locations_locations_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXStorageLocation",
  { "foreign.location_left_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_storage_locations_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_storage_locations_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXVocabularyTerm",
  { "foreign.location_id" => "self.location_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parent

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocation>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocation",
  { location_id => "parent_id" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tYQwu0XaPLyOlqCX4Xd+Jg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
