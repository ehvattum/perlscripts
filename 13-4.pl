#!/usr/bin/perl -w
#
#Lag et Perl-script som skriver ut en liste med fullt navn på alle brukerne
#som kjører prosesser på maskinen scriptet kjører.
#Kun vanlig brukere skal listes, ikke root, daemon etc.
#
use strict; 
my %include;
my @arr;
my @users;
my @procs;
my %uniq;
#--------aapner og leser brukere som ikke har UID == 0,
#og har annet shell in /bin/bash inn %include---
open(FIL, "/etc/passwd") or die "how did you get in here?($!)";
while(<FIL>)
{
    chomp;
#    print "$_ \n";
    my @arr = split ":";
    if(($arr[2] > 1000) && ($arr[$#arr] ne "/bin/false"))
    {
        $include{$arr[0]} = $arr[4];
    }
}
#foreach my $user (keys %include){
#	print "$user : $include{$user} \n";
#	}
close (FIL);
#-------aapner og leser inn fra "ps aux". legger linjene inn i @arr-----
open (PS, "ps aux |");
foreach(<PS>)
{
#print;
    chomp;
    push(@arr, $_);
}
close (PS);
#print "@arr";
shift @arr;
foreach (@arr)
{
#print "$_ \n";
    my @ord = split;
    push(@procs, $ord[0])
    
}
#print "@procs \n";
%uniq = map { $_ => 1 } @procs;
@users = sort keys %uniq;
#print "@users \n";
foreach  my $bruker (sort keys %include)
{
#print "$bruker \n";
    foreach(@users)
    {
        if($bruker eq $_)
        {
            print "$bruker : $include{$bruker}\n";
        }
    }   
}