#!/usr/local/bin/perl

use GD;

$im = new GD::Image(300,300);

# allocate white
$white = $im->colorAllocate(255, 255, 255);        

# allocate black
$black = $im->colorAllocate(0, 0, 0);

# allocate red
$red = $im->colorAllocate(255, 0, 0);      

# allocate green
$green = $im->colorAllocate(0,255,0);

# allocate yellow
$yellow = $im->colorAllocate(255,250,205);

# Get an image from a png file
open (TILE,"./tile.png") || die;
$tile = newFromPng GD::Image(TILE);
close TILE;

# use it as a paintbrush
$im->setBrush($tile);
$im->arc(100,100,100,150,0,360,gdBrushed);

# use it as a tiling pattern to fill a rectangle
$im->setTile($tile);
$im->filledRectangle(150,150,250,250,gdTiled);
$im->rectangle(150,150,250,250,$black);

# Draw a dotted line 
$im->setStyle($green,$green,$green,gdTransparent,$red,$red,$red,gdTransparent);
$im->line(0,280,300,280,gdStyled);

binmode STDOUT;

# print the image to stdout
print $im->png;

