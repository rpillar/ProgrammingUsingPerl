# I'm not sure we need a separate script for this but anyway ....

# 'joining things together' with perl - also see notes here - https://perlmaven.com/join

use Data::Printer;

# create a string combining the elements in an array separated by a space ...
my @a = ("Richard", "Pillar", "is", "old");
my $str = join(" ", @a);
p $str;