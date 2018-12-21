#!/usr/bin/perl
use strict;
use warnings;
#Extarcting sequence from genbank file 
my $string_filename1 = "GB1.gb"; #CHANGE FILENAME
open(my $fh1, $string_filename1) or die("Couldn't read file $string_filename1\n"); 
$string_filename1 = shift(@ARGV); 

my $data = do {local $/; <$fh1>};
my $sequence;
my $acc;
my $def;
my $head;
my $dna;
my $loc;

print "---------GENERATING FASTA FILE FROM GENBANK FILE----------\n";
    if($data =~ /ORIGIN(.*)/s)    
    {
        $sequence = $1;
    }
	
	if($data =~ /LOCUS(.*)DEFINITION/s)
    {
    	$loc = $1;
    }

    if($data =~ /VERSION(.*)KEYWORDS/s)
    {
    	$acc = $1;
    	$acc =~ s/\s+//g;
    }

    if($data =~ /DEFINITION(.*)ACCESSION/s)
    {
    	$def = $1;
    }

    if($data =~ /LOCUS(.*)ORIGIN/s)
    {
    	$head = $1;
    }

	if ($data =~ /ORIGIN(.*)/s)
		{
    		$dna = $1;
    		$dna =~ s/\s+//g;
    		$dna =~ s/\d+//g;
    		$dna =~ s/\/\///;
		}


	

    close($fh1);
  	my $filename = "output.fa";
 	open(FH, '>', $filename) or die $!;
    
		print FH ">gi $acc$def";
 		print FH $dna;

 	close(FH);
print "OPEN OUTPUT.FA from folder to view FASTA FILE";

#CREATING A NEW FILE FOR OUTPUT GENBANK FILE USING OUTPUT.FA FILE GENERATED

    my $string_filename = "output.fa";  
	open(my $fh, $string_filename) or die("Couldn't read file $string_filename\n");  
	local $/ = "\n>";  # read by FASTA record
	my $seq = <$fh>; 
	chomp $seq;
		
	my $filename1 = "output.gb";
 	open(FH1, '>', $filename1) or die $!;
 	print FH1 "LOCUS $loc";
 	print FH1 "DEFINITION $def";
 	print FH1 "ACCESSION    $acc\n";
 	print FH1 "VERSION      $acc.1\n";
 	print FH1 "KEYWORDS	   .\n";
 	print FH1 "SOURCE	   -\n";
 	print FH1 "ORGANISM	   -\n";
 	print FH1 "FEATURES	   -\n";
 	print FH1 "ORIGIN\n";
 	print FH1 "$sequence";

 	close(FH1);

 	
 
	#print "Writing to file successfully!\n";
