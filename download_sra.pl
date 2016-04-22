#!/usr/bin/perl
use warnings; use strict;
while (<>){
	if ($_ =~ /,(ftp:\/\/(\S*.gov)(\S*\.sra)),/){
		my $file = $3;
		(my $ftp = $2) =~ s/ftp-trace/ftp-private/;
		
		print "$ftp\t$file\n";


		my $cmd = "~/.aspera/connect/bin/ascp -QTr -k1 -L ./  --overwrite=never -i ~/.aspera/connect/etc/asperaweb_id_dsa.openssh anonftp\@$ftp:$file .";
		print "CMD: $cmd\n";
		my $infor = system ($cmd);
		my $repeat = 1 ;
		while ($infor != 0 ){
			$infor = system ($cmd);
			
			$repeat ++;
			print "retry: $repeat time\n";
			last if ($repeat >5);
		}
	}else{
		print "NO FTP site\n";
	}
}
