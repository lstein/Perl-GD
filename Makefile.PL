use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'GD',
    'VERSION'	=> '1.00',
    'LIBS'	=> ['-L/usr/local/lib -lgd -lm'],   # e.g., '-lm' 
    'DEFINE'	=> '',     # e.g., '-DHAVE_SOMETHING' 
    'INC'	=> '-I/usr/local/include',     # e.g., '-I/usr/include/other' 
);
