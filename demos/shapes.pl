#!/usr/local/bin/perl

use GD;

$im = new GD::Image(300,300);
($white,$black,$red,$blue,$yellow) = 
    (
     $im->colorAllocate(255, 255, 255),
     $im->colorAllocate(0, 0, 0),
     $im->colorAllocate(255, 0, 0),
     $im->colorAllocate(0,0,255),
     $im->colorAllocate(255,250,205)
     );
$im->transparent($white);	# white color is transparent
$im->interlaced(1);		# cool venetian blinds effect

# Create a flat wide rectangle paintbrush
$brush = new GD::Image(10,10);
$brush->colorAllocate(255,255,255); # white
$brush->colorAllocate(0,0,0);	# black
$brush->transparent($white);	# white is transparent
$brush->filledRectangle(0,0,5,2,$black); # a black rectangle

# Draw a friendly title (ha!)
$im->string(gdLargeFont,150,10,"Hello world!",$red);
$im->string(gdSmallFont,150,28,"Goodbye cruel world!",$blue);
$im->stringUp(gdTinyFont,280,250,"I'm climbing the wall!",$black);
$im->charUp(gdMediumBoldFont,280,280,"Q",$black);

# Draw an oval
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

binmode STDOUT;

# print the image to stdout
print $im->png;

