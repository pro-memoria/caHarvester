use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaBundleDisplay;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaBundleDisplay

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

=head1 TABLE: C<ca_bundle_displays>

=cut

__PACKAGE__->table("ca_bundle_displays");

=head1 ACCESSORS

=head2 display_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 display_code

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 is_system

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 access

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 settings

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "display_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "user_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "display_code",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "is_system",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "access",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "settings",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</display_id>

=back

=cut

__PACKAGE__->set_primary_key("display_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_display_code>

=over 4

=item * L</display_code>

=back

=cut

__PACKAGE__->add_unique_constraint("u_display_code", ["display_code"]);

=head1 RELATIONS

=head2 ca_bundle_display_type_restrictions

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaBundleDisplayTypeRestriction>

=cut

__PACKAGE__->has_many(
  "ca_bundle_display_type_restrictions",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaBundleDisplayTypeRestriction",
  { "foreign.display_id" => "self.display_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3fBuBX0EWAHwb8JtECiseA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
