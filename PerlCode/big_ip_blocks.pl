open(FIL,$ARGV[0]) or die "Ne prochital $ARGV[0]";
open(FIL1,">$ARGV[1]") or  die "Ne prochital $ARGV[1]";
$i = 0;
$line = "1";
@prev_lines = (1,2);
$t = 1;
while( $line )
{
    $line = <FIL>;
   @lines = split ',', $line  ;

if( $lines[0] eq $prev_lines[0] )
{print FIL1 $line ; $t++;
   }
else 
{print FIL1 "$t, $i\n\n".$line ; $i++; $t = 1; }

 @prev_lines = @lines;

}
close FIL1;
close FIL;

sub first_token{
    $_[0] =~ /.*?,/;
    return $&;
}


