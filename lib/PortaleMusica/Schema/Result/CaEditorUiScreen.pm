use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiScreen;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiScreen

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

=head1 TABLE: C<ca_editor_ui_screens>

=cut

__PACKAGE__->table("ca_editor_ui_screens");

=head1 ACCESSORS

=head2 screen_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 parent_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 ui_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 idno

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 rank

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 is_default

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 color

  data_type: 'char'
  is_nullable: 1
  size: 6

=head2 icon

  data_type: 'longblob'
  is_nullable: 0

=head2 hier_left

  data_type: 'decimal'
  is_nullable: 0
  size: [30,20]

=head2 hier_right

  data_type: 'decimal'
  is_nullable: 0
  size: [30,20]

=cut

__PACKAGE__->add_columns(
  "screen_id",
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
  "ui_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "idno",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "rank",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "is_default",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "color",
  { data_type => "char", is_nullable => 1, size => 6 },
  "icon",
  { data_type => "longblob", is_nullable => 0 },
  "hier_left",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
  "hier_right",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
);

=head1 PRIMARY KEY

=over 4

=item * L</screen_id>

=back

=cut

__PACKAGE__->set_primary_key("screen_id");

=head1 RELATIONS

=head2 ca_editor_ui_screen_type_restrictions

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiScreenTypeRestriction>

=cut

__PACKAGE__->has_many(
  "ca_editor_ui_screen_type_restrictions",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiScreenTypeRestriction",
  { "foreign.screen_id" => "self.screen_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_editor_ui_screens

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiScreen>

=cut

__PACKAGE__->has_many(
  "ca_editor_ui_screens",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiScreen",
  { "foreign.parent_id" => "self.screen_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parent

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiScreen>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiScreen",
  { screen_id => "parent_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MmJTAEFmRwyNVlJOMYiMhQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
