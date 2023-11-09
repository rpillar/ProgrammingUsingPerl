package Tree;

use Moose;
use Data::Printer;

=head1 Attributes

=head2 left

=cut

has 'left' => (
    is        => 'rw', 
    isa       => 'Int',
    default   => 0,
    predicate => 'has_left'
);

=head2 right

=cut

has 'right' => (
    is        => 'rw', 
    isa       => 'Int',
    default   => 0,
    predicate => 'has_right'
);

=head2 data

=cut

has 'data' => (
    is        => 'rw', 
    isa       => 'Int',
    predicate => 'has_data'
);

# make the 'class' immutable ...
__PACKAGE__->meta->make_immutable;