use lib "./Moose_Classes";

use Data::Printer;
use Point;

# get / print out an objects symbol table ...
my $s = \%Point::;
p $s;

# {
#     BEGIN       *Point::BEGIN  (layers: ),
#     can         *Point::can  (layers: ),
#     DESTROY     *Point::DESTROY  (layers: ),
#     has_x       *Point::has_x  (layers: ),
#     has_y       *Point::has_y  (layers: ),
#     import      *Point::import  (layers: ),
#     ISA         *Point::ISA  (layers: ),
#     isa         *Point::isa  (layers: ),
#     new         *Point::new  (layers: ),
#     to_string   *Point::to_string  (layers: ),
#     meta        *Point::meta  (layers: ),
#     x           *Point::x  (layers: ),
#     y           *Point::y  (layers: )
# }

# or we can do - to look at everything within current 'main' ...
my $counter = 0;
foreach my $entry ( keys %main:: ) {
    print "$entry\n";
    $counter++;
    if ($counter > 10) {
        print("\nThere could be lots more to print ...\n");
        last;
    }
}

# you can directly manipulate the contents of the symbol table with a construct called a 'typeglob'. A
# typeglob is an identifier preceded by an asterisk and represents the symbol table entry for everything
# with that identifier. 
# Typeglobs can be updated (as lvalues)  and can be a useful way of overriding behaviour
# when testing code ( place a code ref in an INIT block - for example).
print "This variable 's' is in package : " . *main::s{PACKAGE} . "\n"; # This is in package : main
print "This variable is called : " . *s{NAME} . "\n";          # This is called     : s

# an yet another example - I can 'alias' things :-
our $a_very_long_variable_name_that_is_too_long_to_remember = 22;
our $elvis;
*elivis = \$a_very_long_variable_name_that_is_too_long_to_remember;
print "elvis is how old : " . $elivis . "\n";