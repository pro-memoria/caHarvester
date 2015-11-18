use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipRelationship;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipRelationship

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

=head1 TABLE: C<ca_relationship_relationships>

=cut

__PACKAGE__->table("ca_relationship_relationships");

=head1 ACCESSORS

=head2 reification_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 type_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 relationship_table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 relation_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 table_num

  data_type: 'tinyint'
  is_nullable: 0

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 source_info

  accessor: 'column_source_info'
  data_type: 'longtext'
  is_nullable: 0

=head2 sdatetime

  data_type: 'decimal'
  is_nullable: 1
  size: [30,20]

=head2 edatetime

  data_type: 'decimal'
  is_nullable: 1
  size: [30,20]

=cut

__PACKAGE__->add_columns(
  "reification_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "type_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "relationship_table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "relation_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "table_num",
  { data_type => "tinyint", is_nullable => 0 },
  "row_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "source_info",
  {
    accessor    => "column_source_info",
    data_type   => "longtext",
    is_nullable => 0,
  },
  "sdatetime",
  { data_type => "decimal", is_nullable => 1, size => [30, 20] },
  "edatetime",
  { data_type => "decimal", is_nullable => 1, size => [30, 20] },
);

=head1 PRIMARY KEY

=over 4

=item * L</reification_id>

=back

=cut

__PACKAGE__->set_primary_key("reification_id");

=head1 RELATIONS

=head2 type

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipType>

=cut

__PACKAGE__->belongs_to(
  "type",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRelationshipType",
  { type_id => "type_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NlmlCE0KQxCt9224T8Ztbw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
