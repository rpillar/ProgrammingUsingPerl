# some notes taken from 'https://perldoc.perl.org/perlvar' 

# these examples are mainly for the perl variables that could be considered a 'lttle obscure' (or not)
# or that you may not encounter on a regular basis.

# In no particular order :-

# if you want to use 'long' variable names then you will have to 'use English;'
use English;
use Data::Printer;

# here we could have used the more familar '$_' but we use the 'long' name instead.
for ( 1..5 ) { print $ARG . "\n"; }

# '$PID' or '$$' - the 'process number' of the Perl running this script.
print( "The PID of this is $PID (or using the 'shorthand') - $$\n");

# the 'name' of the script being run - $0
print( "this script is : $0\n" );

# %ENV - contains your current environment
print( "Here is my environment :-\n" );
p %ENV;
p $ENV{ 'HOME' };

# the perl 'version' that you are using
print( "Your perl is $]\n" );

# '@INC' - contains the list of places that 'EXPR do' / 'require' / 'use' will look for their libraries
p @INC;

# '%INC' - contains entries for each filename included via the 'do', 'require', or 'use' operators
p %INC;

# '$?' contains the exit code of a program - executed (for example) using a 'system' call
system "perl scripts/hello_world.pl";
p $?;

# you may sometimes come across code like '$::n' or '$main::n' - where $n is defined in the 'main' package
our $n = 1;
p $::n;
p $main::n;