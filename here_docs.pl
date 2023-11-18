# a short script to illustrate the use of 'here' docs.

# when we print the HERE doc the psaces to the left of each line are 'retained' - is that what you want ?
my $string = <<'HERE';
    Pushed to the left
    All the way to the left
    Starts with some space
HERE

print("my string is $string\n");

# with Perl v5.26 when you use the '<<~' syntax the spaces to the left of each line are removed and
# also you can indent the terminating 'HERE'.s
$string = <<~'HERE';
    Pushed to the left
    All the way to the left
    Starts with some space
    HERE

print("my string is $string\n");