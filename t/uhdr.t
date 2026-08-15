#!/usr/bin/perl
# Tests for UltraHDR (libgd >= 2.4.0) support: GD::UHDR read/write,
# gain-map-preserving transforms, and SDR extraction.
use strict;
use warnings;

use Test::More tests => 22;
use_ok('GD');

SKIP: {
    skip "No UHDR support", 21 unless defined &GD::UHDR::newFromFile;

  SKIP: {
        skip "libultrahdr not available at runtime", 21
            unless GD::UHDR->isAvailable;

        my $u = GD::UHDR->newFromFile("t/test_data/tile_uhdr.jpg");
        ok(defined $u, "newFromFile reads an UltraHDR JPEG");
        isa_ok($u, 'GD::UHDR');
        is($u->width, 96, "width reports the source width");
        is($u->height, 72, "height reports the source height");
        ok($u->hasGainMap, "fixture carries a gain map");

        # newFromData from an in-memory buffer
        open(my $fh, "<", "t/test_data/tile_uhdr.jpg") or die $!;
        binmode $fh;
        local $/;
        my $raw = <$fh>;
        close $fh;
        my $u2 = GD::UHDR->newFromData($raw);
        ok(defined $u2, "newFromData reads an UltraHDR JPEG from memory");
        is($u2->width, 96, "newFromData width matches file");

        # write() returns the same bytes it was read from when untransformed
        my $written = $u2->write();
        ok(length($written) > 0, "write() returns non-empty data");

        my $reloaded = GD::UHDR->newFromData($written);
        ok(defined $reloaded, "written UltraHDR data reloads");
        is($reloaded->width, 96, "reloaded width unchanged");

        # gain-map-preserving resize; committed dimensions update only after
        # the transformed image is written back out
        $u->resize(48, 36);
        my $resized_bytes = $u->write();
        my $after_resize = GD::UHDR->newFromData($resized_bytes);
        is($after_resize->width, 48, "resize takes effect after write (width)");
        is($after_resize->height, 36, "resize takes effect after write (height)");
        ok($after_resize->hasGainMap, "gain map survives a resize");

        # crop
        my $u3 = GD::UHDR->newFromFile("t/test_data/tile_uhdr.jpg");
        $u3->crop(0, 0, 40, 30);
        my $cropped = GD::UHDR->newFromData($u3->write());
        is($cropped->width, 40, "crop takes effect after write (width)");
        is($cropped->height, 30, "crop takes effect after write (height)");

        # rotate (90 degrees swaps width/height) and mirror don't die
        my $u4 = GD::UHDR->newFromFile("t/test_data/tile_uhdr.jpg");
        $u4->rotate(90);
        my $rotated = GD::UHDR->newFromData($u4->write());
        is($rotated->width, 72, "rotate(90) swaps width/height (width)");
        is($rotated->height, 96, "rotate(90) swaps width/height (height)");

        my $u5 = GD::UHDR->newFromFile("t/test_data/tile_uhdr.jpg");
        eval { $u5->mirror(GD::GD_UHDR_MIRROR_HORIZONTAL()) };
        ok(!$@, "mirror() does not die");

        # file() writes to disk, and getSdr() yields a plain GD::Image
        my $outfile = "t/test_data/_uhdr_write_test.jpg";
        $u2->file($outfile);
        ok(-s $outfile, "file() writes a non-empty file");
        unlink $outfile;

        my $sdr = $u2->getSdr();
        isa_ok($sdr, 'GD::Image');
        is(join("x", $sdr->getBounds), "96x72", "getSdr() dimensions match the UltraHDR image");
    }
}
