use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaMultipartIdnoSequence;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaMultipartIdnoSequence

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

=head1 TABLE: C<ca_multipart_idno_sequences>

=cut

__PACKAGE__->table("ca_multipart_idno_sequences");

=head1 ACCESSORS

=head2 idno_stub

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 format

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 element

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 seq

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "idno_stub",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "format",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "element",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "seq",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</idno_stub>

=item * L</format>

=item * L</element>

=back

=cut

__PACKAGE__->set_primary_key("idno_stub", "format", "element");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VZ23C4qys5ohC2N8fOk4TA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
