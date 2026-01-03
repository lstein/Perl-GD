# bad jpeg quality: https://rt.cpan.org/Ticket/Display.html?id=48558
# with some libgd.
use GD;
my $infile = shift;
-e $infile or die $!;
my $png = GD::Image->newFromPng($infile) or die $!;
my $jpgImg = GD::Image->newTrueColor( $png->width, $png->height);
my $bg = $jpgImg->colorAllocate(80,10,10);
$jpgImg->fill(0,0,$bg);
$jpgImg->copy($png, 0,0,0,0, $png->width, $png->height);
my $outfile = $infile;
$outfile =~ s/.png/.jpeg/i;
$infile eq $infile or $outfile .= ".jpeg";
open my $f, '>', $outfile or die $!;
print $f $jpgImg->jpeg(80); # quality 80%
close $f;
