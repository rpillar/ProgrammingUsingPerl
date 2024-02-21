# BEGIN blocks as the name suggests run after the perl 'compile' / 'load' process (of the code prior to it - but before code below it) 
# and note - they can be 'stacked' and END blocks run after the perl interpreter exits (even if it is exiting 
# as a result of a die()).
# The output if I do a `perl -c <script name>` is :-
#  I am the first BEGIN block
#  I am the second BEGIN block

# If I then do a `perl <script name>` :-
#  I am the first BEGIN block
#  I am the second BEGIN block
#  I am in the middle'ish
#  This is the end

# Note that BEGIN blocks can be nested - no example here through.

# another (possibly useful) 'pre-execution' block is 'INIT' - runs after compile but before the script
# executes.
#  I am the first BEGIN block
#  I am the second BEGIN block
#  I am an INIT block
#  I am in the middle'ish
#  This is the end

use warnings;
use strict;

print (ajshdbsahdb);

END {
    print "This is the end\n";
}

print "I am in the middleish\n";

INIT {
    print "I am an INIT block\n";
}

BEGIN {
    print "I am the first BEGIN block\n";
}

BEGIN {
    print "I am the second BEGIN block\n"
}

# by introducing a 'bug' - line 27 we get the following output :-
#  Unquoted string "ajshdbsahdb" may clash with future reserved word at begin_and_end_blocks.pl line 27.
#  I am the first BEGIN block
#  I am the second BEGIN block
#  Name "main::ajshdbsahdb" used only once: possible typo at begin_and_end_blocks.pl line 27.
#  I am an INIT block
#  print() on unopened filehandle ajshdbsahdb at begin_and_end_blocks.pl line 27.
#  I am in the middleish
#  This is the end

# useful articles to find out more :-
## - https://perlmaven.com/begin
## - https://perldoc.perl.org/perlmod#BEGIN%2C-UNITCHECK%2C-CHECK%2C-INIT-and-END