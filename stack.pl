#!/usr/bin/perl
use strict;
use warnings;

# a Perl Maven 'stack' example - uses 'push' and 'pop' to add / remove elements from the 'top' (end) of an array (the stack)

my @stack;
while (1) {
 
    print '$ ';
    my $in = <STDIN>;
    chomp $in;
 
    if ($in eq 'q') { last; }
 
    if ($in eq 'c') { 
            pop @stack; 
            next;
            }   # fetch the last value
    if ($in eq '*') { 
            my $x = pop(@stack);
            my $y = pop(@stack);
            push(@stack, $x*$y);
            next;
            }
    if ($in eq '+') { 
            my $x = pop(@stack);
            my $y = pop(@stack);
            push(@stack, $x + $y);
            next;
            }
    if ($in eq '/') {
            my $x = pop(@stack);
            my $y = pop(@stack);
            push(@stack, $y /  $x); 
            next;
            }
    if ($in eq '-') { 
            my $x = pop(@stack);
            my $y = pop(@stack);
            push(@stack, $y - $x);
            next;
            }
    if ($in eq '=') { 
            print pop(@stack), "\n"; 
            next;
            }
    push @stack, $in;
}

# running 'perl stack.pl' - taking data from STDIN 
# $ 2
# $ 3
# $ +
# $ =
# 5
# $ 