#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 12;

use_ok('GD');

# FIXME GD, GD2 broken in some configs: gdImageCreateFromGd2Ptr error 
#SKIP: {
#  skip "No GD support", 1 unless defined &GD::Image::newFromGd;
#  my $gd = GD::Image->new("t/test_data/tile.gd");
#  ok defined($gd), "gd detected";
#}
#SKIP: {
#  skip "No GD2 support", 1 unless defined &GD::Image::newFromGd2;
#  my $gd2 = GD::Image->new("t/test_data/tile.gd2");
#  ok defined($gd2), "gd2 detected";
#}
SKIP: {
  skip "No GIF support", 1 unless defined &GD::Image::newFromGif;
  my $gif = GD::Image->new("t/test_data/tile.gif");
  ok defined($gif), "gif detected";
}
SKIP: {
  skip "No PNG support", 1 unless defined &GD::Image::newFromPng;
  my $png = GD::Image->new("t/test_data/tile.png");
  ok defined($png), "png detected";
}
SKIP: {
  skip "No JPEG support", 1 unless defined &GD::Image::newFromJpeg;
  my $jpeg = GD::Image->new("t/test_data/tile.jpeg");
  ok defined($jpeg), "jpeg detected";
}
SKIP: {
  skip "No TIFF support", 1 unless defined &GD::Image::newFromTiff;
  my $tiff = GD::Image->new("t/test_data/tile.tiff");
  ok defined($tiff), "tiff detected";
}
SKIP: {
  skip "No AVIF support", 1 unless defined &GD::Image::newFromAvif;
  my $avif = GD::Image->new("t/test_data/tile.avif");
  ok defined($avif), "avif detected";
}
SKIP: {
  skip "No HEIF support", 1 unless defined &GD::Image::newFromHeif;
  my $heif = GD::Image->new("t/test_data/tile.heif");
  ok defined($heif), "heif detected";
}
SKIP: {
  skip "No WEBP support", 1 unless defined &GD::Image::newFromWebp;
  my $webp = GD::Image->new("t/test_data/tile.webp");
  ok defined($webp), "webp detected";
}
SKIP: {
  skip "No WBMP support", 1 unless defined &GD::Image::newFromWBMP;
  my $wbmp = GD::Image->new("t/test_data/tile.wbmp");
  ok defined($wbmp), "wbmp detected";
}
SKIP: {
  skip "No BMP support", 1 unless defined &GD::Image::newFromBmp;
  my $bmp = GD::Image->new("t/test_data/windows.bmp");
  ok defined($bmp), "bmp detected";
}

SKIP: {
  skip "No XPM support", 1 unless defined &GD::Image::newFromXpm;
  my $xpm = GD::Image->new("t/test_data/frog.xpm");
  ok defined($xpm), "xpm detected";
}
my $xbm = GD::Image->new("t/test_data/frog.xbm");
ok defined($xbm), "xbm detected";
