use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaSetItemLabel;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaSetItemLabel

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

=head1 TABLE: C<ca_set_item_labels>

=cut

__PACKAGE__->table("ca_set_item_labels");

=head1 ACCESSORS

=head2 label_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 item_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 locale_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 caption

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "label_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "item_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "locale_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
  "caption",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</label_id>

=back

=cut

__PACKAGE__->set_primary_key("label_id");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:h144tNh18cgb/ZIR6CFy6g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
