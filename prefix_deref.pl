# from the GeeksForGeeks site :-

# Dereferencing is the way of accessing the value in memory pointed to by the reference. 
# In order to dereference, we use the prefix $, @, % or & depending on the type of 
# the variable (a reference can point to a array, scalar, or hash etc).

use Data::Printer;

my @a1 = (1,2,3,4,5);
my $a1_ref = \@a1;
p @$a1_ref;

# I can also do it this way :-
p @{ $a1_ref };

# you can also de-ref a specific element of an array
p @{ $a1_ref }[1];

# now an example using a hash
my %h = (name => "Richard", age => 21);
my $h_ref = \%h;
p %$h_ref;

# scalar defererencing
my $number = 1234;
my $number_ref = \$number;
p $$number_ref;
