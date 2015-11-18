use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaUser;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaUser

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

=head1 TABLE: C<ca_users>

=cut

__PACKAGE__->table("ca_users");

=head1 ACCESSORS

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 user_name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 userclass

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 password

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 fname

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 lname

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 email

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 sms_number

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 vars

  data_type: 'longtext'
  is_nullable: 0

=head2 volatile_vars

  data_type: 'text'
  is_nullable: 0

=head2 active

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 confirmed_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 confirmation_key

  data_type: 'char'
  is_nullable: 1
  size: 32

=head2 registered_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 entity_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "user_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "user_name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "userclass",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "password",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "fname",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "lname",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "sms_number",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "vars",
  { data_type => "longtext", is_nullable => 0 },
  "volatile_vars",
  { data_type => "text", is_nullable => 0 },
  "active",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "confirmed_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "confirmation_key",
  { data_type => "char", is_nullable => 1, size => 32 },
  "registered_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "entity_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</user_id>

=back

=cut

__PACKAGE__->set_primary_key("user_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_confirmation_key>

=over 4

=item * L</confirmation_key>

=back

=cut

__PACKAGE__->add_unique_constraint("u_confirmation_key", ["confirmation_key"]);

=head2 C<u_user_name>

=over 4

=item * L</user_name>

=back

=cut

__PACKAGE__->add_unique_constraint("u_user_name", ["user_name"]);

=head1 RELATIONS

=head2 ca_acls

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaAcl>

=cut

__PACKAGE__->has_many(
  "ca_acls",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaAcl",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_batch_logs

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaBatchLog>

=cut

__PACKAGE__->has_many(
  "ca_batch_logs",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaBatchLog",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_commerce_communications

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunication>

=cut

__PACKAGE__->has_many(
  "ca_commerce_communications",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunication",
  { "foreign.from_user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_commerce_communications_read_logs

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunicationsReadLog>

=cut

__PACKAGE__->has_many(
  "ca_commerce_communications_read_logs",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceCommunicationsReadLog",
  { "foreign.read_by_user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_commerce_transactions

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceTransaction>

=cut

__PACKAGE__->has_many(
  "ca_commerce_transactions",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaCommerceTransaction",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_data_import_events

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataImportEvent>

=cut

__PACKAGE__->has_many(
  "ca_data_import_events",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataImportEvent",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_data_importer_logs

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterLog>

=cut

__PACKAGE__->has_many(
  "ca_data_importer_logs",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaDataImporterLog",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_ips

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaIp>

=cut

__PACKAGE__->has_many(
  "ca_ips",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaIp",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_object_checkouts

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaObjectCheckout>

=cut

__PACKAGE__->has_many(
  "ca_object_checkouts",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaObjectCheckout",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_representation_annotations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotation>

=cut

__PACKAGE__->has_many(
  "ca_representation_annotations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaRepresentationAnnotation",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_tours

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaTour>

=cut

__PACKAGE__->has_many(
  "ca_tours",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaTour",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_user_notes

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUserNote>

=cut

__PACKAGE__->has_many(
  "ca_user_notes",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUserNote",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_users_x_groups

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUsersXGroup>

=cut

__PACKAGE__->has_many(
  "ca_users_x_groups",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUsersXGroup",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_users_x_roles

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaUsersXRole>

=cut

__PACKAGE__->has_many(
  "ca_users_x_roles",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaUsersXRole",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_watch_lists

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaWatchList>

=cut

__PACKAGE__->has_many(
  "ca_watch_lists",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaWatchList",
  { "foreign.user_id" => "self.user_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 entity

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaEntity>

=cut

__PACKAGE__->belongs_to(
  "entity",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaEntity",
  { entity_id => "entity_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:A+6y12V7ApQ0KsyQnSt5XA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
