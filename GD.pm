package GD;

# Copyright 1995 Lincoln D. Stein.  See accompanying README file for
# usage information

require 5.00323;
require FileHandle;
require Exporter;
require DynaLoader;
require AutoLoader;
use strict;
use vars qw($VERSION @ISA @EXPORT $AUTOLOAD);
$VERSION = "1.19";

@ISA = qw(Exporter DynaLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw(
	gdBrushed
	gdDashSize
	gdMaxColors
	gdStyled
	gdStyledBrushed
	gdTiled
	gdTransparent
	gdTinyFont
	gdSmallFont
	gdMediumBoldFont
	gdLargeFont
	gdGiantFont
);
sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.  If a constant is not found then control is passed
    # to the AUTOLOAD in AutoLoader.

    my($constname);
    ($constname = $AUTOLOAD) =~ s/.*:://;
    my $val = constant($constname, @_ ? $_[0] : 0);
    if ($! != 0) {
	if ($! =~ /Invalid/) {
	    $AutoLoader::AUTOLOAD = $AUTOLOAD;
	    goto &AutoLoader::AUTOLOAD;
	}
	else {
	    my($pack,$file,$line) = caller;
	    die "Your vendor has not defined GD macro $pack\:\:$constname, used at $file line $line.\n";
	}
    }
    eval "sub $AUTOLOAD { $val }";
    goto &$AUTOLOAD;
}

bootstrap GD;

# Preloaded methods go here.
sub GD::gdSmallFont {
    return &GD::Font::Small;
}

sub GD::gdLargeFont {
    return &GD::Font::Large;
}

sub GD::gdMediumBoldFont {
    return &GD::Font::MediumBold;
}

sub GD::gdTinyFont {
    return &GD::Font::Tiny;
}

sub GD::gdGiantFont {
    return &GD::Font::Giant;
}

# This is a C callback
sub GD::Image::newFromGif {
    croak("Usage: newFromGif(class,filehandle)") unless @_==2;
    my($class,$fh) = @_;
    unless (ref $fh or ref(\$fh) eq 'GLOB') {
	my($package) = caller;
	no strict;
	$fh = *{"$package\::$fh"};
    }
    binmode($fh);
    $class->_newFromGif($fh);
}

sub GD::Image::newFromXbm {
    croak("Usage: newFromXbm(class,filehandle)") unless @_==2;
    my($class,$fh) = @_;
    unless (ref $fh or ref(\$fh) eq 'GLOB') {
	my($package) = caller;
	no strict;
	$fh = *{"$package\::$fh"};
    }
    binmode($fh);
    $class->_newFromXbm($fh);
}

sub GD::Image::newFromGd {
    croak("Usage: newFromGd(class,filehandle)") unless @_==2;
    my($class,$fh) = @_;
    unless (ref $fh or ref(\$fh) eq 'GLOB') {
	my($package) = caller;
	no strict;
	$fh = *{"$package\::$fh"};
    }
    binmode($fh);
    $class->_newFromGd($fh);
}

### The polygon object ###
# create a new polygon
sub GD::Polygon::new {
    my $class = shift;
    return bless { 'length'=>0,'points'=>[] },$class;
}

# automatic destruction of the polygon
sub GD::Polygon::DESTROY {
    my $self = shift;
    undef $self->{'points'};
}

# add an x,y vertex to the polygon
sub GD::Polygon::addPt {
    my($self,$x,$y) = @_;
    push(@{$self->{'points'}},[$x,$y]);
    $self->{'length'}++;
}

# get a vertex
sub GD::Polygon::getPt {
    my($self,$index) = @_;
    return () unless ($index>=0) && ($index<$self->{'length'});
    return @{$self->{'points'}->[$index]};
}

# change the value of a vertex
sub GD::Polygon::setPt {
    my($self,$index,$x,$y) = @_;
    unless (($index>=0) && ($index<$self->{'length'})) {
	warn "Attempt to set an undefined polygon vertex";
	return undef;
    }
    @{$self->{'points'}->[$index]} = ($x,$y);
    1;
}

# return the total number of vertices
sub GD::Polygon::length {
    my $self = shift;
    return $self->{'length'};
}

# return the array of vertices.
# each vertex is an two-member (x,y) array
sub GD::Polygon::vertices {
    my $self = shift;
    return @{$self->{'points'}};
}

