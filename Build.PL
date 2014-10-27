#!/usr/bin/perl

use strict;
use Module::Build;
use Getopt::Long;
use Config;

# =====> PATHS: CHECK AND ADJUST <=====
my (@INC,@LIBPATH,@LIBS);
my $AUTOCONFIG = 0;      # global set by try_to_autoconfigure() below

my ($options,$lib_gd_path,$lib_ft_path,$lib_png_path,$lib_jpeg_path,$lib_xpm_path,$lib_zlib_path);

unless (try_to_autoconfigure(\$options,\$lib_gd_path,\@INC,\@LIBPATH,\@LIBS)) {
    die <<END;
**UNRECOVERABLE ERROR**
Could not find gdlib-config in the search path. Please install libgd 2.0.28 or higher.
END
}

@INC     = qw(-I/usr/include -I/usr/include/gd) unless @INC;
@LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/lib) unless @LIBPATH;
@LIBS    = qw(-lgd) unless @LIBS;

# support for AMD64 libraries
if (-d '/usr/lib64') {
  my @libs64 = map {my $a = $_; $a=~ s/lib$/lib64/; $a} @LIBPATH;
  @LIBPATH = (@LIBPATH,@libs64);
}

#############################################################################################
# Build options passed in to script to support reproducible builds via Makefiles
#############################################################################################
my $result = GetOptions("options=s"       => \$options,
			"lib_gd_path=s"   => \$lib_gd_path,
			"lib_ft_path=s"   => \$lib_ft_path,
			"lib_png_path=s"  => \$lib_png_path,
			"lib_jpeg_path=s" => \$lib_jpeg_path,
			"lib_xpm_path=s"  => \$lib_xpm_path,
			"lib_zlib_path=s" => \$lib_zlib_path,
		       );
