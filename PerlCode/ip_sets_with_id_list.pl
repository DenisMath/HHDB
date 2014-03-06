open(FIL,$ARGV[0]) or die "Ne prochital $ARGV[0]";
open(FIL1,">$ARGV[1]") or  die "Ne prochital $ARGV[1]";
$size = $ARGV[2];
$size = 3;
$i = 0;
$line = "1";
@prev_lines = (1,2);
@file = ();
$t = 1;
@temp_array = ();
while( $line )
{
    $line = <FIL>;
   @lines = split ',', $line  ;

    if(scalar @lines > 2){
if( $lines[0] eq $prev_lines[0] )
{ # if($lines[2] ne )
{
      push @file, $line; 
    if( $lines[2] eq '' or in_array($lines[2]."\n", @temp_array) ){} else
    {
    
     #push @file, $lines[2]."\n";
    push @temp_array, $lines[2]."\n";}
    $t++;}
   }
else 
{ 
if( scalar @temp_array > $size   ){
  print FIL1 @file; 
 print FIL1 "$t \n";
          print FIL1 @temp_array; 
          print FIL1 scalar @temp_array;
          print FIL1 "\n\n";  }
       undef @file;
       undef @temp_array;
      #if($lines[2] ne '')
         {
         push @file, $line;
        #push @file, $lines[2]."\n";
        push @temp_array, $lines[2]."\n";
              }
       $i++;
       $t = 1; 
  }

 @prev_lines = @lines;
    }
}
close FIL1;
close FIL;

sub in_array($@) 
{ my $temp_bool = 0;
 my ($input_str, @input_array) = @_;
 foreach $temp_str (@input_array) { if($temp_str eq $input_str){$temp_bool = 1;}} ; 
       return $temp_bool; }

sub first_token{
    $_[0] =~ /.*?,/;
    return $&;
}