# return the bounding box of the polygon
# (smallest rectangle that contains it)
sub GD::Polygon::bounds {
    my $self = shift;
    my($top,$bottom,$left,$right) = @_;
    $top =    99999999;
    $bottom =-99999999;
    $left =   99999999;
    $right = -99999999;
    my $v;
    foreach $v ($self->vertices) {
	$left = $v->[0] if $left > $v->[0];
	$right = $v->[0] if $right < $v->[0];
	$top = $v->[1] if $top > $v->[1];
	$bottom = $v->[1] if $bottom < $v->[1];
    }
    return ($left,$top,$right,$bottom);
}

# delete a vertex, returning it, just for fun
sub GD::Polygon::delete {
    my($self,$index) = @_;
    my($vertex) = splice(@{$self->{'points'}},$index,1);
    return @$vertex;
}

# translate the polygon in space by deltaX and deltaY
sub GD::Polygon::offset {
    my($self,$dh,$dv) = @_;
    my $size = $self->length;
    my($i);
    for ($i=0;$i<$size;$i++) {
	my($x,$y)=$self->getPt($i);
	$self->setPt($i,$x+$dh,$y+$dv);
    }
}

# map the polygon from sourceRect to destRect,
# translating and resizing it if necessary
sub GD::Polygon::map {
    my($self,$srcL,$srcT,$srcR,$srcB,$destL,$destT,$destR,$destB) = @_;
    my($factorV) = ($destB-$destT)/($srcB-$srcT);
    my($factorH) = ($destR-$destL)/($srcR-$srcL);
    my($vertices) = $self->length;
    my($i);
    for ($i=0;$i<$vertices;$i++) {
	my($x,$y) = $self->getPt($i);
	$x = int($destL + ($x - $srcL) * $factorH);
	$y = int($destT + ($y - $srcT) * $factorV);
	$self->setPt($i,$x,$y);
    }
}

# draws closed polygon with the specified color
sub GD::Image::polygon {
    my $self = shift;
    my($p,$c) = @_;
    $self->openPolygon($p, $c);
    $self->line( @{$p->{'points'}->[0]},
	    @{$p->{'points'}->[$p->{'length'}-1]}, $c);
}

# These routines added by Winfriend Koenig.
sub GD::Polygon::toPt {
    my($self, $dx, $dy) = @_;
    unless ($self->length > 0) {
	$self->addPt($dx,$dy);
	return;
    }
    my ($x, $y) = $self->getPt($self->length-1);
    $self->addPt($x+$dx,$y+$dy);
}

sub GD::Polygon::transform($$$$$$$) {
    # see PostScript Ref. page 154
    my($self, $a, $b, $c, $d, $tx, $ty) = @_;
    my $size = $self->length;
    for (my $i=0;$i<$size;$i++) {
	my($x,$y)=$self->getPt($i);
	$self->setPt($i, $a*$x+$c*$y+$tx, $b*$x+$d*$y+$ty);
    }
    
}

sub GD::Polygon::scale {
    my($self, $sx, $sy) = @_;
    $self->transform($sx,0,0,$sy,0,0);
}


# Autoload methods go after __END__, and are processed by the autosplit program.
1;
__END__

=head1 NAME

GD.pm - Interface to Gd Graphics Library

=head1 SYNOPSIS

    use GD;
        
    # create a new image
    $im = new GD::Image(100,100);

    # allocate some colors
    $white = $im->colorAllocate(255,255,255);
    $black = $im->colorAllocate(0,0,0);       
    $red = $im->colorAllocate(255,0,0);      
    $blue = $im->colorAllocate(0,0,255);

    # make the background transparent and interlaced
    $im->transparent($white);
    $im->interlaced('true');

    # Put a black frame around the picture
    $im->rectangle(0,0,99,99,$black);

    # Draw a blue oval
    $im->arc(50,50,95,75,0,360,$blue);

    # And fill it with red
    $im->fill(50,50,$red);

    # make sure we are writing to a binary stream
    binmode STDOUT;

    # Convert the image to GIF and print it on standard output
    print $im->gif;

=head1 DESCRIPTION

B<GD.pm> is a port of Thomas Boutell's gd graphics library (see
below).  GD allows you to create color drawings using a large number of
graphics primitives, and emit the drawings as GIF files.

GD defines the following three classes:

=over 5

=item C<GD::Image>

An image class, which holds the image data and accepts graphic
primitive method calls.

=item C<GD::Font>

A font class, which holds static font information and used for text
rendering.

=item C<GD::Polygon>

