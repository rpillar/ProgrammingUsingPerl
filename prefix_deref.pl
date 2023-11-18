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
p @$a1_ref[2];

# now an example using a hash
my %h1 = (name => "Richard", age => 21);
my $h1_ref = \%h1;
p %$h1_ref;

# another example using a 'hash'
my %h2 = (
    Bender => [ qw(Beer Beer Beer )],
    Fry    => [ qw( Sandwich ) ],
);
print( join '_', @{$h2{'Bender'}} );

# scalar defererencing
my $number = 1234;
my $number_ref = \$number;
p $number_ref;
p $$number_ref;

# CODE dereferencing - create a code ref :-
my $code = sub {
    my $n = shift;
    $n++;
    return $n;
};
p $code; # sub { ... }
my $number = &$code(7);
p $number; # 8

# To find out the 'type' of ref use 'ref' :-
my $a2_ref = [1..10];
print "\n", ref $a2_ref, "\n"; # ARRAY
my $h3_ref = {
    name => "Richard",
    age => 21
};
print ref $h3_ref, "\n"; # HASH

print ref \21, "\n"; # SCALAR