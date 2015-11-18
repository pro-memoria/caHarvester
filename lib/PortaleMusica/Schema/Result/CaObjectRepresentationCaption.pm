use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationCaption;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaObjectRepresentationCaption

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

=head1 TABLE: C<ca_object_representation_captions>

=cut

__PACKAGE__->table("ca_object_representation_captions");

=head1 ACCESSORS

=head2 caption_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 representation_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 locale_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 caption_file

  data_type: 'longblob'
  is_nullable: 0

=head2 caption_content

  data_type: 'longtext'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "caption_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "representation_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "locale_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "caption_file",
  { data_type => "longblob", is_nullable => 0 },
  "caption_content",
  { data_type => "longtext", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</caption_id>

=back

=cut

__PACKAGE__->set_primary_key("caption_id");

=head1 RELATIONS

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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+CX0I0ahV0YGcm0MnZYT8A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
