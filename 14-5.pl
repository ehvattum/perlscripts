#! /usr/bin/perl - w
#Regulære uttrykk er nyttige i mange sammenhenger og veldig
#fleksible når man ønsker å skrive programmer som leter etter et spesielt
#innhold eller spesielle mønstre i tekstfiler. Lag et regulært uttrykk som
#matcher alle linjer av typen $line = "Time 3 Proc 4";
use strict;
my $line = "Time 3 Proc 4"; 
my($en, $to) = ($line =~ /(\d+)/g);
print "\$en: $en\t\$to: $to\n";