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

#=================array===================
#both arr and dict use () and qw// to create
#but use [] and {} to access
#both use $ to access

#construct
@arr=(1,2,3);
@arr2=qw\1 2 3\;
@arr3=qw\1
2
3\;

print "\$arr[0]=$arr[0]\n";
print "\$arr[-1]=$arr[-1]\n"; #like python
print "\$arr2[0]=$arr2[0]\n";
print "\$arr3[0]=$arr3[0]\n";

#range
@arr4=(1..20);
print "@arr4\n";

#copy by value
@copy=@arr;
$copy[0]=2;
print "$copy[0] vs $arr[0]\n";

#size and max index
$size=@arr;
$maxindex=$#arr; # careful! use $, since we are getting scalar
print "size of \@arr: $size\n";
print "maxindex of \@arr: $maxindex\n";

#push pop shift unshift
push(@arr, 5);
unshift(@arr,0);
print "@arr\n";
pop(@arr);
shift(@arr);
print "@arr\n";

#slicing
print "@arr4[2,3,4]\n"; #careful! use @ instead of $, since we are getting arr
print "@arr4[2..4]\n";

#splice -- changing the arr
splice(@arr4, 10); # replace from 11 to null
print "@arr4\n";
splice(@arr4, 5, 2); # replace from 6-7 to null
print "@arr4\n";
splice(@arr4, 1, 2, 10..11); # replace from 2-3 to (10,11)
print "@arr4\n";

#=================dict===================
%dict=('a',1,'b',2,'c',3);
print "\$dict{'a'}=$dict{'a'}\n";

#copy by value
@copy=@arr;
$copy[0]=2;
print "$copy[0] vs $arr[0]\n";

$size=@arr;
print "size of \@arr: $size\n";

#=================string===================
$str='a' . 15;
print"$str is a concat string \n";

$multilineStr='aaa
aaa'."\n";
$multilineStr2=<<"EOF";
aaa
aaa
EOF

print "$multilineStr";
print "$multilineStr2";
