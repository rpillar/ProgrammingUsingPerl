package SerializerAbstractClass;

use Moose::Role;

use feature qw(signatures);

requires qw(serialize to_string);

has 'name' => (
    is  => 'rw',
    isa => 'Str'
);

1;