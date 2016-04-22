#!/usr/bin/perl
use strict; use warnings;
use FileHandle;
use Library;

my($infile1, $infile2) = @ARGV;
my $in1 = FileHandle->new($infile1);
my %hash = Library::behash($infile2);

my @array;
while(<$in1>){
	chomp;
	push @array, "$_";
}
for(my $i = 0; $i < @array; $i++){
	if(exists($hash{$array[$i]})){
		print "$array[$i]\n$hash{$array[$i]}\n";
	}
}
