use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaAttributeValue;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaAttributeValue

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

=head1 TABLE: C<ca_attribute_values>

=cut

__PACKAGE__->table("ca_attribute_values");

=head1 ACCESSORS

=head2 value_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 element_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 attribute_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 item_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 value_longtext1

  data_type: 'longtext'
  is_nullable: 1

=head2 value_longtext2

  data_type: 'longtext'
  is_nullable: 1

=head2 value_blob

  data_type: 'longblob'
  is_nullable: 1

=head2 value_decimal1

  data_type: 'decimal'
  is_nullable: 1
  size: [40,20]

=head2 value_decimal2

  data_type: 'decimal'
  is_nullable: 1
  size: [40,20]

=head2 value_integer1

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 source_info

  accessor: 'column_source_info'
  data_type: 'longtext'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "value_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "element_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "attribute_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "item_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "value_longtext1",
  { data_type => "longtext", is_nullable => 1 },
  "value_longtext2",
  { data_type => "longtext", is_nullable => 1 },
  "value_blob",
  { data_type => "longblob", is_nullable => 1 },
  "value_decimal1",
  { data_type => "decimal", is_nullable => 1, size => [40, 20] },
  "value_decimal2",
  { data_type => "decimal", is_nullable => 1, size => [40, 20] },
  "value_integer1",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "source_info",
  {
    accessor    => "column_source_info",
    data_type   => "longtext",
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</value_id>

=back

=cut

__PACKAGE__->set_primary_key("value_id");

=head1 RELATIONS

=head2 attribute

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaAttribute>

=cut

__PACKAGE__->belongs_to(
  "attribute",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaAttribute",
  { attribute_id => "attribute_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 element

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement>

=cut

__PACKAGE__->belongs_to(
  "element",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement",
  { element_id => "element_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 item

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->belongs_to(
  "item",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { item_id => "item_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8sFnfRKAFSH61rlqKUh8fA

=head2 value

We always write in value_longtext1, with an alias, we had to write less :D

=cut

use Moose;
use MooseX::NonMoose;
use MooseX::Aliases;

alias value =>'value_longtext1';

__PACKAGE__->meta->make_immutable(inline_constructor => 0);


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
