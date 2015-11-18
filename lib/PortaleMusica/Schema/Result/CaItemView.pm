use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaItemView;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaItemView

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

=head1 TABLE: C<ca_item_views>

=cut

__PACKAGE__->table("ca_item_views");

=head1 ACCESSORS

=head2 view_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 row_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 locale_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 viewed_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ip_addr

  data_type: 'varchar'
  is_nullable: 1
  size: 39

=cut

__PACKAGE__->add_columns(
  "view_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "row_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "user_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "locale_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "viewed_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "ip_addr",
  { data_type => "varchar", is_nullable => 1, size => 39 },
);

=head1 PRIMARY KEY

=over 4

=item * L</view_id>

=back

=cut

__PACKAGE__->set_primary_key("view_id");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9hTA//Wp7SPGP3EdvBS6zA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
