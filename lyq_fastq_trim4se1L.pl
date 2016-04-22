#!/usr/bin/perl
use warnings; use strict;
my($samplesheet,$phred,$wd) = @ARGV;
die "$0 <sample>  <phred> <working dir> \n" if(@ARGV != 3);

####read adapter###=
my %adaptors;
while (<DATA>){
	chomp;
	my ($id,$ideq) = split ;
	$adaptors{$id} = $ideq;
}
my $uni   = $adaptors{Uni};
$uni =~ tr/ATCGatcg/TAGCtagc/;
$uni = reverse $uni;

my%s;
open (FH,$samplesheet) or die $!;
<FH>;
while(<FH>){
my @a= split(",",$_);
$s{$a[2]} =$a[4];
}

my $index = $adaptors{Index};
$index = "A".$index;

print "Adaptor:\n$uni\n$index\n";

foreach my $id( keys%s){

      ######## making your main result directory!!! ########
      print "\n############into dir: Sample_$id\n";
	  #mkdir "Sample_$id";

########unzipping the original gz files########
print "\n############unzipping fastq files  ...";
#my $fq_1 = $idample_name."_R1";
#my $fq_2 = $idample_name."_R2";
#system ("mv $reads2  $idample_name/$fq_2") == 0  or die $!;
#system ("mv $reads1  $idample_name/$fq_1") == 0  or die $!;

####### change to your working dir############

chdir "$wd/Sample_$id" or die $!;

if(system ("gunzip *.gz") == 0){  
#######    dynamic triming   ###################
my $dyn_dir = "Trimmed";

	system ("perl ~/pro/countsum.pl $id\_$s{$id}\_L002_R1_001.fastq >> ../out$id.txt") ==0 or die $!;
	system ("perl ~/pro/countsum.pl $id\_$s{$id}\_L001_R1_001.fastq >> ../out$id.txt") ==0 or die $!;
mkdir $dyn_dir;
print "\n############dynamic triming  Sample_$id\n";
#system ("/psc/program/install/SolexaQA_v.2.2/DynamicTrim.pl *.fastq -h $phred -d $dyn_dir") == 0 or die $!;
system ("/psc/program/install/SolexaQA_v.2.2/DynamicTrim.pl ./$id\_$s{$id}\_L002_R1_001.fastq -h $phred -d $dyn_dir") == 0 or die $!;
system ("/psc/program/install/SolexaQA_v.2.2/DynamicTrim.pl ./$id\_$s{$id}\_L001_R1_001.fastq -h $phred -d $dyn_dir") == 0 or die $!;
#system ("/psc/program/install/SolexaQA_v.2.2/DynamicTrim.pl ../$id\_$s{$id}\_L002_R2_001.fastq -h $phred -d $dyn_dir") == 0 or die $!;

print "\n#############length sorting  1 \n";

#############length sorting  ##########
#system ("/psc/program/install/SolexaQA_v.2.2/LengthSort $dyn_dir/*.fastq.trimmed  -l 25 -d $dyn_dir") == 0 or die $! ;
system ("/psc/program/install/SolexaQA_v.2.2/LengthSort.pl $dyn_dir/$id\_$s{$id}\_L001_R1_001.fastq.trimmed -l 25 -d $dyn_dir") == 0 or die $! ;
system ("/psc/program/install/SolexaQA_v.2.2/LengthSort.pl $dyn_dir/$id\_$s{$id}\_L002_R1_001.fastq.trimmed -l 25 -d $dyn_dir") == 0 or die $! ;

system ("'rm'  $dyn_dir/*.trimmed  ") == 0 or die $! ;

chdir $dyn_dir;

##########count the reads #############
system ("perl ~/pro/countsum.pl $id\_$s{$id}\_L002_R1_001.fastq.trimmed.single  >> ../../out$id.txt") ==0 or die $!;
system ("perl ~/pro/countsum.pl $id\_$s{$id}\_L001_R1_001.fastq.trimmed.single  >> ../../out$id.txt") ==0 or die $!;
#system ("perl ~/pro/countsum.pl $id\_$s{$id}\_L001_R2_001.fastq.trimmed.paired2  >> out$id.txt") ==0 or die $!;
#system ("perl ~/pro/countsum.pl $id\_$s{$id}\_L002_R1_001.fastq.trimmed.paired1  >> out$id.txt") ==0 or die $!;
#system ("perl ~/pro/countsum.pl $id\_$s{$id}\_L002_R2_001.fastq.trimmed.paired2  >> out$id.txt") ==0 or die $!;
#######    cut adaptor   !!!########
#my $cut_dir = "Cutadt_dir_step_2";
#mkdir $cut_dir;

print "\n#############cuting adapter \n";
system("pwd");

#system ("cutadapt -a $uni  -f fastq  $id\_$s{$id}\_L001_R2_001.fastq.trimmed.paired2 -o $id\_$s{$id}\_L001_R2_001.fastq.trimmed.paired2.cut > $id\_$s{$id}\_L001_R2_001.fastq.sta") == 0 or die $!;
#system ("cutadapt -a $index  -f fastq  *.fastq.trimmed.single -o $id\_$s{$id}.fastq.trimmed.single.cut > $id\_$s{$id}.fastq.sta") == 0 or die $!;
system ("cutadapt -a $index  -f fastq  $id\_$s{$id}\_L001_R1_001.fastq.trimmed.single -o $id\_$s{$id}\_L001_R1_001.fastq.trimmed.single.cut > $id\_$s{$id}\_L001_R1_001.fastq.sta") == 0 or die $!;
system ("cutadapt -a $uni  -f fastq  $id\_$s{$id}\_L002_R1_001.fastq.trimmed.single -o $id\_$s{$id}\_L002_R1_001.fastq.trimmed.single.cut > $id\_$s{$id}\_L002_R1_001.fastq.sta") == 0 or die $!;

system ("'rm'  *.fastq.trimmed.single  ") == 0 or die $! ;
chdir ".."; # change to your main result dir
#system ("rm -f $dyn_dir/*.trimmed") == 0 or die $!;
############## /psc/program/install/SolexaQA_v.2.2/Length sort #########
my $len_dir = "Cut";
mkdir "$len_dir";

print "\n#############length sorting 2\n";

system ("/psc/program/install/SolexaQA_v.2.2/LengthSort.pl $dyn_dir/$id\_$s{$id}\_L001_R1_001.fastq.trimmed.single.cut  -l 25 -d $len_dir") == 0 or die $! ;
system ("/psc/program/install/SolexaQA_v.2.2/LengthSort.pl $dyn_dir/$id\_$s{$id}\_L002_R1_001.fastq.trimmed.single.cut  -l 25 -d $len_dir") == 0 or die $! ;
#system ("/psc/program/install/SolexaQA_v.2.2/LengthSort $dyn_dir/$id\_$s{$id}\_L002_R1_001.fastq.trimmed.paired1.cut $dyn_dir/$id\_$s{$id}\_L002_R2_001.fastq.trimmed.paired2.cut -l 25 -d $len_dir") == 0 or die $! ;

system ("'rm'  $dyn_dir/*.fastq.trimmed.single.cut  ") == 0 or die $! ;
##########count the reads #############
system ("perl ~/pro/countsum.pl $len_dir/$id\_$s{$id}\_L001_R1_001.fastq.trimmed.single.cut.single  >> ../out$id.txt") ==0 or die $!;
system ("perl ~/pro/countsum.pl $len_dir/$id\_$s{$id}\_L002_R1_001.fastq.trimmed.single.cut.single  >> ../out$id.txt") ==0 or die $!;

#system ("perl ~/pro/countsum.pl $id\_$s{$id}\_L001_R2_001.fastq.trimmed.paired2.cut.paired2  >> out$id.txt") ==0 or die $!;
#system ("perl ~/pro/countsum.pl $id\_$s{$id}\_L002_R1_001.fastq.trimmed.paired1.cut.paired1  >> out$id.txt") ==0 or die $!;
#system ("perl ~/pro/countsum.pl $id\_$s{$id}\_L002_R2_001.fastq.trimmed.paired2.cut.paired2  >> out$id.txt") ==0 or die $!;
system ("cat $len_dir/*.single >../Sample_$id\_1.fq") == 0 or die $!;

system ("'rm' -rf $len_dir  ") == 0 or die $! ;
system ("'rm'  -rf $dyn_dir ") == 0 or die $! ;
#	system ("gzip *.fastq")==0 or die $!;
}else{

#	system ("gzip *.fastq")==0 or die $!;
}

chdir ".."; # change to your main result dir
system("pwd");
print "done for Sample_$id\n";
}
__DATA__
Uni	AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT
Index	GATCGGAAGAGCACACGTCTGAACTCCAGTCAC
Index_1	GATCGGAAGAGCACACGTCTGAACTCCAGTCACATCACGATCTCGTATGCCGTCTTCTGCTTG
Index_2	GATCGGAAGAGCACACGTCTGAACTCCAGTCACCGATGTATCTCGTATGCCGTCTTCTGCTTG
Index_3	GATCGGAAGAGCACACGTCTGAACTCCAGTCACTTAGGCATCTCGTATGCCGTCTTCTGCTTG
Index_4	GATCGGAAGAGCACACGTCTGAACTCCAGTCACTGACCAATCTCGTATGCCGTCTTCTGCTTG
Index_5	GATCGGAAGAGCACACGTCTGAACTCCAGTCACACAGTGATCTCGTATGCCGTCTTCTGCTTG
Index_6	GATCGGAAGAGCACACGTCTGAACTCCAGTCACGCCAATATCTCGTATGCCGTCTTCTGCTTG
Index_7	GATCGGAAGAGCACACGTCTGAACTCCAGTCACCAGATCATCTCGTATGCCGTCTTCTGCTTG
Index_8	GATCGGAAGAGCACACGTCTGAACTCCAGTCACACTTGAATCTCGTATGCCGTCTTCTGCTTG
Index_9	GATCGGAAGAGCACACGTCTGAACTCCAGTCACGATCAGATCTCGTATGCCGTCTTCTGCTTG
Index_10	GATCGGAAGAGCACACGTCTGAACTCCAGTCACTAGCTTATCTCGTATGCCGTCTTCTGCTTG
Index_11	GATCGGAAGAGCACACGTCTGAACTCCAGTCACGGCTACATCTCGTATGCCGTCTTCTGCTTG
Index_12	GATCGGAAGAGCACACGTCTGAACTCCAGTCACCTTGTAATCTCGTATGCCGTCTTCTGCTTG
Index_13	GATCGGAAGAGCACACGTCTGAACTCCAGTCACAGTCAACAATCTCGTATGCCGTCTTCTGCTTG
Index_14	GATCGGAAGAGCACACGTCTGAACTCCAGTCACAGTTCCGTATCTCGTATGCCGTCTTCTGCTTG
Index_15	GATCGGAAGAGCACACGTCTGAACTCCAGTCACATGTCAGAATCTCGTATGCCGTCTTCTGCTTG
Index_16	GATCGGAAGAGCACACGTCTGAACTCCAGTCACCCGTCCCGATCTCGTATGCCGTCTTCTGCTTG
Index_18	GATCGGAAGAGCACACGTCTGAACTCCAGTCACGTCCGCACATCTCGTATGCCGTCTTCTGCTTG
Index_19	GATCGGAAGAGCACACGTCTGAACTCCAGTCACGTGAAACGATCTCGTATGCCGTCTTCTGCTTG
