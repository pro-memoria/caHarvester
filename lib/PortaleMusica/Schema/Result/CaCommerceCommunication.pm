use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunication;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunication

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

=head1 TABLE: C<ca_commerce_communications>

=cut

__PACKAGE__->table("ca_commerce_communications");

=head1 ACCESSORS

=head2 communication_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 transaction_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 source

  data_type: 'char'
  is_nullable: 0
  size: 1

=head2 communication_type

  data_type: 'char'
  default_value: 'O'
  is_nullable: 0
  size: 1

=head2 created_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 from_user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 subject

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 message

  data_type: 'text'
  is_nullable: 0

=head2 set_snapshot

  data_type: 'longtext'
  is_nullable: 0

=head2 deleted

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 read_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "communication_id",
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
  "source",
  { data_type => "char", is_nullable => 0, size => 1 },
  "communication_type",
  { data_type => "char", default_value => "O", is_nullable => 0, size => 1 },
  "created_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "from_user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "subject",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "message",
  { data_type => "text", is_nullable => 0 },
  "set_snapshot",
  { data_type => "longtext", is_nullable => 0 },
  "deleted",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "read_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</communication_id>

=back

=cut

__PACKAGE__->set_primary_key("communication_id");

=head1 RELATIONS

=head2 ca_commerce_communications_read_logs

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunicationsReadLog>

=cut

__PACKAGE__->has_many(
  "ca_commerce_communications_read_logs",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunicationsReadLog",
  { "foreign.communication_id" => "self.communication_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 from_user

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUser>

=cut

__PACKAGE__->belongs_to(
  "from_user",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUser",
  { user_id => "from_user_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:P7tQvgoP6S8GBHBapKVoRg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
