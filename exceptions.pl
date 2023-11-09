## how to raise and handle exceptions in Perl ....

#!/usr/bin/env perl

use strict;
use warnings;

use Try::Tiny;

# The first line prints 0 plus 1 = 1\n as expected. The second line, 
# however, dies in a way that we can't recover from which prevents the 
# rest of our program from doing any further execution. So, we must handle our exceptions!

sub unhandled_exception {
    print "0 plus 1 = ", increment(0), "\n"; # 1
    print "zero plus 1 = ", increment('zero'), "\n"; # Exception
    print "1 plus 1 = ", increment(1), "\n"; # never executes
}

sub increment {
    my $int = shift;
    die "That's not an int!" unless defined $int && $int =~ /^[0-9]+\z/;
    return $int+1;
}

try {
    unhandled_exception();
}
catch {
    print $_;
    print "So I wasn't able to perform the third call to increment ...\n";
    print "=============\n"
};

# a solution to this is to wrap each 'process' in a try / catch (Try::Tiny) so that the
# exception can be 'handled' in an appropriate way and processing can continue (if required).

sub handled_exception {
    try {
        print "0 plus 1 = ", increment(0), "\n"; # no problem here
    }
    catch {
        ... # no exception
    };
    try {
        increment('zero'); # Exception
    }
    catch {
        print "I died : $_"
    };
    try {
        print "1 plus 1 = ", increment(1), "\n";
    }
    catch {
        ... # no exception
    }   
}

handled_exception();