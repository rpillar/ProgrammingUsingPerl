use strict;
use warnings;

=head1

A queue is basically list of items - an item is added to the end of the 'queue' (list) and
items are processed from the 'start' of the queue (list) - FIFO (First In First Out).

In Perl a 'queue' data structure can be implemented using the 'push' and 'shift' functions.

=cut

my @people = ("Foo", "Bar");
while (@people) {
    my $next_person = shift @people;
    print "$next_person is at the front of the  queue\n"; # do something with this person
 
    print "Type in the names of more people : \n";
    while (my $new = <STDIN>) {
        chomp $new;
        if ($new eq "") {
            last;
        }
        print("$new has been added to the queue (add more or press ENTER).\n");
        push @people, $new;
    }
    print "\n";
}