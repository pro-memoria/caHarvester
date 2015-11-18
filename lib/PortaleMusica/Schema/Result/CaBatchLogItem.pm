use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaBatchLogItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaBatchLogItem

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

=head1 TABLE: C<ca_batch_log_items>

=cut

__PACKAGE__->table("ca_batch_log_items");

=head1 ACCESSORS

=head2 batch_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 errors

  data_type: 'longtext'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "batch_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "row_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "errors",
  { data_type => "longtext", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</batch_id>

=item * L</row_id>

=back

=cut

__PACKAGE__->set_primary_key("batch_id", "row_id");

=head1 RELATIONS

=head2 batch

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaBatchLog>

=cut

__PACKAGE__->belongs_to(
  "batch",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaBatchLog",
  { batch_id => "batch_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:o8jF7ZaQfF17PEimdLu5QQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
