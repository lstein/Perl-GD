use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
my $CAPI = defined $ExtUtils::MakeMaker::CAPI_support ? 'TRUE' : 'FALSE';

# perl not usually compiled with X11 libraries, so won't find Xpm
# unless we do this.
my @extrasearch = qw( -L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib);

my @extralibs;
push @extralibs, '-lgd','-lz','-lpng','-lttf';
push @extralibs, "-lm" unless $^O eq 'MSWin32';
push @extralibs,@extrasearch,'-lX11','-lXpm';

WriteMakefile(
    'NAME'	=> 'GD',
    'VERSION_FROM'	=> 'GD.pm',
    'dist'      => {'COMPRESS'=>'gzip -9f', 'SUFFIX' => 'gz',
	            'ZIP'=>'/usr/bin/zip','ZIPFLAGS'=>'-rl'},
    'LIBS'      => [join ' ',@extralibs],
    'AUTHOR'    => 'Lincoln Stein (lstein@cshl.org)',
    'ABSTRACT' => 'Interface to Gd Graphics Library',
    'CAPI' => $CAPI,
    # Uncomment the line below if you're using a perl compiled
    # for fastCGI (http://www.fastcgi.com/).
    # 'DEFINE'	=> '-DFCGI'
);

sub MY::postamble {
    my $postamble = <<'END';
html: GD.pm
	pod2html --outfile=GD.html GD.pm
END
    $postamble;
}

