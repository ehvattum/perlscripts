#! /usr/bin/perl
#Vær oppmerksom på at etter fork()-kallet er det to
#uavhengige prosesser som kjører den samme koden!
#Eneste forskjell er at $pid er forskjellig.
#
#Modifiser denne koden og lag et Perl-script som ved hjelp av
#fork() lager en child-prosess.
#Denne prosessen skal skrive ut sin egen og parent-prosessen sin PID,
#sove i 5 sekunder (sleep(5);) og deretter ved hjelp av fork()
#lage en ny child-prosess. Denne prosessen blir "grandchild" av den
#opprinnelige prosessen. Grandchild-prosessen skal skrive ut
#sin egen og parent-prosessen sin PID, sove i 5 sekunder og deretter avslutte.
#Alle prosesser skal vente på sine children og si ifra når de avslutter.
print "\n";
print "Fork demo! \nI am the parent (pid =  $$) \n";
sleep(2);
$pid = fork(); # Prosessen lager n� en ny uavhengig prosess
               # I den nye barne-prosessen er $pid = 0
               # I foreldre prosessen er $pid = barnets PID
if ($pid == 0)
  {
    $ppid = getppid();
    print "       I am the child (cid = $$) of parent with pid = $ppid.\n";
    print "       Here variable \$pid is $pid.\n";
    sleep(5);
    $pid = fork();
    if ($pid == 0)
    {
        $ppid = getppid();
        print "            I am the child (cid = $$) of parent with pid = $ppid.\n";
        print "            Here variable \$pid is $pid.\n";
        sleep(5);
        print "            This is the grandchild process exiting.\n";
        exit(0);
    }
    else
    {
    sleep(3);
    print "Parent $$ waiting for child $pid here...\n";
    wait;
    }
    print "       This is the child process exiting.\n";
    exit(0);
  }
else
  {
    sleep(2);
    print "Parent $$ waiting for child $pid here...\n";
    wait;
    print "Child finished, Parent quitting too !\n";
  }