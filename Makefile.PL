use ExtUtils::MakeMaker qw(prompt WriteMakefile);

warn "NOTICE: This module requires libgd 1.8.4 or higher (shared library version 4.X).\n";

# =====> PATHS: CHECK AND ADJUST <=====
my @INC     = qw(-I/usr/local/include -I/usr/local/include/gd); 
my @LIBPATH = qw(-L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/local/lib );
my @LIBS    = qw(-lgd -lpng -lz);

# FEATURE FLAGS
warn "\nPlease choose the features that match how libgd was built:\n";

my $JPEG    = lc prompt('Build JPEG support?','y') eq 'y';
my $TTF     = lc prompt('Build FreeType support?','y') eq 'y';
my $XPM     = $^O !~ /^freebsd|MSWin32$/ && lc prompt('Build XPM support?','y') eq 'y';
my $GIF		= lc prompt('Build GIF support (for patched versions of gd)?','n') eq 'y';

my $FCGI    = 0;   # set to 1 to build compatability with fastCGI

warn "\nIf you experience compile problems, please check the \@INC, \@LIBPATH and \@LIBS\n",
     "arrays defined in Makefile.PL and manually adjust, if necessary.\n\n";

#### no user-serviceable parts below #####

push @LIBS,'-lfreetype' if $TTF;
push @LIBS,'-ljpeg' if $JPEG;
push @LIBS, '-lm' unless $^O eq 'MSWin32';

# FreeBSD 3.3 with libgd built from ports croaks if -lXpm is specified 
if ($^O ne 'freebsd' && $^O ne 'MSWin32') { 
  push @LIBS,'-lX11','-lXpm' if $XPM; 
} 

my $CAPI = defined $ExtUtils::MakeMaker::CAPI_support ? 'TRUE' : 'FALSE';
my $DEFINES = '';
$DEFINES    .= ' -DHAVE_JPEG' if $JPEG;
$DEFINES    .= ' -DHAVE_TTF'  if $TTF;
$DEFINES    .= ' -DHAVE_XPM'  if $XPM;
$DEFINES    .= ' -DHAVE_GIF'  if $GIF;
$DEFINES    .= ' -DFCGI'      if $FCGI;

WriteMakefile(
    'NAME'	=> 'GD',
    'VERSION_FROM'	=> 'GD.pm',
    'dist'      => {'COMPRESS'=>'gzip -9f', 'SUFFIX' => 'gz',
	            'ZIP'=>'/usr/bin/zip','ZIPFLAGS'=>'-rl'},
    'LIBS'      => [join(' ',$ENV{'GD_LIBS'},@LIBPATH,@LIBS)],
    'INC'       => join(' ',$ENV{'GD_INC'},@INC), 
    'AUTHOR'    => 'Lincoln Stein (lstein@cshl.org)',
    'ABSTRACT'  => 'Interface to Gd Graphics Library',
    'CAPI'      => $CAPI,
    'DEFINE'	=> $DEFINES,
);

sub MY::postamble {
    my $postamble = <<'END';
html: GD.pm
	pod2html --outfile=GD.html GD.pm
END
    $postamble;
}

