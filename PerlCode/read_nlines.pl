$i = 0;
open(FIL,$ARGV[0]) or die "Ne prochital $ARGV[0]";
open(FIL1,">$ARGV[1]") or die "Ne prochital $ARGV[1]";;
while($i < $ARGV[2])
{
my $line = <FIL> ;
print FIL1 $line ; 
    $i++ ;
}
close FIL1;
close FIL;
