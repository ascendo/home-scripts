#!/usr/bin/perl -w

# Copyright (c) 2013
# University of Minnesota
# All Rights Reserved
#
# Authors: Lin Li, Nathan M. Springer, Gary J. Muehlbauer
#
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the 
# following conditions are met:
#   o Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
#   o Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following 
#     disclaimer in the documentation and/or other materials provided with the distribution.
#   o Neither the name of the University of Minnesota nor the names of its contributors may be used to endorse or promote 
#     products derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED 
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL LIN LI, NATHAN M. SPRINGER, or GARY J. MUEHLBAUER 
# (OR UNIVERSITY OF MINNESOTA) BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL 
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
# STRICT LIABILITY, OR  TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# DESCRIPTION: LncRNA_Finder enables the discovery of long noncoding RNAs using native sequence fasta files 
#              This script essentially uses the results from external alignment programs 
#              and performs long noncoding RNA filtering via a set of specified parameters.
#
# CITATION: LncRNA_Finder can be cited as:
#          Li L, Eichten SR, Shimizu R, Petsch K, Yeh CT, Wu W, Chettoor AM, Givan SA, Cole RA, Fowler JE, Evans MMS,
#          Scanlon MJ, Yu JM, Schnable PS, Timmermans MCP, Springer NM, and Muehlbauer GJ: Genome-wide discovery and
#          characterization of maize long non-coding RNAs (lncRNAs). Genome Biology, 2013, revised.
#
#source /psc/program/install/cpc-0.9-r2/profile
#/psc/program/install/cpc-0.9-r2/bin/run_predict.sh /psc/bioinformatics/sunyd/lncrna/test.fa /psc/bioinformatics/sunyd/lncrna/testcpc /psc/bioinformatics/sunyd/lncrna/

use strict;
use warnings;
use Getopt::Long;
#--------------------------configuration of external programs-------------------------------------------------
my $ncbi_blast="/psc/program/install/blast/blast-2.2.26/bin/blastall"; # could be modified according to users' computational environment
my $ncbi_blast_formatdb="/psc/program/install/blast/blast-2.2.26/bin/formatdb"; # could be modified according to users' computational environment
#----------------------------bowtie1---------------------------
#my $bowtie_program="/soft/bowtie/1.0.0/bowtie"; #could be modified according to users' computational environment
#my $bowtie_build_program="/soft/bowtie/1.0.0/bowtie-build"; #could be modified according to users' computational environment
#----------------------------bowtie2---------------------------
my $bowtie_program="/psc/program/install/bowtie/bowtie"; #could be modified according to users' computational environment
my $bowtie_build_program="/psc/program/install/bowtie/bowtie-build"; #could be modified according to users' computational environment
my $cpc_home="/psc/program/install/cpc-0.9-r2";#could be modified according to users' computational environment
#----------------------------main interface that the program starts from--------------------------------------
&main(); 

