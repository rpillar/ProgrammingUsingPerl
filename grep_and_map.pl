# some examples of uses of 'grep' and 'map' in perl scripts.

## docs :-
# - https://perldoc.perl.org/functions/grep
# - https://perldoc.perl.org/functions/map

# grep
# ====

# 'grep' can be used to filter a list based on a some expression - usually (but not always) a
# regex.
use Data::Printer;

my @data_1 = (
    "This is line 1",
    "#this is a comment line",
    "This is another line",
    "And another one ..."
);
my @filtered_data_1 = grep(!/^#/ , @data_1);
p @filtered_data_1;
## returns :-
# [
#     [0] "This is line 1",
#     [1] "This is another line",
#     [2] "And another one ..."
# ]

# the 'grep' code above could also be written as - in this case just get the 'comment' lines :-
my @filtered_data_2 = grep {/^#/} @data_1;
p @filtered_data_2;
## returns :-
# [
#     [0] "#this is a comment line"
# ]

# map
# ===

# 'map' evaluates a 'block' (or expression) for each element of list (locally setting $_ to each element) and 
# composes a list of the results of each such evaluation. Each element of the list may produce zero, one, or more elements in the generated list, 
# so the number of elements in the generated list may differ from that in original list. In scalar context 'map' returns the total 
# number of elements so generated. In list context, returns the generated list.

# 'square' the numbers in a list - returning a 'new' list
my @squares = map { $_ * $_ } ( 1,2,3,4,5 );
p @squares;

# only 'square' numbers that are greater than 3
my @new_squares = map { $_ > 3 ? ( $_ * $_ ) : () } ( 1 .. 10 );
p @new_squares;