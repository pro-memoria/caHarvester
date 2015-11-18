use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItemsXObjectRepresentation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItemsXObjectRepresentation

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

=head1 TABLE: C<ca_commerce_order_items_x_object_representations>

=cut

__PACKAGE__->table("ca_commerce_order_items_x_object_representations");

=head1 ACCESSORS

=head2 relation_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 item_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 representation_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 rank

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "relation_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "item_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "representation_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "rank",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</relation_id>

=back

=cut

__PACKAGE__->set_primary_key("relation_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_all>

=over 4

=item * L</item_id>

=item * L</representation_id>

=back

=cut

__PACKAGE__->add_unique_constraint("u_all", ["item_id", "representation_id"]);

=head1 RELATIONS

=head2 item

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItem>

=cut

__PACKAGE__->belongs_to(
  "item",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItem",
  { item_id => "item_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 representation

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation>

=cut

__PACKAGE__->belongs_to(
  "representation",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentation",
  { representation_id => "representation_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YtUBv9GYcbRxfEeDtsof1w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
