# understanding what is meant be 'context' in perl scripts / modules etc.

use Data::Printer;

# 'scalar' context - whenever you assign anything to a Scalar variable it will always give Scalar Context.
my @numbers = (1 .. 10);
my $number_of_elements = @numbers;
p $number_of_elements; # 10

# in terms of the 'localtime(time)' function we can use 'list' context to extract the various elements of 'time'
# that are returned.
my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
p $sec;
p $min;
p $hour;

# we could also do :-
my ($new_sec, $new_min) = localtime(time);
p $new_sec;
p $new_min;

# and :- 
my ($another_sec, $another_min, @the_rest) = localtime(time);
p $another_sec;
p $another_min;
p @the_rest;
