use ExtUtils::MakeMaker qw(prompt WriteMakefile);
use ExtUtils::Constant 'WriteConstants';
use Config;
use strict;

require 5.6.0;

unless (@ARGV) {
warn <<END;
Notice: Type perl Makefile.PL -h for command-line option summary.

END
}


# =====> PATHS: CHECK AND ADJUST <=====
my (@INC,@LIBPATH,@LIBS,$LIBGD_VERSION);
my $AUTOCONFIG = 0;      # global set by try_to_autoconfigure() below
my $HAVE_GD2 = 1;        # until libgd 2.3.1, unset by try_to_autoconfigure()

my ($options,$lib_gd_path,$lib_ft_path,$lib_png_path,$lib_jpeg_path,$lib_xpm_path,
    $lib_tiff_path,$lib_webp_path,$lib_raqm_path,$lib_heif_path,$lib_avif_path,
    $lib_zlib_path,$lib_fontconfig_path,$force,$FCGI,$gdlib_config_path,
    $lib_bmp_path);

use Getopt::Long;
my $result = GetOptions("ignore_missing_gd" => \$force,
                        "options=s"       => \$options,
			"lib_gd_path=s"   => \$lib_gd_path,
			"lib_ft_path=s"   => \$lib_ft_path,
			"lib_png_path=s"  => \$lib_png_path,
			"lib_jpeg_path=s" => \$lib_jpeg_path,
			"lib_tiff_path=s" => \$lib_tiff_path,
			"lib_xpm_path=s"  => \$lib_xpm_path,
			"lib_webp_path=s" => \$lib_webp_path,
			"lib_raqm_path=s" => \$lib_raqm_path,
			"lib_heif_path=s" => \$lib_heif_path,
			"lib_avif_path=s" => \$lib_avif_path,
			"lib_zlib_path=s" => \$lib_zlib_path,
      "lib_bmp_path=s"  => \$lib_bmp_path,
                        "lib_fontconfig_path=s" => \$lib_fontconfig_path,
                        "gdlib_config_path=s" => \$gdlib_config_path,
                        "fcgi"            => \$FCGI,
		       );

unless (try_to_autoconfigure() || $force) {
    die <<END;
**UNRECOVERABLE ERROR**
Could not find gdlib-config nor pkgconfig/gdlib.pc. Please install libgd 2.0.28 or higher.
In Debian and its derivatives (e.g. Ubuntu), it is provided by the libgd-dev or
libgd2-xpm-dev package. Their libgd3 is the latest 2.2.5 (which has a severe security bug).
On Redhat and derivatives or OpenSUSE you need gd-devel.
On FreeBSD it is installed by the graphics/gd port.
Mandriva has libgd2-devel, libgd-devel or lib64gd-devel.
If you want to try to compile anyway, please rerun this script with the option --ignore_missing_gd.
END
}

@LIBS    = qw(-lgd) unless @LIBS;

# support for AMD64 libraries
if (-d '/usr/lib64') {
  my @libs64 = map {my $a = $_; $a=~ s/lib$/lib64/; $a} @LIBPATH;
  @LIBPATH = (@LIBPATH,@libs64);
}

#############################################################################################
# Build options passed in to script to support reproducible builds via Makefiles
#############################################################################################
unless ($result) {
  print STDERR <<END;
Usage: perl Makefile.PL [options]

Configure GD module.

 Options:
     --options       "JPEG,GD2,FT,PNG,WEBP,GIF,XPM,ANIMGIF"   feature options, separated by commas
     --lib_gd_path   path            path to libgd (/usr/lib)
     --lib_ft_path   path            path to Freetype library (/usr)
     --lib_png_path  path            path to libpng (/usr)
     --lib_jpeg_path path            path to libjpeg (/usr)
     --lib_xpm_path  path            path to libxpm (/usr)
     --lib_tiff_path  path           path to libtiff (/usr)
     --lib_webp_path  path           path to libwebp (/usr)
     --lib_raqm_path  path           path to libraqm (/usr)
     --lib_heif_path  path           path to libheif (/usr)
     --lib_avif_path  path           path to libavif (/usr)
     --lib_zlib_path path            path to libpng (/usr)
     --lib_fontconfig_path path      path to libfontconfig (/usr)
     --gdlib_config_path path        path to gdlib-config (/usr/bin)
     --ignore_missing_gd             Ignore missing or old libgd installations and try to compile anyway
     --fcgi                          build for FastCGI compatibility, i.e. no PerlIO

If no options are passed on the command line.  The program will
attempt to autoconfigure itself with the gdlib-config program or pkgconfig/gdlib.pc
(present in GD versions 2.0.27 or later).  Otherwise it will prompt for these
values interactively.
END
}

