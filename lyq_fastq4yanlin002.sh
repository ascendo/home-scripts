wd=/psc/bioinformatics/Data/140418_7001435_0101_AC3WPCACXX_XiongYan/140418_7001435_0101_AC3WPCACXX/L002/
wd1=/psc/home/liyanqiang/lyq/yanlin/L002
echo start for $wd
cp -r ${wd}${SGE_TASK_ID}*.gz  $TMP
	  
perl     ~/pro/fastq_trim4yanlin.pl $wd/a.csv 17 $wd1 $TMP ${SGE_TASK_ID}
#cp $TMP/*fq $TMP/*txt $wd1   
echo done for ${wd} sample_${SGE_TASK_ID}  
