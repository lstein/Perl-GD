use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
push my(@extralibs), "-lm" unless $^O eq 'MSWin32';

WriteMakefile(
    'NAME'	=> 'GD',
    'VERSION_FROM'	=> 'GD.pm',
    'MYEXTLIB'  => 'libgd/libgd$(LIB_EXT)',
    'dist'      => {'COMPRESS'=>'gzip -9f', 'SUFFIX' => 'gz',
	            'ZIP'=>'/usr/bin/zip','ZIPFLAGS'=>'-rl'},
    # Uncomment the line below if you're getting link errors
    # having to do with missing math functions (like floor)
    'LIBS'      =>  [@extralibs],
    # Uncomment the line below if you're using a perl compiled
    # for fastCGI (http://www.fastcgi.com/).
    # 'DEFINE'	=> '-DFCGI'
);

sub MY::postamble {
    my $postamble =<<'END';
$(MYEXTLIB): libgd/Makefile
END

    $postamble .= ($^O eq 'MSWin32') ? <<'END1' : <<'END2';
	cd libgd && $(MAKE) all DEFINE=$(DEFINE)
END1
	cd libgd && $(MAKE) -e all
END2

    $postamble .= <<'END';

html: GD.pm
	pod2html GD.pm
	mv GD.pm.html GD.html
END

    $postamble;
}

