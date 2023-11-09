use Data::Printer;

use lib './Moose_Classes';
use Point;

# create a 'default point ...
my $p1 = Point->new();
my $p1_string = $p1->to_string();
print($p1_string . "\n");

# create a Point - setting the x/y values
my $p2 = Point->new( x => 2, y => 3); 
my $p2_string = $p2->to_string();
print($p2_string . "\n");