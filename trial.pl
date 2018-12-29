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
@arr22=qw(1 2 3);
@arr3=qw\1
2
3\;

print "\$arr[0]=$arr[0]\n";
print "\$arr[-1]=$arr[-1]\n"; #like python
print "\$arr2[0]=$arr2[0]\n";
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

#str<=>arr, split join
$str='a b c';
@splitarr=split(' ', $str); # careful about the position of the delimiter
print "$splitarr[1]\n";
@splitarr=split(' ', $str, 2); # careful about the position of the delimiter
print "$splitarr[1]\n";
$joinedstr=join(' ', @splitarr); # careful about the position of the delimiter
print "$joinedstr\n";

#sort
@arr=qw('b' 'a' 'c' 'D');
@arr2=sort(@arr);
print "@arr2\n";
@arr2=sort { lc($a) cmp lc($b) } @arr ; # to lower case, careful $a instead of just a
print "@arr2\n";

#concat arr
@arr3=(@arr,@arr2);
print "@arr3\n";


#=================dict/map/hash===================
#construction
%dict=('a',1,'b',2,'c',3);
%dict2=('a b'=>1, 'c' =>2, 'd'=>3);
%dict3=(-ab=>1, -c =>2, -d=>3); # single word without space
print "\$dict{'a'}=$dict{'a'}\n";
print "\$dict2{'a b'}=$dict2{'a b'}\n";
print "\$dict3{-ab}=$dict3{-ab}\n";

#slice
print "\@dict{'a', 'b'}=@dict{'a', 'b'}\n"; # use @ instead of $ or %

#keys, values
@keys=keys %dict;
@values=values %dict;
print "keys: @keys\n";
print "values: @values\n";

#existence
$tf=exists($dict{'d'});
print "whether d exist in dict: $tf\n";

#size
$size=keys %dict;
print "size of dict: $size\n";

#remove
delete $dict{'a'};
print "new dict : %dict\n"; # we didn't prepared how to print %, but prepared for $ and @
print "new \$dict{'a'} : $dict{'a'}\n";

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

#=================condition===================
$a=100;
if($a==10){
    print "\$a=10: $a\n";
}
elsif($a==50){
    print "\$a=50: $a\n";
}
else{
    print "\$a=100: $a\n";
}

$b=100;
unless($a==100){
    print "as expected, we didn't get 100: $a\n";
}
elsif($b==100){
    print "we got a == 100 unexpectedly, in this case we expect b=100 also: $a, $b\n";
}
else {
    print "very strange situation: a==100 but b!=100\n";
} 

use Switch;
$var=10;
@arr=(1,2,10);
%hash=('a'=>5,10=>'a');
switch($var){
    case 11		{print "\$var is 11\n";}#careful the ;
    case [1..6,9]	{print "\$var is in list\n";}#careful the [] expression in case, instead of ()
    case (\@arr)	{print "\$var is in \@arr\n"; next;}#(\) syntax, and next , since break is the default behaviour
    case (\%hash)	{print "\$var is in \%hash\n";}
    else		{print "\$var is not the above cases\n";}#use else instead of default
}

$tri= 1==2? 'a':'b';
print "$tri\n";


#=================loop===================
#while loop
$a = 10;
while( $a < 20 ) {
   printf "Value of a: $a\n";
   $a = $a + 1;
}
$a = 10;
do{
   printf "Value of a: $a\n";
   $a = $a + 1;
}while( $a < 20 );

#until loop
$a = 5;
until( $a > 10 ) {
   printf "Value of a: $a\n";
   $a = $a + 1;
}

#for loop
for( $a = 10; $a < 20; $a = $a + 1 ) {
   print "value of a: $a\n";
}

#foreach list
@list = (2, 20, 30, 40, 50);
foreach $a (@list) {
   print "value of a: $a\n";
}

#next statement: continue
$a = 0;
OUTER: while( $a < 4 ) {
   $b = 0;
   print "value of a: $a\n";
   INNER:while ( $b < 4) {
      if( $a == 2) {
         $a = $a + 1;
         # jump to outer loop
         next OUTER;
      }
      $b = $b + 1;
      print "Value of b : $b\n";
   }
   print "\n";
   $a = $a + 1;
}

#last statement: break
$a = 0;
OUTER: while( $a < 4 ) {
   $b = 0;
   print "value of a: $a\n";
   INNER:while ( $b < 4) {
      if( $a == 2) {
         # terminate outer loop
         last OUTER;
      }
      $b = $b + 1;
      print "Value of b : $b\n";
   }
   print "\n";
   $a = $a + 1;
}

#continue block: executed just befor condition evaluation, can only be used in foreach and while
$a = 0;
while($a < 3) {
   print "Value of a = $a\n";
} continue {
   $a = $a + 1;
}
@list = (1, 2, 3, 4, 5);
foreach $a (@list) {
   print "Value of a = $a\n";
} continue {
   last if $a == 4; # last if statement
}

#redo statement: restart the loop without condition evaluation
$a = 0;
while($a < 10) {
   if( $a == 5 ) {
      $a = $a + 1;
      redo;
   }
   print "Value of a = $a\n";
} continue {
   $a = $a + 1;
}

#goto statement
$a = 10;
$str1 = "LO";
$str2 = "OP";
LOOP:do {
   if( $a == 15) {
      # skip the iteration.
      $a = $a + 1;
      # use goto EXPR form
      goto $str1.$str2;
   }
   print "Value of a = $a\n";
   $a = $a + 1;
} while( $a < 20 );


#=================ops===================
$a=10;
$b=10;
$tmp=$a<=>$b;
print "\$a<=>\$b: $tmp\n";
#numerical compare are C style, e.g. <=
#string use lt, gt, le, ge, eq, ne, cmp(compared to <=>)
#numerical assignment and bitwise ops are C style
#logical ops have both python like and C style, but no C style !

$str1=q{abcd}; #same as 'abcd'
$str2=qq{abcd}; #same as "abcd"
$str3=qx{abcd}; #same as `abcd`	
print $str1." ". $str2." ".$str3."\n";

print ('-'x3)."\n";
