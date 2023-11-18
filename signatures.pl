# subroutine 'signatures' are enabled automatically in Perl v5.36 - prior to this you would have to :-
# - use feature 'signatures';
# in the current scope.

use Try::Tiny;

# parameters / arguments (when not using 'signatures') would be passed to a subroutine as follows :-
sub hello1 {
    my ( $name ) = @_;
    print("hello " . $name . "\n");
}
hello1("Richard");

# enable 'feature' ...
use feature 'signatures';

# alternatively we can :-
sub hello2 ( $name ) {
    print("hello " . $name . "\n");
}
hello2("Sam");

# if the subroutine is called and the argument list does not meet the requirements of the 'signature' 
# then an exception is raised
try {
    hello2();
}
catch {
    print("Invalid argument list - exception raised\n")
};

# it is possible to set an argment to 'optional' by providing a 'default'
sub hello3 ($name, $age = 21) {
    print("hello $name, your age is $age\n")
}
hello3("Richard");
hello3("Sam", 18);

# pass a 'list' ...
sub hello4(@names) {
    foreach ( @names ) {
        print("hello $_\n")
    }
}
hello4(("Richard", "Sam", "John"));

# optional positional parameters must come 'after' mandatory positional parameters - here we are
# using a 'slurpy' parameter (a list) but this could equally be a 'hash' (will treat argument pairs as 'key' value')
sub hello5 ($name, $age, @optional_args) {
    print("hello $name, my age is $age\n");
    print(@optional_args[0] . "\n");
}
hello5("Richard", 21, "male");

# if your subroutine has many arguments but you only 'need' to work with the first your can provide
# a 'nameless' slurpy parameter :-
sub hello6($name, @) {
    print("hello $name\n");
}
hello6("Richard", 21, "male");

# NOTE that if no parameters are specified in a signature then an exception will be raised if
# arguments are passed :-
sub hello7 () {
    print("hello to a nameless person\n");
}
try {
    hello7("Richard");
}
catch {
    print("Exception raised - arguments provided when none expected\n");
};