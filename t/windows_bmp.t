#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 4;

use_ok('GD');

my $winbmp = "t/test_data/windows.bmp";

my $im = GD::Image->newFromBmp($winbmp);

ok defined($im), "windows bmp does not return undef";
is $im->width, 2, "windows bmp has width 2";
is $im->height, 2, "windows bmp has height 2";
