#!/usr/bin/perl
# Tests for JPEG XL (libgd >= 2.4.0) read/write support: newFromJxl,
# newFromJxlData, autodetection, and the jxl() writer (lossy + lossless).
use strict;
use warnings;

use Test::More tests => 14;

use_ok('GD');

SKIP: {
    skip "No JXL support", 13 unless defined &GD::Image::newFromJxl;

    # newFromJxlData from a fixture generated from tile.png
    open(my $fh, "<", "t/test_data/tile.jxl") or die "can't read fixture: $!";
    binmode $fh;
    local $/;
    my $jxl_data = <$fh>;
    close $fh;

    my $from_data = GD::Image->newFromJxlData($jxl_data);
    ok(defined $from_data, "newFromJxlData returns an image");
    is(join("x", $from_data->getBounds), "21x22", "newFromJxlData dimensions match tile.png");

    # magic-byte autodetection via GD::Image->new($path)
    my $from_path = GD::Image->new("t/test_data/tile.jxl");
    ok(defined $from_path, "new(\$path) autodetects a JPEG XL file");
    is(join("x", $from_path->getBounds), "21x22", "autodetected image has correct dimensions");

    # newFromJxl(filehandle)
    open(my $rfh, "<", "t/test_data/tile.jxl") or die $!;
    my $from_fh = GD::Image->newFromJxl($rfh);
    close $rfh;
    ok(defined $from_fh, "newFromJxl(filehandle) returns an image");
    is(join("x", $from_fh->getBounds), "21x22", "newFromJxl(filehandle) dimensions match tile.png");

    # lossy round trip
    my $src = GD::Image->new(32, 24, 1);
    my $white = $src->colorAllocate(255, 255, 255);
    my $red   = $src->colorAllocate(220, 20, 20);
    $src->filledRectangle(0, 0, 31, 23, $white);
    $src->filledEllipse(16, 12, 20, 14, $red);

    my $lossy = $src->jxl();
    ok(length($lossy) > 0, "jxl() produces non-empty lossy data");
    my $lossy_back = GD::Image->newFromJxlData($lossy);
    ok(defined $lossy_back, "lossy jxl data decodes back to an image");
    is(join("x", $lossy_back->getBounds), "32x24", "lossy round trip preserves dimensions");

    # lossless round trip: pixels must match exactly
    my $lossless = $src->jxl(1);
    ok(length($lossless) > 0, "jxl(1) produces non-empty lossless data");
    my $lossless_back = GD::Image->newFromJxlData($lossless);
    ok(defined $lossless_back, "lossless jxl data decodes back to an image");

    my ($sr, $sg, $sb) = $src->rgb($src->getPixel(16, 12));
    my ($dr, $dg, $db) = $lossless_back->rgb($lossless_back->getPixel(16, 12));
    is("$sr,$sg,$sb", "$dr,$dg,$db", "lossless round trip preserves pixel color exactly");

    # malformed input reports an error instead of crashing
    eval { GD::Image->newFromJxlData("not a jxl file") };
    like($@, qr/error/i, "newFromJxlData on garbage data raises an error");
}