#-----------------------------------subroutine begins----------------------------------------------------------
sub main(){
	my $USAGE = qq(
Welcome to use LncRNA_Finder to identify long noncoding RNAs only according to the nucleotide attributes of input sequences!

USAGE:
   LncRNA_Finder.pl -i <transcript.fasta> -p <protein.fasta> -k <housekeeping.fasta> -s <smallRNA.fasta> -o <output prefix> [-t <# of thread>] [-r <minimum lncRNA length>] [-f <maximum ORF length>] [-e <E-value of alignment>]
Options:
   -i <transcript.fasta>
   -p <protein.fasta>
   -k <housekeeping.fasta>
   -s <smallRNA.fasta>
   -o <output prefix>
   -h help
   -t <int> number of thread for the computation || default=4
   -r <int> minimum lncRNA length || default=200
   -f <int> maximum potential ORF length of lncRNAs || default=100
   -m <int> number of mismatch in the alignment with smallRNA || default=0
   -e E-value of the alignment against protein database || default=1.0e-3
   
Requirement:
   Need to install ncbi_blast standalone package, bowtie and cpc in your local environment correctly and set the running path of external programs at the begining of the pipeline
   
Citation:
   Li L, Eichten SR, Shimizu R, Petsch K, Yeh CT, Wu W, Scanlon MJ, Yu JM, Schnable PS, Timmermans MCP, Springer NM, and Muehlbauer GJ: Genome-wide discovery and characterization of maize long non-coding RNAs (lncRNAs). Genome Biology, 2013, revised.
	);
	my ($inputfile,$hkfile,$srnafile,$profile,$outfile); #required parameters
	my ($mintslength,$maxorflength,$evalue,$thread);#optional parameters
	#
	my $parastr = &GetOptions("i=s{1}"=>\$inputfile,
							  "s=s{1}"=>\$srnafile,
							  "o=s{1}"=>\$outfile,
							  "t=i{0,1}"=>\$thread,
	);
	GetOptions ("help|?");

	unless ($parastr && defined($outfile)) {
	   print $USAGE."\n";
	   exit 1;
	}else{
		print "----------------------------------------------------------\n\n";
		unless(-e $inputfile){
			print "input transcript sequence file-$inputfile does not exist\n";
			die("Pipeline halted\n");
		}else{
			print "input transcript sequence file: $inputfile\n";
		}
		unless(-e $srnafile){
			print "input smallRNA sequence file-$srnafile does not exist\n";
			die("Pipeline halted\n");
		}else{
			print "input smallRNA sequence file: $srnafile\n";
		}
		#check the optional parameters
		unless(defined($thread)){
			$thread=4;
		}
		print "----------------------------------------------------------\n\n";
		print "LncRNA_Finder starts to work with the following parameters:\n";
		print "number of thread for computation:\t$thread\n";
		print "----------------------------------------------------------\n\n";
	}
	   my %oriseqhash=getOriSeqinfo($inputfile);
	   print "processing transcript length/ORF filter...\n";
	   print "----------------------------------------------------------\n\n";

	#align the left putative lncRNAs against smallRNAs to classify the high-confidence lncRNAs and pre-lncRNAs
	my $bowtiebuildcmd=$bowtie_build_program." $inputfile putativelncRNA_db";
	print $bowtiebuildcmd."\n";
	if(system($bowtiebuildcmd)!=0){
		die("bowtie package has not been installed properly to be invoked by lncRNA_Finder Pipeline\nPipeline\tHalted\n");
	}
	my $srna_aligned_file=$outfile."-srna2putativelncRNA_res.txt";
	#-----------------------bowtie1 alignment-----------------------------
	my $bowtiecmd=$bowtie_program."  -a --best -v 0 -p $thread putativelncRNA_db $srnafile > $srna_aligned_file";
	#-----------------------bowtie2 alignment-----------------------------
#	my $bowtiecmd=$bowtie_program."  -a -N 0 -L 10 -p $thread -x putativelncRNA_db $srnafile -S $srna_aligned_file";
	if(system($bowtiecmd)!=0){
		die("bowtie package has not been installed properly to be invoked by lncRNA_Finder Pipeline\nPipeline\tHalted\n");
	}
	#parse the protein DB blast result
	open SAMIN,"$srna_aligned_file" || die "Cannot open $srna_aligned_file:$!";
	my $samstr;
	my %prelncRNA;
	while($samstr=<SAMIN>){
		my @barr=split(/\t/,trim($samstr));
		$prelncRNA{trim($barr[0])}=1;
	}
	close(SAMIN);
	my $HClncRNAfile=$outfile."-HighConfidencelncRNA.fa";
	my $prelncRNAfile=$outfile."-prelncRNA.fa";
	open HCOUT,">$HClncRNAfile" || die "Cannot create result file:$!";
	open PREOUT,">$prelncRNAfile" || die "Cannot create result file:$!";
	while (my ($tkey,$tvalue)=each(%oriseqhash)){
		if($tvalue ne "" && exists($prelncRNA{$tkey})){
			print PREOUT ">".$tkey."\n".$tvalue."\n";
		}elsif($tvalue ne "" && !exists($prelncRNA{$tkey})){
			print HCOUT ">".$tkey."\n".$tvalue."\n";
		}
	}
	close(HCOUT);
	close(PREOUT);
	print "----------------------------------------------------------\n\n";
	print "putative lncRNA classification done!!!\n";	
	print "Congratulations! LncRNA_Finder has completed all the filtering analyses!!!\n";
	print "Please check out the following result files:\n";
	print "High Confidence lncRNA file:\t$HClncRNAfile\n";
	print "pre-lncRNA file:\t$prelncRNAfile\n";	
	print "----------------------------------------------------------\n\n";
}
sub getOriSeqinfo(){
	my $orifile=shift;
	my %resarr;
	open ORI,$orifile or die "Cannot open $orifile:$!";
	my $tstr;
	while($tstr=<ORI>){
		if(trim($tstr) ne "" && $tstr=~/>/){
			my @tarr=split(/\s+/,trim($tstr));
			my $tseqstr="";
			my $nstr="";
			while ($nstr=<ORI>){
				if($nstr=~/>/){
					my $tname=substr(trim($tarr[0]),1);
					$resarr{$tname}=$tseqstr;
					seek(ORI,-length($nstr),1);
					last;
				}else{
					$tseqstr.=trim($nstr);
				}
			}
		}
	}
	close(ORI);
	return %resarr;
}
sub codon2aa {
    my($codon) = @_;

    $codon = uc $codon;
 
    my(%genetic_code) = (
    
    'TCA' => 'S',    # Serine
    'TCC' => 'S',    # Serine
    'TCG' => 'S',    # Serine
    'TCT' => 'S',    # Serine
    'TTC' => 'F',    # Phenylalanine
    'TTT' => 'F',    # Phenylalanine
    'TTA' => 'L',    # Leucine
    'TTG' => 'L',    # Leucine
    'TAC' => 'Y',    # Tyrosine
    'TAT' => 'Y',    # Tyrosine
    'TAA' => '*',    # Stop
    'TAG' => '*',    # Stop
    'TGC' => 'C',    # Cysteine
    'TGT' => 'C',    # Cysteine
    'TGA' => '*',    # Stop
    'TGG' => 'W',    # Tryptophan
    'CTA' => 'L',    # Leucine
    'CTC' => 'L',    # Leucine
    'CTG' => 'L',    # Leucine
    'CTT' => 'L',    # Leucine
    'CCA' => 'P',    # Proline
    'CCC' => 'P',    # Proline
    'CCG' => 'P',    # Proline
    'CCT' => 'P',    # Proline
    'CAC' => 'H',    # Histidine
    'CAT' => 'H',    # Histidine
    'CAA' => 'Q',    # Glutamine
    'CAG' => 'Q',    # Glutamine
    'CGA' => 'R',    # Arginine
    'CGC' => 'R',    # Arginine
    'CGG' => 'R',    # Arginine
    'CGT' => 'R',    # Arginine
    'ATA' => 'I',    # Isoleucine
    'ATC' => 'I',    # Isoleucine
    'ATT' => 'I',    # Isoleucine
    'ATG' => 'M',    # Methionine
    'ACA' => 'T',    # Threonine
    'ACC' => 'T',    # Threonine
    'ACG' => 'T',    # Threonine
    'ACT' => 'T',    # Threonine
    'AAC' => 'N',    # Asparagine
    'AAT' => 'N',    # Asparagine
    'AAA' => 'K',    # Lysine
    'AAG' => 'K',    # Lysine
    'AGC' => 'S',    # Serine
    'AGT' => 'S',    # Serine
    'AGA' => 'R',    # Arginine
    'AGG' => 'R',    # Arginine
    'GTA' => 'V',    # Valine
    'GTC' => 'V',    # Valine
    'GTG' => 'V',    # Valine
    'GTT' => 'V',    # Valine
    'GCA' => 'A',    # Alanine
    'GCC' => 'A',    # Alanine
    'GCG' => 'A',    # Alanine
    'GCT' => 'A',    # Alanine
    'GAC' => 'D',    # Aspartic Acid
    'GAT' => 'D',    # Aspartic Acid
    'GAA' => 'E',    # Glutamic Acid
    'GAG' => 'E',    # Glutamic Acid
    'GGA' => 'G',    # Glycine
    'GGC' => 'G',    # Glycine
    'GGG' => 'G',    # Glycine
    'GGT' => 'G',    # Glycine
    );

    if(exists $genetic_code{$codon}) {
        return $genetic_code{$codon};
    }#else{

#            print STDERR "Bad codon \"$codon\"!!\n";
#            exit;
#    }
}

sub dna2peptide {

    my($dna) = @_;

    # Initialize variables
    my $protein = '';

    # Translate each three-base codon to an amino acid, and append to a protein 
    for(my $i=0; $i < (length($dna) - 2) ; $i += 3) {
        $protein .= codon2aa( substr($dna,$i,3) );
    }

    return $protein;
}

sub translate_frame {

    my($seq, $start, $end) = @_;

    my $protein;

    # To make the subroutine easier to use, you won't need to specify
    #  the end point-it will just go to the end of the sequence
    #  by default.
    unless($end) {
        $end = length($seq);
    }

    # Finally, calculate and return the translation
    return dna2peptide ( substr ( $seq, $start - 1, $end -$start + 1) );
}

# revcom 
#
# A subroutine to compute the reverse complement of DNA sequence

sub revcom {

    my($dna) = @_;

    # First reverse the sequence
    my $revcom = reverse $dna;

    # Next, complement the sequence, dealing with upper and lower case
    # A->T, T->A, C->G, G->C
    $revcom =~ tr/ACGTacgt/TGCAtgca/;

    return $revcom;
}

sub checkprotein(){
	my $tstr=shift;
	my $resstr="";
	my @tarr=split(/\*/,trim($tstr));
	my $maxlen=0;
	my $maxstr="NA";
	my $tpro="";
	pop(@tarr);
	foreach $tpro(@tarr){
		if(trim($tpro) ne ""){
			if(index($tpro,"M")!=-1){
				if($maxlen<length(trim($tpro))-index(trim($tpro),"M")){
					$maxlen=length(trim($tpro))-index(trim($tpro),"M");
					$maxstr=substr(trim($tpro),index(trim($tpro),"M"));
				}
			}
		}
	}
	$resstr=$maxstr;
	return $resstr;
}

sub trim(){
	my $string=shift;
	$string=~s/^\s+//;
	$string=~s/\s+$//;
	return $string;
}
