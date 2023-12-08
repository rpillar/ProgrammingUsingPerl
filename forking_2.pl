# for notes on this example see - https://perlmaven.com/speed-up-calculation-by-running-in-parallel

# time perl forking_2.pl
# Non-forking
# $VAR1 = {
#           '20000000' => '20100030.3295869',
#           '8000000' => '8040002.9586146',
#           '6000000' => '6030012.55695653',
#           '16000000' => '16080013.2082134',
#           '2000000' => '2009993.78455316',
#           '10000000' => '10050002.56867',
#           '18000000' => '18090003.5770109',
#           '12000000' => '12060002.7337117',
#           '14000000' => '14070010.6298301',
#           '4000000' => '4020001.25927364'
#         };
# perl forking_2.pl  7.45s user 0.02s system 99% cpu 7.474 total
#
# time perl forking_2.pl 4
# Forking up to 4 at a time
# $VAR1 = {
#           '2000000' => '2010003.6351865',
#           '8000000' => '8040006.93429846',
#           '4000000' => '4020006.04636722',
#           '10000000' => '10050010.1485563',
#           '16000000' => '16080017.7931148',
#           '14000000' => '14070015.8289347',
#           '18000000' => '18090008.4287194',
#           '6000000' => '6030000.03174732',
#           '20000000' => '20100009.5000491',
#           '12000000' => '12060010.9474169'
#         };
# perl forking_2.pl 4  8.07s user 0.06s system 197% cpu 4.112 total

use strict;
use warnings;
use Parallel::ForkManager;
use Data::Dumper qw(Dumper);
 
 
my $forks = shift;
 
my @numbers = map { $_ * 2000000 } reverse 1 .. 10;
my %results;
 
if ($forks) {
    print "Forking up to $forks at a time\n";
    my $pm = Parallel::ForkManager->new($forks);
    $pm->run_on_finish( sub {
        my ($pid, $exit_code, $ident, $exit_signal, $core_dump, $data_structure_reference) = @_;

        my $q = $data_structure_reference->{input};
        $results{$q} = $data_structure_reference->{result};
    });
 
    DATA_LOOP:
    foreach my $q (@numbers) {
        my $pid = $pm->start and next DATA_LOOP;
        my $res = calc($q);
        $pm->finish(0, { result => $res, input => $q });
    }
    $pm->wait_all_children;
} else {
    print "Non-forking\n";
    foreach my $q (@numbers) {
        $results{$q} = calc($q);
    }
}
 
print Dumper \%results;
 
sub calc {
    my ($n) = @_;
    my $sum = 0;
    for (1 .. $n) {
        $sum += 1 + rand()/100;
    }
    return $sum;
}