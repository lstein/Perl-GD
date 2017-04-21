#!/usr/bin/perl
# -*- encoding: utf-8; indent-tabs-mode: nil -*-
# See https://rt.cpan.org/Ticket/Display.html?id=120572
# checks 5832 RGB triples, executes a
# round trip RGB -> HSV -> RGB and compares the initial and final
# RGB triples. Of course, there will be rounding errors, so the
# final RGB triple will be a little different from the initial.
# So I compare the Manhattan distance between the two triples and
# compare it with a fuzz value.

use Test::More tests => 1;
use strict;
use warnings;
use GD::Simple;

my $fmt     = " %3d" x 10;
my $step    = 15;
my $fuzz    =  3;
my $neg_fix =  0;

for     (my $r0 = 0; $r0 <= 255; $r0 += $step) {
  for   (my $g0 = 0; $g0 <= 255; $g0 += $step) {
    for (my $b0 = 0; $b0 <= 255; $b0 += $step) {
      my ($h,  $s,  $v)  = GD::Simple->RGBtoHSV($r0, $g0, $b0);
      my ($r1, $g1, $b1) = GD::Simple->HSVtoRGB($h, $s, $v);
      my $delta = abs($r1 - $r0) + abs($g1 - $g0) + abs($b1 - $b0);
      if ($delta > $fuzz) {
	diag(sprintf $fmt, $h, $s, $v, $r0, $g0, $b0, $r1, $g1, $b1, $delta);
        fail();
        exit;
      }
    }
  }
}

pass();
