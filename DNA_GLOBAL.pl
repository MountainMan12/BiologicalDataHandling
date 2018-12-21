#!usr/bin/perl
use strict;
use warnings;

my $string_filename1 = "NC_014510.1.fasta";  #CHANGE FILENAME 
open(my $fh1, $string_filename1) or die("Couldn't read file $string_filename1\n");  

local $/ = "\n>";  # read by FASTA record
my $seq1 = <$fh1>; 
chomp $seq1;
$seq1 =~ s/^>*.+\n//;  # remove FASTA header
$seq1 =~ s/\n//g;  # remove endlines
$seq1 =~ s/\s//g;

my $string_filename2 = "NC_014510.2.fasta";   #CHANGE FILENAME 
open(my $fh2, $string_filename2) or die("Couldn't read file $string_filename2\n");  

local $/ = "\n>";  # read by FASTA record
my $seq2 = <$fh2>; 
chomp $seq2;
$seq2 =~ s/^>*.+\n//;  # remove FASTA header
$seq2 =~ s/\n//g;  # remove endlines
$seq2 =~ s/\s//g;

#DNAFULL MATRIX
my $MATCH    =  5;
my $MISMATCH = -4;
#EMBOSS_NEEDLE CONSTRAINTS
my $GAP      = -1;


my @matrix;
#MATRIX INITIALIZATION
$matrix[0][0]{score}   = 0;
$matrix[0][0]{ptr} = "none";
for(my $j = 1; $j <= length($seq1); $j++) {
    $matrix[0][$j]{score}   = $GAP * $j;
    $matrix[0][$j]{ptr} = "left";
}
for (my $i = 1; $i <= length($seq2); $i++) {
    $matrix[$i][0]{score}   = $GAP * $i;
    $matrix[$i][0]{ptr} = "up";
}

my $finalscore = 0;

#MATRIX VALUE INSERTION
for(my $i = 1; $i <= length($seq2); $i++) {
    for(my $j = 1; $j <= length($seq1); $j++) {
        my ($diagonal_score, $left_score, $up_score);

        #MATCH SCORE
        my $letter1 = substr($seq1, $j-1, 1);
        my $letter2 = substr($seq2, $i-1, 1);                            
        if ($letter1 eq $letter2) {
            $diagonal_score = $matrix[$i-1][$j-1]{score} + $MATCH;
            
        }
        else {
            $diagonal_score = $matrix[$i-1][$j-1]{score} + $MISMATCH;
            
        }

        #GAP SCORE
        $up_score   = $matrix[$i-1][$j]{score} + $GAP;
        $left_score = $matrix[$i][$j-1]{score} + $GAP;

        #BEST SCORE
        if ($diagonal_score >= $up_score) {
            if ($diagonal_score >= $left_score) {
                $matrix[$i][$j]{score}   = $diagonal_score;
                $matrix[$i][$j]{ptr} = "diagonal";
                
            }
        else {
                $matrix[$i][$j]{score}   = $left_score;
                $matrix[$i][$j]{ptr} = "left";
                
            }
        } else {
            if ($up_score >= $left_score) {
                $matrix[$i][$j]{score}   = $up_score;
                $matrix[$i][$j]{ptr} = "up";
                
            }
            else {
                $matrix[$i][$j]{score}   = $left_score;
                $matrix[$i][$j]{ptr} = "left";
                
            }
        }
    }
}


#TRACEBACK
my $al1 = "";
my $al2 = "";

#LAST CELL
my $j = length($seq1);
my $i = length($seq2);
my $ngap = 0;
my $nmat = 0;
my $nmim = 0;
while (1) {
    last if $matrix[$i][$j]{ptr} eq "none";

    if ($matrix[$i][$j]{ptr} eq "diagonal") {
        $al1 .= substr($seq1, $j-1, 1);
        $al2 .= substr($seq2, $i-1, 1);
        $nmat = $nmat + 1;       #COUNTNG NUMBER OF MATCHES
        $i--;
        $j--;
    }
    elsif ($matrix[$i][$j]{ptr} eq "left") {
        $al1 .= substr($seq1, $j-1, 1);
        $al2 .= "-";
        $ngap = $ngap + 1;         #COUNTING NUMBER OF GAPS
        $j--;
    }
    elsif ($matrix[$i][$j]{ptr} eq "up") {
        $al1 .= "-";
        $al2 .= substr($seq2, $i-1, 1);
        $nmim = $nmim + 1;          #COUNTING NUMBER OF MISMATCHES
        $i--;
    }   
    $finalscore = ($MATCH*$nmat + ($MISMATCH*$nmim) + ($GAP*$ngap)); #FINAL SCORE CALCULATION
}

$al1 = reverse $al1;
$al2 = reverse $al2;

#GENERATES A NEW ALIGNMENT FILE
my $filename = 'DNA_GLOBAL.txt';
open(FH, '>', $filename) or die $!;
print FH "#=======================================\n";
print FH "#\n";
print FH "# Aligned_sequences: 2\n";
print FH "1: $string_filename1\n";
print FH "2: $string_filename2\n";
print FH "# Matrix: EDNAFULL\n";
print FH "# GAP PENALTY: $GAP\n";
print FH "# EXTEND PENALTY: 0.0\n";
print FH "#\n";
print FH "# Score: $finalscore\n";
print FH "#\n";
print FH "#\n";
print FH "#=======================================\n";
print FH "$al1\n";
print FH "$al2\n";
print FH "\n";
print FH "#---------------------------------------\n";
print FH "#---------------------------------------\n";
close(FH);
 
__END__
 
