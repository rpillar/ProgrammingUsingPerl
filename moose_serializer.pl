use Data::Printer;

use strict;
use warnings;

use feature 'say';

use lib 'Moose_Classes';
use SerializerJSON;

# create a serializer ...
my $s = SerializerJSON->new( name => "Richard", data => { account => "Savings", balance => 12.33} );

my $s_string = $s->to_string();
say $s_string;
