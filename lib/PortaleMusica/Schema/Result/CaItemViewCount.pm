use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaItemViewCount;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaItemViewCount

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

=head1 TABLE: C<ca_item_view_counts>

=cut

__PACKAGE__->table("ca_item_view_counts");

=head1 ACCESSORS

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 view_count

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "row_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "view_count",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:v+1hFlf7OR/MBfOyEcuXWw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
