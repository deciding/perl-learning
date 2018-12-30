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

print ('-'x3);
print "\n";

#=================datetime===================
@months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
@days = qw(Sun Mon Tue Wed Thu Fri Sat Sun);
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
print "$hour:$min:$sec $mday $months[$mon] $year $days[$wday] $yday $isdst\n";#$year should +1900, isdst means is Daylight Saving Time
$datestring = localtime();
print "Local date and time $datestring\n";
$datestring = gmtime();
print "GMT date and time $datestring\n";#gmt time don't have DST, it is standard
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
printf("Time Format - HH:MM:SS\n");
printf("%02d:%02d:%02d\n", $hour, $min, $sec);
$epoc = time();
print "Number of seconds since Jan 1, 1970 - $epoc\n";
$datestring = localtime($epoc);
print "recovered date time from epoch: $datestring\n";
use POSIX qw(strftime);
$datestring = strftime "%a %b %e %H:%M:%S %Y", localtime;
printf("date and time - $datestring\n");

#=================subroutine/function===================
#basic
sub Hello{#careful, no ()
    print "Hello world!\n";
}
Hello();
#pass scalar
sub Average {
   # get total number of arguments passed.
   $n = scalar(@_);#same as $n=@_
   $sum = 0;

   foreach $item (@_) {
      $sum += $item;
   }
   $average = $sum / $n;

   print "Average for the given numbers : $average\n";
}
Average(10, 20, 30);
#pass list -- put list as the last argument, since list is expanded and combined with all other arguments
sub PrintList {
   my $variable; # $variable is invisible outside somefunc()
   my ($another, @an_array, %a_hash); # declaring many variables at once
   my @list = @_; #my: new local, local: amend to old var, our: global and used in strict mode, use strict, use warning
   print "Given list is @list\n";
}
$a = 10;
@b = (1, 2, 3, 4);
PrintList($a, @b);
#pass hash
sub PrintHash {
   my (%hash) = @_;#params translated to arr of key/value pari

   foreach my $key ( keys %hash ) {
      my $value = $hash{$key};
      print "$key : $value\n";
   }
}
%hash = ('name' => 'Tom', 'age' => 19);
PrintHash(%hash);
#returning arr and hash are also expanded, thus we need references of them
#my vs local vs state
#state is private scope, but can save state accross function call
{		#following are comparision
   my $count = 0; # initial value
   sub PrintCount {
      print "Value of counter is $count\n";
      $count++;
   }
}
for (1..5) {
   PrintCount();
}
use feature 'state';#following are actual
sub PrintCount {
   state $count = 0; # initial value

   print "Value of counter is $count\n";
   $count++;
}
for (1..5) {
   PrintCount();
}
#context of the function: what is th expected return value

#=================references===================
#$scalarref = \$foo;
#$arrayref  = \@ARGV;
#$hashref   = \%ENV;
#$coderef   = \&handler;
#$globref   = \*foo;

#construct referece
$arrayref = [1, 2, ['a', 'b', 'c']];#mind the [] anonymous hash format
$hashref = {
   'Adam'  => 'Eve',
   'Clyde' => 'Bonnie',
};#mind the {} anonymous hash format
$coderef = sub { print "Boink!\n" };#mind the sub{} anonymous function, also mind the last sentence in bracket can without ;

#dereferencing
$var = 10;
$r = \$var;
print "Value of $var is : ", $$r, "\n";
@var = (1, 2, 3);
$r = \@var;
print "Value of @var is : ",  @$r, "\n";
%var = ('key1' => 10, 'key2' => 20);
$r = \%var;
print "Value of %var is : ", %$r, "\n";#note comma for print function, and the default printing routine for hash, is just like an array

#reference type
$var = 10;
$r = \$var;
print "Reference type in r : ", ref($r), "\n";
@var = (1, 2, 3);
$r = \@var;
print "Reference type in r : ", ref($r), "\n";
%var = ('key1' => 10, 'key2' => 20);
$r = \%var;
print "Reference type in r : ", ref($r), "\n";

#circular references
my $foo = 100;#following are comparision
$bar = \$foo;
print "Value of bar is : ", $bar, "\n";
print "Value of bar is : ", $$bar, "\n";
my $foo = 100;#following are actual
$foo = \$foo;
print "Value of foo is : ", $foo, "\n";
print "Value of foo is : ", $$foo, "\n";
print "Value of foo is : ", $$$foo, "\n";

#reference functions
sub PrintHash {
   my (%hash) = @_;
   foreach $item (%hash) {
      print "Item : $item\n";
   }
}
%hash = ('name' => 'Tom', 'age' => 19);

