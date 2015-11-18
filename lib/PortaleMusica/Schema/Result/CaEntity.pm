use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaEntity;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaEntity

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

=head1 TABLE: C<ca_entities>

=cut

__PACKAGE__->table("ca_entities");

=head1 ACCESSORS

=head2 entity_id

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

=head2 source_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

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

=head2 life_sdatetime

  data_type: 'decimal'
  is_nullable: 1
  size: [30,20]

=head2 life_edatetime

  data_type: 'decimal'
  is_nullable: 1
  size: [30,20]

=head2 hier_entity_id

  data_type: 'integer'
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

=cut

__PACKAGE__->add_columns(
  "entity_id",
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
    ios_foreign_key => 1,
    is_nullable => 1,
  },
  "source_id",
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
  "life_sdatetime",
  { data_type => "decimal", is_nullable => 1, size => [30, 20] },
  "life_edatetime",
  { data_type => "decimal", is_nullable => 1, size => [30, 20] },
  "hier_entity_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
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
);

=head1 PRIMARY KEY

=over 4

=item * L</entity_id>

=back

=cut

__PACKAGE__->set_primary_key("entity_id");

=head1 RELATIONS

=head2 ca_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntity>

=cut

__PACKAGE__->has_many(
  "ca_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntity",
  { "foreign.parent_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXCollection>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXCollection",
  { "foreign.entity_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_entities_entities_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXEntity>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_entities_entities_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXEntity",
  { "foreign.entity_left_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_entities_entity_rights

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXEntity>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_entities_entity_rights",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXEntity",
  { "foreign.entity_right_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXOccurrence",
  { "foreign.entity_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntityXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntityXPlaces",
  { "foreign.entity_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXStorageLocation",
  { "foreign.entity_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entities_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_entities_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntitiesXVocabularyTerm",
  { "foreign.entity_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_entity_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntityLabel>

=cut

__PACKAGE__->has_many(
  "ca_entity_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntityLabel",
  { "foreign.entity_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXEntity>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXEntity",
  { "foreign.entity_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXEntity",
  { "foreign.entity_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXEntity",
  { "foreign.entity_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXEntity",
  { "foreign.entity_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXEntity",
  { "foreign.entity_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXEntity",
  { "foreign.entity_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXEntity",
  { "foreign.entity_id" => "self.entity_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_users

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUser>

=cut

__PACKAGE__->has_many(
  "ca_users",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUser",
  { "foreign.entity_id" => "self.entity_id" },
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
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 parent

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntity>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntity",
  { entity_id => "parent_id" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JN1K4Q2GpdJYVV4tPWl7wg

__PACKAGE__->add_unique_constraint(ca_idno => [ qw/idno/ ]);

__PACKAGE__->has_many(
  "ca_attributes",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaAttribute",
    { "foreign.row_id" => "self.entity_id" },
    { cascade_copy => 0, cascade_delete => 0 },
);


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
