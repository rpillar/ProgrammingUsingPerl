package Foo;
use v5.34;  # which implies "use strict;"

$Foo::foo = 23;
my $name = "Richard";
our $age = 21; # need to define this with 'our' not 'my'

{
    our $foo ;         # alias to $Foo::foo
    print $foo . "\n"; # prints 23
}

{
    my $foo = 12;     # local to this scope
    print $foo . "\n" # prints 12
}
print $Foo::foo . "\n"; # prints 23

print "my global age is : $age\n";
local_sub();

# the rules for 'my' and 'our' relate to scoping - 'my' is local ('lexically' scoped) to a scope whereas
# an 'our' variable is an alias to a package variable - 'globally' scoped.

# 'local' can be used to 'localize' a variable that has been defined in the global scope - see the subroutine
# below - see call above ....
sub local_sub {
    local $age = 22;
    print "My local age is : $age\n"
}

# You can use 'state' to persist a variables value across calls - in this case we use a 'state' 
# variable as a counter ...
sub my_sub {
    state $c;

    ++$c;
    print("I have been called $c times\n");
}
for ( 1 .. 10 ) {
    my_sub();
}