#!/usr/local/bin/perl

use GD;

$im = new GD::Image(225,180);
$black = $im->colorAllocate(0, 0, 0);
$white = $im->colorAllocate(255, 255, 255);        
$red = $im->colorAllocate(255, 0, 0);      
$blue = $im->colorAllocate(0,0,255);
$yellow = $im->colorAllocate(255,250,205);

# Create a triangle
$poly = new GD::Polygon;
$poly->addPt(0,50);
$poly->addPt(25,25);
$poly->addPt(50,50);
$im->filledPolygon($poly,$blue);

# offset it down and to the right
$poly->offset(100,100);
$im->filledPolygon($poly,$red);

# make it twice as wide and move it upward a bit
$poly->map(50,50,100,100,10,10,110,60);
$im->filledPolygon($poly,$yellow);

# make it real tall
$poly->map($poly->bounds,50,20,80,160);
$im->filledPolygon($poly,$white);

binmode STDOUT;

# print the image to stdout
print $im->png;

