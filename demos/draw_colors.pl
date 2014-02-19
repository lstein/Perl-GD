#!/usr/bin/perl -w

use strict;
use lib '.','./blib/lib','./blib/arch';
use GD::Simple;

my @color_names = GD::Simple->color_names;
my $cols = int(sqrt(@color_names));
my $rows = int(@color_names/$cols)+1;

my $cell_width    = 100;
my $cell_height   = 50;
my $legend_height = 16;

my $width       = $cols * $cell_width;
my $height      = $rows * $cell_height;

my $img = GD::Simple->new($width,$height);
$img->font(gdSmallFont);

for (my $c=0; $c<$cols; $c++) {
  for (my $r=0; $r<$rows; $r++) {
    my $color = $color_names[$c*$rows + $r] or next;
    my @topleft  = ($c*$cell_width,$r*$cell_height);
    my @botright = ($topleft[0]+$cell_width,$topleft[1]+$cell_height-$legend_height);
    $img->bgcolor($color);
    $img->fgcolor($color);
    $img->rectangle(@topleft,@botright);
    $img->moveTo($topleft[0]+2,$botright[1]+$legend_height-2);
    $img->fgcolor('black');
    $img->string($color);
  }
}

print eval {$img->png} || $img->gif;
