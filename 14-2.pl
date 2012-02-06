#! /usr/bin/perl -w
#grep
use strict;
unless   (scalar @ARGV == 2)
{
    print "Please provide 2 arguments.\n";
}else
{
open (FIL, $ARGV[1]);
while(<FIL>)
{
    chomp;
    if($_ =~ $ARGV[0])
    {
        print "$_ \n";
    }
}
close FIL;
}