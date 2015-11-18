use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUi;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUi

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

=head1 TABLE: C<ca_editor_uis>

=cut

__PACKAGE__->table("ca_editor_uis");

=head1 ACCESSORS

=head2 ui_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 is_system_ui

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 editor_type

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 editor_code

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 color

  data_type: 'char'
  is_nullable: 1
  size: 6

=head2 icon

  data_type: 'longblob'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "ui_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "user_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "is_system_ui",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "editor_type",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "editor_code",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "color",
  { data_type => "char", is_nullable => 1, size => 6 },
  "icon",
  { data_type => "longblob", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</ui_id>

=back

=cut

__PACKAGE__->set_primary_key("ui_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_code>

=over 4

=item * L</editor_code>

=back

=cut

__PACKAGE__->add_unique_constraint("u_code", ["editor_code"]);

=head1 RELATIONS

=head2 ca_editor_ui_type_restrictions

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiTypeRestriction>

=cut

__PACKAGE__->has_many(
  "ca_editor_ui_type_restrictions",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEditorUiTypeRestriction",
  { "foreign.ui_id" => "self.ui_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Yj9pNy3iN5edCLw7QsvQJw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
