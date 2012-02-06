#! usr/bin/perl -w
$in = <STDIN>;
$pi = 3.141592654;
if ($in >=0){
$return = 2*$pi*$in;
}
else{
    $return = 0;
}
print $return;