A simple polygon object, used for storing lists of vertices prior to
rendering a polygon into an image.

=back

A Simple Example:

	#!/usr/local/bin/perl

	use GD;
	
	# create a new image
	$im = new GD::Image(100,100);

	# allocate some colors
	$white = $im->colorAllocate(255,255,255);
	$black = $im->colorAllocate(0,0,0);       
	$red = $im->colorAllocate(255,0,0);      
	$blue = $im->colorAllocate(0,0,255);

	# make the background transparent and interlaced
	$im->transparent($white);
	$im->interlaced('true');

	# Put a black frame around the picture
	$im->rectangle(0,0,99,99,$black);

	# Draw a blue oval
	$im->arc(50,50,95,75,0,360,$blue);

	# And fill it with red
	$im->fill(50,50,$red);

	# make sure we are writing to a binary stream
	binmode STDOUT;

	# Convert the image to GIF and print it on standard output
	print $im->gif;

Notes:

=over 5

=item 1.
To create a new, empty image, send a new() message to GD::Image, passing
it the width and height of the image you want to create.  An image
object will be returned.  Other class methods allow you to initialize
an image from a preexisting GIF, GD or XBM file.

=item 2.
Next you will ordinarily add colors to the image's color table.
colors are added using a colorAllocate() method call.  The three
parameters in each call are the red, green and blue (rgb) triples for
the desired color.  The method returns the index of that color in the
image's color table.  You should store these indexes for later use.

=item 3.
Now you can do some drawing!  The various graphics primitives are
described below.  In this example, we do some text drawing, create an
oval, and create and draw a polygon.

=item 4.
Polygons are created with a new() message to GD::Polygon.  You can add
points to the returned polygon one at a time using the addPt() method.
The polygon can then be passed to an image for rendering.

=item 5.
When you're done drawing, you can convert the image into GIF format by
sending it a gif() message.  It will return a (potentially large)
scalar value containing the binary data for the image.  Ordinarily you
will print it out at this point or write it to a file.  To ensure
portability to platforms that differentiate between text and binary
files, be sure to call C<binmode()> on the file you are writing
the image to.

=back

=head1 Method Calls


=head2 Creating and Saving Images

=over 5

=item C<new>

C<GD::Image::new(width,height)> I<class method>

To create a new, blank image, send a new() message to the GD::Image
class.  For example:

	$myImage = new GD::Image(100,100) || die;

This will create an image that is 100 x 100 pixels wide.  If you don't
specify the dimensions, a default of 64 x 64 will be chosen. If
something goes wrong (e.g. insufficient memory), this call will
return undef.

=item C<newFromGif>

C<GD::Image::newFromGif(FILEHANDLE)> I<class method>

This will create an image from a GIF file read in through the provided
filehandle.  The filehandle must previously have been opened on a
valid GIF file or pipe.  If successful, this call will return an
initialized image which you can then manipulate as you please.  If it
fails, which usually happens if the thing at the other end of the
filehandle is not a valid GIF file, the call returns undef.  Notice
that the call doesn't automatically close the filehandle for you.
But it does call C<binmode(FILEHANDLE)> for you, on platforms where
this matters.

To get information about the size and color usage of the information,
you can call the image query methods described below.

	Example usage:

	open (GIF,"barnswallow.gif") || die;
	$myImage = newFromGif GD::Image(GIF) || die;
	close GIF;

=item C<newFromXbm>

C<GD::Image::newFromXbm(FILEHANDLE)> I<class method>

This works in exactly the same way as C<newFromGif>, but reads the
contents of an X Bitmap file:

	open (XBM,"coredump.xbm") || die;
	$myImage = newFromXbm GD::Image(XBM) || die;
	close XBM;

Note that this function also calls C<binmode(FILEHANDLE)> before
reading from the filehandle.

=item C<newFromGd>

C<GD::Image::newFromGd(FILEHANDLE)> I<class method>

This works in exactly the same way as C<newFromGif>, but reads the
contents of a GD file.  GD is Tom Boutell's disk-based storage format,
intended for the rare case when you need to read and write the image
to disk quickly.  It's not intended for regular use, because, unlike
GIF or JPEG, no image compression is performed and these files can
become B<BIG>.

	open (GDF,"godzilla.gd") || die;
	$myImage = newFromGd GD::Image(GDF) || die;
	close GDF;

Note that this function also calls C<binmode(FILEHANDLE)> before
reading from the supplied filehandle.

=item C<gif>

