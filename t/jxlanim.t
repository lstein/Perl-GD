#!/usr/bin/perl
# Tests for animated/multi-image JPEG XL support (libgd >= 2.4.0):
# GD::JxlAnimWriter (gdJxlWriteOpenPtr/AddImage/PtrFinish) and
# GD::JxlAnimReader (gdJxlReadOpenCtx/GetInfo/NextImage).
use strict;
use warnings;

use Test::More tests => 18;

use_ok('GD');

SKIP: {
    skip "No animated JXL support", 17
        unless defined &GD::JxlAnimWriter::new;

    my @colors = ([255, 0, 0], [0, 255, 0], [0, 0, 255]);
    my $writer = GD::JxlAnimWriter->new({ loop_count => 4, distance => 1.0, effort => 4 });
    isa_ok($writer, 'GD::JxlAnimWriter');

    for my $rgb (@colors) {
        my $im = GD::Image->new(16, 16, 1);
        my $bg = $im->colorAllocate(255, 255, 255);
        my $fg = $im->colorAllocate(@$rgb);
        $im->filledRectangle(0, 0, 15, 15, $bg);
        $im->filledEllipse(8, 8, 10, 10, $fg);
        ok($writer->addImage($im, 90), "addImage succeeds for frame with color @$rgb");
    }

    my $bytes = $writer->finish;
    ok(length($bytes) > 0, "finish() returns non-empty JXL data");

    eval { $writer->addImage(GD::Image->new(1, 1, 1), 10) };
    like($@, qr/finished/, "addImage after finish() dies instead of using a stale pointer");

    eval { $writer->finish };
    like($@, qr/finished/, "calling finish() twice dies instead of a double-free");

    my $reader = GD::JxlAnimReader->newFromData($bytes);
    isa_ok($reader, 'GD::JxlAnimReader');

    my %info = $reader->info;
    is($info{width}, 16, "reader info width matches the canvas");
    is($info{height}, 16, "reader info height matches the canvas");
    is($info{loop_count}, 4, "reader info round-trips the loop count");
    ok($info{animated}, "reader info flags the stream as animated");

    my @frames;
    while (my ($delay, $img) = $reader->nextImage) {
        push @frames, [$delay, $img];
    }
    is(scalar(@frames), 3, "nextImage() iterates exactly the frames written");
    is($frames[0][0], 90, "nextImage() reports the frame delay in milliseconds");
    is(join("x", $frames[0][1]->getBounds), "16x16", "nextImage() decodes full-canvas frames");

    my @empty = $reader->nextImage;
    is(scalar(@empty), 0, "nextImage() returns an empty list once exhausted");

    # a single still image (not an animation) should still be readable
    my $still = GD::Image->new(8, 8, 1);
    $still->colorAllocate(1, 2, 3);
    my $stillwriter = GD::JxlAnimWriter->new;
    $stillwriter->addImage($still, 0);
    my $stillbytes = $stillwriter->finish;
    my $stillreader = GD::JxlAnimReader->newFromData($stillbytes);
    my ($sdelay, $simg) = $stillreader->nextImage;
    is(join("x", $simg->getBounds), "8x8", "a single-frame JXL round-trips through the anim API too");
}
