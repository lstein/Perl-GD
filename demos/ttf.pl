#!/usr/local/bin/perl

use lib '../blib/lib','../blib/arch';
use GD 1.20;
use constant font => '../t/Generic.ttf';

$im = new GD::Image(400,250);


warn $GD::VERSION;

($white,$black,$red,$blue,$yellow) = 
    (
     $im->colorAllocate(255, 255, 255),
     $im->colorAllocate(0, 0, 0),
     $im->colorAllocate(255, 0, 0),
     $im->colorAllocate(0,0,255),
     $im->colorAllocate(255,250,205)
     );
$im->interlaced(1);		# cool venetian blinds effect

# Some TTFs
$im->stringTTF($black,font,12.0,0.0,20,20,"Hello world!") || die $@;
$im->stringTTF($red,font,14.0,0.0,20,80,"Hello world!")|| die $@;;
$im->stringTTF($blue,font,30.0,-0.5,60,100,"Goodbye cruel world!")|| die $@;;

binmode STDOUT;

# print the image to stdout
print $im->png;

