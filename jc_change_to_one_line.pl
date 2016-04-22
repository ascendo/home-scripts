#!/usr/bin/perl
use warnings; use strict;



my $unit = 2;

my @lines;
my $index=0;
foreach (@ARGV){
	open IN, $_ or die $!;
	chomp (my @all =  <IN>);
	for (my $i = 0; $i < @all-1; $i += $unit){
		$lines[$index] .= $all[$i]."\t";
		$lines[$index+1] .= $all[$i+1]."\t";
	}
	$index += $unit;
}


foreach (@lines){
	print "$_\n";
}
	

	
