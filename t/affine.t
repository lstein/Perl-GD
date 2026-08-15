#!/usr/bin/perl
# Tests for the affine transformation API (libgd >= 2.1.0):
# https://github.com/lstein/Perl-GD/issues/21
#
# Matrix builders (affineIdentity, affineScale, ...), matrix utilities
# (affineConcat, affineInvert, affineFlip, affineExpansion,
# affineRectilinear, affineEqual, affineApplyToPoint), and the image-level
# transformAffineGetImage / transformAffineCopy / transformAffineBoundingBox
# wrapping gdTransformAffineGetImage/Copy/BoundingBox.
use strict;
use warnings;

use Test::More tests => 26;

use_ok('GD');

SKIP: {
    skip "No affine transform support", 25
        unless defined &GD::Image::affineIdentity;

    # --- matrix builders ---
    my @id = GD::Image->affineIdentity();
    is_deeply(\@id, [1, 0, 0, 1, 0, 0], "affineIdentity");

    my @scale = GD::Image->affineScale(2, 3);
    is_deeply(\@scale, [2, 0, 0, 3, 0, 0], "affineScale(2,3)");

    my @translate = GD::Image->affineTranslate(5, -7);
    is_deeply(\@translate, [1, 0, 0, 1, 5, -7], "affineTranslate(5,-7)");

    my @rot90 = GD::Image->affineRotate(90);
    ok(abs($rot90[0]) < 1e-9, "affineRotate(90) cos component ~0");
    ok(abs($rot90[1] - 1)   < 1e-9, "affineRotate(90) sin component ~1");

    my @shearH = GD::Image->affineShearHorizontal(45);
    ok(abs($shearH[2] - 1) < 1e-9, "affineShearHorizontal(45) ~ tan(45)=1");

    my @shearV = GD::Image->affineShearVertical(45);
    ok(abs($shearV[1] - 1) < 1e-9, "affineShearVertical(45) ~ tan(45)=1");

    # --- matrix utilities ---
    my @concat_id = GD::Image->affineConcat(\@scale, \@id);
    is_deeply(\@concat_id, \@scale, "affineConcat(scale, identity) == scale");

    my @inv = GD::Image->affineInvert(\@scale);
    is_deeply(\@inv, [0.5, 0, 0, 1/3, 0, 0], "affineInvert(scale(2,3))");

    my @singular = (0, 0, 0, 0, 0, 0);
    my @noinv = GD::Image->affineInvert(\@singular);
    ok(!@noinv, "affineInvert on a singular matrix returns empty list");

    my @flip = GD::Image->affineFlip(\@id, 1, 0);
    ok(GD::Image->affineEqual(\@flip, [-1, 0, 0, 1, 0, 0]), "affineFlip horizontal");

    is(GD::Image->affineExpansion(\@id), 1, "affineExpansion(identity) == 1");
    ok(GD::Image->affineRectilinear(\@id), "identity is rectilinear");
    ok(!GD::Image->affineRectilinear(\@shearH), "a shear is not rectilinear");

    ok(GD::Image->affineEqual(\@id, [1, 0, 0, 1, 0, 0]), "affineEqual true case");
    ok(!GD::Image->affineEqual(\@id, \@scale), "affineEqual false case");

    my @pt = GD::Image->affineApplyToPoint(10, 20, \@scale);
    is_deeply(\@pt, [20, 60], "affineApplyToPoint through scale(2,3)");

    # --- image-level transforms ---
    my @bbox = GD::Image->transformAffineBoundingBox([0, 0, 20, 10], \@translate);
    is_deeply(\@bbox, [5, -7, 20, 10], "transformAffineBoundingBox under a pure translation");

    my $src = GD::Image->new(20, 10, 1);
    my $white = $src->colorAllocate(255, 255, 255);
    my $red   = $src->colorAllocate(255, 0, 0);
    $src->filledRectangle(0, 0, 19, 9, $white);
    $src->filledRectangle(0, 0, 9, 9, $red);

    my $scaled = $src->transformAffineGetImage(\@scale);
    ok(defined $scaled, "transformAffineGetImage returns an image");
    is(join("x", $scaled->getBounds), "40x30", "transformAffineGetImage(scale(2,3)) doubles/triples size");

    my $cropped = $src->transformAffineGetImage(\@id, [0, 0, 10, 10]);
    is(join("x", $cropped->getBounds), "10x10", "transformAffineGetImage honors an explicit src region");

    my $dst = GD::Image->new(100, 100, 1);
    my $black = $dst->colorAllocate(0, 0, 0);
    $dst->filledRectangle(0, 0, 99, 99, $black);
    ok($dst->transformAffineCopy($src, 10, 10, \@id),
        "transformAffineCopy pastes a whole-image identity transform");
    is($dst->getPixel(15, 15), $red, "transformAffineCopy actually copied red source pixels");

    my $dst2 = GD::Image->new(100, 100, 1);
    $dst2->colorAllocate(0, 0, 0);
    ok($dst2->transformAffineCopy($src, 0, 0, \@id, [0, 0, 10, 10]),
        "transformAffineCopy honors an explicit src region");

    eval { GD::Image->affineConcat([1,2,3], \@id) };
    like($@, qr/6 elements/, "affineConcat rejects a malformed matrix");
}
