use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaChangeLogSubject;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaChangeLogSubject

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

=head1 TABLE: C<ca_change_log_subjects>

=cut

__PACKAGE__->table("ca_change_log_subjects");

=head1 ACCESSORS

=head2 log_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 subject_table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 subject_row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "log_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "subject_table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "subject_row_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 RELATIONS

=head2 log

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaChangeLog>

=cut

__PACKAGE__->belongs_to(
  "log",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaChangeLog",
  { log_id => "log_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FN5rR9R6eie1MJuFkCVLYw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
