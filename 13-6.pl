#! /usr/bin/perl
#script som tester om noen av passord og brukernavnene i "pass_file
#stemmer med noen av linjene i "shadow". lager passord av passorddelen
#og legger til salt
open(SHADOW,"/etc/shadow");
while($line = <SHADOW>)
  {
      chomp($line);
      @shadowArray = split(":",$line);
      $name = $shadowArray[0]; 
      $hash = $shadowArray[1]; 
      @array = split("",$hash);
      $salt = "$array[0]$array[1]";
      open(FIL,"/etc/pass_file");
      while($passLine = <FIL>)
      {
      chomp($passLine);
      ($name,$pass) = split(" ",$passLine);
      $streng = crypt($pass,$salt);
      if ($streng eq $hash)
      {
          print "Password for user $name is $pass\n";
      }
      }
      close(FIL);
  }
close(SHADOW);