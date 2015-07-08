#!/usr/bin/perl

# given a Cigar string (assumed that format is correct), will split it line by line at each character

use strict;
use warnings;

my $InputString = $ARGV[0];
chomp($InputString);

for ($InputString =~ /\d+[A-Z]/g) {
  print "$_\n";
}
