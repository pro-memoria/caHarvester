use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaSqlSearchNgram;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaSqlSearchNgram

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

=head1 TABLE: C<ca_sql_search_ngrams>

=cut

__PACKAGE__->table("ca_sql_search_ngrams");

=head1 ACCESSORS

=head2 word_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ngram

  data_type: 'char'
  is_nullable: 0
  size: 4

=head2 seq

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "word_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "ngram",
  { data_type => "char", is_nullable => 0, size => 4 },
  "seq",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:J2IKKg6Yg1VFXm++lSzLfA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
