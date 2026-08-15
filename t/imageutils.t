#!/usr/bin/perl
# Tests for previously-unbound libgd image utility functions (libgd >= 2.1.0
# unless noted): paletteToTrueColor, crop/cropAuto/cropThreshold,
# colorReplace/colorReplaceArray/colorReplaceThreshold, convolution,
# resolution, cloneImage/clone (libgd >= 2.4.0), getTrueColorPixel
# (libgd >= 2.4.0), perceptualDiff (libgd >= 2.4.0).
use strict;
use warnings;

use Test::More tests => 29;

use_ok('GD');

SKIP: {
    skip "No image utility methods (libgd < 2.1.0)", 28
        unless defined &GD::Image::paletteToTrueColor;

    # --- paletteToTrueColor ---
    my $pal = GD::Image->new(10, 10);
    $pal->colorAllocate(255, 255, 255);
    ok(!$pal->isTrueColor, "palette image starts out non-truecolor");
    ok($pal->paletteToTrueColor, "paletteToTrueColor succeeds");
    ok($pal->isTrueColor, "paletteToTrueColor converts the image in place");

    # --- crop ---
    my $src = GD::Image->new(40, 30, 1);
    my $white = $src->colorAllocate(255, 255, 255);
    my $red   = $src->colorAllocate(255, 0, 0);
    $src->filledRectangle(0, 0, 39, 29, $white);
    $src->filledRectangle(0, 0, 19, 29, $red);

    my $cropped = $src->crop([0, 0, 20, 30]);
    is(join("x", $cropped->getBounds), "20x30", "crop returns the requested region size");
    is($cropped->getPixel(5, 5), $red, "crop preserves pixel content");

    # --- cropAuto ---
    my $bordered = GD::Image->new(30, 30, 1);
    my $bwhite = $bordered->colorAllocate(255, 255, 255);
    $bordered->filledRectangle(0, 0, 29, 29, $bwhite);
    my $bred = $bordered->colorAllocate(255, 0, 0);
    $bordered->filledRectangle(5, 5, 24, 24, $bred);
    my $autocropped = $bordered->cropAuto(GD::GD_CROP_WHITE());
    ok(defined $autocropped, "cropAuto returns an image");
    is(join("x", $autocropped->getBounds), "20x20", "cropAuto strips the uniform white border");

    # --- cropThreshold ---
    my $threshcropped = $bordered->cropThreshold($bwhite, 10);
    is(join("x", $threshcropped->getBounds), "20x20", "cropThreshold strips a matching border color");

    # --- colorReplace ---
    my $im = GD::Image->new(10, 10, 1);
    my $w = $im->colorAllocate(255, 255, 255);
    my $r = $im->colorAllocate(255, 0, 0);
    my $b = $im->colorAllocate(0, 0, 255);
    $im->filledRectangle(0, 0, 9, 9, $w);
    $im->filledRectangle(0, 0, 4, 9, $r);
    my $n = $im->colorReplace($r, $b);
    is($n, 50, "colorReplace reports the number of pixels changed");
    is($im->getPixel(0, 0), $b, "colorReplace actually recolored the pixels");

    # --- colorReplaceArray ---
    my $im2 = GD::Image->new(2, 1, 1);
    my $c1 = $im2->colorAllocate(10, 10, 10);
    my $c2 = $im2->colorAllocate(20, 20, 20);
    $im2->setPixel(0, 0, $c1);
    $im2->setPixel(1, 0, $c2);
    my $c3 = $im2->colorAllocate(30, 30, 30);
    my $c4 = $im2->colorAllocate(40, 40, 40);
    my $rc = $im2->colorReplaceArray([$c1, $c2], [$c3, $c4]);
    is($rc, 2, "colorReplaceArray replaces every listed color");
    is($im2->getPixel(0, 0), $c3, "colorReplaceArray remapped the first color");
    is($im2->getPixel(1, 0), $c4, "colorReplaceArray remapped the second color");

    eval { $im2->colorReplaceArray([$c1], [$c3, $c4]) };
    like($@, qr/same length/, "colorReplaceArray rejects mismatched array lengths");

    # --- colorReplaceThreshold ---
    my $rt = $im->colorReplaceThreshold($w, $b, 50);
    ok($rt > 0, "colorReplaceThreshold replaces perceptually-close colors");

    # --- convolution ---
    my $conv = GD::Image->new(10, 10, 1);
    $conv->colorAllocate(0, 0, 0);
    ok($conv->convolution([0,0,0, 0,1,0, 0,0,0], 1, 0),
        "convolution with an identity kernel succeeds");
    eval { $conv->convolution([1,2,3], 1, 0) };
    like($@, qr/9 elements/, "convolution rejects a malformed filter");

    # --- resolution ---
    my $res = GD::Image->new(5, 5);
    my @default_res = $res->resolution;
    is(scalar(@default_res), 2, "resolution() returns a 2-element list");
    $res->resolution(300, 150);
    is_deeply([$res->resolution], [300, 150], "resolution(x,y) sets and reads back both axes");

    # --- cloneImage / clone ---
    my $orig = GD::Image->new(12, 8, 1);
    my $oc = $orig->colorAllocate(1, 2, 3);
    $orig->setPixel(0, 0, $oc);
    my $cl = $orig->clone;
    is(join("x", $cl->getBounds), "12x8", "clone() preserves dimensions");
    is($cl->isTrueColor, $orig->isTrueColor, "clone() preserves truecolor-ness");
    is($cl->getPixel(0, 0), $oc, "clone() copies pixel data");
    isnt("$cl", "$orig", "clone() returns a distinct image object");

  SKIP: {
        skip "No native cloneImage/getTrueColorPixel/perceptualDiff (libgd < 2.4.0)", 5
            unless defined &GD::Image::cloneImage;

        # --- getTrueColorPixel ---
        my $tp = GD::Image->new(4, 4, 1);
        my $tpcolor = $tp->colorAllocate(10, 20, 30);
        $tp->setPixel(1, 1, $tpcolor);
        is($tp->getTrueColorPixel(1, 1), $tp->getPixel(1, 1),
            "getTrueColorPixel matches getPixel on a truecolor image");

        # --- perceptualDiff ---
        my $diffA = GD::Image->new(10, 10, 1);
        $diffA->colorAllocate(255, 255, 255);
        my $diffB = GD::Image->new(10, 10, 1);
        my $dw = $diffB->colorAllocate(255, 255, 255);
        $diffB->filledRectangle(0, 0, 9, 9, $dw);
        my $dblack = $diffB->colorAllocate(0, 0, 0);
        $diffB->filledRectangle(0, 0, 4, 9, $dblack);

        my ($same_changed, $same_delta) = $diffA->perceptualDiff($diffA, 0.05);
        is($same_changed, 0, "perceptualDiff of an image against itself changes nothing");

        my ($changed, $delta) = $diffA->perceptualDiff($diffB, 0.05);
        ok($changed > 0, "perceptualDiff detects the differing region");
        ok($delta > 0, "perceptualDiff reports a positive maximum delta");

        eval { $diffA->perceptualDiff(GD::Image->new(5, 5, 1), 0.05) };
        like($@, qr/error/i, "perceptualDiff on mismatched image sizes raises an error");
    }
}
