use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipType

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

=head1 TABLE: C<ca_relationship_types>

=cut

__PACKAGE__->table("ca_relationship_types");

=head1 ACCESSORS

=head2 type_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 parent_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 sub_type_left_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 sub_type_right_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

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

=head2 hier_type_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 type_code

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 rank

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 is_default

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "type_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "parent_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "sub_type_left_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "sub_type_right_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
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
  "hier_type_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "type_code",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "rank",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "is_default",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</type_id>

=back

=cut

__PACKAGE__->set_primary_key("type_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_type_code>

=over 4

=item * L</type_code>

=item * L</table_num>

=back

=cut

__PACKAGE__->add_unique_constraint("u_type_code", ["type_code", "table_num"]);

=head1 RELATIONS

=head2 ca_collections_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionsXCollection>

=cut

__PACKAGE__->has_many(
  "ca_collections_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionsXCollection",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_collections_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_collections_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionsXStorageLocation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_collections_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_collections_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionsXVocabularyTerm",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXCollection>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXCollection",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXEntity>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXEntity",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXOccurrence",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntityXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntityXPlaces",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXStorageLocation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXVocabularyTerm",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_list_items_x_list_items

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItemsXListItem>

=cut

__PACKAGE__->has_many(
  "ca_list_items_x_list_items",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItemsXListItem",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXCollection>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXCollection",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXEntity>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXEntity",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_loans

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoanXLoans>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_loans",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoanXLoans",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_movements

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXMovement>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_movements",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXMovement",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_object_lots

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObjectLot>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_object_lots",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObjectLot",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObjectRepresentation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObject>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObject",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXOccurrence",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoanXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoanXPlaces",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXStorageLocation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXVocabularyTerm",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXCollection>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXCollection",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXEntity",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_movements

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXMovement>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_movements",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXMovement",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_object_lots

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObjectLot>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_object_lots",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObjectLot",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObjectRepresentation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObject>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObject",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXOccurrence",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementXPlaces",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXStorageLocation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXVocabularyTerm",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXCollection>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXCollection",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXEntity",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_object_lots

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectLot>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_object_lots",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectLot",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectRepresentation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXOccurrence",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotXPlaces",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXStorageLocation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXVocabularyTerm",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXCollection>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXCollection",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXEntity",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXObjectRepresentation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXOccurrence",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationXPlaces",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXStorageLocation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXVocabularyTerm",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXCollection>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXCollection",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXEntity",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXObject>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXObject",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXOccurrence",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectXPlaces",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXStorageLocation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXVocabularyTerm",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXCollection>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXCollection",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXOccurrence",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXStorageLocation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXVocabularyTerm",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXCollection>

=cut

__PACKAGE__->has_many(
  "ca_places_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXCollection",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_places_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXOccurrence",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlaceXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_places_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlaceXPlaces",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_places_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXStorageLocation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_places_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXVocabularyTerm",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_relationship_relationships

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipRelationship>

=cut

__PACKAGE__->has_many(
  "ca_relationship_relationships",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipRelationship",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_relationship_type_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipTypeLabel>

=cut

__PACKAGE__->has_many(
  "ca_relationship_type_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipTypeLabel",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_relationship_types

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipType>

=cut

__PACKAGE__->has_many(
  "ca_relationship_types",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipType",
  { "foreign.parent_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXEntity",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXObject>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXObject",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXOccurrence",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationXPlaces",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXVocabularyTerm",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_storage_locations_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_storage_locations_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXStorageLocation",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_storage_locations_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_storage_locations_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXVocabularyTerm",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXCollection>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXCollection",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXEntity",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXObject>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXObject",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXOccurrence",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopXPlaces",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_tour_stops

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXTourStop>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_tour_stops",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXTourStop",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXVocabularyTerm",
  { "foreign.type_id" => "self.type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parent

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipType>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipType",
  { type_id => "parent_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SN+dQiJSoYbT/xISLlDTyw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
