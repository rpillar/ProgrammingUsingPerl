use lib './Moose_Classes';
use Person;

my $person = Person->new(
    first_name => "Richard",
    last_name  => "Pillar"
);

print("My name is $person->{first_name} $person->{last_name}\n");