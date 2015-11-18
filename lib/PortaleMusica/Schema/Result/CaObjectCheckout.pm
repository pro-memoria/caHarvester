use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaObjectCheckout;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaObjectCheckout

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

=head1 TABLE: C<ca_object_checkouts>

=cut

__PACKAGE__->table("ca_object_checkouts");

=head1 ACCESSORS

=head2 checkout_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 group_uuid

  data_type: 'char'
  is_nullable: 0
  size: 36

=head2 object_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 created_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 checkout_date

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 due_date

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 return_date

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 checkout_notes

  data_type: 'text'
  is_nullable: 0

=head2 return_notes

  data_type: 'text'
  is_nullable: 0

=head2 last_sent_coming_due_email

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 last_sent_overdue_email

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 last_reservation_available_email

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 deleted

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "checkout_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "group_uuid",
  { data_type => "char", is_nullable => 0, size => 36 },
  "object_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "created_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "checkout_date",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "due_date",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "return_date",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "checkout_notes",
  { data_type => "text", is_nullable => 0 },
  "return_notes",
  { data_type => "text", is_nullable => 0 },
  "last_sent_coming_due_email",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "last_sent_overdue_email",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "last_reservation_available_email",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "deleted",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</checkout_id>

=back

=cut

__PACKAGE__->set_primary_key("checkout_id");

=head1 RELATIONS

=head2 object

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObject>

=cut

__PACKAGE__->belongs_to(
  "object",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObject",
  { object_id => "object_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:K25CG8LSlgZ5sak3olGRTQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
