#!/usr/local/bin/perl

use GD;

$im = new GD::Image(300,300);
$white = $im->colorAllocate(255, 255, 255);        
$black = $im->colorAllocate(0, 0, 0);
$red = $im->colorAllocate(255, 0, 0);      
$blue = $im->colorAllocate(0,0,255);
$yellow = $im->colorAllocate(255,250,205);

# Create a flat wide rectangle paintbrush
$brush = new GD::Image(10,10);
$brush->colorAllocate(255,255,255); # white
$brush->colorAllocate(0,0,0);	# black
$brush->transparent($white);	# white is transparent
$brush->filledRectangle(0,0,5,2,$black); # a black rectangle

$im->setBrush($brush);
$im->arc(100,100,100,150,0,360,gdBrushed);

$poly = new GD::Polygon;
$poly->addPt(30,30);
$poly->addPt(100,10);
$poly->addPt(190,290);
$poly->addPt(30,290);
$im->polygon($poly,gdBrushed);

$im->fill(132,62,$blue);
$im->fill(100,70,$red);
$im->fill(40,40,$yellow);
$im->interlaced(1);

# Copy the 20,20,70,70 region
# to a location at 150,150
$im->copy($im,150,150,20,20,50,50);

# Same thing, but doubling the size
$im->copyResized($im,10,200,20,20,100,100,50,50);

binmode STDOUT;

# print the image to stdout
print $im->png;

