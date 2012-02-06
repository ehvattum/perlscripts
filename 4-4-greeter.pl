#! /usr/bin/perl -w -s
use 5.010;
sub greet{
    state @namelist;
    my $name = shift;
    print "Hi there $name! ";
    if( @namelist ){
        print "i've seem : @namelist\n";
    }else{
        print "You are the first one here!\n";
    }
    push @namelist, $name;
}

greet( 'Fred' );
greet( 'Barney' );
greet( 'Wilma' );
greet( 'Betty' );
