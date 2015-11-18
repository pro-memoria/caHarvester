use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrenceLabel;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrenceLabel

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

=head1 TABLE: C<ca_occurrence_labels>

=cut

__PACKAGE__->table("ca_occurrence_labels");

=head1 ACCESSORS

=head2 label_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 occurrence_id

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

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 name_sort

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 source_info

  accessor: 'column_source_info'
  data_type: 'longtext'
  is_nullable: 0

=head2 is_preferred

  data_type: 'tinyint'
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
  "occurrence_id",
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
  "name",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "name_sort",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "source_info",
  {
    accessor    => "column_source_info",
    data_type   => "longtext",
    is_nullable => 0,
  },
  "is_preferred",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
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

=item * L</occurrence_id>

=item * L</name>

=item * L</type_id>

=item * L</locale_id>

=back

=cut

__PACKAGE__->add_unique_constraint("u_all", ["occurrence_id", "name", "type_id", "locale_id"]);

=head1 RELATIONS

=head2 ca_entities_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXOccurrence",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXOccurrence",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXOccurrence",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXOccurrence",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXOccurrence",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXOccurrence",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXCollection>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXCollection",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_x_occurrences_label_rights

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_x_occurrences_label_rights",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXOccurrence",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_x_occurrences_labels_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_x_occurrences_labels_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXOccurrence",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXStorageLocation",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_occurrences_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_occurrences_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrencesXVocabularyTerm",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_places_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_places_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaPlacesXOccurrence",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXOccurrence",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXOccurrence",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
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

=head2 occurrence

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrence>

=cut

__PACKAGE__->belongs_to(
  "occurrence",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaOccurrence",
  { occurrence_id => "occurrence_id" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kwiN22B+rTpCrpfAhvh3Bw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
