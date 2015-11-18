use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaEntityLabel;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaEntityLabel

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

=head1 TABLE: C<ca_entity_labels>

=cut

__PACKAGE__->table("ca_entity_labels");

=head1 ACCESSORS

=head2 label_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 entity_id

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

=head2 displayname

  data_type: 'varchar'
  is_nullable: 0
  size: 512

=head2 forename

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 other_forenames

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 middlename

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 surname

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 prefix

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 suffix

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 name_sort

  data_type: 'varchar'
  is_nullable: 0
  size: 512

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
  "entity_id",
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
  "displayname",
  { data_type => "varchar", is_nullable => 0, size => 512 },
  "forename",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "other_forenames",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "middlename",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "surname",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "prefix",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "suffix",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "name_sort",
  { data_type => "varchar", is_nullable => 0, size => 512 },
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

=item * L</entity_id>

=item * L</forename>

=item * L</other_forenames>

=item * L</middlename>

=item * L</surname>

=item * L</type_id>

=item * L</locale_id>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "u_all",
  [
    "entity_id",
    "forename",
    "other_forenames",
    "middlename",
    "surname",
    "type_id",
    "locale_id",
  ],
);

=head1 RELATIONS

=head2 ca_entities_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXCollection>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXCollection",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_entities_label_rights

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXEntity>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_entities_label_rights",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXEntity",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_entities_labels_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXEntity>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_entities_labels_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXEntity",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXOccurrence",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntityXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntityXPlaces",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXStorageLocation",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXVocabularyTerm",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXEntity>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXEntity",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXEntity",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXEntity",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXEntity",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXEntity",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXEntity",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXEntity",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 entity

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntity>

=cut

__PACKAGE__->belongs_to(
  "entity",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntity",
  { entity_id => "entity_id" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eqfs+ZBG++1A3CoV2lyF0Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
