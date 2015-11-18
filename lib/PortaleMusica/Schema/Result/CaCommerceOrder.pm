use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrder;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrder

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

=head1 TABLE: C<ca_commerce_orders>

=cut

__PACKAGE__->table("ca_commerce_orders");

=head1 ACCESSORS

=head2 order_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 transaction_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 created_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 order_status

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 order_number

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 order_type

  data_type: 'char'
  default_value: 'O'
  is_nullable: 0
  size: 1

=head2 shipping_fname

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 shipping_lname

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 shipping_organization

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 shipping_address1

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 shipping_address2

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 shipping_city

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 shipping_zone

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 shipping_postal_code

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 shipping_country

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 shipping_phone

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 shipping_fax

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 shipping_email

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 billing_fname

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 billing_lname

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 billing_organization

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 billing_address1

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 billing_address2

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 billing_city

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 billing_zone

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 billing_postal_code

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 billing_country

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 billing_phone

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 billing_fax

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 billing_email

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 payment_method

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 payment_status

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 payment_details

  data_type: 'longblob'
  is_nullable: 0

=head2 payment_response

  data_type: 'longblob'
  is_nullable: 0

=head2 payment_received_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 shipping_method

  data_type: 'varchar'
  is_nullable: 0
  size: 40

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

=head2 shipping_date

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 shipped_on_date

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 sales_agent

  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 additional_fees

  data_type: 'longtext'
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

=head2 deleted

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "order_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "transaction_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "created_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "order_status",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "order_number",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "order_type",
  { data_type => "char", default_value => "O", is_nullable => 0, size => 1 },
  "shipping_fname",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "shipping_lname",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "shipping_organization",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "shipping_address1",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "shipping_address2",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "shipping_city",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "shipping_zone",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "shipping_postal_code",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "shipping_country",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "shipping_phone",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "shipping_fax",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "shipping_email",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "billing_fname",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "billing_lname",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "billing_organization",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "billing_address1",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "billing_address2",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "billing_city",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "billing_zone",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "billing_postal_code",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "billing_country",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "billing_phone",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "billing_fax",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "billing_email",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "payment_method",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "payment_status",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "payment_details",
  { data_type => "longblob", is_nullable => 0 },
  "payment_response",
  { data_type => "longblob", is_nullable => 0 },
  "payment_received_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "shipping_method",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "shipping_cost",
  { data_type => "decimal", is_nullable => 1, size => [8, 2] },
  "handling_cost",
  { data_type => "decimal", is_nullable => 1, size => [8, 2] },
  "shipping_notes",
  { data_type => "text", is_nullable => 0 },
  "shipping_date",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "shipped_on_date",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "sales_agent",
  { data_type => "varchar", is_nullable => 0, size => 1024 },
  "additional_fees",
  { data_type => "longtext", is_nullable => 0 },
  "refund_date",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "refund_notes",
  { data_type => "text", is_nullable => 0 },
  "refund_amount",
  { data_type => "decimal", is_nullable => 1, size => [8, 2] },
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

=item * L</order_id>

=back

=cut

__PACKAGE__->set_primary_key("order_id");

=head1 RELATIONS

=head2 ca_commerce_fulfillment_events

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceFulfillmentEvent>

=cut

__PACKAGE__->has_many(
  "ca_commerce_fulfillment_events",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceFulfillmentEvent",
  { "foreign.order_id" => "self.order_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_commerce_order_items

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItem>

=cut

__PACKAGE__->has_many(
  "ca_commerce_order_items",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItem",
  { "foreign.order_id" => "self.order_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 transaction

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceTransaction>

=cut

__PACKAGE__->belongs_to(
  "transaction",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceTransaction",
  { transaction_id => "transaction_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DU2eDOc+g8xeVuSOc6881Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
