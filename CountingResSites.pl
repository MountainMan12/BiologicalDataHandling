#!/usr/bin/perl
use strict;
use warnings;
my $string_filename = "ecoli_11kb.txt";  
open(my $fh, $string_filename) or die("Couldn't read file $string_filename\n");  

local $/ = "\n>";  # read by FASTA record
my $seq = <$fh>; 
chomp $seq;
$seq =~ s/^>*.+\n//;  # remove FASTA header
$seq =~ s/\n//g;  # remove endlines
$seq =~ s/\s//g; 
my $j = 0;	
$_ =  $seq;
			my @matches = m/gaattc/g;
			foreach(@matches)
			{
				$j++;
			}
			my $pos = index($_, $matches[0]);
	
			print "Total number of Recognition sites for EcoRI in the sequence is: $j\n";
			print "The Restriction are present at $pos in the DNA sequence\n";

close $fh;
exit;