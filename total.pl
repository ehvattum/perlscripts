#! /usr/bin/perl -w -s
use 5.010;
sub total{
    my $sum;
    foreach(@_){
         $sum += $_;
    }
    $sum;
}
my $user_total = &total(1..1000);
print "The total of those numbers is $user_total. \n";

#my @fred = qw{ 1 3 5 7 9 };
#my $fred_total = &total(@fred);
#print "The total of \@fred is $fred_total.\n";
#print "Enter some numbers on separate lines: \n";
#my $user_total = &total(<STDIN>);
#print "The total of those numbers is $user_total. \n";