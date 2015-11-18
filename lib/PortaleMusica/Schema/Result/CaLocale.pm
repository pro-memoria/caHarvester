use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaLocale;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaLocale

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

=head1 TABLE: C<ca_locales>

=cut

__PACKAGE__->table("ca_locales");

=head1 ACCESSORS

=head2 locale_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 language

  data_type: 'varchar'
  is_nullable: 0
  size: 3

=head2 country

  data_type: 'char'
  is_nullable: 0
  size: 2

=head2 dialect

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 dont_use_for_cataloguing

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "locale_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "language",
  { data_type => "varchar", is_nullable => 0, size => 3 },
  "country",
  { data_type => "char", is_nullable => 0, size => 2 },
  "dialect",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "dont_use_for_cataloguing",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</locale_id>

=back

=cut

__PACKAGE__->set_primary_key("locale_id");

=head1 RELATIONS

=head2 ca_attributes

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaAttribute>

=cut

__PACKAGE__->has_many(
  "ca_attributes",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaAttribute",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_collection_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionLabel>

=cut

__PACKAGE__->has_many(
  "ca_collection_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCollection>

=cut

__PACKAGE__->has_many(
  "ca_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCollection",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_data_exporter_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporterLabel>

=cut

__PACKAGE__->has_many(
  "ca_data_exporter_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataExporterLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_data_importer_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterLabel>

=cut

__PACKAGE__->has_many(
  "ca_data_importer_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntity>

=cut

__PACKAGE__->has_many(
  "ca_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntity",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entity_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntityLabel>

=cut

__PACKAGE__->has_many(
  "ca_entity_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntityLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_list_item_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItemLabel>

=cut

__PACKAGE__->has_many(
  "ca_list_item_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItemLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_list_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListLabel>

=cut

__PACKAGE__->has_many(
  "ca_list_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loan_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoanLabel>

=cut

__PACKAGE__->has_many(
  "ca_loan_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoanLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoan>

=cut

__PACKAGE__->has_many(
  "ca_loans",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoan",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_metadata_element_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElementLabel>

=cut

__PACKAGE__->has_many(
  "ca_metadata_element_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElementLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movement_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementLabel>

=cut

__PACKAGE__->has_many(
  "ca_movement_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovement>

=cut

__PACKAGE__->has_many(
  "ca_movements",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovement",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLabel>

=cut

__PACKAGE__->has_many(
  "ca_object_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lot_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotLabel>

=cut

__PACKAGE__->has_many(
  "ca_object_lot_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representation_captions

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationCaption>

=cut

__PACKAGE__->has_many(
  "ca_object_representation_captions",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationCaption",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representation_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationLabel>

=cut

__PACKAGE__->has_many(
  "ca_object_representation_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObject>

=cut

__PACKAGE__->has_many(
  "ca_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObject",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrence_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrenceLabel>

=cut

__PACKAGE__->has_many(
  "ca_occurrence_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrenceLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrence",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_place_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlaceLabel>

=cut

__PACKAGE__->has_many(
  "ca_place_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlaceLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlace>

=cut

__PACKAGE__->has_many(
  "ca_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlace",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_relationship_type_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipTypeLabel>

=cut

__PACKAGE__->has_many(
  "ca_relationship_type_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipTypeLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotation_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationLabel>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotation_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotation>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotation",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_storage_location_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationLabel>

=cut

__PACKAGE__->has_many(
  "ca_storage_location_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourLabel>

=cut

__PACKAGE__->has_many(
  "ca_tour_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stop_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopLabel>

=cut

__PACKAGE__->has_many(
  "ca_tour_stop_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopLabel",
  { "foreign.locale_id" => "self.locale_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sCgTXyFEGdN72cR9E2eKPw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
