# get information / check a file

use feature 'say';

# does a file exist
if ( -e "arrays.pl" ) {
    say "this file does exist"
}

# is this file a directory
if ( -d "Moose_Classes" ) {
    say "this file is a directory"
}