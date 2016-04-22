#!/usr/bin/perl
use warnings; use strict;
use Getopt::Std;
my %opt;
getopts("p:t:r:o:i:d:s:h",\%opt);

die "USAGE
	$0
	
	-p : REQUIRED   your sample name									####(required)#########################
	-i : REQUIRED   full path index file	(Index file for bwa)
	-r : REQUIRED   relative path to reads according to PWD(can be globbled pattern, '#' instead of '*' required)#########################
	
	
	-d : full path of you main working directory: contain your input 
		 file	<default: current working directory >
	
	-t : num of threads		(default 32)
	-o : out_put_path;		(if not assign, equal to -d)
	-s : if generate and sort the bam file?		<T|F>  default:T  \n"               if ($opt{h});

my ($index,$pre)= ($opt{i},$opt{p});
my $wd = ($opt{d}?$opt{d}:$ENV{'PWD'});
my $out = ($opt{o}?$opt{o}:$wd);
my $cpu =($opt{t}?$opt{t}:32);
my $sor = ($opt{s}?$opt{s}:"T");

(my $rds = $opt{r}) =~ s/#/*/g;
print STDERR "reads_file: $ENV{PWD}/$rds\n";
my @files = glob ("$ENV{PWD}/$rds");

my $cmd = "bwa mem $index  @files -t $cpu ";
print "CMD: $cmd\n";
if ($sor eq "T"){
	$cmd .= "| tee $out/$pre.bwa.sam | samtools view -bSF4 - | samtools sort -@ 10 - $out/$pre.sort";
}else{
	$cmd .= " > $out/$pre.bwa.sam";
}

print "$cmd \n";
system(" $cmd ") == 0 or die "bwa error!\n";

if ($sor eq "T"){
	print "estimating the coverage depth........\n";
	system  ( "samtools mpileup $out/$pre.sort.bam | bam_coverage.pl &>$out/$pre.cov") == 0 or die "estimate coverage error\n";
}

