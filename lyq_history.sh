  239  ls -l 
  240  ll
  241  le SRX099070 
  242  cd lyq/ascp/
  243  ls
  244  ll
  245  ls -l
  246  cd SRX099070 
  247  LS
  248  ls 
  249  ll
  250  cd SRR349700 
  251  ls 
  252  ll 
  253  ls -l 
  254  top -
  255  top -c 
  256  ls 
  257  ll
  258  ls -l 
  259  cd ..
  260  ll
  261  ls 
  262  cd ..
  263  ll
  264  le sra_result.csv 
  265  cd SRX099067 
  266  ls
  267  cd SRR349697 
  268  ls 
  269  ls -l 
  270  top -c 
  271  ls -l 
  272  ls 
  273  ls -l 
  274  ll 
  275  cd ../../
  276  ll
  277  cd SRX099069 
  278  ls 
  279  cd SRR349699 
  280  ls 
  281  ls -l 
  282  ls 
  283  ll 
  284  top -c 
  285  cd lyq/ascp
  286  ls
  287  ll
  288  cd SRX099067 
  289  ls
  290  cd  SRR349697 
  291  ls 
  292  ls -l 
  293  ll
  294  cd ../..
  295  ll
  296  cd SRX099068 
  297  ls
  298  cd SRR349698/
  299  ls
  300  ll
  301  cd ../
  302  ll
  303  cd ..
  304  ll
  305  le aspera-scp-transfer.0.log 
  306  top -c 
  307  ll
  308  le sra_result.csv 
  309  cd SRX099067 
  310  ls
  311  cd SRR349697/
  312  ls -l
  313  ll
  314  cd ../
  315  cd SRX099068 
  316  cd SRR349698/
  317  ls
  318  ll
  319  lll
  320  ll
  321  cd 
  322  ll
  323  cd SRX099067 
  324  ls
  325  ll
  326  cd SRR349697 
  327  ls
  328  ll
  329  cd ..
  330  ll
  331  cd ..
  332  ll
  333  cd SRX099068 
  334  ls
  335  cd SRR349698/
  336  ls
  337  ll
  338  cd ..
  339  le run_sra_result.csv.sh.o1788 
  340  cd ..
  341  le run_sra_result.csv.sh.
  342  le run_sra_result.csv.sh.o1788 
  343  \rm SRX0990*
  344  \rm -RF  SRX0990*
  345  \rm -rf  SRX0990*
  346  ll
  347  cd lyq/
  348  ls
  349  ll
  350  cd ascp/
  351  ll
  352  cd SRX099070 
  353  cd SRR349700/
  354  ls
  355  ll
  356  cd ../
  357  ll
  358  cd ..
  359  ll
  360  cd SRX099069 
  361  ll
  362  cd SRR349699/
  363  ls
  364  ll
  365  cd ../
  366  cd SRX099067
  367  cd ../SRX099067
  368  ll
  369  cd SRR349697/
  370  ll
  371  cd ../../SRX099068 
  372  LL
  373  ll
  374  cd SRR349698/
  375  ll
  376  ls -l 
  377  ls -l
  378  top -c 
  379  cd ..
  380  ll
  381  cd ..
  382  ll
  383  vi run_sra_result.csv.sh 
  384  \rm SRX099068 
  385  \rm -rf SRX099068 
  386  sh run_sra_result.csv.sh 
  387  ll
  388  top -c
  389  ll 
  390  cd SRX099068 
  391  ls
  392  ll
  393  cd SRR349698/
  394  ls -ll 
  395  ll 
  396  ls -l 
  397  cd lyq/
  398  ls
  399  cd ascp/
  400  ll 
  401  ascp -QTr -k1 -L ./ --overwrite=never  -l 100m -i ~/.aspera/connect/etc/asperaweb_id_dsa.openssh "anonftp@ftp-private.ncbi.nlm.nih.gov:sra/sra-instant/reads/ByExp/sra/SRX/SRX234/SRX234888" .
  402  qstat 
  403  ll 
  404  le tophat_chen.sh.e1775.10 
  405  le tophat_chen.sh.e1774.1 
  406  cd lyq/
  407  cd ascp/
  408  ll
  409  mkdir yuhua
  410  vi yuhua.csv
  411  lll
  412  ll
  413  cd lyq/
  414  ls
  415  ll
  416  cd ascp/
  417  ll
  418  sh awk_SraRun.sh sra_nrpd1.csv 
  419  ll
  420  le sra_nrpd1.csv 
  421  vi awk.sh 
  422  vi awk_SraRun.sh 
  423  sh awk13.sh sra_nrpd1.csv 
  424  ll
  425  head sra_nrpd1.csv 
  426  vi awk.sh 
  427  vi awk13.sh 
  428  sh awk14.sh sra_nrpd1.csv 
  429  ll
  430  head run_sra_nrpd1.csv.sh 
  431  ascp -QTr -k1 -L ./ --overwrite=never  -l 100m -i ~/.aspera/connect/etc/asperaweb_id_dsa.openssh "anonftp@ftp-private.ncbi.nlm.nih.gov:sra/sra-instant/reads/ByExp/sra/SRX/SRX234/SRX234889" .
  432  ll 
  433  cd SRX234888 
  434  ll 
  435  cd SRR707464/
  436  ll 
  437  cd ../../
  438  ll 
  439  cd SRX234889 
  440  ll 
  441  cd SRR707465/
  442  ll 
  443  top -c 
  444  ll 
  445  cd ..
  446  ll
  447  cd .. 
  448  top -c 
  449  ll 
  450  pwd
  451  ll
  452  le run_sra_nrpd1.csv.sh 
  453  ke sra_nrpd1.csv 
  454  le sra_nrpd1.csv 
  455  cd lyq/
  456  ls
  457  cd chen/
  458  ls
  459  ll
  460  le chen.count.txt 
  461  le 10_out 
  462  cd 10
  463  ls
  464  ll
  465  cd ..
  466  ll
  467  vi fastq4chen.sh 
  468  cd
  469  ll
  470  cd soft/
  471  ll
  472  unzip IGV_2.3.25.zip 
  473  sh IGV_2.3.25/igv.sh 
  474  cd soft/
  475  ls
  476  ll
  477  cd IGV_2.3.25
  478  ls
  479  sh igv.sh 
  480  cd lyq/
  481  lls
  482  ls
  483  cd ascp/
  484  ls
  485  ll
  486  le awk.sh 
  487  vi awk.sh 
  488  cd pro/
  489  ll
  490  vi huanggua2forqsub.pl 
  491  vi fastq_trim_cut_count1.0.pl 
  492  vi fastq_trim_cut_count.pl 
  493  ll 
  494  vi fastq_trim4chen.pl 
  495  ll 
  496  cd
  497  cd lyq/
  498  ls
  499  ll
  500  cd cucumber_GM/
  501  ll 
  502  ll *sh 
  503  vi fastq.
  504  vi fastq.sh  
  505  ll 
  506  cd ..
  507  ll
  508  mkdir chen
  509  cp fastq4chen.sh chen/
  510  cd chen/
  511  vi fastq4chen.sh 
  512  ll 
  513  vi ~/pro/fastq_trim4chen.pl 
  514  vi ~/pro/huanggua2forqsub.pl 
  515  vi ~/pro/fastq_trim4chen.pl 
  516  ll
  517  vi fastq4chen.sh 
  518  vi ~/pro/fastq_trim4chen.pl 
  519  vi fastq4chen.sh 
  520  vi ~/pro/fastq_trim4chen.pl 
  521  vi fastq4chen.sh 
  522  vi ~/pro/fastq_trim4chen.pl 
  523  vi fastq4chen.sh 
  524  vi ~/pro/fastq_trim4chen.pl 
  525  vi ~/pro/huanggua2forqsub.pl 
  526  vi ~/pro/fastq_trim4chen.pl 
  527  ll 
  528  vi fastq4chen.sh 
  529  qsub -t 1  fastq4chen.sh 
  530  qstat 
  531  qrsh -l hostname=node107
  532  ll
  533  qstat 
  534  cd 
  535  ll
  536  le fastq4chen.sh.e1737.1 
  537  vi ~/pro/fastq_trim4chen.pl 
  538  cd - 
  539  ;;
  540  ll
  541  qsub -t 1 fastq4chen.sh 
  542  qstat 
  543  cd 
  544  ll
  545  le fastq4chen.sh.e1739.1 
  546  vi ~/pro/fastq_trim4chen.pl 
  547  le fastq4chen.sh.o1739.1 
  548  vi ~/pro/huanggua2forqsub.pl 
  549  vi ~/pro/fastq_trim4chen.pl 
  550  cd -
  551  lll
  552  ll 
  553  vi fastq4chen.sh 
  554  vi ~/pro/fastq_trim4chen.pl 
  555  qsub -t 1 fastq4chen.sh 
  556  qstat 
  557  qrsh -l hostname=node103
  558  ll 
  559  qsub -t 1 fastq4chen.sh 
  560  top -c 
  561  cd 
  562  qstat 
  563  ll 
  564  le fastq4chen.sh.o1742.1 
  565  top -c 
  566  cd lyq/ascp/
  567  ls 
  568  ll 
  569  le aspera-scp-transfer.0.log 
  570  vi run_SraRunInforoot.csv.sh 
  571  cd lyq/
  572  ll 
  573  ll
  574  cd cucumber_GM/
  575  ll 
  576  cd ../
  577  ll 
  578  le cuc.pep.tair10.blastp 
  579  ll 
  580  perl ~/pro/addcol0.0.pl -f ~/Arab/TAIR10_ann  -g  cuc.pep.tair10.blastp >cuc.pep.arab.ann 
  581  ll 
  582  le cuc.pep.arab.ann 
  583  vi ~/Arab/TAIR10_ann 
  584  vi cuc.pep.arab.ann 
  585  qstat 
  586  ll 
  587  cd 
  588  ll 
  589  le fastq4chen.sh.e1742.1 
  590  le fastq4chen.sh.o1742.1 
  591  vi ~/pro/fastq_trim4chen.pl 
  592  le fastq4chen.sh.o1742.1 
  593  le fastq4chen.sh.e1742.1 
  594  vi ~/pro/fastq_trim4chen.pl 
  595  le fastq4chen.sh.e1742.1 
  596  ll 
  597  le fastq4chen.sh.e1755.3 
  598  le fastq4chen.sh.o1755.3 
  599  le fastq4chen.sh.o1757.10 
  600  le fastq4chen.sh.e1756.2 
  601  le fastq4chen.sh.e1757.8 
  602  cd lyq/Yongwu/
  603  ll 
  604  cd .. 
  605  ll 
  606  cd chen/
  607  ll
  608  le out1.txt 
  609  le out8.txt 
  610  le 2_1.fq 
  611  cat out*.txt 
  612  cd ..
  613  ll *sh
  614  ci runtophat.sh 
  615  vi runtophat.sh 
  616  ll
  617  cd Cucumber
  618  ls
  619  ll
  620  cd ..
  621  ll
  622  cd cucumber_GM/
  623  ls
  624  ll
  625  vi tophat_G2.sh 
  626  cd ../
  627  ll 
  628  cd 140417_7001435_0100_AH92WNADXX 
  629  ll 
  630  vi tophat_htseq140417.sh 
  631  cd ../chen/
  632  ls
  633  ll
  634  vi tophat.sh 
  635  ll ../140417_7001435_0100_AH92WNADXX/
  636  le ../140415_7001435_0098_AH92WMADXX/tophat_htseq140417.sh 
  637  vi  ../140415_7001435_0098_AH92WMADXX/tophat_htseq140417.sh 
  638  vi  ../140417_7001435_0100_AH92WNADXX/tophat_htseq140417.sh 
  639  cd ../140417_7001435_0100_AH92WNADXX/
  640  ll 
  641  le htseq_count140417.sh 
  642  cp htseq_count140417.sh ../chen/
  643  cd ../chen/
  644  lll
  645  ll 
  646  vi htseq_count140417.sh 
  647  mv  htseq_count140417.sh tophat_chen.sh
  648  vi tophat_chen.sh 
  649  qsub t 1-2 -q  large.q  tophat_chen.sh 
  650  qsub -t 1-2 -q  large.q  tophat_chen.sh 
  651  qstat 
  652  cd
  653  ll 
  654  le tophat_chen.sh.e1774.1 
  655  le tophat_chen.sh.e1774.2
  656  cd -
  657  ll
  658  qsub -t 7-10 -q  small.q  tophat_chen.sh 
  659  qstat 
  660  cd 
  661  ll 
  662  le tophat_chen.sh.o1775.10 
  663  ll 
  664  ll
  665  le tophat_chen.sh.o1775.10 
  666  le tophat_chen.sh.e1774.2
  667  qstat 
  668  qrsh -l hostname=large.q 
  669  qrsh -l hostname=biocomp1 
  670  ll 
  671  le  tophat_chen.sh.e1774.2 
  672  le  tophat_chen.sh.o1774.2 
  673  cd lyq/chen/
  674  cd 1
  675  ll
  676  cd Arab/
  677  le rice.id.txt 
  678  pwd 
  679  ll 
  680  cd lyq/ascp/
  681  ls
  682  ll
  683  cd SRX099068 
  684  ll 
  685  cd SRR349698/
  686  ls
  687  ll
  688  pwd
  689  cd ..
  690  ll
  691  cd ..
  692  ll
  693  le sra_result.csv 
  694  pwd
  695  ll 
  696  cd lyq/
  697  ls
  698  ll
  699  cd chen/
  700  ls
  701  ll
  702  le read.map1
  703  le read.txt 
  704  le 0415.map2 
  705  le read.map
  706  le map2
  707  le map1
  708  le read.txt 
  709  le read.map2
  710  ll 
  711  vi fastq4chen.sh 
  712  cd ../Data/
  713  ls
  714  ll
  715  cd 140418_7001435_0101_AC3WPCACXX 
  716  ls 
  717  ll 
  718  cd Sample_1
  719  ll 
  720  cd ../
  721  cd Sample_2
  722  ll 
  723  cd ../Sample_3
  724  ls 
  725  ll 
  726  cd 
  727  cd lyq/chen/
  728  ls
  729  ll
  730  cd 1
  731  ls 
  732  ll
  733  cd ..
  734  ll
  735  cd 1
  736  ll
  737  pwd
  738  ll 
  739  cd ../
  740  ll
  741  ll 
  742  bcftools
  743  ll
  744  vi .bashrc 
  745  vi .profile 
  746  ll
  747  find -name Vcf.pm 
  748  cd /psc/program/src/
  749  ls
  750  ll
  751  cd vcftools_0.1.12
  752  ls 
  753  cd lib/
  754  ls
  755  cd perl5/
  756  ls
  757  ll
  758  cd site_perl/
  759  ls
  760  ll
  761  cp *.pm ~/.lib
  762  mkdir ~/.lib 
  763  cp *.pm ~/.lib
  764  vcf-annotate 
  765  ll
  766  cd lyq/
  767  ls
  768  ll
  769  cd 140415_7001435_0098_AH92WMADXX/
  770  ls
  771  ll
  772  cd Sample_1
  773  ls
  774  ll
  775  cd tmp/
  776  ls
  777  ll
  778  cd ../
  779  ll
  780  cd ..
  781  ll
  782  cd Sample_1
  783  ls
  784  ll
  785  cd tmp/
  786  ls
  787  ll
  788  cd ..
  789  ll
  790  cd ..
  791  ll
  792  find -name *sam 
  793  cd ..
  794  ll
  795  cd 140417_7001435_0100_AH92WNADXX/
  796  ls
  797  ll
  798  cd Sample_3
  799  ls
  800  ll
  801  samtools mpileup 
  802  samtools mpileup -s -B -f ~/Arab/arab10.fa accepted_hits.sorted.bam 
  803  ll
  804  samtools mpileup -s -B -f ~/Arab/arab10.fa accepted_hits.bam 
  805  samtools mpileup -s -B -f ~/Arab/arab10.fa accepted_hits.bam  >sample_3.pipleup.txt 
  806  ll
  807  le sample_3.pipleup.txt 
  808  samtools mpileup 
  809  cd 
  810  find -name vcf
  811  find -name vcf*
  812  cd /psc/program/install/
  813  ls
  814  ll 
  815  cd vcftools_0.1.12 
  816  ll 
  817  cd perl/
  818  ls
  819  ll
  820  pwd
  821  cd ..
  822  ll
  823  cd lib/
  824  ls
  825  ll
  826  cd perl5/
  827  ls
  828  cd site_perl/
  829  ls
  830  LL
  831  ll 
  832  cd lyq/
  833  ll
  834  cd 140415_7001435_0098_AH92WMADXX/
  835  ll
  836  cd Sample_1
  837  ls
  838  cd ..
  839  ll
  840  le 0415.count.txt 
  841  cd Sample_5
  842  ls
  843  ll
  844  LL
  845  ll
  846  samtools mpileup 
  847  ll
  848  cd ..
  849  ll
  850  cd ..
  851  ll
  852  cd 140417_7001435_0100_AH92WNADXX/
  853  ll
  854  cd Sample_3
  855  ls
  856  ll
  857  le sample_3.pipleup.txt 
  858  samtools mpileup 
  859  le sample_3.pipleup.txt 
  860  cd ~/pro
  861  wget http://montgomerylab.stanford.edu/resources/kukurba2013/_downloads/samase.pl 
  862  cd -
  863  ll
  864  perl ~/pro/samase.pl 
  865  perl ~/pro/samase.pl -parse_pileup --sp sample_3.pipleup.txt 
  866  vi ~/pro/samase.pl 
  867  perl ~/pro/samase.pl --help
  868  perl ~/pro/samase.pl -help
  869  perl ~/pro/samase.pl -h
  870  cd
  871  ll
  872  cd /psc/program/src/
  873  ls
  874  ll
  875  cd samtools-0.1.19 
  876  ls 
  877  cd bcftools/
  878  ll 
  879  pwd
  880  cd lyq/ar63
  881  ls
  882  ll
  883  le ler_0.v7c.vcf 
  884  bedtools 
  885  bedtools  intersect 
  886  ll
  887  cd .local/
  888  ls
  889  cd bin/
  890  ls
  891  ll
  892  ln -s /psc/program/src/samtools-0.1.19/bcftools/bcftools
  893  ll
  894  bcftools 
  895  ln -s /psc/program/install/vcftools_0.1.12/perl/vcf-annotate
  896  ll
  897  vcf-annotate 
  898  echo @INC
  899  source ~/.profile 
  900  vcf-annotate 
  901  vcf-annotate -H -n -f 
  902  ll
  903  cd ..
  904  lll
  905  ll
  906  cd lib/
  907  ls
  908  ll
  909  cd python2.7/
  910  ls
  911  ll
  912  cd 
  913  ll
  914  cd lyq/
  915  ls
  916  ll
  917  cd 140417_7001435_0100_AH92WNADXX/
  918  ls
  919  ll
  920  cd Sample_3
  921  ls 
  922  ll
  923  samtools mpileup 
  924  ll 
  925  samtools view  accepted_hits.bam 
  926  samtools view  accepted_hits.bam |le 
  927  bcftools view 
  928  bcftools view -vcg sample_3.pipleup.txt >sample_3.raw.vcf 
  929  bcftools view -vcg - sample_3.pipleup.txt >sample_3.raw.vcf 
  930  ll 
  931  samtools sample_3.pipleup.txt 
  932  le  sample_3.pipleup.txt 
  933  samtools mpileup accepted_hits.bam -f ~/Arab/arab10.fa -uD -B|bcftools view -vcg - |tee sample_3_raw.vcf
  934  ll 
  935  le sample_3_raw.vcf 
  936  vcf-annotate 
  937  vcf-annotate -h 
  938  vcf-annotate sample_3_raw.vcf -H -n -f +/D=100/Q=60/d=3/c=3,10/ >sample_3.filter.vcf 
  939  ll 
  940  le sample_3.filter.vcf 
  941  vcf-annotate sample_3_raw.vcf -H -n -f +/Q=60/d=3/c=3,10/ >sample_3.filter_D.vcf  
  942  ll 
  943  le sample_3.filter_D.vcf 
  944  ll 
  945  le sample_3.pipleup.txt 
  946  le sample_3_raw.vcf 
  947  le sample_3.pipleup.txt 
  948  le sample_3_raw.vcf 
  949  le sample_3.pipleup.txt 
  950  ll 
  951  history 
  952  history >log.sh
  953  ll
  954  ll 
  955  le sample_3.pipleup.txt 
  956  le sample_3_raw.vcf 
  957  cd ..
  958  ll
  959  ll 
  960  cd ..
  961  ll
  962  cd ar63
  963  ll
  964  le ler_0.v7c.sdi
  965  head readme.txt 
  966  le ler_0.v7c.sdi
  967  history 
  968  ll 
  969  cd commond/
  970  ls
  971  ll 
  972  cd history/
  973  ls
  974  ll
  975  cd 
  976  ll
  977  cd lyq/
  978  ls
  979  ll
  980  cd db_blast/
  981  ls
  982  le __t.fa.18.1399531160.sh 
  983  ll
  984  le q 
  985  \rm q
  986  ll
  987  le cuc.0..output 
  988  ll cuc*
  989  le cuc_tair10.21..output 
  990  ll 
  991  cd pro/
  992  ls
  993  ll
  994  vi qsub_blast1.1.pl 
  995  ll 
  996  cd 
  997  cd lyq/
  998  ls
  999  ll
 1000  cd
 1001  ll 
 1002  cd lyq/
 1003  ls
 1004  cd Data/
 1005  ls
 1006  ll
 1007  cd 140418_7001435_0101_AC3WPCACXX_XiongYan/
 1008  ls 
 1009  ll
 1010  cd 140418_7001435_0101_AC3WPCACXX/
 1011  ll 
 1012  ls *L001
 1013  ls *L001*
 1014  ls *L002*
 1015  mkdir L001
 1016  mkdir L002
 1017  mv *L001 L001/
 1018  mv *L001*  L001/
 1019  ll
 1020  mv *L002*  L002/
 1021  ll
 1022  cd L001
 1023  LL
 1024  ll 
 1025  ll
 1026  cp ../../../140418_7001435_0101_AC3WPCACXX/1-bcl2fastq_Sample_info_v2-----20140418-C3WPCACXX.csv .
 1027  ll
 1028  ke 1-bcl2fastq_Sample_info_v2-----20140418-C3WPCACXX.csv 
 1029  le 1-bcl2fastq_Sample_info_v2-----20140418-C3WPCACXX.csv 
 1030  vi 1-bcl2fastq_Sample_info_v2-----20140418-C3WPCACXX.csv 
 1031  ll 
 1032  zcat 1_ATCACG_L001_R1_001.fastq.gz |head -n 1000 >11_ATCACG_L001_R1_001.fastq
 1033  ll
 1034  le 11_ATCACG_L001_R1_001.fastq 
 1035  zcat 1_ATCACG_L001_R2_001.fastq.gz |head -n 1000 >11_ATCACG_L001_R2_001.fastq
 1036  ll
 1037  gzip 11_ATCACG_L001_R1_001.fastq 
 1038  gzip 11_ATCACG_L001_R2_001.fastq 
 1039  ll 
 1040  vi a.csv 
 1041  pwd
 1042  ll 
 1043  vi a.csv 
 1044  cp a.csv ../L002
 1045  cd..
 1046  cd ..
 1047  ll 
 1048  cd L002
 1049  ll
 1050  ll 
 1051  cd ..
 1052  ll
 1053  cd L001
 1054  ls
 1055  cd ../
 1056  ll
 1057  lll
 1058  ll
 1059  cd L002
 1060  ll 
 1061  le a.csv 
 1062  vi  a.csv 
 1063  ll 
 1064  vi a.csv 
 1065  cp ../../../140418_7001435_0101_AC3WPCACXX/1-bcl2fastq_Sample_info_v2-----20140418-C3WPCACXX.csv .
 1066  ll
 1067  vi 1-bcl2fastq_Sample_info_v2-----20140418-C3WPCACXX.csv 
 1068  ll
 1069  mv b.csv a.csv
 1070  ll
 1071  rm a.csv*
 1072  ll
 1073  llcd ..
 1074  ll
 1075  cd ..
 1076  ll
 1077  cd L001
 1078  ls
 1079  ll
 1080  cd 
 1081  cd lyq/
 1082  ls
 1083  ll
 1084  cd yanlin/
 1085  ls
 1086  ll
 1087  cd L001
 1088  ls
 1089  ll
 1090  le all.count.txt 
 1091  ll 
 1092  le 0415.map2 
 1093  vi mapsum.sh 
 1094  le 1/align_summary.txt 
 1095  vi mapsum.sh 
 1096  le 1/align_summary.txt 
 1097  vi mapsum.sh 
 1098  sh mapsum.sh 
 1099  ll
 1100  vi map2 
 1101  le 1/align_summary.txt 
 1102  vi mapsum.sh 
 1103  vi map2 
 1104  \rm map2
 1105  sh mapsum.sh 
 1106  vi map2 
 1107  vi mapsum.sh 
 1108  vi map2 
 1109  vi map2
 1110  vi mapsum.sh 
 1111   1 for i in  1 2 3 4 5 6 7 8 9 10
 1112    2 do
 1113    3           echo $i >>map3                                                                                                                                                                  
 1114    4       sed -n '2p;11p;12p;' $i/align_summary.txt |sed -e 's/[a-z A-Z : ]//g; ' >>map2
 1115     for i in  1 2 3 4 5 6 7 8 9 10;    do              echo $i >>map3                                                                                                                                                                  ;          sed -n '2p;11p;12p;' $i/align_summary.txt |sed -e 's/[a-z A-Z : ]//g; ' >>map3;                 done
 1116  vi map3
 1117     sed -i  s/\n/\t/g map3  
 1118  vi map3 
 1119  sed 
 1120     sed -i  's/\n/\t/g' map3  
 1121  vi map3
 1122  sed -i  's/\n/\t/g' map3  
 1123  vi map3
 1124  sed   's/\n/\t/g' map3  
 1125  sed  's/\n/\t/g' map3  
 1126  sed  's/(/\t/g' map3  
 1127  sed  's/\r/\t/g' map3  
 1128  sed  's/\n/\t/g' map3  
 1129  cat map3 |sed  's/\n/\t/g' 
 1130  cat map3 |tr '\n\t' 
 1131  cat map3 |tr -d '\n\t' 
 1132  cat map3 |tr -d '\n' 
 1133  ?tr
 1134  tr
 1135  tr --help
 1136  cat map3 |tr -s '\n\t' 
 1137  tr --help
 1138  cat map3 |tr  '\n\t' 
 1139  tr --help
 1140  cat map3 |tr -c '\n\t' 
 1141  cat map3 |sed  's/\n/\t/' 
 1142  cat map3 |sed  's/\n/\t/' |le 
 1143  cat map3 |sed  -e 's/\n/\t/' |le 
 1144  seq 15 
 1145  seq 1 5 
 1146  seq 1 5 |sed ':a;N;s/\n/:/;ta' 
 1147  cat map3 |sed ':a;N;s/\n/:/;ta' 
 1148  cat map3 |sed ':a;N;s/\n/\t/;ta' 
 1149  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed '/(\d\+\.\d\+)\t/\n/g 
 1150  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed '/(\d\+\.\d\+)\t/\n/g '
 1151  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed '/(\d+\.\d+)\t/\n/g '
 1152  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed '/(\d+\.\d+)\t/\r/g '
 1153  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d+\.\d+)\t/\r/g '
 1154  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d\+\.\d\+%)\t/\r/g '
 1155  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/\(\d\+\.\d\+%\)\t/\r/g '
 1156  vi map2
 1157  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d\+.\d\+%\)\t/\r/g '
 1158  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d\+.\d\+%)\t/\r/g '
 1159  vi map2
 1160  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d\+\.\d%)\t/\r/g '
 1161  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(/\r/g '
 1162  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(/\r/g '|le 
 1163  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(/\n/g '|le 
 1164  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d\+\.\d\+%)/\n/g '|le 
 1165  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d\+\.\d\+\%)/\n/g '|le 
 1166  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d+\.\d+\%)/\n/g '|le 
 1167  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d+/\n/g '|le 
 1168  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d\+/\n/g '|le 
 1169  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d/\n/g '|le 
 1170  vi map2
 1171  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d\+\.\d\+%)\t/\r/g' 
 1172  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed -e 's/(\d\+\.\d\+%)\t/\r/g' 
 1173  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d/\n/g' 
 1174  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(/\n/g' 
 1175  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/(\d/\n/g' 
 1176  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+/\n/g' 
 1177  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+./\n/g' 
 1178  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+/\n/g' 
 1179  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%/\n/g' 
 1180  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' 
 1181  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)\t/\n/g' 
 1182  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)\s/\n/g' 
 1183  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)\t/\n/g' 
 1184  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' 
 1185  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/[ ]\+//g' 
 1186  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' 
 1187  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t|^\n//g'|  
 1188  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t|^\n//g'  
 1189  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g'  
 1190  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' 
 1191  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' |sed 's/^\n//g' 
 1192  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' |sed 's/^\s//g' 
 1193  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' |sed 's/^$//g' 
 1194  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' |sed 's/^$/d ' 
 1195  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' |sed '/^$/d ' 
 1196  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' |sed '/^$/d '|sed '1 Sample\tgenelist' 
 1197  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' |sed '/^$/d '|sed '1 Sample\tgenelist' -i 
 1198  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' |sed '/^$/d '|sed '1 Sample\tgenelist' 
 1199  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' |sed '/^$/d '
 1200  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' |sed '/^$/d '|sed '1 Sample\tgenelist'  
 1201  cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' |sed '/^$/d ' >map33
 1202  vi map33 
 1203  vi mapsum.sh 
 1204  \rm map3
 1205  sh mapsum.sh 
 1206  ll
 1207  vi map33
 1208  cd ../L003
 1209  cd ../L002
 1210  sh ../L001/mapsum.sh 
 1211  ll
 1212  cat  map33 >>../L001/map33
 1213  cd ../L001
 1214  ll
 1215  le map33
 1216  le 1trim.txt 
 1217  paste 1trim.txt map33|le 
 1218  paste 1trim.txt map33 >fqmap.txt
 1219  cd ~/pro/
 1220  vi print_Mb_Gb.pl 
 1221  vi print_percent1.0.pl 
 1222  vi print_Mb_Gb1.0.pl 
 1223  perl ~/pro/print_Mb_Gb1.0.pl fqmap.txt 
 1224  cd -
 1225  perl ~/pro/print_Mb_Gb1.0.pl fqmap.txt 
 1226  le fqmap.txt 
 1227  paste 1trim.txt map33|le 
 1228  paste 1trim.txt map33|cut -f-8-9|le 
 1229  paste 1trim.txt map33|cut -f -8-9|le 
 1230  paste 1trim.txt map33|cut -f -8 -9|le 
 1231  paste 1trim.txt map33|le 
 1232  paste 1trim.txt map33|cut -f1-7,10-11|le 
 1233  paste 1trim.txt map33|cut -f1-7,10-11 >fqmap.txt 
 1234  perl ~/pro/print_Mb_Gb1.0.pl fqmap.txt 
 1235  perl ~/pro/print_Mb_Gb1.0.pl fqmap.txt >fqmap1
 1236  perl ~/pro/print_percent1.0.pl fqmap1 
 1237  perl ~/pro/print_percent1.0.pl fqmap1 >Table1.mapping.xls
 1238  history >history.sh 
