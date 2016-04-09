#binmode(STDOUT, ":encoding(big5)");
open  infile,"台南大遠百威秀影城.html";
my$line1;
my$print;
while($line1 = <infile>){
	 $line1 =~ s/^\s+//; # 去頭
 	 $line1 =~ s/\s+$//; # 去尾

	if ($line1 =~ /^<a href="http:\/\/www.atmovies.com.tw\/movie/){
		$print = substr $line1, 57;
		if($print =~ /(.*?)(?=<\/a><\/li>)/g ){
			print"$1\n" ;
		} 
		#print "$print\n" ;
	}

	if ($line1 =~ /(?<=<li class="filmVersion">)(.*?)(?=<\/li>)/g){
		print "$1\n" ;
	}

	if ($line1 =~  /(\d+\：\d+)/)
	{	
		$print = substr $line1 , 4 , 7 ;
		#print "$line1\n" ;
		#print "$print\n" ;
		print "$1\n";
	}
}

close infile ;
