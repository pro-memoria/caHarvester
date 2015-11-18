use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaList;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaList

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

=head1 TABLE: C<ca_lists>

=cut

__PACKAGE__->table("ca_lists");

=head1 ACCESSORS

=head2 list_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 list_code

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 is_system_list

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 is_hierarchical

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 use_as_vocabulary

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 default_sort

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 deleted

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "list_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "list_code",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "is_system_list",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "is_hierarchical",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "use_as_vocabulary",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "default_sort",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "deleted",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</list_id>

=back

=cut

__PACKAGE__->set_primary_key("list_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_code>

=over 4

=item * L</list_code>

=back

=cut

__PACKAGE__->add_unique_constraint("u_code", ["list_code"]);

=head1 RELATIONS

=head2 ca_list_items

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->has_many(
  "ca_list_items",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { "foreign.list_id" => "self.list_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_list_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListLabel>

=cut

__PACKAGE__->has_many(
  "ca_list_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListLabel",
  { "foreign.list_id" => "self.list_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_metadata_elements

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement>

=cut

__PACKAGE__->has_many(
  "ca_metadata_elements",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement",
  { "foreign.list_id" => "self.list_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9zc1V6V5yvLcGwzzVbBsRA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
