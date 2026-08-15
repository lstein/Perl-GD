#!/usr/bin/perl
# Tests for per-format header introspection (libgd >= 2.4.0):
# GD::Image->pngInfoData/jpegInfoData/gifInfoData/bmpInfoData/
# avifInfoData/heifInfoData, wrapping gd{Png,Jpeg,Gif,Bmp,Avif,Heif}GetInfoCtx.
# Each reads just the container facts (dimensions, bit depth, and similar)
# from an in-memory buffer without fully decoding the image.
use strict;
use warnings;

use Test::More tests => 27;

use_ok('GD');

sub slurp {
    my $file = shift;
    open my $fh, "<", $file or die "$file: $!";
    binmode $fh;
    local $/;
    return <$fh>;
}

SKIP: {
    skip "No pngInfoData support", 5 unless defined &GD::Image::pngInfoData;
    my %info = GD::Image->pngInfoData(slurp("t/test_data/tile.png"));
    is($info{width}, 21, "pngInfoData width");
    is($info{height}, 22, "pngInfoData height");
    is($info{color_type}, 3, "pngInfoData reports palette color type");
    is($info{palette_entries}, 4, "pngInfoData reports palette size");
    eval { GD::Image->pngInfoData("not a png") };
    like($@, qr/gdPngGetInfoCtx error/, "pngInfoData dies on non-PNG data");
}

SKIP: {
    skip "No jpegInfoData support", 4 unless defined &GD::Image::jpegInfoData;
    my %info = GD::Image->jpegInfoData(slurp("t/test_data/tile.jpeg"));
    is($info{width}, 21, "jpegInfoData width");
    is($info{height}, 22, "jpegInfoData height");
    is($info{components}, 3, "jpegInfoData reports RGB component count");
    eval { GD::Image->jpegInfoData("not a jpeg") };
    like($@, qr/gdJpegGetInfoCtx error/, "jpegInfoData dies on non-JPEG data");
}

SKIP: {
    skip "No gifInfoData support", 4 unless defined &GD::Image::gifInfoData;
    my %info = GD::Image->gifInfoData(slurp("t/test_data/tile.gif"));
    is($info{width}, 21, "gifInfoData width");
    is($info{height}, 22, "gifInfoData height");
    is($info{version}, "89a", "gifInfoData reports the GIF version string");
    eval { GD::Image->gifInfoData("not a gif") };
    like($@, qr/gdGifGetInfoCtx error/, "gifInfoData dies on non-GIF data");
}

SKIP: {
    skip "No bmpInfoData support", 5 unless defined &GD::Image::bmpInfoData;
    my %info = GD::Image->bmpInfoData(slurp("t/test_data/tile.bmp"));
    is($info{width}, 21, "bmpInfoData width");
    is($info{height}, 22, "bmpInfoData height");
    is($info{bits_per_pixel}, 4, "bmpInfoData reports bit depth");
    is($info{palette_entries}, 16, "bmpInfoData reports palette size");
    eval { GD::Image->bmpInfoData("not a bmp") };
    like($@, qr/gdBmpGetInfoCtx error/, "bmpInfoData dies on non-BMP data");
}

SKIP: {
    skip "No avifInfoData support", 4 unless defined &GD::Image::avifInfoData;
    my %info = GD::Image->avifInfoData(slurp("t/test_data/tile.avif"));
    is($info{width}, 21, "avifInfoData width");
    is($info{height}, 22, "avifInfoData height");
    is($info{is_animation}, 0, "avifInfoData reports a non-animated still");
    eval { GD::Image->avifInfoData("not an avif") };
    like($@, qr/gdAvifGetInfoCtx error/, "avifInfoData dies on non-AVIF data");
}

SKIP: {
    skip "No heifInfoData support", 4 unless defined &GD::Image::heifInfoData;
    my %info = GD::Image->heifInfoData(slurp("t/test_data/tile.heif"));
    is($info{width}, 21, "heifInfoData width");
    is($info{height}, 22, "heifInfoData height");
    is($info{top_level_image_count}, 1, "heifInfoData reports the image count");
    eval { GD::Image->heifInfoData("not a heif") };
    like($@, qr/gdHeifGetInfoCtx error/, "heifInfoData dies on non-HEIF data");
}
