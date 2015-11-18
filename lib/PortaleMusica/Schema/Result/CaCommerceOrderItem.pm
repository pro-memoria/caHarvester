use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItem

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

=head1 TABLE: C<ca_commerce_order_items>

=cut

__PACKAGE__->table("ca_commerce_order_items");

=head1 ACCESSORS

=head2 item_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 order_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 object_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 service

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 fullfillment_method

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 fee

  data_type: 'decimal'
  is_nullable: 1
  size: [8,2]

=head2 tax

  data_type: 'decimal'
  is_nullable: 1
  size: [8,2]

=head2 notes

  data_type: 'text'
  is_nullable: 0

=head2 restrictions

  data_type: 'text'
  is_nullable: 0

=head2 shipping_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [8,2]

=head2 handling_cost

  data_type: 'decimal'
  is_nullable: 1
  size: [8,2]

=head2 shipping_notes

  data_type: 'text'
  is_nullable: 0

=head2 refund_date

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 refund_notes

  data_type: 'text'
  is_nullable: 0

=head2 refund_amount

  data_type: 'decimal'
  is_nullable: 1
  size: [8,2]

=head2 loan_checkout_date

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 loan_due_date

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 loan_return_date

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 additional_fees

  data_type: 'longtext'
  is_nullable: 0

=head2 rank

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "item_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "order_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "object_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "service",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "fullfillment_method",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "fee",
  { data_type => "decimal", is_nullable => 1, size => [8, 2] },
  "tax",
  { data_type => "decimal", is_nullable => 1, size => [8, 2] },
  "notes",
  { data_type => "text", is_nullable => 0 },
  "restrictions",
  { data_type => "text", is_nullable => 0 },
  "shipping_cost",
  { data_type => "decimal", is_nullable => 1, size => [8, 2] },
  "handling_cost",
  { data_type => "decimal", is_nullable => 1, size => [8, 2] },
  "shipping_notes",
  { data_type => "text", is_nullable => 0 },
  "refund_date",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "refund_notes",
  { data_type => "text", is_nullable => 0 },
  "refund_amount",
  { data_type => "decimal", is_nullable => 1, size => [8, 2] },
  "loan_checkout_date",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "loan_due_date",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "loan_return_date",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 1,
  },
  "additional_fees",
  { data_type => "longtext", is_nullable => 0 },
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

=item * L</item_id>

=back

=cut

__PACKAGE__->set_primary_key("item_id");

=head1 RELATIONS

=head2 ca_commerce_fulfillment_events

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceFulfillmentEvent>

=cut

__PACKAGE__->has_many(
  "ca_commerce_fulfillment_events",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceFulfillmentEvent",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_commerce_order_items_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItemsXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_commerce_order_items_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItemsXObjectRepresentation",
  { "foreign.item_id" => "self.item_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 object

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObject>

=cut

__PACKAGE__->belongs_to(
  "object",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObject",
  { object_id => "object_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 order

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrder>

=cut

__PACKAGE__->belongs_to(
  "order",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrder",
  { order_id => "order_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AY7mUTNY5gPkdPL2bvfAkw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
