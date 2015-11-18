use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation

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

=head1 TABLE: C<ca_object_representations>

=cut

__PACKAGE__->table("ca_object_representations");

=head1 ACCESSORS

=head2 representation_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 locale_id

  data_type: 'smallint'
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

=head2 md5

  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 mimetype

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 original_filename

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 media

  data_type: 'longblob'
  is_nullable: 0

=head2 media_metadata

  data_type: 'longblob'
  is_nullable: 1

=head2 media_content

  data_type: 'longtext'
  is_nullable: 1

=head2 deleted

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

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

=head2 rank

  data_type: 'integer'
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
  "representation_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
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
    is_nullable => 0,
  },
  "idno",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "idno_sort",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "md5",
  { data_type => "varchar", is_nullable => 0, size => 32 },
  "mimetype",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "original_filename",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "media",
  { data_type => "longblob", is_nullable => 0 },
  "media_metadata",
  { data_type => "longblob", is_nullable => 1 },
  "media_content",
  { data_type => "longtext", is_nullable => 1 },
  "deleted",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
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
  "rank",
  {
    data_type => "integer",
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

=item * L</representation_id>

=back

=cut

__PACKAGE__->set_primary_key("representation_id");

=head1 RELATIONS

=head2 ca_commerce_order_items_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItemsXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_commerce_order_items_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItemsXObjectRepresentation",
  { "foreign.representation_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObjectRepresentation",
  { "foreign.representation_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObjectRepresentation",
  { "foreign.representation_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_lots_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_object_lots_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectLotsXObjectRepresentation",
  { "foreign.representation_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representation_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationLabel>

=cut

__PACKAGE__->has_many(
  "ca_object_representation_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationLabel",
  { "foreign.representation_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXCollection>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXCollection",
  { "foreign.representation_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXEntity",
  { "foreign.representation_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_object_representations_representation_rights

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_object_representations_representation_rights",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXObjectRepresentation",
  { "foreign.representation_right_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_object_representations_representations_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_object_representations_representations_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXObjectRepresentation",
  { "foreign.representation_left_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXOccurrence",
  { "foreign.representation_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationXPlaces",
  { "foreign.representation_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXStorageLocation",
  { "foreign.representation_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_representations_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_object_representations_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationsXVocabularyTerm",
  { "foreign.representation_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_objects_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_objects_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectsXObjectRepresentation",
  { "foreign.representation_id" => "self.representation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotation>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotation",
  { "foreign.representation_id" => "self.representation_id" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:d5u9fqkRf7aXM/7uLafsEw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
