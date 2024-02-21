# in perl scripts you will sometimes see modules 'loaded' using 'use' and also using
# 'require' - what are the differences.

# when using 'use' perl will load and compile a module - during the compilation phase. So
# the 'use' statement is actually replaced by :-
# BEGIN {
#     require Math::Round;
#     Math::Round->import( qw( nearest ) );   
# }

# or :-

# BEGIN {
#     require Data::Printer;
#     Data::Printer->import;
# }

# when using 'require' a module is loaded at the point of execution - this means that we can 
# (if required) load modules conditionally as in this example :-

use strict;
use warnings;

use Data::Printer;

my $testing = 1;
if ( $testing ) {
    require Math::Round;
    Math::Round->import( qw(nearest) )
}

print "I am a small script that does nothing really.\n";
print "The nearest number to 40 is : " . nearest(10, 47) . "\n";