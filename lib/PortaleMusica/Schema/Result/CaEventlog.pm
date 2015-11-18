use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaEventlog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaEventlog

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

=head1 TABLE: C<ca_eventlog>

=cut

__PACKAGE__->table("ca_eventlog");

=head1 ACCESSORS

=head2 date_time

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 code

  data_type: 'char'
  is_nullable: 0
  size: 4

=head2 message

  data_type: 'text'
  is_nullable: 0

=head2 source

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "date_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "code",
  { data_type => "char", is_nullable => 0, size => 4 },
  "message",
  { data_type => "text", is_nullable => 0 },
  "source",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RPYtpgFJXFNJmCyeL6j5+A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
