use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaSqlSearchWordIndex;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaSqlSearchWordIndex

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

=head1 TABLE: C<ca_sql_search_word_index>

=cut

__PACKAGE__->table("ca_sql_search_word_index");

=head1 ACCESSORS

=head2 index_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 field_table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 field_num

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 field_row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 rel_type_id

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 word_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 boost

  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 access

  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "index_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "row_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "field_table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "field_num",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "field_row_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "rel_type_id",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "word_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "boost",
  {
    data_type => "tinyint",
    default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "access",
  {
    data_type => "tinyint",
    default_value => 1,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</index_id>

=back

=cut

__PACKAGE__->set_primary_key("index_id");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Jla1arrkydjLpXhQBAnmhQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