if( defined($options) )
{
    print "Included Features:          $options\n";
}
if( defined($lib_gd_path) )
{
    print "GD library used from:       $lib_gd_path\n";
}
if( defined($lib_ft_path) )
{
    print "FreeType library used from: $lib_ft_path\n";
    @INC     = ("-I$lib_ft_path/include", @INC);
    @LIBPATH = ("-L$lib_ft_path/lib", @LIBPATH);
}
if( defined($lib_png_path) )
{
    print "PNG library used from:      $lib_png_path\n";
    @INC     = ("-I$lib_png_path/include", @INC);
    @LIBPATH = ("-L$lib_png_path/lib", @LIBPATH);
}
if( defined($lib_jpeg_path) )
{
    print "JPEG library used from:      $lib_jpeg_path\n";
    @INC     = ("-I$lib_jpeg_path/include", @INC);
    @LIBPATH = ("-L$lib_jpeg_path/lib", @LIBPATH);
}
if( defined($lib_xpm_path) )
{
    print "XPM library used from:      $lib_xpm_path\n";
    @INC     = ("-I$lib_xpm_path/include", @INC);
    @LIBPATH = ("-L$lib_xpm_path/lib", @LIBPATH);
}
if( defined($lib_zlib_path) )
{
    print "Zlib library used from:     $lib_zlib_path\n";
    @INC     = ("-I$lib_zlib_path/include", @INC);
    @LIBPATH = ("-L$lib_zlib_path/lib", @LIBPATH);
}
if( defined($lib_tiff_path) )
{
    print "TIFF library used from:     $lib_tiff_path\n";
    @INC     = ("-I$lib_tiff_path/include", @INC);
    @LIBPATH = ("-L$lib_tiff_path/lib", @LIBPATH);
}
if( defined($lib_fontconfig_path) )
{
    print "Fontconfig library used from:     $lib_fontconfig_path\n";
    @INC     = ("-I$lib_fontconfig_path/include", @INC);
    @LIBPATH = ("-L$lib_fontconfig_path/lib", @LIBPATH);
}
if( defined($lib_webp_path) )
{
    print "WEBP library used from:      $lib_webp_path\n";
    @INC     = ("-I$lib_webp_path/include", @INC);
    @LIBPATH = ("-L$lib_webp_path/lib", @LIBPATH);
}
if( defined($lib_raqm_path) )
{
    print "RAQM library used from:      $lib_raqm_path\n";
    @INC     = ("-I$lib_raqm_path/include", @INC);
    @LIBPATH = ("-L$lib_raqm_path/lib", @LIBPATH);
}
if( defined($lib_heif_path) )
{
    print "HEIF library used from:      $lib_heif_path\n";
    @INC     = ("-I$lib_heif_path/include", @INC);
    @LIBPATH = ("-L$lib_heif_path/lib", @LIBPATH);
}
if( defined($lib_avif_path) )
{
    print "AVIF library used from:      $lib_avif_path\n";
    @INC     = ("-I$lib_avif_path/include", @INC);
    @LIBPATH = ("-L$lib_avif_path/lib", @LIBPATH);
}
if( defined($lib_bmp_path) )
{
    print "BMP library used from:      $lib_bmp_path\n";
    @INC     = ("-I$lib_bmp_path/include", @INC);
    @LIBPATH = ("-L$lib_bmp_path/lib", @LIBPATH);
}
if( defined($gdlib_config_path) )
{
    print "gdlib-config used:          $gdlib_config_path\n";
}
else
{
    $gdlib_config_path = "gdlib-config";
    print "$gdlib_config_path used from the PATH\n";
}
#############################################################################################

