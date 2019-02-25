use List::Util qw[max];

my @sequences=("ACTTCGACCCCCGACTCCCAGCAGCACGATCAGCACTAT","ACTTCGACCTGCACGACAGCAGCACGATCAGCACTAT","CACGATCAGCACTATCACGATC","CACGATCAGCACTAGATCAGCACT","AGCACGATCAGCACTTCGACCTGCACGA");
my @startPositions=(2,3,4,5,6);
my $seqSubsetLength=8;


#Record nucidetide count in each postion
my %seqPositionCount;
foreach my $j (0..(scalar(@startPositions)-1)) {
	my $startPosition=$startPositions[$j];
	my $sequence=$sequences[$j];
	
	print $startPosition."\n";
	my $subSequence  = substr $sequence, $startPosition,$seqSubsetLength;
	print $subSequence."\n";
	
	#split sequence into array, each element indicate nucidetide at one position
	my @subSequenceArray = split //, $subSequence;
	
	#loop each position of sequence and count nucidetide into hash. $i means postion, $subSequenceArray[$i] means nucidetide (A, T, C, G) 
	foreach my $i (0..($seqSubsetLength-1)) {
		if (exists $seqPositionCount{$i}{$subSequenceArray[$i]}) {
			$seqPositionCount{$i}{$subSequenceArray[$i]}=$seqPositionCount{$i}{$subSequenceArray[$i]}+1;
		} else {
			$seqPositionCount{$i}{$subSequenceArray[$i]}=1;
		}
	}
}

#find max in each position
my $sumValue=0;
foreach my $i (0..($seqSubsetLength-1)) {
	my @countInPosition=values(%{$seqPositionCount{$i}});
	my $countInPositionMax=max(@countInPosition);
	$sumValue=$sumValue+$countInPositionMax;
	print $countInPositionMax."\n";
}


print "Result:".$sumValue."\n";
