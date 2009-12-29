#!/usr/bin/perl

use strict;
use warnings;

BEGIN {
    use lib '../lib';
}

use Win32::WMIC;

my $wmic = Win32::WMIC->new();
my $wql  = "process list brief";
my $csv  = $wmic->query($wql)->data;
my $data = $wmic->parse({ name => { -like => ['w%'] } });

print "Found ", scalar(@$data), " processes running that start with the letter `w`.\n\n";
print "$_->{name}\n" for @{$data};