use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
my $CAPI = defined $ExtUtils::MakeMaker::CAPI_support ? 'TRUE' : 'FALSE';

my @extralibs;
push @extralibs, "-lgd";
push @extralibs, "-lm" unless $^O eq 'MSWin32';

WriteMakefile(
    'NAME'	=> 'GD',
    'VERSION_FROM'	=> 'GD.pm',
    'dist'      => {'COMPRESS'=>'gzip -9f', 'SUFFIX' => 'gz',
	            'ZIP'=>'/usr/bin/zip','ZIPFLAGS'=>'-rl'},
    'LIBS'      => [ join(" ", @extralibs) ],
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

