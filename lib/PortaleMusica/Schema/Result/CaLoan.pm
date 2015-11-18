use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaLoan;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaLoan

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

=head1 TABLE: C<ca_loans>

=cut

__PACKAGE__->table("ca_loans");

=head1 ACCESSORS

=head2 loan_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 parent_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 type_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 locale_id

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 idno

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 idno_sort

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 is_template

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 source_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 source_info

  accessor: 'column_source_info'
  data_type: 'longtext'
  is_nullable: 0

=head2 hier_left

  data_type: 'decimal'
  is_nullable: 0
  size: [30,20]

=head2 hier_right

  data_type: 'decimal'
  is_nullable: 0
  size: [30,20]

=head2 hier_loan_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 access

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 status

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 deleted

  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 rank

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "loan_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "parent_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "type_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "locale_id",
  {
    data_type => "smallint",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "idno",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "idno_sort",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "is_template",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "source_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 1,
  },
  "source_info",
  {
    accessor    => "column_source_info",
    data_type   => "longtext",
    is_nullable => 0,
  },
  "hier_left",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
  "hier_right",
  { data_type => "decimal", is_nullable => 0, size => [30, 20] },
  "hier_loan_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "access",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "status",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "deleted",
  {
    data_type => "tinyint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "rank",
  {
    data_type => "integer",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</loan_id>

=back

=cut

__PACKAGE__->set_primary_key("loan_id");

=head1 RELATIONS

=head2 ca_loan_labels

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoanLabel>

=cut

__PACKAGE__->has_many(
  "ca_loan_labels",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoanLabel",
  { "foreign.loan_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoan>

=cut

__PACKAGE__->has_many(
  "ca_loans",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoan",
  { "foreign.parent_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_collections

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXCollection>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_collections",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXCollection",
  { "foreign.loan_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_entities

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXEntity>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_entities",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXEntity",
  { "foreign.loan_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_loans_loan_rights

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoanXLoans>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_loans_loan_rights",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoanXLoans",
  { "foreign.loan_right_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_loans_loans_left

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoanXLoans>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_loans_loans_left",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoanXLoans",
  { "foreign.loan_left_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_movements

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXMovement>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_movements",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXMovement",
  { "foreign.loan_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_object_lots

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObjectLot>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_object_lots",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObjectLot",
  { "foreign.loan_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_object_representations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObjectRepresentation>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_object_representations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObjectRepresentation",
  { "foreign.loan_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_objects

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObject>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_objects",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXObject",
  { "foreign.loan_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_occurrences

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXOccurrence>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_occurrences",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXOccurrence",
  { "foreign.loan_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_places

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoanXPlaces>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_places",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoanXPlaces",
  { "foreign.loan_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_storage_locations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXStorageLocation>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_storage_locations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXStorageLocation",
  { "foreign.loan_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ca_loans_x_vocabulary_terms

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXVocabularyTerm>

=cut

__PACKAGE__->has_many(
  "ca_loans_x_vocabulary_terms",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoansXVocabularyTerm",
  { "foreign.loan_id" => "self.loan_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 locale

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLocale>

=cut

__PACKAGE__->belongs_to(
  "locale",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLocale",
  { locale_id => "locale_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 parent

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaLoan>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaLoan",
  { loan_id => "parent_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 source

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->belongs_to(
  "source",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { item_id => "source_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);

=head2 type

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaListItem>

=cut

__PACKAGE__->belongs_to(
  "type",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaListItem",
  { item_id => "type_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8/blQe9pSaHmWqc9NDthHA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
