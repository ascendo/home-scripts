library("exomePeak")
args <- commandArgs(trailingOnly = TRUE)

#gtf="/psc/bioinformatics/sunyd/genome/arabidopsis_thaliana/ath_TAIR10.gtf"
#input2="/psc/bioinformatics/sunyd/m6a/arab_m6aseq/SRR150833/SRR150833_top/accepted_hits.bam"
#input1="/psc/bioinformatics/sunyd/m6a/arab_m6aseq/SRR150831/SRR150831_top/accepted_hits.bam"
#ip1="/psc/bioinformatics/sunyd/m6a/arab_m6aseq/SRR150832/SRR150832_top/accepted_hits.bam"
#ip2="/psc/bioinformatics/sunyd/m6a/arab_m6aseq/SRR150834/SRR150834_top/accepted_hits.bam"
gtf = args[1]
input1 = args[2]
ip1 = args[3]
filename = args[4]
result = exomepeak(GENE_ANNO_GTF=gtf,IP_BAM=ip1,INPUT_BAM=input1,SAVE_RESULT_ON_DISK=TRUE,OUTPUT_DIR = filename)
recommended_peaks = result$con_peaks
recommended_peaks_info = mcols(recommended_peaks) 
all_peaks = result$all_peaks
all_peaks_info = mcols(all_peaks)
