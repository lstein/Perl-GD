package GD::Simple;

use strict;
use GD;
use Carp 'croak';

our @ISA = 'Exporter';
our @EXPORT    = @GD::EXPORT;
our @EXPORT_OK = @GD::EXPORT_OK;
our $AUTOLOAD;

my %COLORS;

sub AUTOLOAD {
  my $self = shift;
  my($pack,$func_name) = $AUTOLOAD=~/(.+)::([^:]+)$/;
  return if $func_name eq 'DESTROY';

  if (ref $self && exists $self->{gd}) {
    $self->{gd}->$func_name(@_);
  } else {
    my @result = GD::Image->$func_name(@_);
    if (UNIVERSAL::isa($result[0],'GD::Image')) {
      return $self->new($result[0]);
    } else {
      return @result;
    }
  }
}

sub new {
  my $pack = shift;
  return $pack->new(GD::Image->new(100,100)) if @_ == 0;
  return $pack->new(GD::Image->new(@_))      if @_ == 2;
  my $gd   = shift;
  my $self = bless {
		    gd      => $gd,
		    xy      => [0,0],
		    font    => gdSmallFont,
		    fontsize=> 12,
		    fontangle=> 0,
		   },$pack;
  $self->{bgcolor} = $self->translate_color(255,255,255),
  $self->{fgcolor} = $self->translate_color(0,0,0);
  $self;
}

sub moveTo {
  my $self = shift;
  croak 'Usage GD::Simple->moveTo($x,$y)' unless @_ == 2;
  $self->{xy} = \@_;
}

sub lineTo {
  my $self = shift;
  croak 'Usage GD::Simple->lineTo($x,$y)' unless @_ == 2;
  $self->gd->line($self->curPos,@_,$self->fgcolor);
}

sub rectangle {
  my $self = shift;
  croak 'Usage GD::Simple->rectangle($x1,$y1,$x2,$y2)' unless @_ == 4;
  my $gd = $self->gd;
  my ($bg,$fg) = ($self->bgcolor,$self->fgcolor);
  $gd->filledRectangle(@_,$bg) if defined $bg;
  $gd->rectangle(@_,$fg)       if defined $fg && (!defined $bg || $bg != $fg);
}

sub ellipse {
  my $self = shift;
  croak 'Usage GD::Simple->ellipse($cx,$cy,$width,$height)' unless @_ == 4;
  my $gd = $self->gd;
  my ($bg,$fg) = ($self->bgcolor,$self->fgcolor);
  $gd->filledEllipse(@_,$bg) if defined $bg;
  $gd->ellipse(@_,$fg)       if defined $fg && (!defined $bg || $bg != $fg);
}

sub arc {
  my $self = shift;
  croak 'Usage GD::Simple->arc($cx,$cy,$width,$height,$start,$end,$style)' unless @_ >= 6;
  my ($cx,$cy,$width,$height,$start,$end,$style) = @_;
  my $gd = $self->gd;
  my ($bg,$fg) = ($self->bgcolor,$self->fgcolor);

  my @args = defined $style ? ($cx,$cy,$width,$height,$start,$end,$self->bgcolor,$style)
                            : ($cx,$cy,$width,$height,$start,$end,$self->bgcolor);

  $gd->filledArc(@args)            if defined $bg || defined $style;
  $gd->arc(@_,$self->fgcolor)   if !defined $style && defined $fg 
                                      && (!defined $bg || $bg != $fg);
}

sub string {
  my $self   = shift;
  my $string = shift;
  my $font   = $self->font;
  if (ref $font && $font->isa('GD::Font')) {
    $self->gd->string($font,$self->curPos,$string,$self->fgcolor);
  }
  else {
    $self->useFontConfig(1);
    $self->stringFT($self->fgcolor,$font,
		    $self->fontsize,$self->fontangle,
		    $self->curPos,$string);
  }
}

sub curPos {  @{shift->{xy}}; }

sub gd { shift->{gd} }

