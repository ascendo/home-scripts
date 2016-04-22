package Library;
use strict;
use warnings;

sub behash {
    my($file) = @_;
    open(my $in, "$file");
    my (@array, %hash);
    while(<$in>){
		chomp;
        push @array,"$_";
    }
    for(my $i = 0; $i < (@array - 1); $i += 2){
        $hash{$array[$i]} = $array[$i + 1];
    }
    return %hash;
}
sub one_line {
    my($infile, $outfile) = @_;
    open(my $in, "$infile");
    open(my $out, ">$outfile");
	my $num = 0;
    while(<$in>){
		chomp;
		if($_ =~ /^>/){
			if($num == 0){
				print $out "$_\n";
			}else{
				print $out "\n$_\n";
			}
		}else{
			$_ =~ /(.+)/;
			print $out "$1";
        }
		$num++;
    }
}







1;

