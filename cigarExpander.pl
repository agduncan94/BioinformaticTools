#!/usr/bin/perl

# Given a CIGAR string as input, will return an expanded string
# ./cigarExpander.pl 90M5I5M
# Output: MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMIIIIIMMMMM

use strict;
use warnings;

my $InputString = $ARGV[0];
chomp($InputString);

# Copy this function
# Pre: CIGAR String
# Post: Expanded CIGAR String
sub ExpandCIGAR{
	my $Input = $_[0];
	my @CigarValues;
	my $CigarString;
	my $CigarNum;
	my $PendingString;

	for ($InputString =~ /\d+[a-zA-Z]/g) {
       		$PendingString = "";
        	$CigarNum = substr($_, 0, -1);
        	$CigarString = substr($_, -1);
        	for (my $i=0; $i < $CigarNum; $i++) {
        	        $PendingString .= $CigarString;
        	}
        	push @CigarValues, $PendingString;
	}

	foreach my $n (@CigarValues) {
       		print "$n";
	}
	print "\n";

}

ExpandCIGAR($InputString);
