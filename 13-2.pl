#!/usr/bin/perl -w
open(FIL,"<","/etc/passwd") or die "how did you get in here?($!)";
while(<FIL>)
{
    chomp;
    @arr = split(":");
    if($arr[0] == 0){
        print "Bruker \"$arr[0]\" med navn \"$arr[4]\" har root-rettigheter \n";
    }
}
close(FIL);
