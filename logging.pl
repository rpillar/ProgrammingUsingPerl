# logging in perl scripts / modules - using the Log::Log4perl module

use strict;
use warnings;
use 5.010;
 
use Log::Log4perl qw(:easy);

# set the 'minimum' log level - setting this to INFO will mean that all INFO / WARN / ERROR / FATEL messages
# will be output. In this example DEBUG and TRACE messages will not be displayed on SYSOUT.
Log::Log4perl->easy_init($INFO);
 
my $logger = Log::Log4perl->get_logger();
$logger->fatal( "This is", " fatal");
$logger->error( "This is error");
$logger->warn(  "This is warn");
$logger->info(  "This is info");
$logger->debug( "This is debug");
$logger->trace( "This is trace");