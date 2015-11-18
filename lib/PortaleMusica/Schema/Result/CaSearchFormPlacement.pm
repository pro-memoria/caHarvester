use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaSearchFormPlacement;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaSearchFormPlacement

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

=head1 TABLE: C<ca_search_form_placements>

=cut

__PACKAGE__->table("ca_search_form_placements");

=head1 ACCESSORS

=head2 placement_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 form_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 bundle_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 rank

  data_type: 'integer'
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
  "form_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "bundle_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "rank",
  {
    data_type => "integer",
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


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:phqYV+Itxz3+VjAMZhDHCg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
