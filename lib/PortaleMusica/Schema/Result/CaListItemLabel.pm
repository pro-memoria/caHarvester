use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaListItemLabel;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaListItemLabel

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

=head1 TABLE: C<ca_list_item_labels>

=cut

__PACKAGE__->table("ca_list_item_labels");

=head1 ACCESSORS

=head2 label_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 item_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 locale_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 name_singular

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 name_plural

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 name_sort

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 source_info

  accessor: 'column_source_info'
  data_type: 'longtext'
  is_nullable: 0

=head2 is_preferred

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "label_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "item_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "locale_id",
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
  "name_singular",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "name_plural",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "name_sort",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "source_info",
  {
    accessor    => "column_source_info",
    data_type   => "longtext",
    is_nullable => 0,
  },
  "is_preferred",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</label_id>

=back

=cut

__PACKAGE__->set_primary_key("label_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_all>

=over 4

=item * L</item_id>

=item * L</name_singular>

=item * L</name_plural>

=item * L</type_id>

=item * L</locale_id>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "u_all",
  [
    "item_id",
    "name_singular",
    "name_plural",
    "type_id",
    "locale_id",
  ],
);

=head1 RELATIONS

=head2 ca_collections_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_collections_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCollectionsXVocabularyTerm",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXVocabularyTerm",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_list_items_x_list_items_label_rights

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItemsXListItem>

=cut

__PACKAGE__->has_many(
  "ca_list_items_x_list_items_label_rights",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItemsXListItem",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_list_items_x_list_items_labels_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItemsXListItem>

=cut

__PACKAGE__->has_many(
  "ca_list_items_x_list_items_labels_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItemsXListItem",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXVocabularyTerm",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXVocabularyTerm",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXVocabularyTerm",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXVocabularyTerm",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXVocabularyTerm",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXVocabularyTerm",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_places_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXVocabularyTerm",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXVocabularyTerm",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_storage_locations_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_storage_locations_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaStorageLocationsXVocabularyTerm",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXVocabularyTerm",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 item

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->belongs_to(
  "item",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { item_id => "item_id" },
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
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Cnc+iJSTxYApmfOnPnRYog


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
