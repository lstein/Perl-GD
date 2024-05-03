# GH #47
use strict;
use GD;
use Test::More 'no_plan';
use Test::NoWarnings;

SKIP: {
  skip "No PNG support", 1 unless defined &GD::Image::newFromPng;

  # Use of uninitialized value $pkg
  my $image = GD::Image->newFromPng('t/test_data/tile.png');
  f();
}

sub f
{
    my $image = GD::Image->newFromPng('t/test_data/tile.png');
}
