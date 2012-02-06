#! /usr/bin/perl -w
$line = "haugerud:x:285:100:Hårek Haugerud:/iu/nexus/ud/haugerud:/bin/bash";
@arr=split(":",$line);
print "Brukeren ".$arr[0]." heter ".$arr[4]." og kjører ".$arr[$#arr].".\n"