#---------------------------------------------------------------------------------#
#THIS IS A PROGRAM USED TO PERFORM RESIDUE SHUFFLING AND SEGMENT SHUFFLING OF DNA-#
#AND PROTEIN SEQEUENCES AS PROVIDED BY THE USER.----------------------------------#
#THE SAMPLE DNA AND PROTEIN SEQUENCES ARE PROVIDED IN THE FOLDER AND USER IS------#
#ADVISED TO CHANGE THE FILENAME IN THE SOURCE CODE BEFORE TRYING TO RUN THE CODE--#
#----------------------------AUTHOR: Pawan Verma----------------------------------#
#---------------------------------------------------------------------------------#

use strict;
use warnings;
use diagnostics;


#READ FASTA FILE FOR DNA SEQUENCE
my $string_filename1 = "NC_014510.2.fasta"; #CHANGE FILENAME
open(my $fh1, $string_filename1) or die("Couldn't read file $string_filename1\n");
local $/ = "\n>";  # read by FASTA record
my $seq1 = <$fh1>;
chomp $seq1;
$seq1 =~ s/^>*.+\n//;  # remove FASTA header
$seq1 =~ s/\n//g;  # remove endlines
$seq1 =~ s/\s//g;

#READ FASTA FILE FOR PROTEIN SEQUENCE
my $string_filename2 = "CAA35120.1.fasta";  #CHANGE FILENAME
open(my $fh2, $string_filename2) or die("Couldn't read file $string_filename2\n");
local $/ = "\n>";  # read by FASTA record
my 	$seq2 = <$fh2>;
chomp $seq2;
$seq2 =~ s/^>*.+\n//;  # remove FASTA header
$seq2 =~ s/\n//g;  # remove endlines
$seq2 =~ s/\s//g;

print "_____________________________________RESIDUE SHUFFLING________________________________________\n\n";
print "Performing residue shuffling on DNA sequence\n";
print "$seq1\n";
#RESIDUE SHUFFLING
my $rand_DNA_res;
my @chars1  = $seq1 =~ /./g;
my %randindex1;
for (my $i = 0 ; $i <= $#chars1 ; $i++)
{
	$randindex1{rand()} = $i;
}
$rand_DNA_res = join "",map $chars1[$randindex1{$_}], sort keys %randindex1;
print "The randomized DNA sequence by residue shuffling is: \n";
print "$rand_DNA_res\n";

print "----------------------------------------------------------------------------------------------\n";
print "----------------------------------------------------------------------------------------------\n";
print "Performing residue shuffling on protein sequence\n";
print "$seq2\n";
#RESIDUE SHUFFLING
my $rand_PROTEIN_res;
my @chars2  = $seq2 =~ /./g;
my %randindex2;
for (my $j = 0 ; $j <= $#chars2 ; $j++)
{
	$randindex2{rand()} = $j;
}
$rand_PROTEIN_res = join "",map $chars2[$randindex2{$_}], sort keys %randindex2;
print "The randomized PROTEIN sequence by residue shuffling is: \n";
print "$rand_PROTEIN_res\n";

print "_____________________________________SEGMENT SHUFFLING________________________________________\n\n";
print "---------------------------------------------------------------------------------------------- \n";
print "---------------------------------------------------------------------------------------------- \n";
print "Performing segment shuffling on DNA sequence\n";
print "FOR SEGMENT SIZE = 3\n";
#SEGMENT SHUFFLING
my $rand_DNA_seg;
my @chars3;
my $x;
for($x = 0; $x<= length($seq1); $x++)
{
	$chars3[$x] = substr($seq1, $x, 3);
}
print "@chars3\n";
my %randindex3;
for (my $k = 0 ; $k <= $#chars3 ; $k++)
{
	$randindex3{rand()} = $k;
}
$rand_DNA_seg = join " ",map $chars3[$randindex3{$_}], sort keys %randindex3;
print "The randomized DNA sequence by segment shuffling is: \n";
print "$rand_DNA_seg\n";

print "-----------------------------------------------------------------------------------------------\n";
print "---------------------------------------------------------------------------------------------- \n";
print "Performing segment shuffling on protein sequence\n";
print "FOR SEGMENT SIZE = 3\n";
#SEGMENT SHUFFLING
my $rand_PROTEIN_seg;
my @chars4;
my $y;
for($y = 0; $y<= length($seq2); $y++)
{
	$chars4[$y] = substr($seq2, $y, 3);
}
print "@chars4\n";
my %randindex4;
for (my $l = 0 ; $l <= $#chars4 ; $l++)
{
	$randindex4{rand()} = $l;
}
$rand_PROTEIN_seg = join " ",map $chars4[$randindex4{$_}], sort keys %randindex4;
print "The randomized PROTEIN sequence by segment shuffling is: \n";
print "$rand_PROTEIN_seg\n";
