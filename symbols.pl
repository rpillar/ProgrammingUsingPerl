use lib "./Moose_Classes";

use Data::Printer;
use Point;

# get / print out an objects symbol table ...
my $s = \%Point::;
p $s;