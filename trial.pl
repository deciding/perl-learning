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

#=================array and dict===================
@arr=(1,2,3);
print "\$arr[0]=$arr[0]\n";

%dict=('a',1,'b',2,'c',3);
print "\$dict{'a'}=$dict{'a'}\n";

@copy=@arr;
$copy[0]=2;
print "$copy[0] vs $arr[0]\n";

$size=@arr;
print "size of \@arr: $size\n";
