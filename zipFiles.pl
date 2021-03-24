#!/usr/bin/perl
# zipFiles.pl
# PURPOSE: Zip Files in a directory
#          
# INPUTS: 
#  -i: inDir - an input directory containing files with which to rename.
# OUTPUTS:
#  zips all files in a directory

use warnings;
use strict;
use Getopt::Long;

my $inDir;

GetOptions(
    "i:s" => \$inDir,
);

opendir(DH, $inDir) or die ("renameFiles.pl: Can't open input directory at ${inDir}. Please check the -i option\n");
my @files = readdir(DH);
closedir(DH);

foreach my $file (@files){

    my $cmd = "gzip ${inDir}${file}";
    print $cmd . "\n";
    `$cmd`;

}