push @LIBS, '-lfcgi' if $FCGI;

if ($^O eq 'VMS'){
  warn "This is a build on OpenVMS. In case of problems with the build\n";
  warn "do not bother Lincoln Stein but get in touch with\n";
  warn "Martin P.J. Zinser (zinser\@decus.de)\n\n";

  if ($ENV{"LIB_ROOT"} eq "") {
    warn "Define lib_root as a concealed logical pointing to the\n";
    warn "Top directory where you have your libraries installed\n";
    warn "E.g. define/job/trans=conc lib_root public\$device:[public.util.libs.]\n";
    warn "Also define the logical pubbin to point to the location\n";
    warn "of the object libraries\n";
    warn "Then re-invoke Makefile.PL\n";
    warn "Exiting now...\n";
    exit;
  }

  @INC     = qw(-I/lib_root/gd -I/lib_root/libpng -I/lib_root/zlib);
  @LIBPATH = qw(-Lpubbin);
  @LIBS    = qw(-llibgd.olb -llibpng.olb -llibz.olb);
}

# workaround for solaris and other systems
elsif ($^O =~ /(solaris|hpux)/i) {
    push @LIBS,'-liconv';
}

###################################################################
# path to libgd, skip prompt if passed in from above
###################################################################
my $PREFIX = $lib_gd_path;
if( ! defined($lib_gd_path) )
{
  warn "\n";
  $PREFIX = prompt('Where is libgd installed?','/usr/lib');
}

unless ($AUTOCONFIG || $PREFIX eq '/usr/lib') {
  $PREFIX =~ s!/lib$!!;
  unshift @INC,"-I$PREFIX/include";
  unshift @LIBPATH,"-L$PREFIX/lib";
}

# FEATURE FLAGS

##################################################################################################################
# If build options have not been passed in then prompt for settings
##################################################################################################################
my ($JPEG, $GD2, $FT, $XPM, $GIF,$ANIMGIF,$UNCLOSEDPOLY,$FONTCONFIG,$PNG,$TIFF,
    $WEBP,$RAQM,$WBMP,$BMP,$FTCIRCLE,$VERSION_33, $HEIF, $AVIF);
if( defined($options) )
{
    # WBMP is builtin since at least 1.8.0
  if (!defined($LIBGD_VERSION) || $LIBGD_VERSION ge '1.8.0') {
    $WBMP = 1;
  }
  $JPEG      = $options =~ m/JPEG/i;
  $GD2       = $options =~ m/GD2/i;
  $FT        = $options =~ m/FT|FREETYPE/i;
  $XPM       = $options =~ m/XPM/i;
  $GIF       = $options =~ m/GIF/i;
  $PNG       = $options =~ m/PNG/i;
  $TIFF      = $options =~ m/TIFF/i;
  $WEBP      = $options =~ m/WEBP/i;
  $RAQM      = $options =~ m/RAQM/i;
  $HEIF      = $options =~ m/HEIF/i;
  $AVIF      = $options =~ m/AVIF/i;
  $BMP       = $options =~ m/WINDOWS_BMP/i;
  $ANIMGIF   = $GIF && $options =~ m/ANIMGIF/i;
  $VERSION_33= $options =~ m/VERSION_33/i; # i.e. 2.0.33 or higher
  $UNCLOSEDPOLY  = $options =~ m/UNCLOSEDPOLY/i;
  $FONTCONFIG  = $options =~ m/FONTCONFIG/i;
  $FTCIRCLE  = $options =~ m/FTCIRCLE/i;
}
else
{
    warn "\nPlease choose the features that match how libgd was built:\n";
    $WBMP = 1;
    $BMP     = lc prompt('Build BMP support?','y') eq 'y';
    $JPEG    = lc prompt('Build JPEG support?','y') eq 'y';
    $PNG     = lc prompt('Build PNG support?','y') eq 'y';
    $GD2     = lc prompt('Build GD2 support?','y') eq 'y';
    $TIFF    = lc prompt('Build TIFF support?','y') eq 'y';
    $WEBP    = lc prompt('Build WEBP support?','y') eq 'y';
    $RAQM    = lc prompt('Build RAQM support?','y') eq 'y';
    $HEIF    = lc prompt('Build HEIF support?','y') eq 'y';
    $AVIF    = lc prompt('Build AVIF support?','y') eq 'y';
    $FT      = lc prompt('Build FreeType support?','y') eq 'y';
    if ($FT) {
      $FONTCONFIG = lc prompt('Build fontconfig support?','y') eq 'y';
      $FTCIRCLE   = lc prompt('Build with FTCircle support?','y') eq 'y';
    }
    $GIF     = lc prompt('Build GIF support?','y') eq 'y';
    $ANIMGIF = $GIF && lc prompt('Build support for animated GIFs?','y') eq 'y';
    $XPM     = $^O !~ /^freebsd|MSWin32$/ && lc prompt('Build XPM support?','y') eq 'y';
}
##################################################################################################################

