open(FIL,$ARGV[0]) or die "Ne prochital $ARGV[0]";
open(FIL1,">$ARGV[1]") or die "Ne prochital $ARGV[1]";
@file = ();
#$count++ while <FIL>;
while($line = <FIL>)
{
    $i++;
    push @file, $line;
    #print $i."\n";
 }
print FIL1 sort @file;
print scalar @file ;
$count = 0;
close FIL;
close FIL1;
open(FILE, "<$ARGV[1]") or die "can't open $file: $!";
$count++ while <FILE>;
print "\n".$count;
#print $count;
