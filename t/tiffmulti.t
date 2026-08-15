#!/usr/bin/perl
# Tests for multi-page TIFF support (libgd >= 2.4.0):
# GD::TiffMultiWriter (gdTiffWriteOpenPtr/AddImage/PtrFinish) and
# GD::TiffMultiReader (gdTiffReadOpenCtx/GetInfo/NextImage).
use strict;
use warnings;

use Test::More tests => 20;

use_ok('GD');

SKIP: {
    skip "No multi-page TIFF support", 19
        unless defined &GD::TiffMultiWriter::new;

    my @colors = ([255, 0, 0], [0, 255, 0], [0, 0, 255]);
    my $writer = GD::TiffMultiWriter->new({
        colorspace  => GD::GD_TIFF_RGBA(),
        compression => GD::GD_TIFF_COMPRESSION_ADOBE_DEFLATE(),
    });
    isa_ok($writer, 'GD::TiffMultiWriter');

    for my $rgb (@colors) {
        my $im = GD::Image->new(16, 16, 1);
        my $bg = $im->colorAllocate(255, 255, 255);
        my $fg = $im->colorAllocate(@$rgb);
        $im->filledRectangle(0, 0, 15, 15, $bg);
        $im->filledEllipse(8, 8, 10, 10, $fg);
        ok($writer->addImage($im), "addImage succeeds for page with color @$rgb");
    }

    my $bytes = $writer->finish;
    ok(length($bytes) > 0, "finish() returns non-empty TIFF data");

    eval { $writer->addImage(GD::Image->new(1, 1, 1)) };
    like($@, qr/finished/, "addImage after finish() dies instead of using a stale pointer");

    eval { $writer->finish };
    like($@, qr/finished/, "calling finish() twice dies instead of a double-free");

    my $reader = GD::TiffMultiReader->newFromData($bytes);
    isa_ok($reader, 'GD::TiffMultiReader');

    my %info = $reader->info;
    is($info{width}, 16, "reader info width matches the first page");
    is($info{height}, 16, "reader info height matches the first page");
    is($info{page_count}, 3, "reader info reports the page count written");

    my @pages;
    while (my ($pinfo, $img) = $reader->nextImage) {
        push @pages, [$pinfo, $img];
    }
    is(scalar(@pages), 3, "nextImage() iterates exactly the pages written");
    is($pages[0][0]{page_index}, 0, "nextImage() reports a zero-based page index");
    is($pages[1][0]{page_index}, 1, "nextImage() page index advances per page");
    is(join("x", $pages[0][1]->getBounds), "16x16", "nextImage() decodes each page's image");
    ok($pages[0][0]{has_alpha}, "nextImage() page info reflects the RGBA colorspace requested");

    my @empty = $reader->nextImage;
    is(scalar(@empty), 0, "nextImage() returns an empty list once exhausted");

    # a single-page TIFF should still be readable
    my $still = GD::Image->new(8, 8, 1);
    $still->colorAllocate(1, 2, 3);
    my $stillwriter = GD::TiffMultiWriter->new;
    $stillwriter->addImage($still);
    my $stillbytes = $stillwriter->finish;
    my $stillreader = GD::TiffMultiReader->newFromData($stillbytes);
    my %stillinfo = $stillreader->info;
    is($stillinfo{page_count}, 1, "a single-page TIFF reports page_count 1");
    my ($spinfo, $simg) = $stillreader->nextImage;
    is(join("x", $simg->getBounds), "8x8", "a single-page TIFF round-trips through the multi-page API too");
}