C<GD::Image::gif> I<object method>

This returns the image data in GIF format.  You can then print it,
pipe it to a display program, or write it to a file.  Example:

	$gif_data = $myImage->gif;
	open (DISPLAY,"| display -") || die;
	binmode DISPLAY;
	print DISPLAY $gif_data;
	close DISPLAY;

Note the use of C<binmode()>.  This is crucial for portability to
DOSish platforms.

=item C<gd>

C<GD::Image::gd> I<object method>

This returns the image data in GD format.  You can then print it,
pipe it to a display program, or write it to a file.  Example:

	binmode MYOUTFILE;
	print MYOUTFILE $myImage->gd;

=back

=head2 Color Control

=over 5

=item C<colorAllocate>

C<GD::Image::colorAllocate(red,green,blue)> I<object method>

This allocates a color with the specified red, green and blue
components and returns its index in the color table, if specified.
The first color allocated in this way becomes the image's background
color.  (255,255,255) is white (all pixels on).  (0,0,0) is black (all
pixels off).  (255,0,0) is fully saturated red.  (127,127,127) is 50%
gray.  You can find plenty of examples in /usr/X11/lib/X11/rgb.txt.

If no colors are allocated, then this function returns -1.

Example:

	$white = $myImage->colorAllocate(0,0,0); #background color
	$black = $myImage->colorAllocate(255,255,255);
	$peachpuff = $myImage->colorAllocate(255,218,185);

=item C<colorDeallocate>

C<GD::Image::colorDeallocate(colorIndex)> I<object method> 

This marks the color at the specified index as being ripe for
reallocation.  The next time colorAllocate is used, this entry will be
replaced.  You can call this method several times to deallocate
multiple colors.  There's no function result from this call.

Example:

	$myImage->colorDeallocate($peachpuff);
	$peachy = $myImage->colorAllocate(255,210,185);

=item C<colorClosest>

C<GD::Image::colorClosest(red,green,blue)> I<object method>

This returns the index of the color closest in the color table to the
red green and blue components specified.  If no colors have yet been
allocated, then this call returns -1.

Example:

	$apricot = $myImage->colorClosest(255,200,180);

=item C<colorExact>

C<GD::Image::colorExact(red,green,blue)> I<object method>

This returns the index of a color that exactly matches the specified
red green and blue components.  If such a color is not in the color
table, this call returns -1.

	$rosey = $myImage->colorExact(255,100,80);
	warn "Everything's coming up roses.\n" if $rosey >= 0;

=item C<colorsTotal>

C<GD::Image::colorsTotal)> I<object method>

This returns the total number of colors allocated in the object.

	$maxColors = $myImage->colorsTotal;

=item C<getPixel>

C<GD::Image::getPixel(x,y)> I<object method>

This returns the color table index underneath the specified
point.  It can be combined with rgb()
to obtain the rgb color underneath the pixel.

Example:

        $index = $myImage->getPixel(20,100);
        ($r,$g,$b) = $myImage->rgb($index);

=item C<rgb>

C<GD::Image::rgb(colorIndex)> I<object method>

This returns a list containing the red, green and blue components of
the specified color index.

Example:

	@RGB = $myImage->rgb($peachy);

=item C<transparent>

C<GD::Image::transparent(colorIndex)> I<object method>

This marks the color at the specified index as being transparent.
Portions of the image drawn in this color will be invisible.  This is
useful for creating paintbrushes of odd shapes, as well as for
making GIF backgrounds transparent for displaying on the Web.  Only
one color can be transparent at any time. To disable transparency, 
specify -1 for the index.  

If you call this method without any parameters, it will return the
current index of the transparent color, or -1 if none.

Example:

	open(GIF,"test.gif");
	$im = newFromGif GD::Image(GIF);
	$white = $im->colorClosest(255,255,255); # find white
	$im->transparent($white);
	binmode STDOUT;
	print $im->gif;

=back

=head2 Special Colors

GD implements a number of special colors that can be used to achieve
special effects.  They are constants defined in the GD::
namespace, but automatically exported into your namespace when the GD
module is loaded.

=over 5

=item C<setBrush>

=item C<gdBrushed>

C<GD::Image::setBrush( )> and C<GD::gdBrushed>

You can draw lines and shapes using a brush pattern.  Brushes are 
just images that you can create and manipulate in the usual way. When
you draw with them, their contents are used for the color and shape of
the lines.