#### no user-serviceable parts below #####

if (!$AUTOCONFIG) {
  warn "\nIf you experience compile problems, please check the \@INC, \@LIBPATH and \@LIBS\n",
       "arrays defined in Makefile.PL and manually adjust, if necessary.\n\n";

  push @LIBS,'-lfreetype'      if $FT;
  push @LIBS,'-ljpeg'          if $JPEG;
  push @LIBS,'-lpng','-lz'     if $PNG;
  push @LIBS,'-ltiff'          if $TIFF;
  push @LIBS,'-lwebp'          if $WEBP;
  push @LIBS,'-lraqm'          if $RAQM;
  push @LIBS,'-lheif'          if $HEIF;
  push @LIBS,'-lavif'          if $AVIF;
  push @LIBS,'-lm'             unless $^O eq 'MSWin32';
  push @INC, '-I/lib_root/libjpeg' if ($JPEG && $^O eq 'VMS');
  push @INC, '-I/lib_root/ft2/include/freetype' if ($FT && $^O eq 'VMS');
  push @INC, '-I/X11' if ($XPM && $^O eq 'VMS');

  # FreeBSD 3.3 with libgd built from ports croaks if -lXpm is specified
  if ($^O ne 'freebsd' && $^O ne 'MSWin32') {
    push @LIBS,'-lX11','-lXpm' if $XPM;
  }
}

my $CAPI = defined $ExtUtils::MakeMaker::CAPI_support;
my $DEFINES = '';
$DEFINES    .= ' -DHAVE_WBMP'    if $WBMP; # since 1.8.0
$DEFINES    .= ' -DHAVE_JPEG'    if $JPEG;
$DEFINES    .= ' -DHAVE_FT'      if $FT;
$DEFINES    .= ' -DHAVE_XPM'     if $XPM;
$DEFINES    .= ' -DHAVE_GIF'     if $GIF;
$DEFINES    .= ' -DHAVE_GD2'     if $HAVE_GD2;
$DEFINES    .= ' -DHAVE_PNG'     if $PNG;
$DEFINES    .= ' -DHAVE_TIFF'    if $TIFF;
$DEFINES    .= ' -DFCGI'         if $FCGI;
$DEFINES    .= ' -DHAVE_ANIMGIF' if $ANIMGIF;
$DEFINES    .= ' -DVERSION_33'   if $VERSION_33;
$DEFINES    .= ' -DHAVE_UNCLOSEDPOLY' if $UNCLOSEDPOLY;
$DEFINES    .= ' -DHAVE_FONTCONFIG'   if $FONTCONFIG;
$DEFINES    .= ' -DHAVE_FTCIRCLE'  if $FTCIRCLE;
$DEFINES    .= ' -DHAVE_WEBP'    if $WEBP;
$DEFINES    .= ' -DHAVE_RAQM'    if $RAQM;
$DEFINES    .= ' -DHAVE_HEIF'    if $HEIF;
$DEFINES    .= ' -DHAVE_AVIF'    if $AVIF;
$DEFINES    .= ' -DHAVE_BMP'     if $BMP; # since 2.1.0
$DEFINES    .= " -DLIBGD_VERSION=\"$LIBGD_VERSION\"" if defined($LIBGD_VERSION);
open F,">.config.cache";
print F $DEFINES,"\n";
close F;

