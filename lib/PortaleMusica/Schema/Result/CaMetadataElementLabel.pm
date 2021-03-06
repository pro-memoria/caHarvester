use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElementLabel;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElementLabel

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

=head1 TABLE: C<ca_metadata_element_labels>

=cut

__PACKAGE__->table("ca_metadata_element_labels");

=head1 ACCESSORS

=head2 label_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 element_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 locale_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'text'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "label_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "element_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "locale_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "description",
  { data_type => "text", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</label_id>

=back

=cut

__PACKAGE__->set_primary_key("label_id");

=head1 RELATIONS

=head2 element

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement>

=cut

__PACKAGE__->belongs_to(
  "element",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataElement",
  { element_id => "element_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 locale

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLocale>

=cut

__PACKAGE__->belongs_to(
  "locale",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLocale",
  { locale_id => "locale_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Dg4wkYXCZt3hIXB60RdFEw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
