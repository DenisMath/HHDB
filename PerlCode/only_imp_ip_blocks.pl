open(FIL,$ARGV[0]) or die "Ne prochital $ARGV[0]";
open(FIL1,">$ARGV[1]") or  die "Ne prochital $ARGV[1]";
$i = 0;
$line = "1";
@prev_lines = (1,2);
@file = ();
@temp_array = ();
$t = 1;
while( $line )
{
    $line = <FIL>;
    @lines = split ',', $line  ;

if( $lines[0] eq $prev_lines[0] )
{ if($lines[3] ne ''){
  push @file, $line;
     if( $lines[2] eq '' or in_array($lines[2]."\n", @temp_array) )
       {} 
     else
      {
       push @temp_array, $lines[2]."\n";
      }
     $t++;}
   }
else 
{ 
       if($t > 4 ){
       	    print FIL1 "# set_id,$i\n";
	    print FIL1 "# number of line,$t";
            print FIL1 sort @file, "\n"; 
            print FIL1 "# number of id,";
            print FIL1 scalar @temp_array; 
            print FIL1 @temp_array, "\n";
            print FIL1 "#\n#\n";
	   }
       undef @file;
      #if($lines[3] ne '')
      {
       push @file, $line;
      }
       $i++;
       $t = 1; 
  }

 @prev_lines = @lines;

}
close FIL1;
close FIL;

sub first_token{
    $_[0] =~ /.*?,/;
    return $&;
}

sub n_token {
my @temp_array = split ',', $_[0]  ;
return $temp_array[$_[1]];
}

sub in_array($@) 
{ my $temp_bool = 0;
 my ($input_str, @input_array) = @_;
 foreach $temp_str (@input_array) { if($temp_str eq $input_str){$temp_bool = 1;}} ; 
       return $temp_bool; }