my $CCFLAGS = $Config{ccflags};
$CCFLAGS .= " -Wall -Wextra -Wformat=1" if $Config{gccversion} and $] > 5.020;
# hardened CFLAGS for testing
#$CCFLAGS .= ' -D_GNU_SOURCE -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches';

my %WriteMakefileArgs = (
    'NAME'	=> 'GD',
    'ABSTRACT'  => 'Perl interface to the gd2 graphics library',
    'VERSION_FROM'	=> 'lib/GD.pm',
    'PREREQ_PM' => {
        'Math::Trig' => 0,
    },
    'CONFIGURE_REQUIRES' => {
        'ExtUtils::Constant' => 0.22,
        'ExtUtils::PkgConfig' => 0,
    },
    'TEST_REQUIRES' => {
        'Test::More' => 0.88,
        'Test::Fork' => 0.02,
    },
    'PL_FILES'  => {'bdf_scripts/bdf2gdfont_pl.PL' => 'bdf_scripts/bdf2gdfont.pl',
                    'lib/GD/Image_pm.PL' => 'lib/GD/Image.pm'},
    'LIBS'      => [join(' ',$ENV{'GD_LIBS'},@LIBPATH,@LIBS)],
    'INC'       => join(' ',$ENV{'GD_INC'},@INC),

    'CCFLAGS'   => $CCFLAGS,
    'EXE_FILES' => ['bdf_scripts/bdf2gdfont.pl'],
    'AUTHOR'    => 'Lincoln Stein <lincoln.stein@gmail.com>',
     # Maintained by Reini Urban now
     $CAPI ? ('CAPI'      => 'TRUE') : (),
    'DEFINE'	=> $DEFINES,
    'clean'     => {
        FILES => '.config.cache cover_db MANIFEST.git *.gcov GD.gcda GD.gcno'
                .' META.yml META.json'
     },
    'LICENSE'   => 'perl_5',

    'META_MERGE' => {
        "meta-spec" => { version => 2 },
        recommends => {
            'ExtUtils::PkgConfig' => 0,
            'Math::Trig'        => 0,
            'ExtUtils::Constant'=> '0.23',
            'Test::More'        => '0.88',
            'Test::Fork'        => '0.02',
        },
        resources => {
            repository => {
                web => "https://github.com/lstein/Perl-GD",
                url => "git://github.com/lstein/Perl-GD.git",
                type => 'git',
            },
            license => "https://dev.perl.org/licenses/",
        },
        prereqs => {
            develop => {
                requires => {
                    'Class::XSAccessor' => 0,
                    'Text::CSV_XS'      => 0,
                    'List::MoreUtils'   => 0,
                    'Test::Kwalitee'    => 0,
                    'Pod::Spell::CommonMistakes' => 0,
                    'Test::Pod'         => '1.00',
                    'Algorithm::Diff'   => 0,
                },
            },
        },
    },
    SIGN => 1,
);

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };
delete $WriteMakefileArgs{TEST_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };
delete $WriteMakefileArgs{META_MERGE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.46) };

WriteMakefile(%WriteMakefileArgs);

