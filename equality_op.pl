# a script that demonstrates how to check for 'equality' between 'things'

use feature 'say';

# Binary "==" returns true if the left argument is numerically equal to the right argument.
if (1 == 1) { say("It turns out that one is equal to one (numerically of course)") }

# Binary "!=" returns true if the left argument is numerically not equal to the right argument.
if (1 != 2) { say("And 1 is not equal to 2 (numerically of cource)"); }

# String comparisons :-
# Binary "eq" returns true if the left argument is stringwise equal to the right argument.
if ("Richard" eq "Richard") { say("These two strings are equal") }

# Binary "ne" returns true if the left argument is stringwise not equal to the right argument.
if ("James" ne "Jack") { say("And these two strings are not equal"); }

# Binary "<=>" returns -1, 0, or 1 depending on whether the left argument is numerically less than, equal to, or greater than the right argument.
say 10 <=> 2; # returns 1
say 2 <=> 10; # returns -1
say 2.5 <=> 2.5; # returns 0