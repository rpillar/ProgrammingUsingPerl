package Person;
use namespace::autoclean; 
use Moose;
 
has 'first_name' => (
    is  => 'rw',
    isa => 'Str',
);
 
has 'last_name' => (
    is  => 'rw',
    isa => 'Str',
);

# make the 'class' immutable ... 
__PACKAGE__->meta->make_immutable;