my @constants_iv = qw(
  GD_CMP_IMAGE
  GD_CMP_NUM_COLORS
  GD_CMP_COLOR
  GD_CMP_SIZE_X
  GD_CMP_SIZE_Y
  GD_CMP_TRANSPARENT
  GD_CMP_BACKGROUND
  GD_CMP_INTERLACE
  GD_CMP_TRUECOLOR
  GD_PIXELATE_UPPERLEFT
  GD_PIXELATE_AVERAGE

  gdBrushed
  gdDashSize
  gdMaxColors
  gdStyled
  gdStyledBrushed
  gdTiled
  gdTransparent
  gdAntiAliased
  gdArc
  gdPie
  gdChord
  gdNoFill
  gdEdged

  gdEffectReplace
  gdEffectAlphaBlend
  gdEffectNormal
  gdEffectOverlay
  gdEffectMultiply

  gdAlphaMax
  gdAlphaOpaque
  gdAlphaTransparent
  gdRedMax
  gdGreenMax
  gdBlueMax

  GD_MAJOR_VERSION
  GD_MINOR_VERSION
  GD_RELEASE_VERSION

  GD_FLIP_HORINZONTAL
  GD_FLIP_VERTICAL
  GD_FLIP_BOTH
  GD_RESOLUTION

  GD_DEFAULT
  GD_BELL
  GD_BESSEL
  GD_BILINEAR_FIXED
  GD_BICUBIC
  GD_BICUBIC_FIXED
  GD_BLACKMAN
  GD_BOX
  GD_BSPLINE
  GD_CATMULLROM
  GD_GAUSSIAN
  GD_GENERALIZED_CUBIC
  GD_HERMITE
  GD_HAMMING
  GD_HANNING
  GD_MITCHELL
  GD_NEAREST_NEIGHBOUR
  GD_POWER
  GD_QUADRATIC
  GD_SINC
  GD_TRIANGLE
  GD_WEIGHTED4
  GD_LINEAR
  GD_METHOD_COUNT

  GD_AFFINE_TRANSLATE
  GD_AFFINE_SCALE
  GD_AFFINE_ROTATE
  GD_AFFINE_SHEAR_HORIZONTAL
  GD_AFFINE_SHEAR_VERTICAL
  );

# Note that ExtUtils::Constant::ProxySubs creates code incompatible
# with <5.14. Only 0.23_04 has that fixed.
if (!-e 'const-xs.inc' or !-e"const-c.inc") {
  WriteConstants(
    #PROXYSUBS => {autoload => 1},
    NAME => 'GD',
    NAMES => \@constants_iv,
    DEFAULT_TYPE => 'IV');
}

exit 0;

