# Regular expressions are one of perl's super-powers. But they can be (at times) difficult to understand.
# Here are a 'few' examples ...

use Modern::Perl;

use feature 'say';

my $string = "I have never liked mushrooms";
if ( $string =~ /mushrooms/ ) { # this condition will return 'true' because the 'string' does match the expression
    say "This string contains the word mushrooms";
}

# in this example ^^ /mushrooms/ is the 'pattern' and '=~' tells Perl to try the match the 'pattern'
# against the string.

# you can also use '!~' in a conditional to check for 'no' matches.
# it should be noted that not 'all' characters can be used as-is in a regex. Some characters, called
# 'metacharacters' are reserved for use in regex notation. The metacharacters are :-
# {}[]()^$.|*+?-#\
# If a 'metacharacter' is in your 'pattern' then it will need to be 'escaped' (preceded by a '\').
# For example :-
if ( "2+2=4" =~ /2\+2/ ) {
    say "we match 2+2=4"
}

# Sometimes, however, we'd like to specify where in the string the regexp should try to match. To do this, we would use the 
# anchor metacharacters '^' and '$'. The anchor '^' means match at the beginning of the string and the anchor '$' means match 
# at the end of the string, or before a newline at the end of the string.
if ( "testing is fun" =~ /is fun$/ ) {
    say "matching based on an anchor does work."
} 
if ( "C++ sucks" !~ /^D\+\+/ ) {
    say "C++ does not match D++ at the start of a string."
}

# Using character classes
# =======================
# A character class allows a set of possible characters rather than a single character to match at a particular point in a regex.
# And you can define your own 'custom' character classes.
# Character classes are denoted by - [.....] - with the set of characters to be possibly matched inside

if ( 'abc' =~ /[cdef]/ ) { # matches because 'c' is in our character class ...
    say "I have a 'character class' match ....";
}

# a range of numbers / characters can be expressed using a '-' :-
if ( 9 =~ /[0-9]/ ) {
    say "I have another 'character class' match ....";
}
if ( "Richard" =~ /[a-zA-Z]/ ) {
    say "I have yet another 'character class' match ....";
}

# the '^' character in the first position in a character class denotes a 'negated' character class
if ( "Richard" =~ /[^0-9]/) {
    say "This string does not contain any numerics ....";
}

# Perl has several abbreviations for common character classes :- 
# \d matches a digit, not just [0-9] but also digits from non-roman scripts
# \s matches a whitespace character, the set [\ \t\r\n\f] and others
# \w matches a word character (alphanumeric or '_'), not just [0-9a-zA-Z_] but also digits and characters from non-roman scripts
# \D is a negated \d; it represents any other character than a digit, or [^\d]
# \S is a negated \s; it represents any non-whitespace character [^\s]
# \W is a negated \w; it represents any non-word character [^\w]
# The period '.' matches any character but "\n" (unless the modifier /s is in effect, as explained below).
# \N, like the period, matches any character but "\n", but it does so regardless of whether the modifier /s is in effect.
if ( 1234 =~ /[\d]/) { # the '\d' does not have to be used inside a set of brackets
    say "I have a number here ....";
}
if ( "Richard" =~ /\D/ ) {
    say "This string does not contain any numerics ....";
}

# Anchors
# =======
# Another anchor (just like '^' and '$') useful in basic regexps is the word anchor \b. This matches a boundary between a 
# word character and a non-word character \w\W or \W\w
if ( "My name is James" =~ /James\b/ ) {
    say 'I matched to the end of the string (word boundary)';
}
if ( "My name is James" =~ /\bname\b/ ) {
    say 'I matched to the middle of the string (word boundary)';
}

# Matching this or that
#======================

# Grouping things
# ===============

# We can use the 'grouping' metacharaters - '(' and ')' - grouping allows part of the regex
# to be treated as a single unit.

if ( 'cab' =~ /(a|b)b/ ) {
    say "cab matches ...."
}    # matches 'cab' or 'xbb'

# Extracting matches
# ==================

my $time = "10:11:12";
if ($time =~ /(\d\d):(\d\d):(\d\d)/) {    # match hh:mm:ss format
	my $hours = $1;
	my $minutes = $2;
	my $seconds = $3;

    say 'the time is - hour : ' . $hours . ' / minutes : ' . $minutes . ' / seconds : ' . $seconds;
}

# A more complicated match (there could be many examples) is the following - get the last 8 bytes of a string
# provided it only contains 'a-z' (no uppercase chars).
my $str = "this is a long log message that has a filename at the end - testfile"; 
my ( $filename ) = ( $str =~ m!([a-z]{8}$)! ); 
say "My filename is : $filename ";

# Named backreferences
# ====================

# in this example the 'description' has a 18 character 'reference' with a 'word' boundary at the start / end - this
# is 'captured' in a named reference called 'reference' (in this case - could be anything). This named reference
# can then be accessed using '$+{reference}' - in other words '$+{<name of reference>}'
my $desc = "TESTMEAGAIN E KW9SA0ARVR7XXXCV12 ABC"; 
if ( $desc =~ /\b(?<reference>[A-Z0-9]{18})\b/x ) { 
    print( "I have a match : $+{reference}\n"); 
}
