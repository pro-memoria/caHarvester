use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiBundlePlacement;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiBundlePlacement

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

=head1 TABLE: C<ca_editor_ui_bundle_placements>

=cut

__PACKAGE__->table("ca_editor_ui_bundle_placements");

=head1 ACCESSORS

=head2 placement_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 screen_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 placement_code

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 bundle_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 rank

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 settings

  data_type: 'longtext'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "placement_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "screen_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "placement_code",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "bundle_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "rank",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "settings",
  { data_type => "longtext", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</placement_id>

=back

=cut

__PACKAGE__->set_primary_key("placement_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_bundle_name>

=over 4

=item * L</bundle_name>

=item * L</screen_id>

=item * L</placement_code>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "u_bundle_name",
  ["bundle_name", "screen_id", "placement_code"],
);

=head1 RELATIONS

=head2 ca_editor_ui_bundle_placement_type_restrictions

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiBundlePlacementTypeRestriction>

=cut

__PACKAGE__->has_many(
  "ca_editor_ui_bundle_placement_type_restrictions",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiBundlePlacementTypeRestriction",
  { "foreign.placement_id" => "self.placement_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/QbYJsqPVuFrI276LgXigw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
