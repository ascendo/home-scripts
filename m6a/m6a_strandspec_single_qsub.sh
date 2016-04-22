#$ -cwd
assemble=/psc/home/sunyidan/scripts/m6a/m6a_standspec_single.sh
#sample=/psc/bioinformatics/sunyd/identify/arab_rnaseq
sample=$1          ####the input file dir
name=$2            ####the input name 
gff=$3             ####the gff file
genome=$4          ####the genome file
for i in $sample/${name}${SGE_TASK_ID}.fastq;    ###SRR0       the SGE number is normal
do
	#j=`echo $i |sed 's/\.sra//'`;
	j=`echo $i |rev |cut -d "." -f2 |rev`;
	z=`echo $j |rev |cut -d/ -f 1 |rev`;
	##################run the assemble scripts######################
	sh $assemble $i $z $TMP/$z $gff $genome;     ######$TMP/
	cp -r $TMP/$z $sample
done
#sleep 5h
