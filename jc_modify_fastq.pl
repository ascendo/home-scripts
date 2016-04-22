#!/usr/bin/perl
use warnings; use strict;
use Getopt::Std;


my $usage = "$0 
		-r : <DIR> 
		-n : <sample> 
		-1 : <'reads1_files'> 
		-2 : <'reads2_files'> 
		-s : single end reads
		-p : <phred> 
		-l : <lenth> <5
		-5 : 'adaptor:Uni Index> 
		-3 : <3'adaptor> 
		-d : if run dynamic trim ?  <T|F>  default:T
		-c : if run cutadapter ?    <T|F>  default:T \n";

########
		#  DIR output directory default 'current directory'
		#



###############  get parameters #################
my %opt;
getopts("r:n:1:2:p:l:5:3:s:d:c:h",\%opt);

die  $usage if ($opt{h});

my $dyna_b = ($opt{d}?$opt{d}:"T");
my $cuta_b = ($opt{c}?$opt{c}:"T");
print "$dyna_b\t$cuta_b\n";

my($dir,$sample_name,$reads1,$reads2,$sin,$phred,$len,$ad_1,$ad_2) = ($opt{r},$opt{n},$opt{1},$opt{2},$opt{s},$opt{p},$opt{l},$opt{5},$opt{3});
$dir = $dir? $dir :$ENV{PWD};


my $zcat = ($reads1=~/.gz$/)?"zcat":"cat";


############   read adapter     #################

my %adaptors;
while (<DATA>){
	chomp;
	my ($id,$seq) = split /\t/,$_;
	$adaptors{$id} = $seq;
}
my $uni   = $adaptors{$ad_1};
$uni =~ tr/ATCGatcg/TAGCtagc/;
$uni = reverse $uni;

my $index = $adaptors{$ad_2};
$index = "A".$index;

print "Adaptor:\n$uni\n$index\n";

######## making your main result directory!!! ########


print "\n############making dir: $sample_name\n";
mkdir "$dir/$sample_name";
my $cwd = $ENV{PWD};
my $file_sta = "$dir/$sample_name/$sample_name.sta";


########unzipping the original gz files########
print "\n############unzipping fastq files:\n\t$reads1\n\t$reads2\n.....\n";
my $fq_1 = $sample_name."_R1";
my $fq_2 = $sample_name."_R2";
system ("printf '$sample_name\tRaw:' >> $file_sta") == 0 or die $!;
system ("$zcat $reads1 |count_line_num.pl $file_sta >$dir/$fq_1") == 0  or die $!;
system ("$zcat $reads2 |count_line_num.pl $file_sta >$dir/$fq_2") == 0  or die $!;

####### change to your working dir############

chdir "$dir/$sample_name" or die $!;

#######    dynamic triming_step_1   ###################
my $len_dir = "Len_sort_step_2";
my $sta_tri ;  #### determine if count base and reads for cut
if($dyna_b =~ /T/g){
	$sta_tri = $file_sta;
	my $dyn_dir = "Dynamic_dir_step_1";
	mkdir $dyn_dir;
	print "\n############dynamic triming reads1 $fq_1\n";
	system ("DynamicTrim $dir/$fq_1 -h $phred -d $dyn_dir") == 0 or die $!;
	print "###########dynamic triming reads2 $fq_2\n";
	system ("DynamicTrim $dir/$fq_2 -h $phred -d $dyn_dir") == 0 or die $!;


	my $fq_1_trimmed = "$dyn_dir/$fq_1.trimmed";
	my $fq_2_trimmed = "$dyn_dir/$fq_2.trimmed";

	
	############### Length_sorting from dynamic trim ###########
	mkdir $len_dir;
	print "\n###########lenth sorting step 2############\n";
	system ("LengthSort $fq_1_trimmed $fq_2_trimmed -l $len -d $len_dir") == 0 or die $!;
	system ("rm -f $fq_1_trimmed $fq_2_trimmed") == 0 or die $!;
}else{
	$sta_tri = "/dev/null";
	mkdir $len_dir;
	print "skip dynamic trim step.................\n";
	system ("ln  -s ../$fq_1 $len_dir/$fq_1.trimmed.paired1") == 0 or die "soft link failed\n";
	system ("ln  -s ../$fq_2 $len_dir/$fq_1.trimmed.paired2") == 0 or die "soft link failed\n";
}

#system ("rm -f $fq_1") == 0 or die $!;
#system ("rm -f $fq_2") == 0 or die $!;



#######    cut adaptor   !!!#######
my $len_dir_4 = "Len_sort_step_4";
mkdir "$len_dir_4";
my $fq_1_loc = "$len_dir/$fq_1.trimmed.paired1";
my $fq_2_loc = "$len_dir/$fq_1.trimmed.paired2";

if ($cuta_b =~ /T/g){
	my $cut_dir = "Cutadt_dir_step_3";
	mkdir $cut_dir;
#chdir $cut_dir;
	my $fq_1_trimmed_cut = "$fq_1.trimmed.cut";
	my $fq_2_trimmed_cut = "$fq_2.trimmed.cut";

	print "\n#############cuting adapter file 1 $fq_1\n";
	my $fq_1_trimmed_cut_sta = "$fq_1_trimmed_cut.sta";
	system ("printf 'Trim:' >>$sta_tri") == 0 or die $!;
	system ("cat $fq_1_loc | count_line_num.pl $sta_tri | cutadapt -a $index  -f fastq - -o $cut_dir/$fq_1_trimmed_cut > $cut_dir/$fq_1_trimmed_cut_sta") == 0 or die $!;

	print "\n#############cuting adapter file 2 $fq_2\n";
	my $fq_2_trimmed_cut_sta = "$fq_2_trimmed_cut.sta";
	system ("cat $fq_2_loc | count_line_num.pl $sta_tri | cutadapt -a $uni  -f fastq -  -o $cut_dir/$fq_2_trimmed_cut > $cut_dir/$fq_2_trimmed_cut_sta") == 0 or die $!;

	############## Length sort #########
	print "\n#############length sorting\n";
	system ("LengthSort $cut_dir/$fq_1_trimmed_cut $cut_dir/$fq_2_trimmed_cut -l $len -d $len_dir_4") == 0 or die $! ;
	system ("rm -f $cut_dir/$fq_1_trimmed_cut") == 0 or die $!;
	system ("rm -f $cut_dir/$fq_2_trimmed_cut") == 0 or die $!;
	system ("printf 'Adaptor:' >>$file_sta") == 0 or die $!;
	system ("cat $len_dir_4/$fq_1_trimmed_cut.paired1 | count_line_num.pl $file_sta NO") == 0 or die $!;
	system ("cat $len_dir_4/$fq_1_trimmed_cut.paired2 | count_line_num.pl $file_sta NO") == 0 or die $!;
}else{
	print "skip cutadat ......\n";
	system ("printf 'Trim:' >>$file_sta") == 0 or die $!;
	system ("cat $fq_1_loc | count_line_num.pl $file_sta > $len_dir_4/$fq_1.pair1" ) == 0 or die $!;
	system ("cat $fq_2_loc | count_line_num.pl $file_sta > $len_dir_4/$fq_2.pair2" ) == 0 or die $!;	
}

system ("rm -rf $fq_1_loc $fq_2_loc" ) == 0 or die $!;



system ("echo  >>$file_sta") == 0 or die $!;  #### change to new line




##########  compress file  ######
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
