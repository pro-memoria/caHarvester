use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataDictionaryRule;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataDictionaryRule

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

=head1 TABLE: C<ca_metadata_dictionary_rules>

=cut

__PACKAGE__->table("ca_metadata_dictionary_rules");

=head1 ACCESSORS

=head2 rule_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 entry_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 rule_code

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 expression

  data_type: 'text'
  is_nullable: 0

=head2 rule_level

  data_type: 'char'
  is_nullable: 0
  size: 4

=head2 settings

  data_type: 'longtext'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "rule_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "entry_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "rule_code",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "expression",
  { data_type => "text", is_nullable => 0 },
  "rule_level",
  { data_type => "char", is_nullable => 0, size => 4 },
  "settings",
  { data_type => "longtext", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</rule_id>

=back

=cut

__PACKAGE__->set_primary_key("rule_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<u_rule_code>

=over 4

=item * L</rule_code>

=back

=cut

__PACKAGE__->add_unique_constraint("u_rule_code", ["rule_code"]);

=head1 RELATIONS

=head2 ca_metadata_dictionary_rule_violations

Type: has_many

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataDictionaryRuleViolation>

=cut

__PACKAGE__->has_many(
  "ca_metadata_dictionary_rule_violations",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataDictionaryRuleViolation",
  { "foreign.rule_id" => "self.rule_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 entry

Type: belongs_to

Related object: L<CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataDictionaryEntry>

=cut

__PACKAGE__->belongs_to(
  "entry",
  "CollectiveAccess::PortaleMusica::Schema::Result::CaMetadataDictionaryEntry",
  { entry_id => "entry_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9pDJF6Pk0n6eZcd7N5PLBg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
