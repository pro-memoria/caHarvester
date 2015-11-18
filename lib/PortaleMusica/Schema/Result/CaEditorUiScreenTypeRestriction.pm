use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiScreenTypeRestriction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiScreenTypeRestriction

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

=head1 TABLE: C<ca_editor_ui_screen_type_restrictions>

=cut

__PACKAGE__->table("ca_editor_ui_screen_type_restrictions");

=head1 ACCESSORS

=head2 restriction_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 screen_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 include_subtypes

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 settings

  data_type: 'longtext'
  is_nullable: 0

=head2 rank

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "restriction_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "type_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "screen_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "include_subtypes",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "settings",
  { data_type => "longtext", is_nullable => 0 },
  "rank",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</restriction_id>

=back

=cut

__PACKAGE__->set_primary_key("restriction_id");

=head1 RELATIONS

=head2 screen

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiScreen>

=cut

__PACKAGE__->belongs_to(
  "screen",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiScreen",
  { screen_id => "screen_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OeoUh/Fz3Lfr8MXYWxwOdw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