sub font {
  my $self = shift;
  $self->{font} = shift if @_;
  $self->{font};
}

sub fontsize {
  my $self = shift;
  $self->{fontsize} = shift if @_;
  $self->{fontsize};
}

sub fontangle {
  my $self = shift;
  if (@_) {
    my $angle = shift;
    if (abs($angle) > 3.1414) {  # assume degrees
      $angle = -3.1414 * $angle/180;
    }
    $self->{fontangle} = $angle;
  }
  $self->{fontangle};
}

sub fgcolor {
  my $self = shift;
  $self->{fgcolor} = $self->translate_color(@_) if @_;
  $self->{fgcolor};
}

sub bgcolor {
  my $self = shift;
  $self->{bgcolor} = $self->translate_color(@_) if @_;
  $self->{bgcolor};
}

sub translate_color {
  my $self = shift;
  return unless defined $_[0];
  my ($r,$g,$b);
  if (@_ == 1 && $_[0] =~ /^\d+/) {  # previously allocated index
    return $_[0];
  }
  elsif (@_ == 3) {  # (rgb triplet)
    ($r,$g,$b) = @_;
  } else {
    $self->read_color_table unless %COLORS;
    die "unknown color" unless exists $COLORS{lc $_[0]};
    ($r,$g,$b) = @{$COLORS{lc $_[0]}};
  }
  return $self->colorResolve($r,$g,$b);
}

sub read_color_table {
  my $class = shift;
  while (<DATA>) {
    chomp;
    last if /^__END__/;
    my ($name,$r,$g,$b) = split /\s+/;
    $COLORS{$name} = [hex $r,hex $g,hex $b];
  }
}

1;

