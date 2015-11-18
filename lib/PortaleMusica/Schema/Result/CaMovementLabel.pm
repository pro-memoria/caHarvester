use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaMovementLabel;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaMovementLabel

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

=head1 TABLE: C<ca_movement_labels>

=cut

__PACKAGE__->table("ca_movement_labels");

=head1 ACCESSORS

=head2 label_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 movement_id

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
  "movement_id",
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

=head1 RELATIONS

=head2 ca_loans_x_movements

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXMovement>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_movements",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXMovement",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXCollection>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXCollection",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXEntity",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_movements_label_rights

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXMovement>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_movements_label_rights",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXMovement",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_movements_labels_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXMovement>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_movements_labels_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXMovement",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_object_lots

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObjectLot>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_object_lots",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObjectLot",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObjectRepresentation",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObject>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXObject",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXOccurrence",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementXPlaces",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXStorageLocation",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_movements_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_movements_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovementsXVocabularyTerm",
  { "foreign.label_left_id" => "self.label_id" },
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

=head2 movement

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMovement>

=cut

__PACKAGE__->belongs_to(
  "movement",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMovement",
  { movement_id => "movement_id" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:V5Jg31YqYIFB+l3KvkmJ3g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
