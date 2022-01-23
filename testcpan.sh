#!/bin/sh
p=$(cat ~/.alias-perl | sed 's,alias p=,,')
test -n "$p" || p=perl
alias ppan='$p -S cpan'
$p Makefile.PL && make test && sudo make install clean
ppan -f GD::Graph GD::Text Barcode::Code128  GD::Thumbnail GD::SVG GD::Text::Arc GD::Thumbnail \
	GD::Tiler GD::Wbmp GD::Window GD::Image::AnimatedGif GD::Image::Orientation \
	GD::Image::Scale2x GD::Image::Thumbnail GD::Map GD::Map::Mercator \
	GD::Chart GD::Barcode GD::Arrow GD::3DBarGrapher GD::Dashboard
ppan GD::OrgChart
