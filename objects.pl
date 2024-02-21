# from the 'perlobj' doco :-

# There are a few basic principles which define object oriented Perl:
#
# - An object is simply a data structure that knows to which class it belongs.
# - A class is simply a package. A class provides methods that expect to operate on objects.
# - A method is simply a subroutine that expects a reference to an object (or a package name, for class methods) as the first argument.

# Unlike many other languages which support object orientation, Perl does not provide any special syntax for constructing an object. 
# Objects are merely Perl data structures (hashes, arrays, scalars, filehandles, etc.) that have been explicitly associated 
# with a particular class.
#
# That explicit association is created by the built-in bless function, which is typically used within the constructor 
# subroutine of the class.

# For example :-

package Customer;

sub new {
    my ( $class, $name, $age ) = @_;

    return bless {
        name => $name,
        age  => $age,
    }, $class;
}

# define getters
sub name {
    my $self = shift;
    return $self->{ name };
}

sub age {
    my $self = shift;
    return $self->{ age };
}

# add a 'to_string' method
sub to_string {
    my $self = shift;
    return "$self->{ name} : $self->{ age }"
}

1;

use Data::Printer;
use Scalar::Util 'blessed';

use feature 'say';

my $customer = Customer->new( "Richard", 21);
p $customer->name; # "Richard"
p $customer->age; # 21
p $customer->to_string; # "Richard : 21"

say blessed $customer; # Customer - something that has been 'blessed' (using the 'bless' function)