#!/usr/bin/perl

use strict;
use warnings;

use FileHandle;
use FindBin qw($Bin);
use lib "$Bin/../blib/lib","$Bin/../blib/arch","$Bin/../lib";
use constant FONT=>"$Bin/test_data/Generic.ttf";
use constant IMAGE_TESTS => 7;
use Test::More tests => 11;
use IO::Dir;

use_ok('GD',':DEFAULT',':cmp');
use_ok('GD::Simple');

chdir $Bin || die "Couldn't change to 't' directory: $!";
my $images = './test_data/images';

my $arg = shift;
write_regression_tests() if (defined $arg && $arg eq '--write');
run_image_regression_tests();
run_round_trip_test();

exit 0;

sub write_regression_tests {
    warn "Writing regression files...";
    for my $suffix ('gd2','gd','png','gif','jpeg') {
	my $op = ucfirst $suffix;
	unless (GD::Image->can("newFrom$op")) {
	    print "# not writing $op regression test: not supported\n";
	    next;
	}
	for my $t (1..IMAGE_TESTS) {
	    my $data = eval "test${t}('$suffix')" or die $@;
	    write_regression_test($data,$t,$suffix);
	}
    }
}

sub write_regression_test {
    my ($data,$test,$suffix) = @_;
    my $base = "$images/t${test}";
    mkdir $base unless -d $base;
    my $count = 0;
    my $filename = sprintf ("$base/$test-%02d.$suffix",$count);
    while (-e $filename) {
	$count++;
	$filename = sprintf ("$base/$test-%02d.$suffix",$count);
    }
    open my $fh,'>',$filename or die "$filename: $!";
    binmode($fh);
    print $fh $data->$suffix;
    close $fh or die "$filename: $!";
}

sub compare {
    my ($data,$test,$suffix) = @_;
    my @files_to_match = glob("$images/t${test}/*.$suffix");

    my $matched;
    for my $file (@files_to_match) {
	$matched ||= compare_image($data,$file,$suffix);
    }
    return $matched;
}

sub compare_image {
    my ($data1,$file,$suffix) = @_;
    my $op    = ucfirst($suffix);
    my $method = "newFrom${op}";
    my $data2 = eval {GD::Image->$method($file)} or die $@;
    return ! $data1->compare($data2) & GD_CMP_IMAGE();
}

sub test1 {
    my $suffix = shift;
    my $im     = new GD::Image(300,300);
    my($white) = $im->colorAllocate(255, 255, 255);
    my($black) = $im->colorAllocate(0, 0, 0);
    my($red) = $im->colorAllocate(255, 0, 0);
    my($green) = $im->colorAllocate(0,255,0);
    my($yellow) = $im->colorAllocate(255,250,205);
    my $fn = "./test_data/tile.$suffix";
    my $op    = ucfirst($suffix);
    my $tile = eval "GD::Image->newFrom${op}('$fn')" or die $@;
    return unless $tile;
    $im->setBrush($tile);
    $im->arc(100,100,100,150,0,360,gdBrushed());
    $im->setTile($tile);
    $im->filledRectangle(150,150,250,250,gdTiled());
    $im->rectangle(150,150,250,250,$black);
    $im->setStyle($green,$green,$green,gdTransparent(),$red,$red,$red,gdTransparent());
    $im->line(0,280,300,280,gdStyled());
    return $im;
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
    $im->arc(100,100,100,150,0,360,gdBrushed());
    my($poly) = new GD::Polygon;
    $poly->addPt(30,30);
    $poly->addPt(100,10);
    $poly->addPt(190,290);
    $poly->addPt(30,290);
    $im->polygon($poly,gdBrushed());
    $im->fill(132,62,$blue);
    $im->fill(100,70,$red);
    $im->fill(40,40,$yellow);
    $im->copy($im,150,150,20,20,50,50);
    $im->copyResized($im,10,200,20,20,100,100,50,50);
    return $im;
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
    return $im;
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
    return $im;
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
    my($brush) = new GD::Image(10,10);
    $brush->colorAllocate(255,255,255);
    $brush->colorAllocate(0,0,0);
    $brush->transparent($white);
    $brush->filledRectangle(0,0,5,2,$black);
    $im->string(gdLargeFont(),150,10,"Hello world!",$red);
    $im->string(gdSmallFont(),150,28,"Goodbye cruel world!",$blue);
    $im->stringUp(gdTinyFont(),280,250,"I'm climbing the wall!",$black);
    $im->charUp(gdMediumBoldFont(),280,280,"Q",$black);
    $im->setBrush($brush);
    $im->arc(100,100,100,150,0,360,gdBrushed());
    my $poly = new GD::Polygon;
    $poly->addPt(30,30);
    $poly->addPt(100,10);
    $poly->addPt(190,290);
    $poly->addPt(30,290);
    $im->polygon($poly,gdBrushed());
    $im->fill(132,62,$blue);
    $im->fill(100,70,$red);
    $im->fill(40,40,$yellow);
    return $im;
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
    for(my $theta=0;$theta<=360;$theta++) {
	my $r = $r_0 + $spring_factor*sin(2*$pi*$theta/$theta_0);
	my $x = int($r * cos($theta*$dtor))*$scale+$x_offset;
	my $y = int($r * sin($theta*$dtor))*$scale+$y_offset;
	$poly->addPt($x,$y);
    }

    $im->filledPolygon($poly,$col_fill);            # Call gdImageFilledPolygon()
    return $im;
}

sub test7 {
  my $im = GD::Image->new(400,250);
  if (!$im) { printf("Test7: no image");};
  my($white,$black,$red,$blue,$yellow) = 
    (
     $im->colorAllocate(255, 255, 255),
     $im->colorAllocate(0, 0, 0),
     $im->colorAllocate(255, 0, 0),
     $im->colorAllocate(0,0,255),
     $im->colorAllocate(255,250,205)
    );

  # Some TTFs
  $im->stringFT($black,FONT,12.0,0.0,20,20,"Hello world!") || warn $@;
  $im->stringFT($red,FONT,14.0,0.0,20,80,"Hello world!") || warn $@;
  $im->stringFT($blue,FONT,30.0,-0.5,60,100,"Goodbye cruel world!") || warn $@;
  return $im;
}

sub run_image_regression_tests {
    my $suffix = $ENV{GDIMAGETYPE} || 'gd2';
    print STDERR "# Testing using $suffix support.\n";
    for my $t (1..IMAGE_TESTS) {
	my $gd   = eval "test${t}('$suffix')";
	if (!$gd) {
	    fail("unable to generate comparison image for test $t: $@");
	} else {
	    ok(compare($gd,$t,$suffix),"image comparison test $t");
	}
    }
}

sub run_round_trip_test {
    my $image  = GD::Image->new(300,300);
    $image->colorAllocate(255,255,255);
    $image->colorAllocate(0,0,0);
    $image->colorAllocate(255,0,0);
    $image->rectangle(0,0,300,300,0);
    $image->filledRectangle(10,10,50,50,2);
    my $gd = $image->gd;
    my $image2 = GD::Image->newFromGdData($gd);
    ok(!$image->compare($image2) & GD_CMP_IMAGE(),'round trip gd');
    my $gd2 = $image->gd2;
    $image2 = GD::Image->newFromGd2Data($gd2);
    ok(!$image->compare($image2) & GD_CMP_IMAGE(),'round trip gd2');
}