__DATA__
white                FF           FF            FF
black                00           00            00
aliceblue            F0           F8            FF
antiquewhite         FA           EB            D7
aqua                 00           FF            FF
aquamarine           7F           FF            D4
azure                F0           FF            FF
beige                F5           F5            DC
bisque               FF           E4            C4
blanchedalmond       FF           EB            CD
blue                 00           00            FF
blueviolet           8A           2B            E2
brown                A5           2A            2A
burlywood            DE           B8            87
cadetblue            5F           9E            A0
chartreuse           7F           FF            00
chocolate            D2           69            1E
coral                FF           7F            50
cornflowerblue       64           95            ED
cornsilk             FF           F8            DC
crimson              DC           14            3C
cyan                 00           FF            FF
darkblue             00           00            8B
darkcyan             00           8B            8B
darkgoldenrod        B8           86            0B
darkgray             A9           A9            A9
darkgreen            00           64            00
darkkhaki            BD           B7            6B
darkmagenta          8B           00            8B
darkolivegreen       55           6B            2F
darkorange           FF           8C            00
darkorchid           99           32            CC
darkred              8B           00            00
darksalmon           E9           96            7A
darkseagreen         8F           BC            8F
darkslateblue        48           3D            8B
darkslategray        2F           4F            4F
darkturquoise        00           CE            D1
darkviolet           94           00            D3
deeppink             FF           14            100
deepskyblue          00           BF            FF
dimgray              69           69            69
dodgerblue           1E           90            FF
firebrick            B2           22            22
floralwhite          FF           FA            F0
forestgreen          22           8B            22
fuchsia              FF           00            FF
gainsboro            DC           DC            DC
ghostwhite           F8           F8            FF
gold                 FF           D7            00
goldenrod            DA           A5            20
gray                 80           80            80
green                00           80            00
greenyellow          AD           FF            2F
honeydew             F0           FF            F0
hotpink              FF           69            B4
indianred            CD           5C            5C
indigo               4B           00            82
ivory                FF           FF            F0
khaki                F0           E6            8C
lavender             E6           E6            FA
lavenderblush        FF           F0            F5
lawngreen            7C           FC            00
lemonchiffon         FF           FA            CD
lightblue            AD           D8            E6
lightcoral           F0           80            80
lightcyan            E0           FF            FF
lightgoldenrodyellow FA           FA            D2
lightgreen           90           EE            90
lightgrey            D3           D3            D3
lightpink            FF           B6            C1
lightsalmon          FF           A0            7A
lightseagreen        20           B2            AA
lightskyblue         87           CE            FA
lightslategray       77           88            99
lightsteelblue       B0           C4            DE
lightyellow          FF           FF            E0
lime                 00           FF            00
limegreen            32           CD            32
linen                FA           F0            E6
magenta              FF           00            FF
maroon               80           00            00
mediumaquamarine     66           CD            AA
mediumblue           00           00            CD
mediumorchid         BA           55            D3
mediumpurple         100          70            DB
mediumseagreen       3C           B3            71
mediumslateblue      7B           68            EE
mediumspringgreen    00           FA            9A
mediumturquoise      48           D1            CC
mediumvioletred      C7           15            85
midnightblue         19           19            70
mintcream            F5           FF            FA
mistyrose            FF           E4            E1
moccasin             FF           E4            B5
navajowhite          FF           DE            AD
navy                 00           00            80
oldlace              FD           F5            E6
olive                80           80            00
olivedrab            6B           8E            23
orange               FF           A5            00
orangered            FF           45            00
orchid               DA           70            D6
palegoldenrod        EE           E8            AA
palegreen            98           FB            98
paleturquoise        AF           EE            EE
palevioletred        DB           70            100
papayawhip           FF           EF            D5
peachpuff            FF           DA            B9
peru                 CD           85            3F
pink                 FF           C0            CB
plum                 DD           A0            DD
powderblue           B0           E0            E6
purple               80           00            80
red                  FF           00            00
rosybrown            BC           8F            8F
royalblue            41           69            E1
saddlebrown          8B           45            13
salmon               FA           80            72
sandybrown           F4           A4            60
seagreen             2E           8B            57
seashell             FF           F5            EE
sienna               A0           52            2D
silver               C0           C0            C0
skyblue              87           CE            EB
slateblue            6A           5A            CD
slategray            70           80            90
snow                 FF           FA            FA
springgreen          00           FF            7F
steelblue            46           82            B4
tan                  D2           B4            8C
teal                 00           80            80
thistle              D8           BF            D8
tomato               FF           63            47
turquoise            40           E0            D0
violet               EE           82            EE
wheat                F5           DE            B3
whitesmoke           F5           F5            F5
yellow               FF           FF            00
yellowgreen          9A           CD            32
gradient1	00 ff 00
gradient2	0a ff 00
gradient3	14 ff 00
gradient4	1e ff 00
gradient5	28 ff 00
gradient6	32 ff 00
gradient7	3d ff 00
gradient8	47 ff 00
gradient9	51 ff 00
gradient10	5b ff 00
gradient11	65 ff 00
gradient12	70 ff 00
gradient13	7a ff 00
gradient14	84 ff 00
gradient15	8e ff 00
gradient16	99 ff 00
gradient17	a3 ff 00
gradient18	ad ff 00
gradient19	b7 ff 00
gradient20	c1 ff 00
gradient21	cc ff 00
gradient22	d6 ff 00
gradient23	e0 ff 00
gradient24	ea ff 00
gradient25	f4 ff 00
gradient26	ff ff 00
gradient27	ff f4 00
gradient28	ff ea 00
gradient29	ff e0 00
gradient30	ff d6 00
gradient31	ff cc 00
gradient32	ff c1 00
gradient33	ff b7 00
gradient34	ff ad 00
gradient35	ff a3 00
gradient36	ff 99 00
gradient37	ff 8e 00
gradient38	ff 84 00
gradient39	ff 7a 00
gradient40	ff 70 00
gradient41	ff 65 00
gradient42	ff 5b 00
gradient43	ff 51 00
gradient44	ff 47 00
gradient45	ff 3d 00
gradient46	ff 32 00
gradient47	ff 28 00
gradient48	ff 1e 00
gradient49	ff 14 00
gradient50	ff 0a 00
__END__
