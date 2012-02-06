#! /usr/bin/perl -w

open(FILA, "ascii_lister.pl");
while($line = <FILA>){
    @arr=split(" ", $line);
    $bruker=$arr[1];
    $halvor=$arr[3];
    $trond=$arr[4];
    $fulltnavn{$bruker}=$trond;
}
close(FILA);
foreach $user (sort keys %fulltnavn)
{
    print "user FN: $fulltnavn[$user]\n";
}