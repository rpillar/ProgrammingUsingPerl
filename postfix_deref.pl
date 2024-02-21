# Perl v5.20 added a 'postfix' way of dereferencing (became stable in v5.24) such that rather then using
# the complicated 'prefix' method we can turn a refrence into its contents

use Data::Printer;
use feature 'postderef';
use feature 'state';

# the 'old' prefix way :-
my @old = @{ [1,2,3,4,5] };
p @old;

# to turn an array ref into its elements, after the '->' use '@' with a star ('*')
my @e1 = [1,2,3,4]->@*;
p @e1;

my $a1 = [1,2,3,4];
my @e2 = $a1->@*;
p @e2;

# note that in previous versions of Perl you would have to do something like :-
# - my @elements = @{ $array_ref };

# but now (well from v5.20 onwards) you can do this (much nicer) .....
my $a2 = [1..10];
foreach my $element ( $a2->@* ) {
    print $element . "\n";
}

# a more interesting example is where the 'reference' is the return value from a subroutine :-
sub a_sub {
    state $ref = [ qw(cat dog bird butterfly) ];
    $ref;
}
foreach my $element ( a_sub()->@* ) {
    print("The element is : $element\n");
}