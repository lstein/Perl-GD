#!/usr/bin/perl
# Tests for the IMAGEQUANT quantization method selector (libgd >= 2.0.0):
# trueColorToPaletteSetMethod(), trueColorToPaletteSetQuality(), and the
# GD_QUANT_* constants (gdPaletteQuantizationMethod is a plain C enum, so
# these constants need special handling to be visible to Perl at all).
use strict;
use warnings;

use Test::More tests => 13;

use_ok('GD');

sub make_truecolor_test_image {
    my $im = GD::Image->new(48, 36, 1);
    my $white = $im->colorAllocate(255, 255, 255);
    my $red   = $im->colorAllocate(220, 20, 20);
    my $blue  = $im->colorAllocate(20, 20, 220);
    $im->filledRectangle(0, 0, 47, 35, $white);
    $im->filledRectangle(0, 0, 23, 35, $red);
    $im->filledEllipse(24, 18, 20, 16, $blue);
    return $im;
}

SKIP: {
    skip "No IMAGEQUANT support", 12
        unless defined &GD::Image::trueColorToPaletteSetMethod;

    is(GD::GD_QUANT_DEFAULT(),  0, "GD_QUANT_DEFAULT constant resolves");
    is(GD::GD_QUANT_JQUANT(),   1, "GD_QUANT_JQUANT constant resolves");
    is(GD::GD_QUANT_NEUQUANT(), 2, "GD_QUANT_NEUQUANT constant resolves");
    is(GD::GD_QUANT_LIQ(),      3, "GD_QUANT_LIQ constant resolves");

    my $im = make_truecolor_test_image();

    ok($im->trueColorToPaletteSetMethod(GD::GD_QUANT_NEUQUANT(), 0),
        "NeuQuant method selection always succeeds");
    ok($im->trueColorToPaletteSetMethod(GD::GD_QUANT_JQUANT(), 0),
        "libjpeg median-cut method selection always succeeds");

  SKIP: {
        skip "libgd not built with libimagequant", 6
            unless $im->trueColorToPaletteSetMethod(GD::GD_QUANT_LIQ(), 0);

        pass("GD_QUANT_LIQ method selection succeeds");

        $im->trueColorToPaletteSetQuality(40, 100);
        pass("trueColorToPaletteSetQuality does not die");

        # trueColorToPalette() converts the image in place.
        $im->trueColorToPalette(0, 16);
        ok(!$im->isTrueColor, "trueColorToPalette(LIQ) converts to a palette image");
        ok($im->colorsTotal > 0 && $im->colorsTotal <= 16,
            "palette color count is within the requested budget");

        # createPaletteFromTrueColor() also honors the selected method, but
        # returns a new image and leaves the source untouched.
        my $src = make_truecolor_test_image();
        $src->trueColorToPaletteSetMethod(GD::GD_QUANT_LIQ(), 0);
        my $created = $src->createPaletteFromTrueColor(0, 16);
        ok(defined $created && !$created->isTrueColor,
            "createPaletteFromTrueColor(LIQ) returns a palette image");
        ok($src->isTrueColor, "createPaletteFromTrueColor leaves the source image truecolor");
    }
}
