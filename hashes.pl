# hashes are a group of un-ordered key / value pairs
use Data::Printer;

# create a hash-ref
my $h1 = {
    name => "Richard"
};
# create a hash
my %h2 = (
    fname => "Richard",
    lname => 'Pillar',
);
p $h1;
p %h2;

# accessing data ...
print("My name is $h1->{name}\n");
print("My name is $h2{fname} $h2{lname}\n");

# adding key / values to a hash-ref
$h1->{gender} = "Male";
p $h1;

# adding a key / value to a hash
$h2{gender} = "Male";
p %h2;

# iterating over a hash (using its 'keys')
my @keys = keys %h2;
foreach (@keys) {
    print("My key / value is : $_ / $h2{$_}\n");
}

# the same with a hash-ref
my @hr_keys = keys %{ $h1 };
foreach (@hr_keys) {
    print("My key / value is : $_ / $h1->{$_}\n");
}

# getting the size of a hash :-
my $size = scalar keys %h2;
p $size;