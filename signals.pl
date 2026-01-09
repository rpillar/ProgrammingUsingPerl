# https://www.perl.com/article/37/2013/8/18/Catch-and-Handle-Signals-in-Perl/

# Signals are types of messages sent by an operating system to a process such as a Perl 
# program. Signals provide a method for communicating with a process, for example when 
# running a command line program pressing control-c will send the interrupt signal (‘SIGINT’) 
# to the program by default terminating it. Signals are often unexpected and if not handled 
# can leave your Perl program or data in an unfinished state.

# press 'ctrl-c' whilst the script 'sleeps'

#
# response is 'Caught a sigint Interrupted system call at signals.pl line 10.'
#

use strict;
use warnings;

$SIG{INT} = sub { die "Caught a sigint $!" };

sleep(10);
print("\nI have slept for 10 seconds\n");

# it is also possible to 'handle' certain signals

$SIG{INT}  = \&signal_handler;
$SIG{TERM} = \&signal_handler;

sleep(20);

sub signal_handler {
    die "Caught a signal in my subroutine .... $!\n";
}