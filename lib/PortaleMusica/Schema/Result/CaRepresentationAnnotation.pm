use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotation

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

=head1 TABLE: C<ca_representation_annotations>

=cut

__PACKAGE__->table("ca_representation_annotations");

=head1 ACCESSORS

=head2 annotation_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 representation_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 locale_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 type_code

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 props

  data_type: 'longtext'
  is_nullable: 0

=head2 preview

  data_type: 'longblob'
  is_nullable: 0

=head2 source_info

  accessor: 'column_source_info'
  data_type: 'longtext'
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

=cut

__PACKAGE__->add_columns(
  "annotation_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "representation_id",
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
    is_nullable => 1,
  },
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "type_code",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "props",
  { data_type => "longtext", is_nullable => 0 },
  "preview",
  { data_type => "longblob", is_nullable => 0 },
  "source_info",
  {
    accessor    => "column_source_info",
    data_type   => "longtext",
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
);

=head1 PRIMARY KEY

=over 4

=item * L</annotation_id>

=back

=cut

__PACKAGE__->set_primary_key("annotation_id");

=head1 RELATIONS

=head2 ca_representation_annotation_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationLabel>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotation_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationLabel",
  { "foreign.annotation_id" => "self.annotation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXEntity",
  { "foreign.annotation_id" => "self.annotation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXObject>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXObject",
  { "foreign.annotation_id" => "self.annotation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXOccurrence",
  { "foreign.annotation_id" => "self.annotation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationXPlaces",
  { "foreign.annotation_id" => "self.annotation_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotationsXVocabularyTerm",
  { "foreign.annotation_id" => "self.annotation_id" },
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

=head2 representation

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation>

=cut

__PACKAGE__->belongs_to(
  "representation",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation",
  { representation_id => "representation_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 user

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUser>

=cut

__PACKAGE__->belongs_to(
  "user",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUser",
  { user_id => "user_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZOFyzIrgT3oPTfKpKRVYCA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
