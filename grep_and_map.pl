# some examples of uses of 'grep' and 'map' in perl scripts.

## docs :-
# - https://perldoc.perl.org/functions/grep
# - https://perldoc.perl.org/functions/map

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