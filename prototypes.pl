# Perl supports a very limited kind of compile-time argument checking using function prototyping. This can be declared :-

sub hello1 ($) { # expects a 'single' scalar arg
    my $name = shift;
    print("hello $name\n")
}
# calling hello1 without arguments will result in the following compile error :-
# - Not enough arguments for main::hello1 at prototypes.pl line 6, near "()"
hello1("Richard"); # all is good ...

# interestingly - in this case we can process a list of zero or more elements.
sub hello2 (@) {
    my @data = @_;
    foreach ( @data ) {
        print("hello - I was passed $_\n");
    }
}
hello2 1,2,3;

# for more info - https://perldoc.perl.org/perlsub#Prototypes