To make a brushed line, you must create or load the brush first, then
assign it to the image using C<setBrush>.  You can then draw in that
with that brush using the C<gdBrushed> special color.  It's often 
useful to set the background of the brush to transparent so that 
the non-colored parts don't overwrite other parts of your image.

Example:

	# Create a brush at an angle
	$diagonal_brush = new GD::Image(5,5);
	$white = $diagonal_brush->allocateColor(255,255,255);
	$black = $diagonal_brush->allocateColor(0,0,0);
	$diagonal_brush->transparent($white);
	$diagonal_brush->line(0,4,4,0,$black); # NE diagonal

	# Set the brush
	$myImage->setBrush($diagonal_brush);
	
	# Draw a circle using the brush
	$myImage->arc(50,50,25,25,0,360,gdBrushed);

=item C<setStyle>

=item C<gdStyled>

C<GD::Image::setStyle(@colors)> and C<GD::gdStyled>

Styled lines consist of an arbitrary series of repeated colors and are
useful for generating dotted and dashed lines.  To create a styled
line, use C<setStyle> to specify a repeating series of colors.  It
accepts an array consisting of one or more color indexes.  Then
draw using the C<gdStyled> special color.  Another special color,
C<gdTransparent> can be used to introduce holes in the line, as the
example shows.

Example:

	# Set a style consisting of 4 pixels of yellow,
	# 4 pixels of blue, and a 2 pixel gap
	$myImage->setStyle($yellow,$yellow,$yellow,$yellow,
			   $blue,$blue,$blue,$blue,
			   gdTransparent,gdTransparent);
	$myImage->arc(50,50,25,25,0,360,gdStyled);

To combine the C<gdStyled> and C<gdBrushed> behaviors, you can specify
C<gdStyledBrushed>.  In this case, a pixel from the current brush
pattern is rendered wherever the color specified in setStyle() is
neither gdTransparent nor 0.

=item C<gdTiled>

Draw filled shapes and flood fills using a pattern.  The pattern is
just another image.  The image will be tiled multiple times in order
to fill the required space, creating wallpaper effects.  You must call
C<setTile> in order to define the particular tile pattern you'll use
for drawing when you specify the gdTiled color.
details.

=item C<gdStyled>

The gdStyled color is used for creating dashed and dotted lines.  A
styled line can contain any series of colors and is created using the
C<setStyled> command.

=back

=head2 Drawing Commands

=over 5

=item C<setPixel>

C<GD::Image::setPixel(x,y,color)> I<object method> 

This sets the pixel at (x,y) to the specified color index.  No value
is returned from this method.  The coordinate system starts at the
upper left at (0,0) and gets larger as you go down and to the right.
You can use a real color, or one of the special colors gdBrushed, 
gdStyled and gdStyledBrushed can be specified.

Example:

	# This assumes $peach already allocated
	$myImage->setPixel(50,50,$peach);

=item C<line>

C<GD::Image::line(x1,y1,x2,y2,color)> I<object method>

This draws a line from (x1,y1) to (x2,y2) of the specified color.  You
can use a real color, or one of the special colors gdBrushed, 
gdStyled and gdStyledBrushed.

Example:

	# Draw a diagonal line using the currently defind
	# paintbrush pattern.
	$myImage->line(0,0,150,150,gdBrushed);

=item C<dashedLine>

C<GD::Image::dashedLine(x1,y1,x2,y2,color)> I<object method>

This draws a dashed line from (x1,y1) to (x2,y2) in the specified
color.  A more powerful way to generate arbitrary dashed and dotted
lines is to use the setStyle() method described below and to draw with
the special color gdStyled.

Example:

	$myImage->dashedLine(0,0,150,150,$blue);

=item C<rectangle>

C<GD::Image::rectangle(x1,y1,x2,y2,color)> I<object method>

This draws a rectangle with the specified color.  (x1,y1) and (x2,y2)
are the upper left and lower right corners respectively.  Both real 
color indexes and the special colors gdBrushed, gdStyled and 
gdStyledBrushed are accepted.

Example:

	$myImage->rectangle(10,10,100,100,$rose);

=item C<filledRectangle>

C<GD::Image::filledRectangle(x1,y1,x2,y2,color)> I<object method>

This draws a rectangle filed with the specified color.  You can use a
real color, or the special fill color gdTiled to fill the polygon
with a pattern.

