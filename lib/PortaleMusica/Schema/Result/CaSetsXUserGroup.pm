use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaSetsXUserGroup;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaSetsXUserGroup

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

=head1 TABLE: C<ca_sets_x_user_groups>

=cut

__PACKAGE__->table("ca_sets_x_user_groups");

=head1 ACCESSORS

=head2 relation_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 set_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 group_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 access

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 sdatetime

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 edatetime

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "relation_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "set_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "group_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "access",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "sdatetime",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "edatetime",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</relation_id>

=back

=cut

__PACKAGE__->set_primary_key("relation_id");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:daXexMwipVDAGv9tewOveg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
