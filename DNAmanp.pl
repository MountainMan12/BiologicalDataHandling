#!/usr/bin/perl
use strict;
use warnings;

my $string_filename = "testQ2.txt";  
open(my $fh, $string_filename) or die("Couldn't read file $string_filename\n");  
my $seq = <$fh>; 
chomp $seq;
print "The original DNA sequence is:\n";
print $seq;
print "\n\n";
print "---------------FINDING REVERSE OF A DNA SEQUENCE--------------------";
my $reverse_seq = reverse $seq;
print "The reversed DNA sequence is:\n";
print $reverse_seq;

print "\n\n";
print "---------------FINDING COMPLEMENT OF A DNA SEQUENCE--------------------\n";
my %map = (
    a => 't',
    t => 'a',
    g => 'c',
    c => 'g',
);
my $chars = join '', keys %map;
$seq =~ s/([$chars])/$map{$1}/g;
print "The complement of the DNA sequence is:\n";
print $seq;
print "\n\n";

print "---------------FINDING REVERSE COMPLEMENT OF A DNA SEQUENCE--------------------\n";
$reverse_seq =~ s/([$chars])/$map{$1}/g;
print "The Reverse complement of the DNA sequence is:\n";
print $reverse_seq;

close $fh;
exit;

