use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'GD',
    'VERSION'	=> '1.14',
    'MYEXTLIB'  => 'libgd/libgd$(LIB_EXT)',
    'dist'      => {'COMPRESS'=>'gzip -9f', 'SUFFIX' => 'gz',
	            'ZIP'=>'/usr/bin/zip','ZIPFLAGS'=>'-rl'},
    # Uncomment the line below if you're using a perl compiled
    # for fastCGI (http://www.fastcgi.com/).
    # 'DEFINE'	=> '-DFCGI'
);

sub MY::postamble{
'
$(MYEXTLIB): libgd/Makefile
	DEFINE=\'$(DEFINE)\'; export DEFINE INC; \
	cd libgd && $(MAKE) -e

html: GD.pm
	pod2html GD.pm
	mv GD.pm.html GD.html
';
}

