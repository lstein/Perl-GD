use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
my $CAPI = defined $ExtUtils::MakeMaker::CAPI_support ? 'TRUE' : 'FALSE';

# CHECK AND ADJUST
my @extrasearch = qw( -L/usr/lib/X11 -L/usr/X11R6/lib -L/usr/X11/lib -L/usr/local/lib );
my @extrainc    = '-I/usr/local/include', '-I/usr/local/include/gd'; 

my @extralibs;
push @extralibs, '-lgd','-lz','-lpng','-lttf';
push @extralibs, "-lm" unless $^O eq 'MSWin32';

# FreeBSD 3.3 with libgd built from ports croaks if -lXpm is specified 
if ($^O ne 'freebsd') { 
    push @extralibs,@extrasearch,'-lX11','-lXpm'; 
} 
 

WriteMakefile(
    'NAME'	=> 'GD',
    'VERSION_FROM'	=> 'GD.pm',
    'dist'      => {'COMPRESS'=>'gzip -9f', 'SUFFIX' => 'gz',
	            'ZIP'=>'/usr/bin/zip','ZIPFLAGS'=>'-rl'},
    'LIBS'      => [join ' ',@extralibs],
    'INC'       => join (' ',@extrainc), 
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

