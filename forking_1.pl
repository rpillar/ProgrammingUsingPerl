# Perl can spawn multiple processes with the fork function and this can be of benefit (in the right circumstances)
# when attempting to manage certain workloads.

# DEBUG note - if there is an issue when trying to build / run concurrent scripts then consider using 
# 'strace -e process,signal /path/to/your/program' as this will allow you to see when the child processes
# are exiting and what signals are being sent.

# A simple example :-
# ================

#!/usr/bin/perl

use Data::Printer;
use feature 'say';

# create a 'child' process using 'fork' - two processes will now be executing. The 'pid' returned from 'fork' 
# to the 'parent' process is that of the 'child' process and '0' to the newly created 'child' process. 
my $pid = fork;
# what if the 'fork' fails (out of memory - for example)...
die "failed to fork: $!" unless defined $pid;

# this 'if' clause will only be true for the 'child' process ...
if ($pid == 0) {
    say 'I am about to sleep ....';
    sleep 1;
    say '.... waking up';
    exit;
}
else {
    say 'I am the parent ....';
}
# waitpid will not 'return' until the 'child' process exits
waitpid $pid, 0;

# another example - with more 'child' processes
# =============================================
my $max_workers = 4;

my @sleepTime = (1..5);

for (1..$max_workers) {
    my $pid = fork;
    die "failed to fork: $!" unless defined $pid;
    next if $pid; # if i'm the 'parent' - next fork ...

    # child process only (pid = 0)
    my $sleep_time = $sleepTime[ rand @sleepTime ];
    say '(2) about to sleep for : ', $sleep_time;
    sleep ( $sleepTime[ rand @sleepTime ] );
    say '(2) .... waking up : ', $sleep_time;

    exit;
}

# waitpid when given an argument of '-1' will block until 'any' child process exits 
my $child_exiting_pid;
do {
  $child_exiting_pid = waitpid -1, 0;
} while ($child_exiting_pid > 0);

# Note that neither of these examples are particularly robust - it would be better to make use of 
# a module like  Parallel::ForkManager -> see forking_2.pl