#! /usr/bin/perl -w

open (PASSWD,"/etc/passwd");
while ($line = <PASSWD>)
  {
    @array = split(":",$line);
    $bruker = $array[0];
    $Navn = $array[4];
    $Navneliste{$bruker} = $Navn;
  }
close(PASSWD);

foreach $bruker (sort keys %Navneliste)
  {
    print "$bruker $Navneliste{$bruker}\n"; 
    # Skriver alfabetisk sortert liste over alle brukere
  }