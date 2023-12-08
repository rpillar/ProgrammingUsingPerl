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

# Matcching this or that
#=======================
