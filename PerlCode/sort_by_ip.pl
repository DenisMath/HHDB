
sort_by_ip($ARGV[0], $ARGV[1]);

sub sort_by_ip{
my ($input, $output_sort) = @_;
my $rest1 = "temp1";
my $rest2 = "temp2";
my $switch = 0;
first_line_ip_extracted($input, $output_sort, $rest1);
$rest = $rest1;
while(-s $rest != 0 )
{
if(($switch % 2) == 0)
  {
     first_line_ip_extracted($rest1, $output_sort, $rest2);
     $rest = $rest2;
  }
  else {
      first_line_ip_extracted($rest2, $output_sort, $rest1);
      $rest = $rest1;
  }
$switch++;
}
unlink ($rest1, $rest2);
}

sub first_line_ip_extracted {
    my ($input, $output_sort, $output_rest) = @_;
      truncate ($output_rest,0);
      open(INPUT,$input) or die "Ne prochital $input";
      open(OUT1,">>$output_sort") or  die "Ne prochital $output_sort";
      open(OUT2,">>$output_rest") or  die "Ne prochital $output_rest";  
    my $line = <INPUT>;
    print OUT1 $line;
    $ip_token = n_token($line,0);
    my $temp_line;
    while( $temp_line = <INPUT>)
       {
           if( n_token($temp_line,0) eq $ip_token )
           {print OUT1 $temp_line;}
           else
           {print OUT2 $temp_line;}
        }
      close INPUT;
      close OUT1;
      close OUT2;
    return 1;
}


sub n_token {
my @temp_array = split ',', $_[0]  ;
return $temp_array[$_[1]];
}
