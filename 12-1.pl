#! /usr/bin/perl -w
open(FIL,"/etc/passwd") or die "how did you get in here?($!)";
foreach(<FIL>){
   @arr = split(":");
   if($arr[3] > 1000){
      print "UID: $arr[3] $arr[0] : $arr[4]\n";
   }
}
close(FIL);
