# -*- perl -*-
use strict;
use Test::More;

plan skip_all => 'No RELEASE_TESTING'
  unless -d '.git' || $ENV{RELEASE_TESTING};

eval "use Pod::Spell::CommonMistakes;";
plan skip_all => "Pod::Spell::CommonMistakes required"
  if $@;

my @docs = qw(
  lib/GD.pm
  lib/GD/Group.pm
  lib/GD/Image.pm
  lib/GD/Polygon.pm
  lib/GD/Polyline.pm
  lib/GD/Simple.pm
);
plan tests => scalar @docs;

for my $f (@docs) {
  my $r = Pod::Spell::CommonMistakes::check_pod($f);
  if ( keys %$r == 0 ) {
    ok(1, "$f");
  } else {
    ok(0, "$f");
    foreach my $k ( keys %$r ) {
      diag "  Found: '$k' - Possible spelling: '$r->{$k}'?";
    }
  }
}
