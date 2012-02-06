#! /usr/bin/perl -w
#sjekker og fikser om noen har annet shell en bash, untatt om det er /false
open(FIL,"<","/etc/passwd") or die "how did you get in here?($!)";
while($linje = <FIL>)
{
    push(@totar,$linje);
}
close(FIL);


for($i=0;$i < (scalar @totar);$i++)
{
    my @ord = split(":",$totar[$i]);
    
    if($ord[$#ord] ne "/bin/false")
    {
        $ord[$#ord] = "/bin/bash";
    }
        #print $ord[0];
    my $nyadd = join(":",@ord);
        #chomp($nyadd);
    $totar[$i] = $nyadd."\n";
    #print $totar[$i]."\n";
}
open(FIL,">","/etc/passwd") or die "how did you get in here?($!)";
print FIL foreach(@totar);
close(FIL);