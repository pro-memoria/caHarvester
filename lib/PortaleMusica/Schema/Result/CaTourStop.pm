use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaTourStop;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaTourStop

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

=head1 TABLE: C<ca_tour_stops>

=cut

__PACKAGE__->table("ca_tour_stops");

=head1 ACCESSORS

=head2 stop_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 parent_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 tour_id

  data_type: 'integer'
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

=head2 hier_stop_id

  data_type: 'integer'
  extra: {unsigned => 1}
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

=cut

__PACKAGE__->add_columns(
  "stop_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "parent_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "tour_id",
  {
    data_type => "integer",
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
  "hier_stop_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
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
);

=head1 PRIMARY KEY

=over 4

=item * L</stop_id>

=back

=cut

__PACKAGE__->set_primary_key("stop_id");

=head1 RELATIONS

=head2 ca_tour_stop_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopLabel>

=cut

__PACKAGE__->has_many(
  "ca_tour_stop_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopLabel",
  { "foreign.stop_id" => "self.stop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXCollection>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXCollection",
  { "foreign.stop_id" => "self.stop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXEntity",
  { "foreign.stop_id" => "self.stop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXObject>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXObject",
  { "foreign.stop_id" => "self.stop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXOccurrence",
  { "foreign.stop_id" => "self.stop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopXPlaces",
  { "foreign.stop_id" => "self.stop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_tour_stops_stops_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXTourStop>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_tour_stops_stops_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXTourStop",
  { "foreign.stop_left_id" => "self.stop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_tour_stops_stops_right

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXTourStop>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_tour_stops_stops_right",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXTourStop",
  { "foreign.stop_right_id" => "self.stop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXVocabularyTerm",
  { "foreign.stop_id" => "self.stop_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tour

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTour>

=cut

__PACKAGE__->belongs_to(
  "tour",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTour",
  { tour_id => "tour_id" },
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


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Zo/NcTr1pQx1R9vDhur5IA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
