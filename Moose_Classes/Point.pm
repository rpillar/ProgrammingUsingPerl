package Point;
use namespace::autoclean;
use Moose;

has 'x' => ( 
  is        => 'ro', 
  isa       => 'Int',
  default   => 1,
  predicate => 'has_x'
);

has 'y' => ( 
  is        => 'ro', 
  isa       => 'Int',
  default   => 1,
  predicate => 'has_y'
);

sub to_string {
  my $self = shift;

  return "My point is " . $self->x . " / " . $self->y;
}

# make the 'class' immutable ...
__PACKAGE__->meta->make_immutable;