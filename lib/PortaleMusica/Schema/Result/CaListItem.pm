use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaListItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaListItem

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

=head1 TABLE: C<ca_list_items>

=cut

__PACKAGE__->table("ca_list_items");

=head1 ACCESSORS

=head2 item_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 parent_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 list_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

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

=head2 item_value

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 rank

  data_type: 'integer'
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

=head2 is_enabled

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 is_default

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 validation_format

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 settings

  data_type: 'longtext'
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

=head2 deleted

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

=cut

__PACKAGE__->add_columns(
  "item_id",
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
  "list_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
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
  "item_value",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "rank",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "hier_left",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
  "hier_right",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
  "is_enabled",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "is_default",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "validation_format",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "settings",
  { data_type => "longtext", is_nullable => 0 },
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
  "deleted",
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
);

=head1 PRIMARY KEY

=over 4

=item * L</item_id>

=back

=cut

__PACKAGE__->set_primary_key("item_id");

=head1 RELATIONS

=head2 ca_attribute_values

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaAttributeValue>

=cut

__PACKAGE__->has_many(
  "ca_attribute_values",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaAttributeValue",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_collection_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionLabel>

=cut

__PACKAGE__->has_many(
  "ca_collection_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionLabel",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_collections_sources

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCollection>

=cut

__PACKAGE__->has_many(
  "ca_collections_sources",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCollection",
  { "foreign.source_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_collections_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCollection>

=cut

__PACKAGE__->has_many(
  "ca_collections_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCollection",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_collections_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_collections_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionsXVocabularyTerm",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_sources

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntity>

=cut

__PACKAGE__->has_many(
  "ca_entities_sources",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntity",
  { "foreign.source_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntity>

=cut

__PACKAGE__->has_many(
  "ca_entities_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntity",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXVocabularyTerm",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entity_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntityLabel>

=cut

__PACKAGE__->has_many(
  "ca_entity_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntityLabel",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_list_item_labels_items

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItemLabel>

=cut

__PACKAGE__->has_many(
  "ca_list_item_labels_items",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItemLabel",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_list_item_labels_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItemLabel>

=cut

__PACKAGE__->has_many(
  "ca_list_item_labels_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItemLabel",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_list_items_parents

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->has_many(
  "ca_list_items_parents",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { "foreign.parent_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_list_items_sources

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->has_many(
  "ca_list_items_sources",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { "foreign.source_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_list_items_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->has_many(
  "ca_list_items_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_list_items_x_list_items_term_rights

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItemsXListItem>

=cut

__PACKAGE__->has_many(
  "ca_list_items_x_list_items_term_rights",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItemsXListItem",
  { "foreign.term_right_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_list_items_x_list_items_terms_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItemsXListItem>

=cut

__PACKAGE__->has_many(
  "ca_list_items_x_list_items_terms_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItemsXListItem",
  { "foreign.term_left_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loan_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoanLabel>

=cut

__PACKAGE__->has_many(
  "ca_loan_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoanLabel",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_sources

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoan>

=cut

__PACKAGE__->has_many(
  "ca_loans_sources",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoan",
  { "foreign.source_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoan>

=cut

__PACKAGE__->has_many(
  "ca_loans_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoan",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXVocabularyTerm",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movement_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementLabel>

=cut

__PACKAGE__->has_many(
  "ca_movement_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementLabel",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_sources

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovement>

=cut

__PACKAGE__->has_many(
  "ca_movements_sources",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovement",
  { "foreign.source_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovement>

=cut

__PACKAGE__->has_many(
  "ca_movements_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovement",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXVocabularyTerm",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLabel>

=cut

__PACKAGE__->has_many(
  "ca_object_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLabel",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lot_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotLabel>

=cut

__PACKAGE__->has_many(
  "ca_object_lot_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotLabel",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_lot_statuses

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLot>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_lot_statuses",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLot",
  { "foreign.lot_status_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_sources

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLot>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_sources",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLot",
  { "foreign.source_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLot>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLot",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXVocabularyTerm",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representation_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationLabel>

=cut

__PACKAGE__->has_many(
  "ca_object_representation_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationLabel",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_sources

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_sources",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation",
  { "foreign.source_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXVocabularyTerm",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_acquisition_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObject>

=cut

__PACKAGE__->has_many(
  "ca_objects_acquisition_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObject",
  { "foreign.acquisition_type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_deaccession_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObject>

=cut

__PACKAGE__->has_many(
  "ca_objects_deaccession_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObject",
  { "foreign.deaccession_type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_item_statuses

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObject>

=cut

__PACKAGE__->has_many(
  "ca_objects_item_statuses",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObject",
  { "foreign.item_status_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_sources

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObject>

=cut

__PACKAGE__->has_many(
  "ca_objects_sources",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObject",
  { "foreign.source_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObject>

=cut

__PACKAGE__->has_many(
  "ca_objects_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObject",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXVocabularyTerm",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrence_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrenceLabel>

=cut

__PACKAGE__->has_many(
  "ca_occurrence_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrenceLabel",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_sources

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_sources",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrence",
  { "foreign.source_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrence",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXVocabularyTerm",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_place_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlaceLabel>

=cut

__PACKAGE__->has_many(
  "ca_place_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlaceLabel",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_hierarchies

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlace>

=cut

__PACKAGE__->has_many(
  "ca_places_hierarchies",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlace",
  { "foreign.hierarchy_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_sources

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlace>

=cut

__PACKAGE__->has_many(
  "ca_places_sources",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlace",
  { "foreign.source_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlace>

=cut

__PACKAGE__->has_many(
  "ca_places_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlace",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_places_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXVocabularyTerm",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotation_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationLabel>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotation_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationLabel",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXVocabularyTerm",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_storage_location_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationLabel>

=cut

__PACKAGE__->has_many(
  "ca_storage_location_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationLabel",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_storage_locations_sources

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_storage_locations_sources",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocation",
  { "foreign.source_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_storage_locations_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_storage_locations_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocation",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_storage_locations_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_storage_locations_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXVocabularyTerm",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStop>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStop",
  { "foreign.type_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXVocabularyTerm",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tours

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTour>

=cut

__PACKAGE__->has_many(
  "ca_tours",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTour",
  { "foreign.source_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 list

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaList>

=cut

__PACKAGE__->belongs_to(
  "list",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaList",
  { list_id => "list_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 parent

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { item_id => "parent_id" },
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


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:T8gO5fXSrmylTd3Ebyz6nA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
