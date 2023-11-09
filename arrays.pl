use Data::Printer;

# an array in some respects can be thought of as a 'variable' that has a 'list assigned to it. 
# It can be an 'empty' list
my @a1 = ();
p @a1; # []

# assign a 'populated' list and iterate over it
my @a2 = (1,2,3,4,5);
for ( @a2 ) {
    print($_ . "\n");
}

# a quick way of creating a 'list' of numbers is using the .. notation
my @numbers = (1 .. 10);
p @numbers;

# take the 'first' value of a list - note that 'shift' removes
# the element from the array ...
my $first = shift @a2;
print("My first value is $first\n");
p @a2;

# remove an element from the 'end' of the list
my $pop = pop @a2;
print("My pop value is $pop\n");
p @a2;

# 'unshift' - adds the specified elements to the start of a list and returns the number of elements in the updated list
my $unshift_count = unshift(@a2, "Hello", "World");
print("My unshift value is $unshift_count\n");
p @a2;

# 'push' - add an element to the 'end' of the list
push @a2, "End";
p @a2;

# using array indexing
# ====================

# get the 'first' element of a list
my @a3 = ("Richard", "Sam", "Luke", "James", "John");
p @a3;
print("My first value is $a3[0]\n");

# using a 'negative' index gets an element starting from the end
p $a3[-1];

# If I only want the first three values from a list then perl will ignore the 'rest'
my ($b, $c, $d) = @a3;
print("The first three elements of this array are : $b / $c / $d\n");

# to get a 'slice' from an array we can use the range operator
my @a4 = @a3[1 .. 3];
p @a4;

# array 'slice' - take / return only the elements that you want
my @a5 = (1 .. 20);
my @a6 = @a5[0,1,2,3,4];
p @a5;
p @a6;
