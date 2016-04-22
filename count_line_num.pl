#!/usr/bin/perl
use warnings; use strict;
my ($out_file,$p) =  @ARGV;

my ($line,$nu) = (0,0);

open OUT, ">>$out_file" or die $!;
while (<STDIN>){
	chomp;
	if ($_ =~ /^[ATCGN]+$/){
		$line ++;
		$nu = $nu+length ($_);
	}
	print "$_\n" unless ($p);
}
print OUT "$line $nu\t";

