#!perl

use GD;
chdir 't' || die "Couldn't change to 't' directory: $!";

$arg = shift;
if (defined($arg) && ($arg eq '--write')) {
    $WRITEREGRESS++;
}

print "1..6\n";
warn "\n";

&compare(&test1,1);
&compare(&test2,2);
&compare(&test3,3);
&compare(&test4,4);
&compare(&test5,5);
&compare(&test6,6);

sub compare {
    my($imageData,$testNo) = @_;
    local($/);
    undef $/;
    open (REGRESSFILE,"./test.out.$testNo.gif") 
	|| die "Can't open regression file './t/test.out.$testNo.gif': $!\n";
    my($regressdata) = <REGRESSFILE>;
    close REGRESSFILE;
    print $imageData eq $regressdata ? "ok $testNo" : "not ok $testNo","\n";
    warn $imageData eq $regressdata ? "ok $testNo" : "not ok $testNo","\n";
    if ($WRITEREGRESS) {
	open (REGRESSFILE,">./test.out.$testNo.gif") 
	    || die "Can't open regression file './t/test.out.$testNo.gif': $!\n";
	print REGRESSFILE $imageData;
	close REGRESSFILE;
    }
}

sub test1 {
    my($im) = new GD::Image(300,300);
    my($white) = $im->colorAllocate(255, 255, 255);        
    my($black) = $im->colorAllocate(0, 0, 0);
    my($red) = $im->colorAllocate(255, 0, 0);      
    my($green) = $im->colorAllocate(0,255,0);
    my($yellow) = $im->colorAllocate(255,250,205);
    open (TILE,"./tile.gif") || die "Can't open tile file: $!";
    my($tile) = newFromGif GD::Image(TILE);
    close TILE;
    $im->setBrush($tile);
    $im->arc(100,100,100,150,0,360,gdBrushed);
    $im->setTile($tile);
    $im->filledRectangle(150,150,250,250,gdTiled);
    $im->rectangle(150,150,250,250,$black);
    $im->setStyle($green,$green,$green,gdTransparent,$red,$red,$red,gdTransparent);
    $im->line(0,280,300,280,gdStyled);
    return $im->gif;
}

sub test2 {
    my($im) = new GD::Image(300,300);
    my($white,$black,$red,$blue,$yellow) = (
					    $im->colorAllocate(255, 255, 255),
					    $im->colorAllocate(0, 0, 0),
					    $im->colorAllocate(255, 0, 0),
					    $im->colorAllocate(0,0,255),
					    $im->colorAllocate(255,250,205)
					    );
    my($brush) = new GD::Image(10,10);
    $brush->colorAllocate(255,255,255); # white
    $brush->colorAllocate(0,0,0);	# black
    $brush->transparent($white);	# white is transparent
    $brush->filledRectangle(0,0,5,2,$black); # a black rectangle
    $im->setBrush($brush);
    $im->arc(100,100,100,150,0,360,gdBrushed);
    my($poly) = new GD::Polygon;
    $poly->addPt(30,30);
    $poly->addPt(100,10);
    $poly->addPt(190,290);
    $poly->addPt(30,290);
    $im->polygon($poly,gdBrushed);
    $im->fill(132,62,$blue);
    $im->fill(100,70,$red);
    $im->fill(40,40,$yellow);
    $im->interlaced(1);
    $im->copy($im,150,150,20,20,50,50);
    $im->copyResized($im,10,200,20,20,100,100,50,50);
    return $im->gif;
}

sub test3 {
    my($im) = new GD::Image(100,50);
    my($black,$white,$red,$blue) = 
	(
	 $im->colorAllocate(0, 0, 0),
	 $im->colorAllocate(255, 255, 255),
	 $im->colorAllocate(255, 0, 0),
	 $im->colorAllocate(0,0,255)
	 );
    $im->arc(50, 25, 98, 48, 0, 360, $white);
    $im->fill(50, 21, $red);
    return $im->gif;
}

sub test4 {
    my($im) = new GD::Image(225,180);
    my($black,$white,$red,$blue,$yellow) = 
       ($im->colorAllocate(0, 0, 0),
	$im->colorAllocate(255, 255, 255),
	$im->colorAllocate(255, 0, 0),
	$im->colorAllocate(0,0,255),
	$im->colorAllocate(255,250,205)
	);
    my($poly) = new GD::Polygon;
    $poly->addPt(0,50);
    $poly->addPt(25,25);
    $poly->addPt(50,50);
    $im->filledPolygon($poly,$blue);
    $poly->offset(100,100);
    $im->filledPolygon($poly,$red);
    $poly->map(50,50,100,100,10,10,110,60);
    $im->filledPolygon($poly,$yellow);
    $poly->map($poly->bounds,50,20,80,160);
    $im->filledPolygon($poly,$white);
    return $im->gif;
}

sub test5 {
    my($im) = new GD::Image(300,300);
    my($white,$black,$red,$blue,$yellow) = 
	(
	 $im->colorAllocate(255, 255, 255),
	 $im->colorAllocate(0, 0, 0),
	 $im->colorAllocate(255, 0, 0),
	 $im->colorAllocate(0,0,255),
	 $im->colorAllocate(255,250,205)
	 );
    $im->transparent($white);
    $im->interlaced(1);
    my($brush) = new GD::Image(10,10);
    $brush->colorAllocate(255,255,255);
    $brush->colorAllocate(0,0,0);
    $brush->transparent($white);
    $brush->filledRectangle(0,0,5,2,$black);
    $im->string(gdLargeFont,150,10,"Hello world!",$red);
    $im->string(gdSmallFont,150,28,"Goodbye cruel world!",$blue);
    $im->stringUp(gdTinyFont,280,250,"I'm climbing the wall!",$black);
    $im->charUp(gdMediumBoldFont,280,280,"Q",$black);
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
    return $im->gif;
}

sub test6 {
    my $dtor = 0.0174533;
    my $pi = 3.141592654;
    my $xsize = 500;   my $ysize = 500;   my $scale = 1;
    my $x_offset = $xsize/2;   my $y_offset = $ysize/2;
    my $im = new GD::Image($xsize,$ysize);
    my $poly = new GD::Polygon;
    my $col_bg = $im->colorAllocate(0,0,0);
    my $col_fg = $im->colorAllocate(255,255,0);
    my $col_fill = $im->colorAllocate(255,0,0);

    my $r_0 = 100;     my $theta_0 = 20;      my $spring_factor = 30;
    for($theta=0;$theta<=360;$theta++) {
	my $r = $r_0 + $spring_factor*sin(2*$pi*$theta/$theta_0);
	my $x = int($r * cos($theta*$dtor))*$scale+$x_offset;
	my $y = int($r * sin($theta*$dtor))*$scale+$y_offset;
	$poly->addPt($x,$y);
    }

    $im->filledPolygon($poly,$col_fill);            # Call gdImageFilledPolygon()

    return $im->gif;
}