$cref = \&PrintHash;
&$cref(%hash);

#=================format===================
#@>>>> right-justified
#@|||| centered
#@####.## numeric field holder
#@* multiline field holder
format EMPLOYEE =
===================================
@<<<<<<<<<<<<<<<<<<<<<< @<< 
$name $age
@#####.##
$salary
===================================
.
format EMPLOYEE_TOP =
===================================
Name                    Age
===================================
.
#select(STDOUT);#associate output file handler
#$~ = EMPLOYEE;#associate format with the output file handler
#$^ = EMPLOYEE_TOP;#header format
@n = ("Ali", "Raza", "Jaffer");
@a  = (20,30, 40);
@s = (2000.00, 2500.00, 4000.000);
$i = 0;
foreach (@n) {
   $name = $_;#simplified foreach
   $age = $a[$i];
   $salary = $s[$i++];
#   write;
}

#pagination
format EMPLOYEE_TOP =
===================================
Name                    Age Page @<
                                 $%
=================================== 
.
$==60;#number of lines per page

#footer -- no auto methods as header, check $- each time, and print footer yourself
format EMPLOYEE_BOTTOM =
End of Page @<
            $%
.

#=================file===================
#special file handlers: STDIN, STDOUT, STDERR
open(DATA, "<file.txt") or die "Couldn't open file file.txt, $!"; # create our own file handler, < means readonly
while(<DATA>) {
   print "$_";
}
#rwa,r+ w+ a+
#< > >>, +< +> +>>
sysopen(DATA, "file.txt", O_RDWR|O_TRUNC );

#close
close FILEHANDLE;
#close; default is select() one, here is OUTPUT
close(DATA) || die "Couldn't close file properly";

#read from file
print "What is your name?\n";
$name = <STDIN>;
print "Hello $name\n";
open(DATA,"<file.txt") or die "Can't open data";
@lines = <DATA>;
close(DATA);

#read single char -- is EOF, return undef
#getc FILEHANDLE
#getc

#read bianry
#read FILEHANDLE, SCALAR, LENGTH, OFFSET # from SCALAR+OFFSET read LENGTH, return num of bytes read
#read FILEHANDLE, SCALAR, LENGTH 

#write
#print FILEHANDLE LIST
#print LIST
#print

#copy
#open(DATA1, "<file1.txt");
#open(DATA2, ">file2.txt");
#while(<DATA1>) {
#   print DATA2 $_;
#}
#close( DATA1 );
#close( DATA2 );

#rename
#rename ("/usr/test/file1.txt", "/usr/test/file2.txt" );

#del
#unlink ("/usr/test/file1.txt");

#tel and seek
#tell FILEHANDLE # return the current position
#tell
#seek FILEHANDLE, POSITION, WHENCE

#file info
#my $file = "/usr/test/file1.txt";
#my (@description, $size);
#if (-e $file) {
#   push @description, 'binary' if (-B _);
#   push @description, 'a socket' if (-S _);
#   push @description, 'a text file' if (-T _);
#   push @description, 'a block special file' if (-b _);
#   push @description, 'a character special file' if (-c _);
#   push @description, 'a directory' if (-d _);
#   push @description, 'executable' if (-x _);
#   push @description, (($size = -s _)) ? "$size bytes" : 'empty';
#   print "$file is ", join(', ',@description),"\n";
#}

#=================directory===================
#display
$dir = "/tmp/* /home/*";
@files = glob( $dir );
foreach (@files ) {
   print $_ . "\n";
}
opendir(DIR, '.') or die "Couldn't open directory, $!";
foreach (sort grep(/^.*\.c$/,readdir(DIR))) {
   print "$_\n";
}
closedir DIR;

#create dir
#$dir = "/tmp/perl";
#mkdir( $dir ) or die "Couldn't create $dir directory, $!";
#print "Directory created successfully\n";

#remove dir
#$dir = "/tmp/perl";
#rmdir( $dir ) or die "Couldn't remove $dir directory, $!";
#print "Directory removed successfully\n";

#change dir
#$dir = "/home";
#chdir( $dir ) or die "Couldn't go inside $dir directory, $!";
#print "Your new location is $dir\n";

#=================error handling===================
open(DATA, $file) || die "Error: Couldn't open the file $!";
die "Error: Can't change directory!: $!" unless(chdir("/etc"));
print(exists($hash{value}) ? 'There' : 'Missing',"\n");
chdir('/etc') or warn "Can't change directory";

