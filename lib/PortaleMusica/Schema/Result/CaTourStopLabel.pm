use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopLabel;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopLabel

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

=head1 TABLE: C<ca_tour_stop_labels>

=cut

__PACKAGE__->table("ca_tour_stop_labels");

=head1 ACCESSORS

=head2 label_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 stop_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 locale_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 name_sort

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "label_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "stop_id",
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
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "name_sort",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</label_id>

=back

=cut

__PACKAGE__->set_primary_key("label_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_locale_id>

=over 4

=item * L</stop_id>

=item * L</locale_id>

=back

=cut

__PACKAGE__->add_unique_constraint("u_locale_id", ["stop_id", "locale_id"]);

=head1 RELATIONS

=head2 ca_tour_stops_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXCollection>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXCollection",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXEntity>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXEntity",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXObject>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXObject",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXOccurrence",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopXPlaces",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_tour_stops_label_rights

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXTourStop>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_tour_stops_label_rights",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXTourStop",
  { "foreign.label_right_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_tour_stops_labels_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXTourStop>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_tour_stops_labels_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXTourStop",
  { "foreign.label_left_id" => "self.label_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tour_stops_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_tour_stops_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStopsXVocabularyTerm",
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

=head2 stop

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTourStop>

=cut

__PACKAGE__->belongs_to(
  "stop",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTourStop",
  { stop_id => "stop_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:51MwYi88Er6f1C6d46r1Rw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
