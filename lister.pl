 #! /usr/bin/perl
@ppl = qw(fred betty barney dino wilma pebbels bamm-bamm);
print "What name do you want printed?\n";
chomp(@range = <STDIN>);
foreach $number(@range){
print "You chose \"$ppl[$number]\"\n";
}