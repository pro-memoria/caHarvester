use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaSchemaUpdate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaSchemaUpdate

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

=head1 TABLE: C<ca_schema_updates>

=cut

__PACKAGE__->table("ca_schema_updates");

=head1 ACCESSORS

=head2 version_num

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 datetime

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "version_num",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "datetime",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 UNIQUE CONSTRAINTS

=head2 C<u_version_num>

=over 4

=item * L</version_num>

=back

=cut

__PACKAGE__->add_unique_constraint("u_version_num", ["version_num"]);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7gqab/OTCk0HNgZfc3mchw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
