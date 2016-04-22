

cat	out*.txt >outall.txt

perl ~/pro/count_out.pl -i outall.txt -f paired  >fq.txt

for i in  1 2 3 4 5 6 7 8 9 10 

do
          echo $i >>map3
      sed -n '2p;11p;12p;' $i/align_summary.txt |sed -e 's/[a-z A-Z : ]//g; ' >>map3 
	  done
echo "Sample	clean	unmapped	unique map" >map33
cat map3 |sed ':a;N;s/\n/\t/;ta' |sed 's/([0-9]\+.[0-9]\+%)/\n/g' |sed 's/^\t//g' |sed '/^$/d ' | awk '{print $1"\t"$2"\t"$2-$3"\t"$3-$4}' >>map33
paste fq.txt map33 
