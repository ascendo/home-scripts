#!/usr/bin/perl
use warnings; use strict;

my($raw_file ) = @ARGV;
open RAW, $raw_file or die $!;


my ($raw_r,$raw_b);
while (<RAW>){
	chomp;
	my $sta = $_;
	my $out;
	my $file = $1 if ($sta =~ /^(\S+)\t/);	
	$out = $file;
	#print "$sta for pattern\n";
	while($sta =~ /(Raw|Trim|Adaptor):([^A-Za-z]+)/ig){
		my $type = $1;
		my $num = $2;
		#	print "$sta\t$type\t$num\n";
		if ($type =~ /raw/i){	
			(my $o,$raw_r,$raw_b) = raw($num);
			$out .= "\t$o";
		}elsif($type =~ /trim/i){
			my $o = trim($num);
			$out .= "\t$o";
		}elsif($type =~ /adaptor/i){
			my $o = adap($num);
			$out .= "\t$o";
		}
	}
	print "$out\n";
}	
		
###### raw data ########
sub raw{
	my $raw = shift @_;
	my @raws = split /\s/,$raw;
	my ($raw_r,$raw_b,$r_r,$r_b);
	for (my $i=0;$i < @raws;$i+=2){
		$raw_r += $raws[$i];
		$raw_b += $raws[$i+1];
	}
	$r_r = sprintf ("%.2f",$raw_r/1000000);	
	$r_b = sprintf ("%.2f",$raw_b/1000000000);
	return ("$r_r \t$r_b ",$raw_r,$raw_b);
}
		
##########  after trim ########
sub trim{
	my $trim = shift @_;
	my (@trims) = split /\s/,$trim;		
	my($t_r_p,$t_b_p,$t_r,$t_b);
	for(my $i=0;$i < @trims;$i+=2){
		$t_r += $trims[$i];
		$t_b += $trims[$i+1];
		$t_r_p += ($trims[$i]/$raw_r);
		$t_b_p += ($trims[$i+1]/$raw_b);
	}
	$t_r_p = sprintf ("%.3f",$t_r_p) * 100 ;
	$t_b_p = sprintf ("%.3f",$t_b_p) * 100 ;
	$t_r   = sprintf ("%.2f",$t_r/1000000);
	$t_b   = sprintf ("%.2f",$t_b/1000000000);
	return ("$t_r\t$t_r_p\t$t_b\t$t_b_p");
}
	
####### after Adapter #######
sub adap {
	my $adapt = shift @_;
	my (@ads) = split /\s/,$adapt;
	
	my($a_r_p,$a_b_p,$a_r,$a_b);
	for (my $i=0;$i < @ads;$i+=2){
		$a_r += $ads[$i];
		$a_b += $ads[$i+1];
		$a_r_p += ($ads[$i]/$raw_r);
		$a_b_p += ($ads[$i+1]/$raw_b);
	}
	$a_r_p = sprintf ("%.3f",$a_r_p) * 100 ;
	$a_b_p = sprintf ("%.3f",$a_b_p) * 100 ;
	$a_r = sprintf ("%.2f",$a_r/1000000);
	$a_b   = sprintf ("%.2f",$a_b/1000000000);
	return("$a_r\t$a_r_p\t$a_b\t$a_b_p");
}


	