unless ($result) {
  die <<END;
Usage: perl Build.PL [options]

Configure GD module.

 Options:
     -options       "JPEG,FT,PNG,GIF,XPM,ANIMGIF"   feature options, separated by commas
     -lib_gd_path   path            path to libgd
     -lib_ft_path   path            path to Freetype library
     -lib_png_path  path            path to libpng
     -lib_jpeg_path path            path to libjpeg
     -lib_xpm_path  path            path to libxpm
     -lib_zlib_path path            path to libpng
     -ignore_missing_gd             Ignore missing or old libgd installations and try to compile anyway

If no options are passed on the command line.  The program will
attempt to autoconfigure itself with the gdlib-config program (present
in GD versions 2.0.27 or later).  Otherwise it will prompt for these
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
#############################################################################################

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

# workaround for solaris systems?
elsif ($^O =~ /solaris/i) {
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
my ($JPEG, $FT, $XPM, $GIF,$ANIMGIF,$UNCLOSEDPOLY,$FONTCONFIG,$PNG,$FTCIRCLE,$VERSION_33);
if( defined($options) )
{
  $JPEG      = $options =~ m/JPEG/i;
  $FT        = $options =~ m/FT|FREETYPE/i;
  $XPM       = $options =~ m/XPM/i;
  $GIF       = $options =~ m/GIF/i;
  $PNG       = $options =~ m/PNG/i;
  $ANIMGIF   = $GIF && $options =~ m/ANIMGIF/i;
  $VERSION_33= $options =~ m/VERSION_33/i;
  $UNCLOSEDPOLY  = $options =~ m/UNCLOSEDPOLY/i;
  $FONTCONFIG  = $options =~ m/FONTCONFIG/i;
  $FTCIRCLE  = $options =~ m/FTCIRCLE/i;
}
else
{
    warn "\nPlease choose the features that match how libgd was built:\n";
    $JPEG    = lc prompt('Build JPEG support?','y') eq 'y';
    $PNG     = lc prompt('Build PNG support?','y') eq 'y';
    $FT      = lc prompt('Build FreeType support?','y') eq 'y';
    $GIF     = lc prompt('Build GIF support?','y') eq 'y';
    $ANIMGIF = $GIF && lc prompt('Build support for animated GIFs?','y') eq 'y';
    $XPM     = $^O !~ /^freebsd|MSWin32$/ && lc prompt('Build XPM support?','y') eq 'y';
}
##################################################################################################################

my $FCGI    = 0;   # set to 1 to build compatability with fastCGI

#### no user-serviceable parts below #####

if (!$AUTOCONFIG) {
  warn "\nIf you experience compile problems, please check the \@INC, \@LIBPATH and \@LIBS\n",
       "arrays defined in Makefile.PL and manually adjust, if necessary.\n\n";

  push @LIBS,'-lfreetype'      if $FT;
  push @LIBS,'-ljpeg'          if $JPEG;
  push @LIBS,'-lpng','-lz'     if $PNG;
  push @LIBS, '-lm'       unless $^O eq 'MSWin32';
  push @INC, '-I/lib_root/libjpeg' if ($JPEG && $^O eq 'VMS');
  push @INC, '-I/lib_root/ft2/include/freetype' if ($FT && $^O eq 'VMS');
  push @INC, '-I/X11' if ($XPM && $^O eq 'VMS');

  # FreeBSD 3.3 with libgd built from ports croaks if -lXpm is specified 
  if ($^O ne 'freebsd' && $^O ne 'MSWin32') { 
    push @LIBS,'-lX11','-lXpm' if $XPM; 
  }
}

my $DEFINES = '';
$DEFINES    .= ' -DHAVE_JPEG'    if $JPEG;
$DEFINES    .= ' -DHAVE_FT'      if $FT;
$DEFINES    .= ' -DHAVE_XPM'     if $XPM;
$DEFINES    .= ' -DHAVE_GIF'     if $GIF;
$DEFINES    .= ' -DHAVE_PNG'     if $PNG;
$DEFINES    .= ' -DFCGI'         if $FCGI;
$DEFINES    .= ' -DHAVE_ANIMGIF' if $ANIMGIF;
$DEFINES    .= ' -DVERSION_33'   if $VERSION_33;
$DEFINES    .= ' -DHAVE_UNCLOSEDPOLY' if $UNCLOSEDPOLY;
$DEFINES    .= ' -DHAVE_FONTCONFIG'   if $FONTCONFIG;
$DEFINES    .= ' -DHAVE_FTCIRCLE'  if $FTCIRCLE;
open F,">.config.cache";
print F $DEFINES,"\n";
close F;

# @INC code was originally written for Makefile.PL. Get rid of -I prefix
foreach (@INC) {
    s/^-I//;
}
unshift @INC,$ENV{GD_INC} if $ENV{GD_INC};

my $build = Module::Build->new(
    module_name         => 'GD',
    dist_version_from	=> 'lib/GD.pm',
    dist_author         => 'Lincoln Stein <lincoln.stein@gmail.com>',
    dist_abstract       => 'Perl interface to the gd2 graphics library',
    license             => 'perl',
    requires            => {
	'Math::Trig'    => 0,
    },
    build_requires      => {
	'ExtUtils::CBuilder' => 0,
    },
    configure_requires => {
	'Module::Build' => 0.42,
    },
    include_dirs        => \@INC,
    extra_linker_flags  => "$ENV{'GD_LIBS'} @LIBPATH @LIBS",
    PL_files            => {'bdf_scripts/bdf2gdfont.PLS' => 'bdf_scripts/bdf2gdfont.pl',
			    'lib/GD/Image.pm.PLS' => 'lib/GD/Image.pm',
		   },
    extra_compiler_flags => $DEFINES,
    script_files        => 'bdf_scripts',
    meta_merge => {
	'meta-spec' => { version => 2 },
	x_repository => {
	    type => 'git',
	    url  => 'git://github.com/lstein/Perl-GD.git',
	    web  => 'https://github.com/lstein/Perl-GD',
	},
    }
    );

$build->create_build_script;
exit 0;

sub try_to_autoconfigure {
  my ($options,$lib_gd_path,$INC,$LIBPATH,$LIBS) = @_;
  my $config = `gdlib-config --all`;
  return unless $config;
  $AUTOCONFIG++;

  my ($version) = $config =~ /^GD library\s+(\S+)/m;
  warn "Configuring for libgd version $version.\n";

  my ($cflags)     = $config =~ /^cflags:\s+(.+)/m;
  my ($ldflags)    = $config =~ /^ldflags:\s+(.+)/m;
  my ($libs)       = $config =~ /^libs:\s+(.+)/m;
  my ($libdir)     = $config =~ /^libdir:\s+(.+)/m;
  my ($features)   = $config =~ /^features:\s+(.+)/m;
  my ($includedir) = $config =~ /^includedir:\s+(.+)/m;

  @$INC          = map {s/^-I// && "-I$_"} split /\s+/,$cflags;
  @$LIBPATH      = map {s/^-L// && "-L$_"} split /\s+/,$ldflags;
  @$LIBS         = split /\s+/,$libs;

  push @$LIBS,"-lgd";
  push @$LIBPATH,"-L$libdir";
  ($$lib_gd_path = $libdir) =~ s!/[^/]+$!!;
  $$options      = $features;

  my ($minor)    = $version =~ /^2\.\d+\.(\d+)$/;
  $$options     .= " GD_UNCLOSEDPOLY GD_ANIMGIF GD_FTCIRCLE VERSION_33" if defined($minor) && $minor >= 33;

  my @correct_inc = map {s/^-I// && $_} split /\s+/,$cflags;
  check_for_stray_headers($includedir,@correct_inc);
  return 1;
}

sub check_for_stray_headers {
  my @official_libraries = @_;
  my %official_libraries = map {$_=>1} @official_libraries;
  print STDERR "Checking for stray libgd header files...";
  my $cc          = $Config{'cc'};
  my $data        = `$cc -print-search-dirs`;
  $data         ||= '';
  my ($libraries)    = $data =~ /^libraries: =(.+)/m;
  my @cc_libs        = split /:/,$libraries;
  foreach (@cc_libs) { s/\/$//; }

  my %libraries   = map {$_=>1} (@cc_libs,'/include','/usr/include',
				 '/usr/local/include','/opt/include',
				 '/usr/X11R6/include');
  my $problems;
  foreach (keys %libraries) {

    s/\blib\b/include/;
    next if $official_libraries{$_};
    next unless -e "$_/gd.h";

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

sub processPL {
    my $inherited = shift->SUPER::processPL(@_);
    $inherited    =~ s/(:: \/libGD\/Image.pm.PLS)/$1 .config.cache/;
    $inherited;
}

