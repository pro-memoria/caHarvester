use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaApplicationVar;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaApplicationVar

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

=head1 TABLE: C<ca_application_vars>

=cut

__PACKAGE__->table("ca_application_vars");

=head1 ACCESSORS

=head2 vars

  data_type: 'longtext'
  is_nullable: 0

=cut

__PACKAGE__->add_columns("vars", { data_type => "longtext", is_nullable => 0 });


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:m3TbaSF7WaNteJhONmT0aQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
