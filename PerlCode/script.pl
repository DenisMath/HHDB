open(FIL,$ARGV[0]) or die "Ne prochital";
open(FIL1,">$ARGV[1]");
$i = 0;
while($i < 50000)
{
my $line = <FIL> ;
print FIL1 $line ; 
    $i++ ;
}
close FIL1;
close FIL;