sub try_to_autoconfigure {
  #my ($options,$lib_gd_path,$INC,$LIBPATH,$LIBS) = @_;
  my ($version, $cflags, $ldflags, $libs, $libdir, $features, $includedir);
  # perl Makefile.PL --lib_gd_path /opt/libgd/2.1.1/lib
  my ($prefix) = $lib_gd_path ? ($lib_gd_path =~ m|(^.*)/lib|) : "";
  my $bindir = $prefix ? "$prefix/bin/" : $lib_gd_path ? "$lib_gd_path/bin/" : "";
  my $config = `${bindir}gdlib-config --all` if -e "${bindir}gdlib-config";
  if (!$config
      and !-e "$prefix/lib/pkgconfig/gdlib.pc"
      and !-e "/usr/lib/pkgconfig/gdlib.pc")
  {
    $gdlib_config_path = "gdlib-config" unless defined($gdlib_config_path);
    $config = `$gdlib_config_path --all`;
  }
  unless ($config) {
      my %config;
      require ExtUtils::PkgConfig;
      %config = ExtUtils::PkgConfig->find ("$prefix/lib/pkgconfig/gdlib.pc") if $prefix;
      %config = ExtUtils::PkgConfig->find ("gdlib") unless %config;
      return unless %config;
      $version  = $config{modversion};
      warn "Configuring for libgd version $version.\n";
      $cflags   = $config{cflags};
      $libs     = $config{libs};
      ($libdir, $libs) = $libs =~ m/-L(.*) (-lgd.*)/;
      # Requires.private:   zlib  libpng  freetype2 >= 9.8.3  fontconfig  libjpeg  xpm  libtiff-4
      # Libs.private:   -L/opt/local/lib -lz  -L/opt/local/lib -lpng16  -L/opt/local/lib -lfreetype  -L/opt/local/lib -lfontconfig -lfreetype   -ljpeg  -L/opt/local/lib -lXpm -lX11  -L/opt/local/lib -ltiff   -lwebp
      # not in the hash!
      # check the .pc file from $config{pkg}
      if ($config{pkg} and -e $config{pkg}) {
        my $F;
        open $F, "<", $config{pkg};
        my $private;
        while (<$F>) {
          next unless /^Requires.private/;
          $private = $_;
        }
        close $F;
        $features = 'GD_GIF GD_OPENPOLYGON';
        $features .= ' GD_ZLIB' if $private =~ / zlib /;
        $features .= ' GD_PNG' if $private =~ / libpng /;
        $features .= ' GD_FREETYPE' if $private =~ / freetype/;
        $features .= ' GD_FONTCONFIG' if $private =~ / fontconfig/;
        $features .= ' GD_RAQM' if $private =~ / raqm/;
        $features .= ' GD_JPEG' if $private =~ / libjpeg/;
        $features .= ' GD_XPM' if $private =~ / xpm/;
        $features .= ' GD_TIFF' if $private =~ / libtiff/;
        $features .= ' GD_WEBP' if $private =~ / libwebp/;
        $features .= ' GD_HEIF' if $private =~ / libheif/;
        $features .= ' GD_AVIF' if $private =~ / libavif/;
      } else {
        $features = 'GD_GIF GD_OPENPOLYGON GD_ZLIB GD_PNG GD_FREETYPE GD_FONTCONFIG GD_JPEG GD_XPM GD_TIFF GD_WEBP';
        #$features .= 'GD_WEBP' if $version ge '2.3.0';;
        $features .= ' GD_AVIF' if $version ge '2.3.2';
        $features .= ' GD_HEIF' if $version ge '2.3.3';
      }
      $AUTOCONFIG++;
  } else {
      $AUTOCONFIG++;

      ($version) = $config =~ /^GD library\s+(\S+)/m;
      warn "Configuring for libgd version $version.\n";

      ($includedir) = $config =~ /^includedir:\s*(.+)$/m;
      ($cflags)     = $config =~ /^cflags:\s*(.+)$/m;
      ($ldflags)    = $config =~ /^ldflags:\s*(.+)$/m;
      ($libs)       = $config =~ /^libs:\s*(.+)$/m;
      ($libdir)     = $config =~ /^libdir:\s*(.+)$/m;
      ($features)   = $config =~ /^features:\s*(.+)$/m;
      ($includedir) = $config =~ /^includedir:\s*(.+)$/m;
  }

  $LIBGD_VERSION = $version;
  @INC           = map {s/^-I// && "-I$_"} split /\s+/,$cflags;
  @LIBS          = split /\s+/,$libs;
  if ($libdir) {
      if ($config) {
          @LIBPATH      = map {s/^-L// && "-L$_"} split /\s+/,$ldflags;
          ($lib_gd_path = $libdir) =~ s!/[^/]+$!!;
      } else {
          $lib_gd_path = $libdir;
      }
      push @LIBPATH,"-L$libdir";
  }
  push @LIBS,"-lgd" unless $libs =~ /-lgd/;
  if (!$options) {
    $options = $features;

    my ($release, $major, $minor) = $version =~ /^(\d+)\.(\d+)\.(\d+)/;
    $options     .= " GD_UNCLOSEDPOLY GD_ANIMGIF GD_FTCIRCLE VERSION_33"
      if defined($minor)
      && ($release > 2
          || ($release == 2 && $major > 0)
          || ($release == 2 && $major == 0 && $minor >= 33));
    $options     .= " WINDOWS_BMP"
      if defined($minor)
      && ($release > 2
          || ($release == 2 && $major > 0));
    if (defined($minor)
        && ($release > 2
            || ($release == 2 && $major > 3)
            || ($release == 2 && $major == 3 && $minor >= 2))) {
      $HAVE_GD2 = 0;
      $AVIF = 1;
    } else {
      $options     .= " GD2";
      $HAVE_GD2 = 1;
      $AVIF = 0;
      $HEIF = 0;
    }
    if (defined($minor)
        && ($release > 2
            || ($release == 2 && $major > 3)
            || ($release == 2 && $major == 3 && $minor >= 3))) {
      $HEIF = 1;
    }
  }

  if ($config) {
      my @correct_inc = map {s/^-I// && $_} split /\s+/,$cflags;
      check_for_stray_headers($includedir,@correct_inc);
  }
  return 1;
}

sub check_for_stray_headers {
  my @official_libraries = @_;
  my %official_libraries = map {$_=>1} @official_libraries;
  print STDERR "Checking for stray libgd header files...";
  my $cc          = $Config{'cc'};
  my $data        = `$cc -print-search-dirs 2>/dev/null`;
  $data         ||= '';
  my ($libraries)    = $data =~ /^libraries: =(.+)/m;
  my @cc_libs        = split /:/,$libraries;
  foreach (@cc_libs) { s/\/$//; }

  my %libraries   = map {$_=>1} (@cc_libs,'/include','/usr/include',
				 '/usr/local/include','/opt/include',
				 '/usr/X11R6/include');
  my $problems;
  my $o = $official_libraries[0];
  foreach (keys %libraries) {

    s/\blib\b/include/;
    next if $official_libraries{$_};
    next unless -e "$_/gd.h";
    if (-l "$_/gd.h" or -l "$o/gd.h") {
      next if (stat("$_/gd.h"))[1] == (stat("$o/gd.h"))[1];
    }

    warn "\n\n** WARNING: found gd.h header file in ${_}/gd.h, but it is expected at $official_libraries[0]/gd.h. This may cause compile errors! **\n";
    $problems++;
  }
  print STDERR $problems ? "** Possible problems found **\n" : "none found.\n";
  print STDERR "\n";
}

sub MY::postamble {
    my $postamble = <<'END';
html: lib/GD.pm
	pod2html --outfile=GD.html lib/GD.pm

END
    $postamble;
}

package MY;

# Ignore templates
sub libscan {
    return 0 if $_[1] =~ /_p[ml].PL$/;
    return $_[1];
}


sub processPL {
    my $inherited = shift->SUPER::processPL(@_);
    $inherited    =~ s/(:: lib\/GD\/Image_pm\.PL)/$1 .config.cache/;
    $inherited;
}

sub depend {
  "
release : dist
	git tag release_\$(VERSION_SYM)
	cpan-upload \$(DISTVNAME).tar\$(SUFFIX)
	git push
	git push --tags

const-c.inc const-xs.inc : Makefile.PL

GCOV = gcov
test_cover :: pure_all
	\$(RM_RF) cover_db
	+\$(PERLRUNINST) -S cover -test

test_coveralls :: pure_all
	+\$(PERLRUNINST) -S cover -test -report coveralls

gcov : \$(BASEEXT).c.gcov \$(BASEEXT).gcov cover_db/\$(BASEEXT)-xs.html

\$(BASEEXT).c.gcov \$(BASEEXT).xs.gcov : \$(BASEEXT).xs
	\$(MAKE) CCFLAGS=\"\$(CCFLAGS) -fprofile-arcs -ftest-coverage\" LDDLFLAGS=\"\$(LDDLFLAGS) -fprofile-arcs -ftest-coverage\"
	\$(GCOV) \$(BASEEXT).c \$(BASEEXT).xs

cover_db/\$(BASEEXT)-xs.html : \$(BASEEXT).xs.gcov
	PERL5OPT=-MDevel::Cover make test
	-$^X -S gcov2perl \$(BASEEXT).c.gcov \$(BASEEXT).xs.gcov
	$^X -S cover

gprof :
	\$(MAKE) CCFLAGS=\"\$(CCFLAGS) -pg\" LDDLFLAGS=\"\$(LDDLFLAGS) -pg\"
"
}
