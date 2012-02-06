#! /usr/bin/perl -w
open (PASSWD,"/etc/passwd");
while ($line = <PASSWD>)
{
    @array = split(":",$line);
    $navneliste{$array[0]} = $array[4];
}
close(PASSWD);

foreach $bruker (sort keys %navneliste)
{
    print  "$bruker $navneliste{$bruker}\n";
    # Skriver alfabetisk sortert liste over alle brukere
}