Example:

	# read in a fill pattern and set it
	open(GIF,"happyface.gif") || die;
	$tile = newFromGif GD::Image(GIF);
	$myImage->setTile($tile); 

	# draw the rectangle, filling it with the pattern
	$myImage->filledRectangle(10,10,150,200,gdTiled);

=item C<polygon>

C<GD::Image::polygon(polygon,color)> I<object method> 

This draws a polygon with the specified color.  The polygon must be
created first (see below).  The polygon must have at least three
vertices.  If the last vertex doesn't close the polygon, the method
will close it for you.  Both real color indexes and the special 
colors gdBrushed, gdStyled and gdStyledBrushed can be specified.

Example:

	$poly = new GD::Polygon;
	$poly->addPt(50,0);
	$poly->addPt(99,99);
	$poly->addPt(0,99);
	$myImage->polygon($poly,$blue);

=item C<filledPolygon>

C<GD::Image::filledPolygon(poly,color)> I<object method>

This draws a polygon filled with the specified color.  You can use a
real color, or the special fill color gdTiled to fill the polygon
with a pattern.

Example:

	# make a polygon
	$poly = new GD::Polygon;
	$poly->addPt(50,0);
	$poly->addPt(99,99);
	$poly->addPt(0,99);

	# draw the polygon, filling it with a color
	$myImage->filledPolygon($poly,$peachpuff);

=item C<arc>

C<GD::Image::arc(cx,cy,width,height,start,end,color)> I<object method>

This draws arcs and ellipses.  (cx,cy) are the center of the arc, and
(width,height) specify the width and height, respectively.  The
portion of the ellipse covered by the arc are controlled by start and
end, both of which are given in degrees from 0 to 360.  Zero is at the
top of the ellipse, and angles increase clockwise.  To specify a
complete ellipse, use 0 and 360 as the starting and ending angles.  To
draw a circle, use the same value for width and height.

You can specify a normal color or one of the special colors gdBrushed,
gdStyled, or gdStyledBrushed.

Example:

	# draw a semicircle centered at 100,100
	$myImage->arc(100,100,50,50,0,180,$blue);

=item C<fill>

C<GD::Image::fill(x,y,color)> I<object method>

This method flood-fills regions with the specified color.  The color
will spread through the image, starting at point (x,y), until it is
stopped by a pixel of a different color from the starting pixel (this
is similar to the "paintbucket" in many popular drawing toys).  You
can specify a normal color, or the special color gdTiled, to flood-fill
with patterns.

Example:

	# Draw a rectangle, and then make its interior blue
	$myImage->rectangle(10,10,100,100,$black);
	$myImage->fill(50,50,$blue);

=item C<GD::Image::fillToBorder(x,y,bordercolor,color)> I<object method>

Like C<fill>, this method flood-fills regions with the specified color,
starting at position (x,y).
However, instead of stopping when it hits a pixel of a different color
than the starting pixel, flooding will only stop when it hits the
color specified by bordercolor.  You must specify a normal indexed
color for the bordercolor.  However, you are free to use the gdTiled
color for the fill.

Example:

	# This has the same effect as the previous example
	$myImage->rectangle(10,10,100,100,$black);
	$myImage->fillToBorder(50,50,$black,$blue);

=back

=head2 Image Copying Commands

Two methods are provided for copying a rectangular region from one
image to another.  One method copies a region without resizing it.
The other allows you to stretch the region during the copy operation.

With either of these methods it is important to know that the routines
will attempt to flesh out the destination image's color table to match
the colors that are being copied from the source.  If the
destination's color table is already full, then the routines will
attempt to find the best match, with varying results.

=over 5

=item C<copy>

C<GD::Image::copy(sourceImage,dstX,dstY,srcX,srcY,width,height)> I<object method>

This is the simpler of the two copy operations, copying the specified
region from the source image to the destination image (the one
performing the method call).  (srcX,srcY) specify the upper left
corner of a rectangle in the source image, and (width,height) give the
width and height of the region to copy.  (dstX,dstY) control where in
the destination image to stamp the copy.  You can use the same image
for both the source and the destination, but the source and
destination regions must not overlap or strange things will happen.

Example:

	$myImage = new GD::Image(100,100);
	... various drawing stuff ...
	$srcImage = new GD::Image(50,50);
	... more drawing stuff ...
	# copy a 25x25 pixel region from $srcImage to
	# the rectangle starting at (10,10) in $myImage
	$myImage->copy($srcImage,10,10,0,0,25,25);

=item C<copyResized>

C<GD::Image::copyResized(sourceImage,dstX,dstY,srcX,srcY,destW,destH,srcW,srcH)> I<object method>

