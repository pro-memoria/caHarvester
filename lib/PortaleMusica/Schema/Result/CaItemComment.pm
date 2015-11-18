use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaItemComment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaItemComment

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

=head1 TABLE: C<ca_item_comments>

=cut

__PACKAGE__->table("ca_item_comments");

=head1 ACCESSORS

=head2 comment_id

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

=head2 media1

  data_type: 'longblob'
  is_nullable: 0

=head2 media2

  data_type: 'longblob'
  is_nullable: 0

=head2 media3

  data_type: 'longblob'
  is_nullable: 0

=head2 media4

  data_type: 'longblob'
  is_nullable: 0

=head2 comment

  data_type: 'text'
  is_nullable: 1

=head2 rating

  data_type: 'tinyint'
  is_nullable: 1

=head2 email

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 location

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 created_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 access

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ip_addr

  data_type: 'varchar'
  is_nullable: 1
  size: 39

=head2 moderated_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 moderated_by_user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "comment_id",
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
  "media1",
  { data_type => "longblob", is_nullable => 0 },
  "media2",
  { data_type => "longblob", is_nullable => 0 },
  "media3",
  { data_type => "longblob", is_nullable => 0 },
  "media4",
  { data_type => "longblob", is_nullable => 0 },
  "comment",
  { data_type => "text", is_nullable => 1 },
  "rating",
  { data_type => "tinyint", is_nullable => 1 },
  "email",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "location",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "created_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "access",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "ip_addr",
  { data_type => "varchar", is_nullable => 1, size => 39 },
  "moderated_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "moderated_by_user_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</comment_id>

=back

=cut

__PACKAGE__->set_primary_key("comment_id");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Lv9x5T3/6PRWlqRveeI9JQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
