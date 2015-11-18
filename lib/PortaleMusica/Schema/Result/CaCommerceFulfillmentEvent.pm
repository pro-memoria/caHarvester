use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceFulfillmentEvent;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceFulfillmentEvent

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

=head1 TABLE: C<ca_commerce_fulfillment_events>

=cut

__PACKAGE__->table("ca_commerce_fulfillment_events");

=head1 ACCESSORS

=head2 event_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 order_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 item_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 fulfillment_method

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 fulfillment_details

  data_type: 'blob'
  is_nullable: 0

=head2 occurred_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 notes

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "event_id",
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
  "item_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "fulfillment_method",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "fulfillment_details",
  { data_type => "blob", is_nullable => 0 },
  "occurred_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "notes",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</event_id>

=back

=cut

__PACKAGE__->set_primary_key("event_id");

=head1 RELATIONS

=head2 item

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItem>

=cut

__PACKAGE__->belongs_to(
  "item",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrderItem",
  { item_id => "item_id" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8jje9tCGEoYnXk0FMQbAyw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