This method is similar to copy() but allows you to choose different
sizes for the source and destination rectangles.  The source and
destination rectangle's are specified independently by (srcW,srcH) and
(destW,destH) respectively.  copyResized() will stretch or shrink the
image to accomodate the size requirements.

Example:

	$myImage = new GD::Image(100,100);
	... various drawing stuff ...
	$srcImage = new GD::Image(50,50);
	... more drawing stuff ...
	# copy a 25x25 pixel region from $srcImage to
	# a larger rectangle starting at (10,10) in $myImage
	$myImage->copyResized($srcImage,10,10,0,0,50,50,25,25);

=back

=head2 Character and String Drawing

Gd allows you to draw characters and strings, either in normal
horizontal orientation or rotated 90 degrees.  These routines use a
GD::Font object, described in more detail below.  There are four
built-in fonts, available in global variables gdGiantFont, gdLargeFont,
gdMediumBoldFont, gdSmallFont and gdTinyFont.  Currently there is no
way of dynamically creating your own fonts.

=over 5

=item C<string>

C<GD::Image::string(font,x,y,string,color)> I<Object Method>

This method draws a string startin at position (x,y) in the specified
font and color.  Your choices of fonts are gdSmallFont, gdMediumBoldFont,
gdTinyFont, gdLargeFont and gdGiantFont.

Example:

	$myImage->string(gdSmallFont,2,10,"Peachy Keen",$peach);

=item C<stringUp>

C<GD::Image::stringUp(font,x,y,string,color)> I<Object Method>

Just like the previous call, but draws the text rotated
counterclockwise 90 degrees.

=item C<char>

=item C<charUp>

C<GD::Image::char(font,x,y,char,color)> I<Object Method>
C<GD::Image::charUp(font,x,y,char,color)> I<Object Method>

These methods draw single characters at position (x,y) in the
specified font and color.  They're carry-overs from the C interface,
where there is a distinction between characters and strings.  Perl is
insensible to such subtle distinctions.

=back

=head2 Miscellaneous Image Methods

=over 5

=item C<interlaced>

C<GD::Image::interlaced( )> C<GD::Image::interlaced(1)> I<Object method>

This method sets or queries the image's interlaced setting.  Interlace
produces a cool venetian blinds effect on certain viewers.  Provide a
true parameter to set the interlace attribute.  Provide undef to
disable it.  Call the method without parameters to find out the
current setting.

=item C<getBounds>

C<GD::Image::getBounds( )> I<Object method>

This method will return a two-member list containing the width and
height of the image.  You query but not not change the size of the
image once it's created.


=back

=head2 Polygon Methods

A few primitive polygon creation and manipulation methods are
provided.  They aren't part of the Gd library, but I thought they
might be handy to have around (they're borrowed from my qd.pl
Quickdraw library).

=over 5

=item C<new>

C<GD::Polygon::new> I<class method>

Create an empty polygon with no vertices.

	$poly = new GD::Polygon;

=item C<addPt>

C<GD::Polygon::addPt(x,y)> I<object method>

Add point (x,y) to the polygon.

	$poly->addPt(0,0);
	$poly->addPt(0,50);
	$poly->addPt(25,25);
	$myImage->fillPoly($poly,$blue);

=item C<getPt>

C<GD::Polygon::getPt(index)> I<object method>

Retrieve the point at the specified vertex.

	($x,$y) = $poly->getPt(2);

=item C<setPt>

C<GD::Polygon::setPt(index,x,y)> I<object method>

Change the value of an already existing vertex.  It is an error to set
a vertex that isn't already defined.

	$poly->setPt(2,100,100);

=item C<deletePt>

C<GD::Polygon:deletePt(index)> I<object method>

Delete the specified vertex, returning its value.

	($x,$y) = $poly->deletePt(1); 

=item C<toPt>

C<GD::Polygon::toPt(dx,dy)> I<object method>

Draw from current vertex to a new vertex, using relative 
(dx,dy) coordinates.  If this is the first point, act like
addPt().

	$poly->addPt(0,0);
	$poly->toPt(0,50);
	$poly->toPt(25,-25);
	$myImage->fillPoly($poly,$blue);


=item C<length>

C<GD::Polygon::length> I<object method>

Return the number of vertices in the polygon.

	$points = $poly->length;

=item C<vertices>

C<GD::Polygon::vertices> I<object method>

