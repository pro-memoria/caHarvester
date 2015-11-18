use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaSqlSearchWord;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaSqlSearchWord

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

=head1 TABLE: C<ca_sql_search_words>

=cut

__PACKAGE__->table("ca_sql_search_words");

=head1 ACCESSORS

=head2 word_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 word

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 stem

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 locale_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "word_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "word",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "stem",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "locale_id",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</word_id>

=back

=cut

__PACKAGE__->set_primary_key("word_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_word>

=over 4

=item * L</word>

=back

=cut

__PACKAGE__->add_unique_constraint("u_word", ["word"]);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GCTw8X5IE9pCMACpwJI7Bg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
