#! /usr/bin/perl
use English; #Ellers skrives ikke det i parentes ut	 
print "Running $0 ($PROGRAM_NAME)\n";	#Running misc.pl (misc.pl)
print "Process ID: $$ ($PID)\n";	#Process ID: 563 (563)
print "OS: $^O ($OSNAME)\n";	#OS: linux (linux)
$OS = `uname`;	 
print "OS: $OS\n";	#OS: Linux
print "Perl version: $] \n"; 	#Perl version: 5.008005
print "User: $ENV{USER}\n";	#User: hh


$tid = localtime(); 	 
@tid = localtime(); 	 
print "$tid\n"; 
print "@tid\n";