use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceTransaction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceTransaction

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

=head1 TABLE: C<ca_commerce_transactions>

=cut

__PACKAGE__->table("ca_commerce_transactions");

=head1 ACCESSORS

=head2 transaction_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 short_description

  data_type: 'text'
  is_nullable: 0

=head2 notes

  data_type: 'text'
  is_nullable: 0

=head2 set_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 deleted

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 created_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "transaction_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "short_description",
  { data_type => "text", is_nullable => 0 },
  "notes",
  { data_type => "text", is_nullable => 0 },
  "set_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "deleted",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "created_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</transaction_id>

=back

=cut

__PACKAGE__->set_primary_key("transaction_id");

=head1 RELATIONS

=head2 ca_commerce_communications

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunication>

=cut

__PACKAGE__->has_many(
  "ca_commerce_communications",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunication",
  { "foreign.transaction_id" => "self.transaction_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_commerce_orders

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrder>

=cut

__PACKAGE__->has_many(
  "ca_commerce_orders",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceOrder",
  { "foreign.transaction_id" => "self.transaction_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 set

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaSet>

=cut

__PACKAGE__->belongs_to(
  "set",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaSet",
  { set_id => "set_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 user

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUser>

=cut

__PACKAGE__->belongs_to(
  "user",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUser",
  { user_id => "user_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2RISnUjK6IMbEWiv23JWmg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
