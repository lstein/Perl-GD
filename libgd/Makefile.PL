use ExtUtils::MakeMaker;
$Verbose = 1;
WriteMakefile(
	'NAME'     =>   'libgd',
        'LINKTYPE'  => 'static',
        'SKIP'      => [qw(dynamic test)],
	'H'         => [qw(gd.h gdfontl.h gdfonts.h io.h gdfontg.h gdfontmb.h gdfontt.h mtables.h)],
        'C'         => [qw(gdfontg.c gdfontmb.c gdfontt.c gdfontl.c gdfonts.c libgd.c)],
        'OBJECT'    => q[$(O_FILES)],
        'clean'    =>   {'FILES' => 'libgd$(LIB_EXT)'}
);

sub MY::post_constants {
    <<'END'
INST_STATIC = libgd$(LIB_EXT)
END
    ;
}

sub MY::top_targets {
    my $top_targets =<<'END';
all    ::    static

static ::    libgd$(LIB_EXT)

config ::

test :	

END
    ;
    $top_targets;
}

