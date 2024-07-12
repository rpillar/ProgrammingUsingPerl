# some examples of the various List::Util methods that can be useful.

use strict;
use warnings;

use Data::Printer;
use List::Util qw( first head minstr shuffle sum tail );

# 'minstr' - return the first string as defined by 'lt'
my @strings = ("Zzzz", "Fred", "Archie", "Sam");
my $first = minstr @strings;
p $first; # "Archie"

# 'sum' all elements in a list
my @number_list = (10 .. 98);
my $total = sum @number_list;
p $total; # 4806

# find the 'first' element in a list that matches the supplied expression
my @first_list = (1,3,5,12,9,8);
my $first_match = first {$_ % 2 == 0} @first_list;
p $first_match; # 12 - first 'even' number

# 'shuffle' the elements of a list
my @shuffle_list = 1 .. 12;
my @shuffled_list = shuffle @shuffle_list;
p @shuffled_list;

# return the 'head' or 'tail' of a list
my @head_tail_list = 1 .. 20;
my @list_head = head 2, @head_tail_list;
p @list_head; # [ [1,2]]
my @list_tail = tail 2, @head_tail_list;
p @list_tail; # [ [19,20] ]