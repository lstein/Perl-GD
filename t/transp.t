use strict;
use warnings;
# This is a feature: adding transparency changes the palette
# https://rt.cpan.org/Ticket/Display.html?id=40525

use Test::More tests => 12;

use_ok('GD');
my $gif = "t/test_data/tile.gif";
my $jpeg = "t/test_data/tile.jpeg";
my $frog = "t/test_data/frog.jpg";

my $im = GD::Image->newFromGif($gif);

$im->transparent( -1 );
is($im->transparent, -1, 'image is not transparent');

my $closest = $im->colorClosest( 24, 53, 62 );
$im->transparent( $im->colorClosest( 24, 53, 62 ) );

is( $im->transparent, $closest, "transparency preserves RGB before $closest" );
is( $im->transparent, $im->colorClosest( 24, 53, 62 ), 'transparency preserves RGB after' );

SKIP: {
  skip "No JPEG support", 8 unless defined &GD::Image::newFromJpeg;

  $im = GD::Image->newFromJpeg($jpeg);
  $im->transparent( -1 );
  is($im->transparent, -1, 'image is not transparent');

  $closest = $im->colorClosest( 24, 53, 62 );
  $im->transparent( $closest );

  is( $im->transparent, $closest, 'transparency preserves RGB before' );

  my ($t, $c) = ($im->transparent, $im->colorClosest( 24, 53, 62 ));
  if ($t == $c) {
  TODO: {
    local $TODO = 'colorClosest ignores alpha';
    isnt( $t, $c, "Closest" );
    }
  } else {
    isnt( $t, $c, "Closest" );
  }
  is( $im->transparent, $im->colorClosestAlpha( 24, 53, 62, 255 ), "ClosestAlpha" );

  $im = GD::Image->newFromJpeg($frog);
  $im->transparent( -1 );
  is($im->transparent, -1, 'image is not transparent');

  $closest = $im->colorClosest( 24, 53, 62 );
  $im->transparent( $closest );
  is( $im->transparent, $closest, 'transparency preserves RGB before' );

  ($t, $c) = ($im->transparent, $im->colorClosest( 24, 53, 62 ));
  if ($t == $c) {
  TODO: {
    local $TODO = 'colorClosest ignores alpha';
    isnt( $t, $c, "Closest" );
    }
  } else {
    isnt( $t, $c, "Closest" );
  }
  is( $im->transparent, $im->colorClosestAlpha( 24, 53, 62, 255 ), "ClosestAlpha" );
}
