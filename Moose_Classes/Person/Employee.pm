package Person::Employee;

use Moose;

extends 'Person';

has 'work_id' => (
    is  => 'ro',
    isa => 'Int',
);

has 'work_title' => (
    is  => 'ro',
    isa => 'Str',
);

has 'start_date' => (
    is  => 'ro',
    isa => 'DateTime',
);

# make the 'class' immutable ... 
__PACKAGE__->meta->make_immutable;