use ExtUtils::MakeMaker;
$Verbose = 1;
WriteMakefile(
	'NAME'     =>   'libgd',
        'LINKTYPE'  => 'static',
        'SKIP'      => [qw(static dynamic test)],
	'H'         => [qw(gd.h gdfontl.h gdfonts.h io.h gdfontg.h gdfontmb.h gdfontt.h)],
        'C'         => [qw(gdfontg.c gdfontmb.c gdfontt.c mtables.c gdfontl.c gdfonts.c libgd.c)],

        'clean'    =>   {'FILES' => 'libgd.a'}
);

sub MY::top_targets {
'
all    ::    static

static ::    libgd$(LIB_EXT)

libgd$(LIB_EXT): $(O_FILES)
	$(AR) cr libgd$(LIB_EXT) $(O_FILES)
	$(RANLIB) libgd$(LIB_EXT)
';
}

