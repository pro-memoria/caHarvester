use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaSearchForm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaSearchForm

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

=head1 TABLE: C<ca_search_forms>

=cut

__PACKAGE__->table("ca_search_forms");

=head1 ACCESSORS

=head2 form_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 form_code

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 table_num

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 is_system

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 settings

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "form_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "user_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "form_code",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "table_num",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "is_system",
  { data_type => "tinyint", extra => { unsigned => 1 }, is_nullable => 0 },
  "settings",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</form_id>

=back

=cut

__PACKAGE__->set_primary_key("form_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_form_code>

=over 4

=item * L</form_code>

=back

=cut

__PACKAGE__->add_unique_constraint("u_form_code", ["form_code"]);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DtPOHWlOFUXFLUeWqRpsuw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
