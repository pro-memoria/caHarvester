use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaSearchLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaSearchLog

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

=head1 TABLE: C<ca_search_log>

=cut

__PACKAGE__->table("ca_search_log");

=head1 ACCESSORS

=head2 search_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 log_datetime

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 search_expression

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 num_hits

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 form_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 ip_addr

  data_type: 'char'
  is_nullable: 1
  size: 15

=head2 details

  data_type: 'text'
  is_nullable: 0

=head2 execution_time

  data_type: 'decimal'
  is_nullable: 0
  size: [7,3]

=head2 search_source

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=cut

__PACKAGE__->add_columns(
  "search_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "log_datetime",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "user_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "search_expression",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "num_hits",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "form_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "ip_addr",
  { data_type => "char", is_nullable => 1, size => 15 },
  "details",
  { data_type => "text", is_nullable => 0 },
  "execution_time",
  { data_type => "decimal", is_nullable => 0, size => [7, 3] },
  "search_source",
  { data_type => "varchar", is_nullable => 0, size => 40 },
);

=head1 PRIMARY KEY

=over 4

=item * L</search_id>

=back

=cut

__PACKAGE__->set_primary_key("search_id");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BsG/9OzPExzdl0+kQEJ5vQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
