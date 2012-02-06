#!/usr/bin/perl -w
open(FIL,"<","/etc/passwd") or die "how did you get in here?($!)";
@arr = <FIL>;
foreach $line (sort @arr){
@out= split(":",$line);
print "$out[0] $out[4]\n";
}
close(FIL);