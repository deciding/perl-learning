#!/usr/bin/perl

#=================syntax===================
#Semicolon matter, compiled
;

# Print python2 + C
print "Hello world\n";

#Comment and Multiline comment
=begin comment
zzz
zzz
=cut

#Variable
$a=10;

#String Quote
print "interpreted a in double quote: $a\n";
print 'not interpreted a and \n in single quote: $a';
print "\n";

$str= <<"EOF";
Multiline like ''' in python, also here document in bash
the position of ; is very strange
can use variable like $a
finish when encounter EOF in the first position in a new line
EOF

print "$str";

#=================data type===================
#$var @arr %map
