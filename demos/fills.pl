#!/usr/local/bin/perl

use GD;

$im = new GD::Image(100,50);

# allocate black -- this will be our background
$black = $im->colorAllocate(0, 0, 0);

# allocate white
$white = $im->colorAllocate(255, 255, 255);        

# allocate red
$red = $im->colorAllocate(255, 0, 0);      

# allocate blue
$blue = $im->colorAllocate(0,0,255);

#Inscribe an ellipse in the image
$im->arc(50, 25, 98, 48, 0, 360, $white);

# Flood-fill the ellipse. Fill color is red, and will replace the
# black interior of the ellipse
$im->fill(50, 21, $red);

binmode STDOUT;

# print the image to stdout
print $im->png;

