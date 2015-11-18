use utf8;
package CollectiveAccess::PortaleMusica::Schema::Result::CaTaskQueue;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CollectiveAccess::PortaleMusica::Schema::Result::CaTaskQueue

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

=head1 TABLE: C<ca_task_queue>

=cut

__PACKAGE__->table("ca_task_queue");

=head1 ACCESSORS

=head2 task_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 row_key

  data_type: 'char'
  is_nullable: 1
  size: 32

=head2 entity_key

  data_type: 'char'
  is_nullable: 1
  size: 32

=head2 created_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 started_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 completed_on

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 priority

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 handler

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 parameters

  data_type: 'text'
  is_nullable: 0

=head2 notes

  data_type: 'text'
  is_nullable: 0

=head2 error_code

  data_type: 'smallint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "task_id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "user_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "row_key",
  { data_type => "char", is_nullable => 1, size => 32 },
  "entity_key",
  { data_type => "char", is_nullable => 1, size => 32 },
  "created_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "started_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "completed_on",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
  "priority",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
  "handler",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "parameters",
  { data_type => "text", is_nullable => 0 },
  "notes",
  { data_type => "text", is_nullable => 0 },
  "error_code",
  {
    data_type => "smallint",
    default_value => 0,
    extra => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</task_id>

=back

=cut

__PACKAGE__->set_primary_key("task_id");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-09-01 16:35:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:+IU13LC646s4Z2JilWhX9A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
