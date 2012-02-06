#! /usr/bin/perl - w
#tar en string som input, sjekker om det er en bruker med det navnet.
use strict;
sub OKbruker()
{
    if(scalar @_ == 1)
    {
        my $test = $_[0];
        open(PASS, "/etc/passwd");
        while(<PASS>)
        {
            chomp;
            if($_ =~ /^$test:.*/){
                return 1;
                last;
            }
        }
        return 0;
        close PASS;
    }else
    {
        return 0;
    }
}

unless (scalar @ARGV == 1)
{
    print "Venligst bruk ETT argument.\n";
    exit;
}
#sjekker at argumentet starter med en bokstav,
#fortsetter med bokstaver, tall eller underscores.
if($ARGV[0] =~ /^[A-Za-z]\w*/){
    print "leser...\n" if scalar @ARGV == 1;
    if (&OKbruker("$ARGV[0]"))
    {
        print "Bruker '$ARGV[0]' funnet.\n"
    }
    else
    {
        print "Bruker '$ARGV[0]' IKKE funnet.\n"
    }
}
else
{
    print "Ugyldig argument.\n"
}