Return a list of all the verticies in the polygon object.  Each
membver of the list is a reference to an (x,y) array.

	@vertices = $poly->vertices;
	foreach $v (@vertices)
	   print join(",",@$v),"\n";
	}

=item C<bounds>

C<GD::Polygon::bounds> I<object method>

Return the smallest rectangle that completely encloses the polygon.
The return value is an array containing the (left,top,right,bottom) of
the rectangle.

	($left,$top,$right,$bottom) = $poly->bounds;

=item C<offset>

C<GD::Polygon::offset(dx,dy)> I<object method>

Offset all the vertices of the polygon by the specified horizontal
(dh) and vertical (dy) amounts.  Positive numbers move the polygon
down and to the right.

	$poly->offset(10,30);

=item C<map>

C<GD::Polygon::map(srcL,srcT,srcR,srcB,destL,dstT,dstR,dstB)> I<object method>

Map the polygon from a source rectangle to an equivalent position in a
destination rectangle, moving it and resizing it as necessary.  See
polys.pl for an example of how this works.  Both the source and
destination rectangles are given in (left,top,right,bottom)
coordinates.  For convenience, you can use the polygon's own bounding
box as the source rectangle.

	# Make the polygon really tall
	$poly->map($poly->bounds,0,0,50,200);

=item C<scale>

C<GD::Polygon::scale(sx,sy)> I<object method>

Scale each vertex of the polygon by the X and Y factors indicated by
sx and sy.  For example scale(2,2) will make the polygon twice as
large.  For best results, move the center of the polygon to position
(0,0) before you scale, then move it back to its previous position.

=item C<transform>

C<GD::Polygon::transform(sx,rx,sy,ry,tx,ty)> I<object method>

Run each vertex of the polygon through a transformation matrix, where
sx and sy are the X and Y scaling factors, rx and ry are the X and Y
rotation factors, and tx and ty are X and Y offsets.  See the Adobe
PostScript Reference, page 154 for a full explanation, or experiment.

=back

=head2 Font Utilities

Gd's support for fonts is minimal.  Basically you have access to a
half dozen for drawing, and not much else.  However, for future
compatibility, I've made the fonts into perl objects of type GD::Font
that you can query and, perhaps someday manipulate.

This distribution comes with Jan Pazdziora's bdftogd program, an
B<unsupported> utility that can help you convert BDF fonts into GD
format.

=over 5

=item C<gdSmallFont>

C<GD::Font::Small> I<constant>

This is the basic small font, "borrowed" from a well known public
domain 6x12 font.

=item C<gdLargeFont>

C<GD::Font::Large> I<constant>

This is the basic large font, "borrowed" from a well known public
domain 8x16 font.

=item C<gdMediumBoldFont>

C<GD::Font::MediumBold> I<constant>

This is a bold font intermediate in size between the small and large
fonts, borrowed from a public domain 7x13 font;

=item C<gdTinyFont>

C<GD::Font::Tiny> I<constant>

This is a tiny, almost unreadable font, 5x8 pixels wide.

=item C<gdGiantFont>

C<GD::Font::Giant> I<constant>

This is a 9x15 bold font converted by Jan Pazdziora from a sans serif
X11 font.

=item C<nchars>

C<GD::Font::nchars>	I<object method>

This returns the number of characters in the font.

	print "The large font contains ",gdLargeFont->nchars," characters\n";

=item C<offset>

C<GD::Font::offset> 	I<object method>

This returns the ASCII value of the first character in the font

=item C<width>

=item C<height>

C<GD::Font::width> C<GD::Font::height>	I<object methods>

These return the width and height of the font.

	($w,$h) = (gdLargeFont->width,gdLargeFont->height);

=back

=head1 Obtaining the C-language version of gd

libgd, the C-language version of gd, can be obtained at URL
http://www.boutell.com/gd/gd.html.  Directions for installing and
using it can be found at that site.  Please do not contact me for help
with libgd.

=head1 Copyright Information

The GD.pm interface is copyright 1995, Lincoln D. Stein.  You are free
to use it for any purpose, commercial or noncommercial, provided that
if you redistribute the source code this statement of copyright
remains attached. The gd library is covered separately under a 1994
copyright by Quest Protein Database Center, Cold Spring Harbor Labs
and Thomas Boutell.  For usage information see the gd documentation at
URL

	http://www.boutell.com/gd/gd.html

The latest versions of GD.pm are available at

  http://stein.cshl.org/WWW/software/GD

