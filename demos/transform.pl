#!/usr/local/bin/perl

use GD;
use Math::Trig;

# test scaling, translation, transformation
$im = new GD::Image(380,225);
$black = $im->colorAllocate(0, 0, 0);
$white = $im->colorAllocate(255, 255, 255);        
$red = $im->colorAllocate(255, 0, 0);      
$blue = $im->colorAllocate(0,0,255);
$yellow = $im->colorAllocate(255,250,205);

# Create a triangle
$poly = new GD::Polygon;
$poly->toPt(50,50);
$poly->toPt(100,0);
$poly->toPt(-50,50);
$poly->toPt(-50,-50);

$im->filledPolygon($poly,$yellow);

# Stretch it a bit
#$poly->scale(1.8,1.0);
#$poly->offset(100,0);
#$im->filledPolygon($poly,$red);

# Rotate it (scale by 0.5,0.2, rotate by 0,1, move by -25,50)
#$poly->transform(0.5,0.2, 0,1, -25,50);
#$poly->scale(1.5);
$poly->rotate(deg2rad(45));
$poly->offset(50,100);
warn "blue: [", join(' ',$poly->bounds), "]";
$im->filledPolygon($poly,$blue);

$poly->rotate(deg2rad(-90));
$poly->offset(180,0);
warn "red:  [", join(' ',$poly->bounds), "]";
$im->filledPolygon($poly,$red);

binmode STDOUT;

print $im->png;
