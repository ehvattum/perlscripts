#!/usr/bin/perl -w
#
#Skriv et Perl-script som legger sammen og
#skriver ut total sum av verdiene VSZ og RSS fra ps aux
use strict; 
my @vsz;
my $vsz;
my @rss;
my $rss;
open (PS, "ps aux |");
foreach(<PS>){
    chomp;
    @_ = split;
    push(@vsz, $_[4]);
    push(@rss, $_[5]);
}
close (PS);
shift @vsz; #fjerner første verdi som inneholder "VSZ"
shift @rss; #fjerner første verdi som inneholder "RSS"
foreach (@vsz){
    $vsz += $_;
}
foreach (@rss){
    $rss += $_;
}
print "VSZ : $vsz\nRSS : $rss\n";