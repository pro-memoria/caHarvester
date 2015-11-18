use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaAttributeValueMultifile;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaAttributeValueMultifile

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

=head1 TABLE: C<ca_attribute_value_multifiles>

=cut

__PACKAGE__->table("ca_attribute_value_multifiles");

=head1 ACCESSORS

=head2 multifile_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 value_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 resource_path

  data_type: 'text'
  is_nullable: 0

=head2 media

  data_type: 'longblob'
  is_nullable: 0

=head2 media_metadata

  data_type: 'longblob'
  is_nullable: 0

=head2 media_content

  data_type: 'longtext'
  is_nullable: 0

=head2 rank

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "multifile_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "value_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "resource_path",
  { data_type => "text", is_nullable => 0 },
  "media",
  { data_type => "longblob", is_nullable => 0 },
  "media_metadata",
  { data_type => "longblob", is_nullable => 0 },
  "media_content",
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

=item * L</multifile_id>

=back

=cut

__PACKAGE__->set_primary_key("multifile_id");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:E4S7xtkaiwcsMFh/6yu4nw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
