#! /usr/bin/perl - w
#sjekker hvor mange blanke linjer det er i en fil
use strict;
my $spaces;
unless (scalar @ARGV == 1)
{
    print "Venligst bruk ETT argument.\n";
    exit;
}
open(FIL, $ARGV[0]) or die "kan ikke lese fra filen\n";
while(<FIL>)
{
    chomp;
    if(/^\s*$/)
    {
        $spaces++;
    }
}
if ($spaces)
{
    print "\$spaces: $spaces\n"
}
else
{
    print "ingen whitespace charachters\n";
}