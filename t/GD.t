#!/usr/bin/perl -w

use lib './blib/lib','./blib/arch','../blib/lib','../blib/arch';
use FileHandle;
use FindBin qw($Bin);
use constant FONT=>"$Bin/Generic.ttf";

my $loaded;
BEGIN {$| = 1; $loaded = 0; print "1..10\n"; }
END {print "not ok 1\n" unless $loaded;}

use GD qw(:DEFAULT GD_CMP_IMAGE);
$loaded++;
print "ok 1\n";

chdir 't' || die "Couldn't change to 't' directory: $!";

$arg = shift;

if (defined $arg && $arg eq '--write') {
  warn "Writing regression files...";
  compare(&test2,2,'write');
  compare(&test3,3,'write');
  compare(&test4,4,'write');
  compare(&test5,5,'write');
  compare(&test6,6,'write');
  compare(&test7,7,'write');
  compare(&test8,8,'write');
  compare(&test9('frog.xpm'),9,'write');
  compare(&test10('frog.jpg'),10,'write');
}

compare(test2(),2);
compare(test3(),3);
compare(test4(),4);
compare(test5(),5);
compare(test6(),6);
compare(test7(),7);

if (GD::Image->stringTTF(0,FONT,12.0,0.0,20,20,"Hello world!")) {
  multicompare(test8(),8,undef);
} elsif ($@ =~/not built with .+Type font support/) {
  print "ok ",8," # Skip, no FreeType font support\n";
} else {
  print "not ok ",8,"\n";
}

if (GD::Image->newFromXpm('frog.xpm')) {
  compare(test9('frog.xpm'),9);
} elsif ($@ =~/not built with xpm support/) {
  print "ok ",9," # Skip, no XPM support\n";
} else {
  print "not ok ",9,"\n";
}

if (GD::Image->newFromJpeg('frog.jpg')) {
  compare(test10('frog.jpg'),10);
} elsif ($@ =~/not built with jpeg support/) {
  print "ok ",10," # Skip, no JPEG support\n";
} else {
  print "not ok ",10,"\n";
}

sub compare {
    my($imageData,$testNo,$fht) = @_;
    local($/);
    undef $/;
    my $ok = $testNo;
    my $regressdata;
    my $file = ($^O eq 'VMS')? "test.out_".$testNo."_png" : "./test.out.$testNo.png";
    if (defined $fht and $fht eq 'write') {
      open (REGRESSFILE,">$file")
	|| die "Can't open regression file '$file': $!\n";
      binmode REGRESSFILE;
      print REGRESSFILE $imageData;
      close REGRESSFILE;
    } else {
      open (REGRESSFILE,"./$file")
        || die "Can't open regression file './t/$file': $!\n";
      binmode REGRESSFILE;
      $regressdata = <REGRESSFILE>;
      close REGRESSFILE;
      print $imageData eq $regressdata ? "ok $ok" : "not ok $ok","\n";
    }
}

sub multicompare {
  my($imageData,$testNo,$fht,@alt) = @_;
  local $/ = undef;
  my $ok = $testNo;
  my $regressdata;
  my $file = ($^O eq 'VMS')? "test.out_".$testNo."_png" : "test.out.$testNo.png";
  if (defined $fht and $fht eq 'write') {
    die "Not implemented with multicompare";
  } else {
    my $equal;
    opendir(DIR,'.');
  ENTRY:
    while (my $entry =readdir(DIR)) {
      next unless $entry =~ /^$file(-\d+)?/;
      open (REGRESSFILE,$entry)
	|| die "Can't open regression file './t/$entry': $!\n";
      binmode REGRESSFILE;
      $regressdata = <REGRESSFILE>;
      close REGRESSFILE;
      if ($imageData eq $regressdata) {
	$equal = 1;
	last ENTRY;
      }
    }
    closedir DIR;
    print $equal ? "ok $ok" : "not ok $ok","\n";
  }
}

sub test2 {
    my($im) = new GD::Image(300,300);
    my($white) = $im->colorAllocate(255, 255, 255);        
    my($black) = $im->colorAllocate(0, 0, 0);
    my($red) = $im->colorAllocate(255, 0, 0);      
    my($green) = $im->colorAllocate(0,255,0);
    my($yellow) = $im->colorAllocate(255,250,205);
    open (TILE,"./tile.png") || die "Can't open tile file: $!";
    my($tile) = newFromPng GD::Image(TILE);
    close TILE;
    $im->setBrush($tile);
    $im->arc(100,100,100,150,0,360,gdBrushed);
    $im->setTile($tile);
    $im->filledRectangle(150,150,250,250,gdTiled);
    $im->rectangle(150,150,250,250,$black);
    $im->setStyle($green,$green,$green,gdTransparent,$red,$red,$red,gdTransparent);
    $im->line(0,280,300,280,gdStyled);
    return $im->png;
}

sub test3 {
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
    return $im->png;
}

sub test4 {
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
    return $im->png;
}

sub test5 {
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
    return $im->png;
}

sub test6 {
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
    return $im->png;
}

sub test7 {
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

    return $im->png;
}

sub test8 {
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
  $im->png;
}

sub test9 {
  my $fn = shift;
  my $im = GD::Image->newFromXpm($fn);
  $im->png;
}

sub test10 {
  my $fn = shift;
  my $im = GD::Image->newFromJpeg($fn);
  $im->png;
}

# not used
sub test11 {
  my $fn = shift;
  my $im = GD::Image->newFromGif($fn);
  $im->gif;
}

