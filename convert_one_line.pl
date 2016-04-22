#!/usr/bin/perl
use strict;
use warnings;
use Library;

my ($infile, $outfile) = @ARGV;
Library::one_line($infile, $outfile);
