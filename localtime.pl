#! /usr/bin/perl -w
#Tidspunkt: fredag 6/9 2000 kl. 01:20:01
#    #  0    1    2     3     4    5     6     7     8
#    ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)

@tid = localtime();
@dager = qw(Sondag Mandag Tirsdag Onsdag Torsdag Fredag Lordag);
$ukedag=$dager[$tid[6]];

print "Tidspunkt: ".$ukedag." ".$tid[3]."/".($tid[4]+1)." ".($tid[5]+1900)." kl. ";
printf "%02d:%02d:%02d \n" ,$tid[2], $tid[1], $tid[0];