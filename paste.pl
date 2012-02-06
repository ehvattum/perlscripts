#! /usr/bin/perl -w
#open(FIL1,"$ARGV[0]") or die "FEIL:($!)";
#open(FIL1,"$ARGV[1]") or die "FEIL:($!)";
open(FIL1,"/etc/fil1.txt") or die "FEIL:($!)";
open(FIL2,"/etc/fil2.txt") or die "FEIL:($!)";

#-----rulle ut filene i array
while(<FIL1>){
    if(!$_){
        $_ = " ";
    }else{
        chomp($_);
    }
    push(@arr1,$_);
}
close(FIL1);

while(<FIL2>){
    if(!$_){
        $_ = " ";
    }else{
        chomp($_);
    }
    push(@arr2,$_);
}
close(FIL2);

#--tester hvilket array som er størst. og skriver ut like mange linjer som arrayet.
$pusher = 0;
if(@arr2>=@arr1){
    foreach(@arr2)
    {
        print $arr2[$pusher].($arr1[$pusher] || " ")."\n";
    $pusher++;
    }
}elsif(@arr2<=@arr1)
{
    foreach(@arr1)
    {
        print $arr1[$pusher].($arr2[$pusher] || " ")."\n";
        $pusher++;
    }
}