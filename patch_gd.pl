#!/usr/bin/perl
$| = 1;

my $GNU => 'http://www.gnu.org/order/ftp.html';

my $patchv = `patch -v`;
die "This script requires GNU patch, available from $GNU.\n" 
    unless $patchv =~ /Free Software Foundation/;

die "You must run this patch script from within the gd distribution directory.\n"
  unless -f './gd.h';

open PATCH,'| patch -Np1' or die "Can't run patch: $!\n";

print PATCH <<'END_OF_PATCH';
diff -Naur gd-2.0.1/AUTHORS gd-2.0.1.patched/AUTHORS
--- gd-2.0.1/AUTHORS	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/AUTHORS	Tue Jul 30 05:28:31 2002
@@ -0,0 +1,57 @@
+
+  Credits and license terms
+  
+   In order to resolve any possible confusion regarding the authorship of
+   gd, the following copyright statement covers all of the authors who
+   have required such a statement. _If you are aware of any oversights in
+   this copyright notice, please contact Thomas Boutell who will be
+   pleased to correct them._
+
+COPYRIGHT STATEMENT FOLLOWS THIS LINE
+
+     Portions copyright 1994, 1995, 1996, 1997, 1998, 1999, by Cold
+     Spring Harbor Laboratory. Funded under Grant P41-RR02188 by the
+     National Institutes of Health.
+     
+     Portions copyright 1996, 1997, 1998, 1999, by Boutell.Com, Inc.
+     
+     Portions relating to GD2 format copyright 1999 Philip Warner.
+     
+     Portions relating to PNG copyright 1999, Greg Roelofs.
+     
+     Portions relating to libttf copyright 1999, John Ellson
+     (ellson@lucent.com).
+     
+     _Permission has been granted to copy and distribute gd in any
+     context, including a commercial application, provided that this
+     notice is present in user-accessible supporting documentation._
+     
+     This does not affect your ownership of the derived work itself, and
+     the intent is to assure proper credit for the authors of gd, not to
+     interfere with your productive use of gd. If you have questions,
+     ask. "Derived works" includes all programs that utilize the
+     library. Credit must be given in user-accessible documentation.
+     
+     Permission to use, copy, modify, and distribute this software and
+     its documentation for any purpose and without fee is hereby
+     granted, provided that the above copyright notice appear in all
+     copies and that both that copyright notice and this permission
+     notice appear in supporting documentation. This software is
+     provided "as is" without express or implied warranty.
+     
+     Although their code does not appear in gd 1.6.2, the authors wish
+     to thank David Koblas, David Rowley, and Hutchison Avenue Software
+     Corporation for their prior contributions.
+     
+     Permission to use, copy, modify, and distribute this software and
+     its documentation for any purpose and without fee is hereby
+     granted, provided that the above copyright notice appear in all
+     copies and that both that copyright notice and this permission
+     notice appear in supporting documentation. _This software is
+     provided "AS IS."_ The copyright holders disclaim all warranties,
+     either express or implied, including but not limited to implied
+     warranties of merchantability and fitness for a particular purpose,
+     with respect to this code and accompanying documentation.
+     
+END OF COPYRIGHT STATEMENT
+
diff -Naur gd-2.0.1/COPYING gd-2.0.1.patched/COPYING
--- gd-2.0.1/COPYING	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/COPYING	Tue Jul 30 05:28:36 2002
@@ -0,0 +1,38 @@
+COPYRIGHT STATEMENT FOLLOWS THIS LINE
+
+     Portions copyright 1994, 1995, 1996, 1997, 1998, 1999, by Cold
+     Spring Harbor Laboratory. Funded under Grant P41-RR02188 by the
+     National Institutes of Health.
+     
+     Portions copyright 1996, 1997, 1998, 1999, by Boutell.Com, Inc.
+     
+     Portions relating to GD2 format copyright 1999 Philip Warner.
+     
+     Portions relating to PNG copyright 1999, Greg Roelofs.
+     
+     Portions relating to libttf copyright 1999, John Ellson
+     (ellson@lucent.com).
+     
+     _Permission has been granted to copy and distribute gd in any
+     context without fee, including a commercial application, provided
+     that this notice is present in user-accessible supporting
+     documentation._
+     
+     This does not affect your ownership of the derived work itself, and
+     the intent is to assure proper credit for the authors of gd, not to
+     interfere with your productive use of gd. If you have questions,
+     ask. "Derived works" includes all programs that utilize the
+     library. Credit must be given in user-accessible documentation.
+     
+     _This software is provided "AS IS."_ The copyright holders disclaim
+     all warranties, either express or implied, including but not
+     limited to implied warranties of merchantability and fitness for a
+     particular purpose, with respect to this code and accompanying
+     documentation.
+     
+     Although their code does not appear in gd 1.6.3, the authors wish
+     to thank David Koblas, David Rowley, and Hutchison Avenue Software
+     Corporation for their prior contributions.
+     
+END OF COPYRIGHT STATEMENT
+
diff -Naur gd-2.0.1/ChangeLog gd-2.0.1.patched/ChangeLog
--- gd-2.0.1/ChangeLog	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/ChangeLog	Tue Jul 30 05:28:58 2002
@@ -0,0 +1,134 @@
+000319 Lincoln Stein (LS)
+	- Patches to compile under GNU autoconfig
+990729 Thomas Boutell (TBB)
+	- It would probably be a good idea to free the 
+	  png_write_struct, wouldn't it.
+990727 Thomas Boutell (TBB)
+	- Sorted out -lm problem that prevented PNG library
+	  from being correctly detected or flagged as absent
+	- Got rid of unneeded Makefiles in test directory
+	- No version number change (no code changes)
+990721 Philip Warner (pjw)
+	- Added gdImageCompare
+	- Various fixes, including bottom line of polygon
+990720 Thomas Boutell (TBB)
+	- Removed automatic allocation of variably sized array 
+          from gdImagePngCtx, replaced with malloc call
+
+990720 Greg Roelofs
+        - Another new version of gd_png.c, with additional fixes
+ 
+990720 John Ellson (ellson@lucent.com)
+	- converted to GNU autoconf/automake/libtool
+	- added functions: gdImageStringTTF  gdImageColorResolve
+	- added source files: gdttf.c gdcache.c gdcche.h gdtestttf.c
+	- modified source files: gd.c gd.h
+	- renamed:  HISTORY -> ChangeLog
+	            readme.txt -> README
+	- updated docs: index.html, README
+	All changes should be fully backward compatible with gd1.6.1
+	If libttf is not found by configure then gdImageStringTTF is a stub.
+
+990718 Thomas Boutell (TBB)
+
+Incorporated Greg Roelofs' superior PNG read and write routines.
+
+990715 Thomas Boutell (TBB)
+
+Removed all GIF capability in favor of PNG
+in order to remove any possible LZW patent concerns.
+
+990701 Philip Warner (pjw) as documented by TBB
+
+Implemented gdImageSink (missing in initial 1.5 release),
+renamed all new source files to have a gd_ prefix.
+
+990628 Thomas Boutell (TBB)
+
+Removed all C++ style comments for broader compatibility.
+
+990310 Philip Warner (pjw)
+--------------------------
+
+Broke gd.c into multiple files; gd.c now has graphics operations, and gd_<zzz> has specific
+support for different formats (eg. GD, GD2, GIF).
+
+Restructured I/O so that reading from files/streams/anything is now possible. All handled
+through the IOCtx record which must define some basic I/O services. All services are defined
+for files, but only some are defined for in-memory pointers. The in-memory pointer 
+implementation is primarily for Perl compatibility. Changed basically involved writing some 
+low level IO routines, and relpacing most FILE* variables with IOCtx*.
+
+Added gdImageGdPtr, gdImageGd2Ptr, gdImageGifPtr, gdImageLzwPtr for Perl compatibility.
+
+Broke up the GIF handling routines; gd_gif_in.c does all GIF input (this did not change when
+support for LZW compression was removed). gd_gif_out.c not handles the miGif compression that
+was introduced in version 1.3
+
+Reinstated LZW support through the gdImageLzw function (defined in gd_lzw_out.c). 
+This is NOT built by default, and the header file must be modified to include it in the build.
+
+Added 'GD2' support. This is a zlib-compressed internal format useful for extracting portions
+of images without having to read entire image files. Informal tests suggest it is only 30% slower
+than the old GD format, and file space requirements are similar to GOF. The GD2 header fields 
+now contain version information, so the format can probably be considered stable across versions.
+
+Various other functions also added (see index.html).
+
+Informal Tests
+--------------
+
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t064.gd2 100 3000 2000 400 300
+Extracting 100 times from (3000, 2000), size is 400x300
+23 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t128.gd2 100 3000 2000 400 300
+Extracting 100 times from (3000, 2000), size is 400x300
+19 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t256.gd2 100 3000 2000 400 300
+Extracting 100 times from (3000, 2000), size is 400x300
+33 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t512.gd2 100 3000 2000 400 300
+Extracting 100 times from (3000, 2000), size is 400x300
+65 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t064.gd2 100 3000 2000 200 100
+Extracting 100 times from (3000, 2000), size is 200x100
+8 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t128.gd2 100 3000 2000 200 100
+Extracting 100 times from (3000, 2000), size is 200x100
+8 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t256.gd2 100 3000 2000 200 100
+Extracting 100 times from (3000, 2000), size is 200x100
+16 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t512.gd2 100 3000 2000 200 100
+Extracting 100 times from (3000, 2000), size is 200x100
+59 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t064.gd2 100 3000 2000 800 600
+Extracting 100 times from (3000, 2000), size is 800x600
+71 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t128.gd2 100 3000 2000 800 600
+Extracting 100 times from (3000, 2000), size is 800x600
+70 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t256.gd2 100 3000 2000 800 600
+Extracting 100 times from (3000, 2000), size is 800x600
+86 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t512.gd2 100 3000 2000 800 600
+Extracting 100 times from (3000, 2000), size is 800x600
+160 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ls -lrt t*.gd2
+-rw-r--r--   1 pjw      users     1363301 Mar 10 12:03 t512.gd2
+-rw-r--r--   1 pjw      users     1339003 Mar 10 12:06 t256.gd2
+-rw-r--r--   1 pjw      users     1323925 Mar 10 12:09 t128.gd2
+-rw-r--r--   1 pjw      users     1492096 Mar 10 12:12 t064.gd2
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t064.gd2 100 3000 2000 50 25
+Extracting 100 times from (3000, 2000), size is 50x25
+4 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t128.gd2 100 3000 2000 50 25
+Extracting 100 times from (3000, 2000), size is 50x25
+2 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t256.gd2 100 3000 2000 50 25
+Extracting 100 times from (3000, 2000), size is 50x25
+4 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t512.gd2 100 3000 2000 50 25
+Extracting 100 times from (3000, 2000), size is 50x25
+15 seconds to extract (& destroy) 100 times
+
diff -Naur gd-2.0.1/INSTALL gd-2.0.1.patched/INSTALL
--- gd-2.0.1/INSTALL	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/INSTALL	Tue Jul 30 05:29:07 2002
@@ -0,0 +1,185 @@
+Basic Installation
+==================
+
+   The `configure' shell script attempts to guess correct values for
+various system-dependent variables used during compilation.  It uses
+those values to create a `Makefile' in each directory of the package.
+It may also create one or more `.h' files containing system-dependent
+definitions.  Finally, it creates a shell script `config.status' that
+you can run in the future to recreate the current configuration, a file
+`config.cache' that saves the results of its tests to speed up
+reconfiguring, and a file `config.log' containing compiler output
+(useful mainly for debugging `configure').
+
+   If you need to do unusual things to compile the package, please try
+to figure out how `configure' could check whether to do them, and mail
+diffs or instructions to the address given in the `README' so they can
+be considered for the next release.  If at some point `config.cache'
+contains results you don't want to keep, you may remove or edit it.
+
+   The file `configure.in' is used to create `configure' by a program
+called `autoconf'.  You only need `configure.in' if you want to change
+it or regenerate `configure' using a newer version of `autoconf'.
+
+The simplest way to compile this package is:
+
+  1. `cd' to the directory containing the package's source code and type
+     `./configure' to configure the package for your system.  If you're
+     using `csh' on an old version of System V, you might need to type
+     `sh ./configure' instead to prevent `csh' from trying to execute
+     `configure' itself.
+
+     Running `configure' takes awhile.  While running, it prints some
+     messages telling which features it is checking for.
+
+  2. Type `make' to compile the package.
+
+  3. Optionally, type `make check' to run any self-tests that come with
+     the package.
+
+  4. Type `make install' to install the programs and any data files and
+     documentation.
+
+  5. You can remove the program binaries and object files from the
+     source code directory by typing `make clean'.  To also remove the
+     files that `configure' created (so you can compile the package for
+     a different kind of computer), type `make distclean'.  There is
+     also a `make maintainer-clean' target, but that is intended mainly
+     for the package's developers.  If you use it, you may have to get
+     all sorts of other programs in order to regenerate files that came
+     with the distribution.
+
+Optional Features
+=================
+
+   This package has three optional features which can be enabled at
+configure time:
+
+   ./configure --enable-jpeg           Enable JPEG support
+   ./configure --enable-freetype       Enable TrueType fonts
+   ./configure --enable-xpm            Enable reading of XPM files
+
+   You may combine these three features if you wish.
+
+JPEG and FreeType are only available if you have downloaded and
+installed the corresponding libraries.  Xpm is only available if you
+have the XPM library installed and have a full X11 installation.  If
+you try to install a feature, and don't have the appropriate library,
+you will receive a warning to that effect.
+
+Read README for information on obtaining these libraries.
+
+Compilers and Options
+=====================
+
+   Some systems require unusual options for compilation or linking that
+the `configure' script does not know about.  You can give `configure'
+initial values for variables by setting them in the environment.  Using
+a Bourne-compatible shell, you can do that on the command line like
+this:
+     CC=c89 CFLAGS=-O2 LIBS=-lposix ./configure
+
+Or on systems that have the `env' program, you can do it like this:
+     env CPPFLAGS=-I/usr/local/include LDFLAGS=-s ./configure
+
+Compiling For Multiple Architectures
+====================================
+
+   You can compile the package for more than one kind of computer at the
+same time, by placing the object files for each architecture in their
+own directory.  To do this, you must use a version of `make' that
+supports the `VPATH' variable, such as GNU `make'.  `cd' to the
+directory where you want the object files and executables to go and run
+the `configure' script.  `configure' automatically checks for the
+source code in the directory that `configure' is in and in `..'.
+
+   If you have to use a `make' that does not supports the `VPATH'
+variable, you have to compile the package for one architecture at a time
+in the source code directory.  After you have installed the package for
+one architecture, use `make distclean' before reconfiguring for another
+architecture.
+
+Installation Names
+==================
+
+   By default, `make install' will install the package's files in
+`/usr/local/bin', `/usr/local/man', etc.  You can specify an
+installation prefix other than `/usr/local' by giving `configure' the
+option `--prefix=PATH'.
+
+   You can specify separate installation prefixes for
+architecture-specific files and architecture-independent files.  If you
+give `configure' the option `--exec-prefix=PATH', the package will use
+PATH as the prefix for installing programs and libraries.
+Documentation and other data files will still use the regular prefix.
+
+   In addition, if you use an unusual directory layout you can give
+options like `--bindir=PATH' to specify different values for particular
+kinds of files.  Run `configure --help' for a list of the directories
+you can set and what kinds of files go in them.
+
+   If the package supports it, you can cause programs to be installed
+with an extra prefix or suffix on their names by giving `configure' the
+option `--program-prefix=PREFIX' or `--program-suffix=SUFFIX'.
+
+Specifying the System Type
+==========================
+
+   There may be some features `configure' can not figure out
+automatically, but needs to determine by the type of host the package
+will run on.  Usually `configure' can figure that out, but if it prints
+a message saying it can not guess the host type, give it the
+`--host=TYPE' option.  TYPE can either be a short name for the system
+type, such as `sun4', or a canonical name with three fields:
+     CPU-COMPANY-SYSTEM
+
+See the file `config.sub' for the possible values of each field.  If
+`config.sub' isn't included in this package, then this package doesn't
+need to know the host type.
+
+   If you are building compiler tools for cross-compiling, you can also
+use the `--target=TYPE' option to select the type of system they will
+produce code for and the `--build=TYPE' option to select the type of
+system on which you are compiling the package.
+
+Sharing Defaults
+================
+
+   If you want to set default values for `configure' scripts to share,
+you can create a site shell script called `config.site' that gives
+default values for variables like `CC', `cache_file', and `prefix'.
+`configure' looks for `PREFIX/share/config.site' if it exists, then
+`PREFIX/etc/config.site' if it exists.  Or, you can set the
+`CONFIG_SITE' environment variable to the location of the site script.
+A warning: not all `configure' scripts look for a site script.
+
+Operation Controls
+==================
+
+   `configure' recognizes the following options to control how it
+operates.
+
+`--cache-file=FILE'
+     Use and save the results of the tests in FILE instead of
+     `./config.cache'.  Set FILE to `/dev/null' to disable caching, for
+     debugging `configure'.
+
+`--help'
+     Print a summary of the options to `configure', and exit.
+
+`--quiet'
+`--silent'
+`-q'
+     Do not print messages saying which checks are being made.  To
+     suppress all normal output, redirect it to `/dev/null' (any error
+     messages will still be shown).
+
+`--srcdir=DIR'
+     Look for the package's source code in directory DIR.  Usually
+     `configure' can determine that directory automatically.
+
+`--version'
+     Print the version of Autoconf used to generate the `configure'
+     script, and exit.
+
+`configure' also accepts some other, not widely useful, options.
diff -Naur gd-2.0.1/Makefile gd-2.0.1.patched/Makefile
--- gd-2.0.1/Makefile	Tue Apr  3 16:44:41 2001
+++ gd-2.0.1.patched/Makefile	Tue Jul 30 11:36:03 2002
@@ -1,175 +1,612 @@
-#Depending on your system and the libraries and features you have
-#and want, you WILL need to modify this Makefile!
-
-#If you do not have gcc, change the setting for COMPILER, but you must
-#use an ANSI standard C compiler (NOT the old SunOS 4.1.3 cc
-#compiler; get gcc if you are still using that). 
-COMPILER=gcc
-
-#If the ar command fails on your system, consult the ar manpage
-#for your system. 
-AR=ar
-
-#Typical configuration: support for PNG images, JPEG images, and FreeType text.
-#Remove -DHAVE_LIBFREETYPE if you can live without FreeType text.
-#Add -DHAVE_XPM if you have X and xpm installed and you want that feature.
-
-CFLAGS=-g -DHAVE_LIBPNG -DHAVE_LIBJPEG -DHAVE_LIBFREETYPE
-
-#PLEASE NOTE: YOU MAY HAVE TO JUGGLE THE ORDER OF THE LIBRARIES.
-#Some systems are very picky about link order. They don't all agree
-#on the right order, either. 
-#
-#Best for most users. If you don't have FreeType, remove -lfreetype.
-#Add -lxpm if you need XPM support.
-
-LIBS=-lgd -lpng -lz -ljpeg -lfreetype -lm
-
-#Typical install locations for freetype 2.0, zlib, xpm, libjpeg 
-#and libpng header files. If yours are somewhere else, change this. 
-#-I. is important to ensure that the version of gd you are installing 
-#is used, and not an older release in your directory tree somewhere.
-
-INCLUDEDIRS=-I. -I/usr/include/freetype2 -I/usr/include/X11 -I/usr/X11R6/include/X11 -I/usr/local/include 
-
-#Typical install locations for freetype, zlib, xpm and libpng libraries.
-#If yours are somewhere else, other than a standard location
-#such as /lib or /usr/lib, then change this. This line shouldn't hurt 
-#if you don't actually have some of the optional libraries and directories.
-LIBDIRS=-L/usr/local/lib -L/usr/lib/X11 -L/usr/X11R6/lib
-
-#Location where libgd.so should be installed by "make install".
-#THIS MUST BE ONE OF YOUR STANDARD SHARED LIBRARY LOCATIONS, unless
-#you add a new directory to your LD_LIBRARY_PATH environment setting.
-#Otherwise applications will NOT find libgd.so and will produce an 
-#error.  
-INSTALL_LIB=/usr/lib
-
-#Location where .h files should be installed by "make install".
-INSTALL_INCLUDE=/usr/include
-
-#Location where useful non-test programs should be installed by "make install".
-INSTALL_BIN=/usr/local/bin
-
-#
-#
-# Changes should not be required below here.
-#
-#
-
-# Update these with each release!
-
-MAJOR_VERSION=2
-VERSION=2.0.0
-
-CC=$(COMPILER) $(INCLUDEDIRS)
-LINK=$(CC) $(LIBDIRS) $(LIBS)
-
-PROGRAMS=$(BIN_PROGRAMS) $(TEST_PROGRAMS)
-
-BIN_PROGRAMS=pngtogd pngtogd2 gdtopng gd2topng gd2copypal gdparttopng webpng
-TEST_PROGRAMS=gdtest gddemo gd2time gdtestft testac
-
-default: instructions
-
-instructions:
-	@echo First, edit this Makefile. Read the comments at
-	@echo the beginning thoroughly.
-	@echo
-	@echo Second, type \'make install\' as root.
-	@echo
-	@echo This installs the GD ${VERSION} shared library,
-	@echo which is required in order to use the included
-	@echo utility programs, such as webpng, pngtogd, etc.
-	@echo 
-	@echo OPTIONAL third step: type \'make test\' to build 
-	@echo the optional test programs. Type \'make install\' FIRST.
-
-test: $(TEST_PROGRAMS)
-
-install: libgd.so.${VERSION} $(BIN_PROGRAMS)
-	sh ./install-item 755 pngtogd $(INSTALL_BIN)/pngtogd
-	sh ./install-item 755 pngtogd2 $(INSTALL_BIN)/pngtogd2
-	sh ./install-item 755 gdtopng $(INSTALL_BIN)/gdtopng
-	sh ./install-item 755 gd2topng $(INSTALL_BIN)/gd2topng
-	sh ./install-item 755 gd2copypal $(INSTALL_BIN)/gd2copypal
-	sh ./install-item 755 gdparttopng $(INSTALL_BIN)/gdparttopng
-	sh ./install-item 755 webpng $(INSTALL_BIN)/webpng
-	sh ./install-item 755 bdftogd $(INSTALL_BIN)/bdftogd
-	sh ./install-item 644 gd.h $(INSTALL_INCLUDE)/gd.h
-	sh ./install-item 644 gdcache.h $(INSTALL_INCLUDE)/gdcache.h
-	sh ./install-item 644 gd_io.h $(INSTALL_INCLUDE)/gd_io.h
-	sh ./install-item 644 gdfontg.h $(INSTALL_INCLUDE)/gdfontg.h
-	sh ./install-item 644 gdfontl.h $(INSTALL_INCLUDE)/gdfontl.h
-	sh ./install-item 644 gdfontmb.h $(INSTALL_INCLUDE)/gdfontmb.h
-	sh ./install-item 644 gdfonts.h $(INSTALL_INCLUDE)/gdfonts.h
-	sh ./install-item 644 gdfontt.h $(INSTALL_INCLUDE)/gdfontt.h
-
-gddemo: gddemo.o
-	$(CC) gddemo.o -o gddemo	$(LIBDIRS) $(LIBS)
-
-testac: testac.o
-	$(CC) testac.o -o testac	$(LIBDIRS) $(LIBS)
-
-pngtogd: pngtogd.o
-	$(CC) pngtogd.o -o pngtogd	$(LIBDIRS) $(LIBS) 
-
-webpng: webpng.o
-	$(CC) webpng.o -o webpng	$(LIBDIRS) $(LIBS)
-
-pngtogd2: pngtogd2.o
-	$(CC) pngtogd2.o -o pngtogd2	$(LIBDIRS) $(LIBS)
-
-gdtopng: gdtopng.o
-	$(CC) gdtopng.o -o gdtopng	$(LIBDIRS) $(LIBS)
-
-gd2topng: gd2topng.o
-	$(CC) gd2topng.o -o gd2topng	$(LIBDIRS) $(LIBS)
-
-gd2copypal: gd2copypal.o
-	$(CC) gd2copypal.o -o gd2copypal	$(LIBDIRS) $(LIBS)
-
-gdparttopng: gdparttopng.o
-	$(CC) gdparttopng.o -o gdparttopng	$(LIBDIRS) $(LIBS)
-
-gdtest: gdtest.o
-	$(CC) gdtest.o -o gdtest	$(LIBDIRS) $(LIBS)
-
-gd2time: gd2time.o
-	$(CC) gd2time.o -o gd2time	$(LIBDIRS) $(LIBS)
-
-gdtestft: gdtestft.o
-	$(CC) --verbose gdtestft.o -o gdtestft $(LIBDIRS) $(LIBS)
-
-LIBOBJS=gd.o gd_gd.o gd_gd2.o gd_io.o gd_io_dp.o \
-		gd_io_file.o gd_ss.o gd_io_ss.o gd_png.o gd_jpeg.o gdxpm.o \
-		gdfontt.o gdfonts.o gdfontmb.o gdfontl.o gdfontg.o \
-		gdtables.o gdft.o gdcache.o gdkanji.o wbmp.o \
-		gd_wbmp.o gdhelpers.o gd_topal.o 
-
-#Shared library. This should work fine on any ELF platform (Linux, etc.) with
-#GNU ld or something similarly intelligent. To avoid the chicken-and-egg
-#problem, this target also installs the library so that applications can
-#actually find it.
-
-libgd.so.${VERSION}: ${LIBOBJS}
-	-rm -f libgd.so.${VERSION} 2>/dev/null
-	ld -shared -o libgd.so.${VERSION} ${LIBOBJS}
-	sh ./install-item 644 libgd.so.${VERSION} \
-		$(INSTALL_LIB)/libgd.so.${VERSION}
-	-rm $(INSTALL_LIB)/libgd.so.${MAJOR_VERSION} 2>/dev/null
-	ln -s $(INSTALL_LIB)/libgd.so.${VERSION} \
-		$(INSTALL_LIB)/libgd.so.${MAJOR_VERSION}	
-	-rm $(INSTALL_LIB)/libgd.so 2>/dev/null
-	ln -s $(INSTALL_LIB)/libgd.so.${VERSION} \
-		$(INSTALL_LIB)/libgd.so	
-
-#Static library, if you really need one for some reason.
-libgd.a: ${LIBOBJS}
-	rm -f libgd.a
-	$(AR) rc libgd.a ${LIBOBJS}
-	-ranlib libgd.a
-
-clean:
-	rm -f *.o *.a *.so ${PROGRAMS} test/gdtest.jpg test/gdtest.wbmp
+# Makefile.in generated automatically by automake 1.4-p4 from Makefile.am
 
+# Copyright (C) 1994, 1995-8, 1999 Free Software Foundation, Inc.
+# This Makefile.in is free software; the Free Software Foundation
+# gives unlimited permission to copy and/or distribute it,
+# with or without modifications, as long as this notice is preserved.
+
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
+# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
+# PARTICULAR PURPOSE.
+
+
+SHELL = /bin/sh
+
+srcdir = .
+top_srcdir = .
+
+prefix = /usr/local
+exec_prefix = ${prefix}
+
+bindir = ${exec_prefix}/bin
+sbindir = ${exec_prefix}/sbin
+libexecdir = ${exec_prefix}/libexec
+datadir = ${prefix}/share
+sysconfdir = ${prefix}/etc
+sharedstatedir = ${prefix}/com
+localstatedir = ${prefix}/var
+libdir = ${exec_prefix}/lib
+infodir = ${prefix}/info
+mandir = ${prefix}/man
+includedir = ${prefix}/include
+oldincludedir = /usr/include
+
+DESTDIR =
+
+pkgdatadir = $(datadir)/gd
+pkglibdir = $(libdir)/gd
+pkgincludedir = $(includedir)/gd
+
+top_builddir = .
+
+ACLOCAL = aclocal
+AUTOCONF = autoconf
+AUTOMAKE = automake
+AUTOHEADER = autoheader
+
+INSTALL = /usr/bin/ginstall -c
+INSTALL_PROGRAM = ${INSTALL} $(AM_INSTALL_PROGRAM_FLAGS)
+INSTALL_DATA = ${INSTALL} -m 644
+INSTALL_SCRIPT = ${INSTALL}
+transform = s,x,x,
+
+NORMAL_INSTALL = :
+PRE_INSTALL = :
+POST_INSTALL = :
+NORMAL_UNINSTALL = :
+PRE_UNINSTALL = :
+POST_UNINSTALL = :
+host_alias = @host_alias@
+host_triplet = i686-pc-linux-gnu
+AS = @AS@
+CC = gcc
+DLLTOOL = @DLLTOOL@
+ECHO = echo
+EXEEXT = 
+LIBTOOL = $(SHELL) $(top_builddir)/libtool
+LN_S = ln -s
+MAKEINFO = makeinfo
+OBJDUMP = @OBJDUMP@
+OBJEXT = o
+PACKAGE = gd
+RANLIB = ranlib
+STRIP = strip
+VERSION = 1.8.4
+
+AUTOMAKE_OPTIONS = 1.3
+
+# library interface 2.0, gd release 2.0.1
+libgd_la_LDFLAGS = -version-info 2:0
+
+lib_LTLIBRARIES = libgd.la
+
+include_HEADERS = gd.h	 gdcache.h  gdfontl.h	gdfonts.h 		gd_io.h  gdfontg.h  gdfontmb.h	gdfontt.h
+
+
+libgd_la_SOURCES = gd.c		  gd_io.c	gd_topal.c  gdfonts.c 	gd_io_dp.c	gd_wbmp.c   gdfontt.c	   	gd_io_file.c	gdcache.c   gdft.c 	gd_io_ss.c	gdhelpers.c    gdxpm.c 	gd_jpeg.c	gdfontg.c   gdkanji.c 	gd_gd.c		  gd_png.c	gdfontl.c   	gd_gd2.c	  gd_ss.c	gdfontmb.c  gdtables.c 	wbmp.c
+
+
+bin_PROGRAMS = pngtogd webpng pngtogd2 gdtopng gd2topng gd2copypal 	gdparttopng gd2time 
+
+
+noinst_PROGRAMS = gddemo testac gdtest gdtestft
+
+gddemo_SOURCES = gddemo.c gd.h gdfonts.h gdfontg.h
+gddemo_LDADD = libgd.la
+
+testac_SOURCES = testac.c gd.h
+testac_LDADD = libgd.la
+
+pngtogd_SOURCES = pngtogd.c gd.h
+pngtogd_LDADD = libgd.la
+
+webpng_SOURCES = webpng.c gd.h
+webpng_LDADD = libgd.la
+
+pngtogd2_SOURCES = pngtogd2.c gd.h
+pngtogd2_LDADD = libgd.la
+
+gdtopng_SOURCES = gdtopng.c gd.h
+gdtopng_LDADD = libgd.la
+
+gd2topng_SOURCES = gd2topng.c gd.h
+gd2topng_LDADD = libgd.la
+
+gd2copypal_SOURCES = gd2copypal.c gd.h
+gd2copypal_LDADD = libgd.la
+
+gdparttopng_SOURCES = gdparttopng.c gd.h
+gdparttopng_LDADD = libgd.la
+
+gdtest_SOURCES = gdtest.c gd.h
+gdtest_LDADD = libgd.la
+
+gd2time_SOURCES = gd2time.c gd.h
+gd2time_LDADD = libgd.la
+
+gdtestft_SOURCES = gdtestft.c gd.h
+gdtestft_LDADD = libgd.la
+
+EXTRA_DIST = demoin.png index.html test/*
+
+CLEANFILES = demoout.png
+ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+mkinstalldirs = $(SHELL) $(top_srcdir)/mkinstalldirs
+CONFIG_CLEAN_FILES = 
+LTLIBRARIES =  $(lib_LTLIBRARIES)
+
+
+DEFS = -DPACKAGE=\"gd\" -DVERSION=\"1.8.4\" -DHAVE_DLFCN_H=1 -DHAVE_LIBM=1 -DHAVE_LIBZ=1 -DHAVE_LIBPNG=1 -DHAVE_JPEGLIB_H=1 -DHAVE_LIBJPEG=1 -DHAVE_FREETYPE_FREETYPE_H=1 -DHAVE_LIBFREETYPE=1 -DHAVE_X11_XPM_H=1 -DHAVE_LIBXPM=1 -DSTDC_HEADERS=1 -DHAVE_MALLOC_H=1 -DHAVE_UNISTD_H=1 -DHAVE_ZLIB_H=1 -DHAVE_PNG_H=1  -I. -I$(srcdir) 
+CPPFLAGS =  -I/usr/X11R6/include/freetype2 -I/usr/include/freetype2 -I${prefix}/include -I/usr/X11R6/include
+LDFLAGS =  -L${exec_prefix}/lib -L/usr/X11R6/lib
+LIBS = -lfreetype -ljpeg -lpng -lz -lm  -lX11 -lXpm
+libgd_la_LIBADD = 
+libgd_la_OBJECTS =  gd.lo gd_io.lo gd_topal.lo gdfonts.lo gd_io_dp.lo \
+gd_wbmp.lo gdfontt.lo gd_io_file.lo gdcache.lo gdft.lo gd_io_ss.lo \
+gdhelpers.lo gdxpm.lo gd_jpeg.lo gdfontg.lo gdkanji.lo gd_gd.lo \
+gd_png.lo gdfontl.lo gd_gd2.lo gd_ss.lo gdfontmb.lo gdtables.lo wbmp.lo
+bin_PROGRAMS =  pngtogd$(EXEEXT) webpng$(EXEEXT) pngtogd2$(EXEEXT) \
+gdtopng$(EXEEXT) gd2topng$(EXEEXT) gd2copypal$(EXEEXT) \
+gdparttopng$(EXEEXT) gd2time$(EXEEXT)
+noinst_PROGRAMS =  gddemo$(EXEEXT) testac$(EXEEXT) gdtest$(EXEEXT) \
+gdtestft$(EXEEXT)
+PROGRAMS =  $(bin_PROGRAMS) $(noinst_PROGRAMS)
+
+pngtogd_OBJECTS =  pngtogd.$(OBJEXT)
+pngtogd_DEPENDENCIES =  libgd.la
+pngtogd_LDFLAGS = 
+webpng_OBJECTS =  webpng.$(OBJEXT)
+webpng_DEPENDENCIES =  libgd.la
+webpng_LDFLAGS = 
+pngtogd2_OBJECTS =  pngtogd2.$(OBJEXT)
+pngtogd2_DEPENDENCIES =  libgd.la
+pngtogd2_LDFLAGS = 
+gdtopng_OBJECTS =  gdtopng.$(OBJEXT)
+gdtopng_DEPENDENCIES =  libgd.la
+gdtopng_LDFLAGS = 
+gd2topng_OBJECTS =  gd2topng.$(OBJEXT)
+gd2topng_DEPENDENCIES =  libgd.la
+gd2topng_LDFLAGS = 
+gd2copypal_OBJECTS =  gd2copypal.$(OBJEXT)
+gd2copypal_DEPENDENCIES =  libgd.la
+gd2copypal_LDFLAGS = 
+gdparttopng_OBJECTS =  gdparttopng.$(OBJEXT)
+gdparttopng_DEPENDENCIES =  libgd.la
+gdparttopng_LDFLAGS = 
+gd2time_OBJECTS =  gd2time.$(OBJEXT)
+gd2time_DEPENDENCIES =  libgd.la
+gd2time_LDFLAGS = 
+gddemo_OBJECTS =  gddemo.$(OBJEXT)
+gddemo_DEPENDENCIES =  libgd.la
+gddemo_LDFLAGS = 
+testac_OBJECTS =  testac.$(OBJEXT)
+testac_DEPENDENCIES =  libgd.la
+testac_LDFLAGS = 
+gdtest_OBJECTS =  gdtest.$(OBJEXT)
+gdtest_DEPENDENCIES =  libgd.la
+gdtest_LDFLAGS = 
+gdtestft_OBJECTS =  gdtestft.$(OBJEXT)
+gdtestft_DEPENDENCIES =  libgd.la
+gdtestft_LDFLAGS = 
+CFLAGS = -g -O2
+COMPILE = $(CC) $(DEFS) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
+LTCOMPILE = $(LIBTOOL) --mode=compile $(CC) $(DEFS) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
+CCLD = $(CC)
+LINK = $(LIBTOOL) --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(LDFLAGS) -o $@
+HEADERS =  $(include_HEADERS)
+
+DIST_COMMON =  README AUTHORS COPYING ChangeLog INSTALL Makefile.am \
+Makefile.in NEWS acinclude.m4 aclocal.m4 config.guess config.sub \
+configure configure.ac install-sh ltmain.sh missing mkinstalldirs
+
+
+DISTFILES = $(DIST_COMMON) $(SOURCES) $(HEADERS) $(TEXINFOS) $(EXTRA_DIST)
+
+TAR = tar
+GZIP_ENV = --best
+DEP_FILES =  .deps/gd.P .deps/gd2copypal.P .deps/gd2time.P \
+.deps/gd2topng.P .deps/gd_gd.P .deps/gd_gd2.P .deps/gd_io.P \
+.deps/gd_io_dp.P .deps/gd_io_file.P .deps/gd_io_ss.P .deps/gd_jpeg.P \
+.deps/gd_png.P .deps/gd_ss.P .deps/gd_topal.P .deps/gd_wbmp.P \
+.deps/gdcache.P .deps/gddemo.P .deps/gdfontg.P .deps/gdfontl.P \
+.deps/gdfontmb.P .deps/gdfonts.P .deps/gdfontt.P .deps/gdft.P \
+.deps/gdhelpers.P .deps/gdkanji.P .deps/gdparttopng.P .deps/gdtables.P \
+.deps/gdtest.P .deps/gdtestft.P .deps/gdtopng.P .deps/gdxpm.P \
+.deps/pngtogd.P .deps/pngtogd2.P .deps/testac.P .deps/wbmp.P \
+.deps/webpng.P
+SOURCES = $(libgd_la_SOURCES) $(pngtogd_SOURCES) $(webpng_SOURCES) $(pngtogd2_SOURCES) $(gdtopng_SOURCES) $(gd2topng_SOURCES) $(gd2copypal_SOURCES) $(gdparttopng_SOURCES) $(gd2time_SOURCES) $(gddemo_SOURCES) $(testac_SOURCES) $(gdtest_SOURCES) $(gdtestft_SOURCES)
+OBJECTS = $(libgd_la_OBJECTS) $(pngtogd_OBJECTS) $(webpng_OBJECTS) $(pngtogd2_OBJECTS) $(gdtopng_OBJECTS) $(gd2topng_OBJECTS) $(gd2copypal_OBJECTS) $(gdparttopng_OBJECTS) $(gd2time_OBJECTS) $(gddemo_OBJECTS) $(testac_OBJECTS) $(gdtest_OBJECTS) $(gdtestft_OBJECTS)
+
+all: all-redirect
+.SUFFIXES:
+.SUFFIXES: .S .c .lo .o .obj .s
+$(srcdir)/Makefile.in: Makefile.am $(top_srcdir)/configure.ac $(ACLOCAL_M4) 
+	cd $(top_srcdir) && $(AUTOMAKE) --gnu Makefile
+
+Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status $(BUILT_SOURCES)
+	cd $(top_builddir) \
+	  && CONFIG_FILES=$@ CONFIG_HEADERS= $(SHELL) ./config.status
+
+$(ACLOCAL_M4):  configure.ac  acinclude.m4
+	cd $(srcdir) && $(ACLOCAL)
+
+config.status: $(srcdir)/configure.ac $(CONFIG_STATUS_DEPENDENCIES)
+	$(SHELL) ./config.status --recheck
+$(srcdir)/configure: $(srcdir)/configure.ac $(ACLOCAL_M4) $(CONFIGURE_DEPENDENCIES)
+	cd $(srcdir) && $(AUTOCONF)
+
+mostlyclean-libLTLIBRARIES:
+
+clean-libLTLIBRARIES:
+	-test -z "$(lib_LTLIBRARIES)" || rm -f $(lib_LTLIBRARIES)
+
+distclean-libLTLIBRARIES:
+
+maintainer-clean-libLTLIBRARIES:
+
+install-libLTLIBRARIES: $(lib_LTLIBRARIES)
+	@$(NORMAL_INSTALL)
+	$(mkinstalldirs) $(DESTDIR)$(libdir)
+	@list='$(lib_LTLIBRARIES)'; for p in $$list; do \
+	  if test -f $$p; then \
+	    echo "$(LIBTOOL)  --mode=install $(INSTALL) $$p $(DESTDIR)$(libdir)/$$p"; \
+	    $(LIBTOOL)  --mode=install $(INSTALL) $$p $(DESTDIR)$(libdir)/$$p; \
+	  else :; fi; \
+	done
+
+uninstall-libLTLIBRARIES:
+	@$(NORMAL_UNINSTALL)
+	list='$(lib_LTLIBRARIES)'; for p in $$list; do \
+	  $(LIBTOOL)  --mode=uninstall rm -f $(DESTDIR)$(libdir)/$$p; \
+	done
+
+# FIXME: We should only use cygpath when building on Windows,
+# and only if it is available.
+.c.obj:
+	$(COMPILE) -c `cygpath -w $<`
+
+.s.o:
+	$(COMPILE) -c $<
+
+.S.o:
+	$(COMPILE) -c $<
+
+mostlyclean-compile:
+	-rm -f *.o core *.core
+	-rm -f *.$(OBJEXT)
+
+clean-compile:
+
+distclean-compile:
+	-rm -f *.tab.c
+
+maintainer-clean-compile:
+
+.s.lo:
+	$(LIBTOOL) --mode=compile $(COMPILE) -c $<
+
+.S.lo:
+	$(LIBTOOL) --mode=compile $(COMPILE) -c $<
+
+mostlyclean-libtool:
+	-rm -f *.lo
+
+clean-libtool:
+	-rm -rf .libs _libs
+
+distclean-libtool:
+
+maintainer-clean-libtool:
+
+libgd.la: $(libgd_la_OBJECTS) $(libgd_la_DEPENDENCIES)
+	$(LINK) -rpath $(libdir) $(libgd_la_LDFLAGS) $(libgd_la_OBJECTS) $(libgd_la_LIBADD) $(LIBS)
+
+mostlyclean-binPROGRAMS:
+
+clean-binPROGRAMS:
+	-test -z "$(bin_PROGRAMS)" || rm -f $(bin_PROGRAMS)
+
+distclean-binPROGRAMS:
+
+maintainer-clean-binPROGRAMS:
+
+install-binPROGRAMS: $(bin_PROGRAMS)
+	@$(NORMAL_INSTALL)
+	$(mkinstalldirs) $(DESTDIR)$(bindir)
+	@list='$(bin_PROGRAMS)'; for p in $$list; do \
+	  if test -f $$p; then \
+	    echo " $(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`"; \
+	    $(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`; \
+	  else :; fi; \
+	done
+
+uninstall-binPROGRAMS:
+	@$(NORMAL_UNINSTALL)
+	list='$(bin_PROGRAMS)'; for p in $$list; do \
+	  rm -f $(DESTDIR)$(bindir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`; \
+	done
+
+mostlyclean-noinstPROGRAMS:
+
+clean-noinstPROGRAMS:
+	-test -z "$(noinst_PROGRAMS)" || rm -f $(noinst_PROGRAMS)
+
+distclean-noinstPROGRAMS:
+
+maintainer-clean-noinstPROGRAMS:
+
+pngtogd$(EXEEXT): $(pngtogd_OBJECTS) $(pngtogd_DEPENDENCIES)
+	@rm -f pngtogd$(EXEEXT)
+	$(LINK) $(pngtogd_LDFLAGS) $(pngtogd_OBJECTS) $(pngtogd_LDADD) $(LIBS)
+
+webpng$(EXEEXT): $(webpng_OBJECTS) $(webpng_DEPENDENCIES)
+	@rm -f webpng$(EXEEXT)
+	$(LINK) $(webpng_LDFLAGS) $(webpng_OBJECTS) $(webpng_LDADD) $(LIBS)
+
+pngtogd2$(EXEEXT): $(pngtogd2_OBJECTS) $(pngtogd2_DEPENDENCIES)
+	@rm -f pngtogd2$(EXEEXT)
+	$(LINK) $(pngtogd2_LDFLAGS) $(pngtogd2_OBJECTS) $(pngtogd2_LDADD) $(LIBS)
+
+gdtopng$(EXEEXT): $(gdtopng_OBJECTS) $(gdtopng_DEPENDENCIES)
+	@rm -f gdtopng$(EXEEXT)
+	$(LINK) $(gdtopng_LDFLAGS) $(gdtopng_OBJECTS) $(gdtopng_LDADD) $(LIBS)
+
+gd2topng$(EXEEXT): $(gd2topng_OBJECTS) $(gd2topng_DEPENDENCIES)
+	@rm -f gd2topng$(EXEEXT)
+	$(LINK) $(gd2topng_LDFLAGS) $(gd2topng_OBJECTS) $(gd2topng_LDADD) $(LIBS)
+
+gd2copypal$(EXEEXT): $(gd2copypal_OBJECTS) $(gd2copypal_DEPENDENCIES)
+	@rm -f gd2copypal$(EXEEXT)
+	$(LINK) $(gd2copypal_LDFLAGS) $(gd2copypal_OBJECTS) $(gd2copypal_LDADD) $(LIBS)
+
+gdparttopng$(EXEEXT): $(gdparttopng_OBJECTS) $(gdparttopng_DEPENDENCIES)
+	@rm -f gdparttopng$(EXEEXT)
+	$(LINK) $(gdparttopng_LDFLAGS) $(gdparttopng_OBJECTS) $(gdparttopng_LDADD) $(LIBS)
+
+gd2time$(EXEEXT): $(gd2time_OBJECTS) $(gd2time_DEPENDENCIES)
+	@rm -f gd2time$(EXEEXT)
+	$(LINK) $(gd2time_LDFLAGS) $(gd2time_OBJECTS) $(gd2time_LDADD) $(LIBS)
+
+gddemo$(EXEEXT): $(gddemo_OBJECTS) $(gddemo_DEPENDENCIES)
+	@rm -f gddemo$(EXEEXT)
+	$(LINK) $(gddemo_LDFLAGS) $(gddemo_OBJECTS) $(gddemo_LDADD) $(LIBS)
+
+testac$(EXEEXT): $(testac_OBJECTS) $(testac_DEPENDENCIES)
+	@rm -f testac$(EXEEXT)
+	$(LINK) $(testac_LDFLAGS) $(testac_OBJECTS) $(testac_LDADD) $(LIBS)
+
+gdtest$(EXEEXT): $(gdtest_OBJECTS) $(gdtest_DEPENDENCIES)
+	@rm -f gdtest$(EXEEXT)
+	$(LINK) $(gdtest_LDFLAGS) $(gdtest_OBJECTS) $(gdtest_LDADD) $(LIBS)
+
+gdtestft$(EXEEXT): $(gdtestft_OBJECTS) $(gdtestft_DEPENDENCIES)
+	@rm -f gdtestft$(EXEEXT)
+	$(LINK) $(gdtestft_LDFLAGS) $(gdtestft_OBJECTS) $(gdtestft_LDADD) $(LIBS)
+
+install-includeHEADERS: $(include_HEADERS)
+	@$(NORMAL_INSTALL)
+	$(mkinstalldirs) $(DESTDIR)$(includedir)
+	@list='$(include_HEADERS)'; for p in $$list; do \
+	  if test -f "$$p"; then d= ; else d="$(srcdir)/"; fi; \
+	  echo " $(INSTALL_DATA) $$d$$p $(DESTDIR)$(includedir)/$$p"; \
+	  $(INSTALL_DATA) $$d$$p $(DESTDIR)$(includedir)/$$p; \
+	done
+
+uninstall-includeHEADERS:
+	@$(NORMAL_UNINSTALL)
+	list='$(include_HEADERS)'; for p in $$list; do \
+	  rm -f $(DESTDIR)$(includedir)/$$p; \
+	done
+
+tags: TAGS
+
+ID: $(HEADERS) $(SOURCES) $(LISP)
+	list='$(SOURCES) $(HEADERS)'; \
+	unique=`for i in $$list; do echo $$i; done | \
+	  awk '    { files[$$0] = 1; } \
+	       END { for (i in files) print i; }'`; \
+	here=`pwd` && cd $(srcdir) \
+	  && mkid -f$$here/ID $$unique $(LISP)
+
+TAGS:  $(HEADERS) $(SOURCES)  $(TAGS_DEPENDENCIES) $(LISP)
+	tags=; \
+	here=`pwd`; \
+	list='$(SOURCES) $(HEADERS)'; \
+	unique=`for i in $$list; do echo $$i; done | \
+	  awk '    { files[$$0] = 1; } \
+	       END { for (i in files) print i; }'`; \
+	test -z "$(ETAGS_ARGS)$$unique$(LISP)$$tags" \
+	  || (cd $(srcdir) && etags $(ETAGS_ARGS) $$tags  $$unique $(LISP) -o $$here/TAGS)
+
+mostlyclean-tags:
+
+clean-tags:
+
+distclean-tags:
+	-rm -f TAGS ID
+
+maintainer-clean-tags:
+
+distdir = $(PACKAGE)-$(VERSION)
+top_distdir = $(distdir)
+
+# This target untars the dist file and tries a VPATH configuration.  Then
+# it guarantees that the distribution is self-contained by making another
+# tarfile.
+distcheck: dist
+	-rm -rf $(distdir)
+	GZIP=$(GZIP_ENV) $(TAR) zxf $(distdir).tar.gz
+	mkdir $(distdir)/=build
+	mkdir $(distdir)/=inst
+	dc_install_base=`cd $(distdir)/=inst && pwd`; \
+	cd $(distdir)/=build \
+	  && ../configure --srcdir=.. --prefix=$$dc_install_base \
+	  && $(MAKE) $(AM_MAKEFLAGS) \
+	  && $(MAKE) $(AM_MAKEFLAGS) dvi \
+	  && $(MAKE) $(AM_MAKEFLAGS) check \
+	  && $(MAKE) $(AM_MAKEFLAGS) install \
+	  && $(MAKE) $(AM_MAKEFLAGS) installcheck \
+	  && $(MAKE) $(AM_MAKEFLAGS) dist
+	-rm -rf $(distdir)
+	@banner="$(distdir).tar.gz is ready for distribution"; \
+	dashes=`echo "$$banner" | sed s/./=/g`; \
+	echo "$$dashes"; \
+	echo "$$banner"; \
+	echo "$$dashes"
+dist: distdir
+	-chmod -R a+r $(distdir)
+	GZIP=$(GZIP_ENV) $(TAR) chozf $(distdir).tar.gz $(distdir)
+	-rm -rf $(distdir)
+dist-all: distdir
+	-chmod -R a+r $(distdir)
+	GZIP=$(GZIP_ENV) $(TAR) chozf $(distdir).tar.gz $(distdir)
+	-rm -rf $(distdir)
+distdir: $(DISTFILES)
+	-rm -rf $(distdir)
+	mkdir $(distdir)
+	-chmod 777 $(distdir)
+	here=`cd $(top_builddir) && pwd`; \
+	top_distdir=`cd $(distdir) && pwd`; \
+	distdir=`cd $(distdir) && pwd`; \
+	cd $(top_srcdir) \
+	  && $(AUTOMAKE) --include-deps --build-dir=$$here --srcdir-name=$(top_srcdir) --output-dir=$$top_distdir --gnu Makefile
+	$(mkinstalldirs) $(distdir)/test
+	@for file in $(DISTFILES); do \
+	  d=$(srcdir); \
+	  if test -d $$d/$$file; then \
+	    cp -pr $$d/$$file $(distdir)/$$file; \
+	  else \
+	    test -f $(distdir)/$$file \
+	    || ln $$d/$$file $(distdir)/$$file 2> /dev/null \
+	    || cp -p $$d/$$file $(distdir)/$$file || :; \
+	  fi; \
+	done
+
+DEPS_MAGIC := $(shell mkdir .deps > /dev/null 2>&1 || :)
+
+-include $(DEP_FILES)
+
+mostlyclean-depend:
+
+clean-depend:
+
+distclean-depend:
+	-rm -rf .deps
+
+maintainer-clean-depend:
+
+%.o: %.c
+	@echo '$(COMPILE) -c $<'; \
+	$(COMPILE) -Wp,-MD,.deps/$(*F).pp -c $<
+	@-cp .deps/$(*F).pp .deps/$(*F).P; \
+	tr ' ' '\012' < .deps/$(*F).pp \
+	  | sed -e 's/^\\$$//' -e '/^$$/ d' -e '/:$$/ d' -e 's/$$/ :/' \
+	    >> .deps/$(*F).P; \
+	rm .deps/$(*F).pp
+
+%.lo: %.c
+	@echo '$(LTCOMPILE) -c $<'; \
+	$(LTCOMPILE) -Wp,-MD,.deps/$(*F).pp -c $<
+	@-sed -e 's/^\([^:]*\)\.o[ 	]*:/\1.lo \1.o :/' \
+	  < .deps/$(*F).pp > .deps/$(*F).P; \
+	tr ' ' '\012' < .deps/$(*F).pp \
+	  | sed -e 's/^\\$$//' -e '/^$$/ d' -e '/:$$/ d' -e 's/$$/ :/' \
+	    >> .deps/$(*F).P; \
+	rm -f .deps/$(*F).pp
+info-am:
+info: info-am
+dvi-am:
+dvi: dvi-am
+check-am: all-am
+check: check-am
+installcheck-am:
+installcheck: installcheck-am
+install-exec-am: install-libLTLIBRARIES install-binPROGRAMS
+install-exec: install-exec-am
+
+install-data-am: install-includeHEADERS
+install-data: install-data-am
+
+install-am: all-am
+	@$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am
+install: install-am
+uninstall-am: uninstall-libLTLIBRARIES uninstall-binPROGRAMS \
+		uninstall-includeHEADERS
+uninstall: uninstall-am
+all-am: Makefile $(LTLIBRARIES) $(PROGRAMS) $(HEADERS)
+all-redirect: all-am
+install-strip:
+	$(MAKE) $(AM_MAKEFLAGS) AM_INSTALL_PROGRAM_FLAGS=-s install
+installdirs:
+	$(mkinstalldirs)  $(DESTDIR)$(libdir) $(DESTDIR)$(bindir) \
+		$(DESTDIR)$(includedir)
+
+
+mostlyclean-generic:
+
+clean-generic:
+	-test -z "$(CLEANFILES)" || rm -f $(CLEANFILES)
+
+distclean-generic:
+	-rm -f Makefile $(CONFIG_CLEAN_FILES)
+	-rm -f config.cache config.log stamp-h stamp-h[0-9]*
+
+maintainer-clean-generic:
+mostlyclean-am:  mostlyclean-libLTLIBRARIES mostlyclean-compile \
+		mostlyclean-libtool mostlyclean-binPROGRAMS \
+		mostlyclean-noinstPROGRAMS mostlyclean-tags \
+		mostlyclean-depend mostlyclean-generic
+
+mostlyclean: mostlyclean-am
+
+clean-am:  clean-libLTLIBRARIES clean-compile clean-libtool \
+		clean-binPROGRAMS clean-noinstPROGRAMS clean-tags \
+		clean-depend clean-generic mostlyclean-am
+
+clean: clean-am
+
+distclean-am:  distclean-libLTLIBRARIES distclean-compile \
+		distclean-libtool distclean-binPROGRAMS \
+		distclean-noinstPROGRAMS distclean-tags \
+		distclean-depend distclean-generic clean-am
+	-rm -f libtool
+
+distclean: distclean-am
+	-rm -f config.status
+
+maintainer-clean-am:  maintainer-clean-libLTLIBRARIES \
+		maintainer-clean-compile maintainer-clean-libtool \
+		maintainer-clean-binPROGRAMS \
+		maintainer-clean-noinstPROGRAMS maintainer-clean-tags \
+		maintainer-clean-depend maintainer-clean-generic \
+		distclean-am
+	@echo "This command is intended for maintainers to use;"
+	@echo "it deletes files that may require special tools to rebuild."
+
+maintainer-clean: maintainer-clean-am
+	-rm -f config.status
+
+.PHONY: mostlyclean-libLTLIBRARIES distclean-libLTLIBRARIES \
+clean-libLTLIBRARIES maintainer-clean-libLTLIBRARIES \
+uninstall-libLTLIBRARIES install-libLTLIBRARIES mostlyclean-compile \
+distclean-compile clean-compile maintainer-clean-compile \
+mostlyclean-libtool distclean-libtool clean-libtool \
+maintainer-clean-libtool mostlyclean-binPROGRAMS distclean-binPROGRAMS \
+clean-binPROGRAMS maintainer-clean-binPROGRAMS uninstall-binPROGRAMS \
+install-binPROGRAMS mostlyclean-noinstPROGRAMS distclean-noinstPROGRAMS \
+clean-noinstPROGRAMS maintainer-clean-noinstPROGRAMS \
+uninstall-includeHEADERS install-includeHEADERS tags mostlyclean-tags \
+distclean-tags clean-tags maintainer-clean-tags distdir \
+mostlyclean-depend distclean-depend clean-depend \
+maintainer-clean-depend info-am info dvi-am dvi check check-am \
+installcheck-am installcheck install-exec-am install-exec \
+install-data-am install-data install-am install uninstall-am uninstall \
+all-redirect all-am all installdirs mostlyclean-generic \
+distclean-generic clean-generic maintainer-clean-generic clean \
+mostlyclean distclean maintainer-clean
+
+
+# Tell versions [3.59,3.63) of GNU make to not export all variables.
+# Otherwise a system limit (for SysV at least) may be exceeded.
+.NOEXPORT:
diff -Naur gd-2.0.1/Makefile.am gd-2.0.1.patched/Makefile.am
--- gd-2.0.1/Makefile.am	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/Makefile.am	Tue Jul 30 05:55:00 2002
@@ -0,0 +1,65 @@
+## Process this file with automake to produce Makefile.in
+
+AUTOMAKE_OPTIONS = 1.3
+
+# library interface 2.0, gd release 2.0.1
+libgd_la_LDFLAGS = -version-info 2:0
+
+lib_LTLIBRARIES = libgd.la
+
+include_HEADERS = gd.h	 gdcache.h  gdfontl.h	gdfonts.h \
+		gd_io.h  gdfontg.h  gdfontmb.h	gdfontt.h
+
+libgd_la_SOURCES = gd.c		  gd_io.c	gd_topal.c  gdfonts.c \
+	gd_io_dp.c	gd_wbmp.c   gdfontt.c	   \
+	gd_io_file.c	gdcache.c   gdft.c \
+	gd_io_ss.c	gdhelpers.c    gdxpm.c \
+	gd_jpeg.c	gdfontg.c   gdkanji.c \
+	gd_gd.c		  gd_png.c	gdfontl.c   \
+	gd_gd2.c	  gd_ss.c	gdfontmb.c  gdtables.c \
+	wbmp.c
+
+bin_PROGRAMS = pngtogd webpng pngtogd2 gdtopng gd2topng gd2copypal \
+	gdparttopng gd2time 
+
+noinst_PROGRAMS = gddemo testac gdtest gdtestft
+
+gddemo_SOURCES = gddemo.c gd.h gdfonts.h gdfontg.h
+gddemo_LDADD = libgd.la
+
+testac_SOURCES = testac.c gd.h
+testac_LDADD = libgd.la
+
+pngtogd_SOURCES = pngtogd.c gd.h
+pngtogd_LDADD = libgd.la
+
+webpng_SOURCES = webpng.c gd.h
+webpng_LDADD = libgd.la
+
+pngtogd2_SOURCES = pngtogd2.c gd.h
+pngtogd2_LDADD = libgd.la
+
+gdtopng_SOURCES = gdtopng.c gd.h
+gdtopng_LDADD = libgd.la
+
+gd2topng_SOURCES = gd2topng.c gd.h
+gd2topng_LDADD = libgd.la
+
+gd2copypal_SOURCES = gd2copypal.c gd.h
+gd2copypal_LDADD = libgd.la
+
+gdparttopng_SOURCES = gdparttopng.c gd.h
+gdparttopng_LDADD = libgd.la
+
+gdtest_SOURCES = gdtest.c gd.h
+gdtest_LDADD = libgd.la
+
+gd2time_SOURCES = gd2time.c gd.h
+gd2time_LDADD = libgd.la
+
+gdtestft_SOURCES = gdtestft.c gd.h
+gdtestft_LDADD = libgd.la
+
+EXTRA_DIST = demoin.png index.html test/*
+
+CLEANFILES = demoout.png
diff -Naur gd-2.0.1/Makefile.in gd-2.0.1.patched/Makefile.in
--- gd-2.0.1/Makefile.in	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/Makefile.in	Tue Jul 30 05:55:02 2002
@@ -0,0 +1,612 @@
+# Makefile.in generated automatically by automake 1.4-p4 from Makefile.am
+
+# Copyright (C) 1994, 1995-8, 1999 Free Software Foundation, Inc.
+# This Makefile.in is free software; the Free Software Foundation
+# gives unlimited permission to copy and/or distribute it,
+# with or without modifications, as long as this notice is preserved.
+
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
+# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
+# PARTICULAR PURPOSE.
+
+
+SHELL = @SHELL@
+
+srcdir = @srcdir@
+top_srcdir = @top_srcdir@
+VPATH = @srcdir@
+prefix = @prefix@
+exec_prefix = @exec_prefix@
+
+bindir = @bindir@
+sbindir = @sbindir@
+libexecdir = @libexecdir@
+datadir = @datadir@
+sysconfdir = @sysconfdir@
+sharedstatedir = @sharedstatedir@
+localstatedir = @localstatedir@
+libdir = @libdir@
+infodir = @infodir@
+mandir = @mandir@
+includedir = @includedir@
+oldincludedir = /usr/include
+
+DESTDIR =
+
+pkgdatadir = $(datadir)/@PACKAGE@
+pkglibdir = $(libdir)/@PACKAGE@
+pkgincludedir = $(includedir)/@PACKAGE@
+
+top_builddir = .
+
+ACLOCAL = @ACLOCAL@
+AUTOCONF = @AUTOCONF@
+AUTOMAKE = @AUTOMAKE@
+AUTOHEADER = @AUTOHEADER@
+
+INSTALL = @INSTALL@
+INSTALL_PROGRAM = @INSTALL_PROGRAM@ $(AM_INSTALL_PROGRAM_FLAGS)
+INSTALL_DATA = @INSTALL_DATA@
+INSTALL_SCRIPT = @INSTALL_SCRIPT@
+transform = @program_transform_name@
+
+NORMAL_INSTALL = :
+PRE_INSTALL = :
+POST_INSTALL = :
+NORMAL_UNINSTALL = :
+PRE_UNINSTALL = :
+POST_UNINSTALL = :
+host_alias = @host_alias@
+host_triplet = @host@
+AS = @AS@
+CC = @CC@
+DLLTOOL = @DLLTOOL@
+ECHO = @ECHO@
+EXEEXT = @EXEEXT@
+LIBTOOL = @LIBTOOL@
+LN_S = @LN_S@
+MAKEINFO = @MAKEINFO@
+OBJDUMP = @OBJDUMP@
+OBJEXT = @OBJEXT@
+PACKAGE = @PACKAGE@
+RANLIB = @RANLIB@
+STRIP = @STRIP@
+VERSION = @VERSION@
+
+AUTOMAKE_OPTIONS = 1.3
+
+# library interface 2.0, gd release 2.0.1
+libgd_la_LDFLAGS = -version-info 2:0
+
+lib_LTLIBRARIES = libgd.la
+
+include_HEADERS = gd.h	 gdcache.h  gdfontl.h	gdfonts.h 		gd_io.h  gdfontg.h  gdfontmb.h	gdfontt.h
+
+
+libgd_la_SOURCES = gd.c		  gd_io.c	gd_topal.c  gdfonts.c 	gd_io_dp.c	gd_wbmp.c   gdfontt.c	   	gd_io_file.c	gdcache.c   gdft.c 	gd_io_ss.c	gdhelpers.c    gdxpm.c 	gd_jpeg.c	gdfontg.c   gdkanji.c 	gd_gd.c		  gd_png.c	gdfontl.c   	gd_gd2.c	  gd_ss.c	gdfontmb.c  gdtables.c 	wbmp.c
+
+
+bin_PROGRAMS = pngtogd webpng pngtogd2 gdtopng gd2topng gd2copypal 	gdparttopng gd2time 
+
+
+noinst_PROGRAMS = gddemo testac gdtest gdtestft
+
+gddemo_SOURCES = gddemo.c gd.h gdfonts.h gdfontg.h
+gddemo_LDADD = libgd.la
+
+testac_SOURCES = testac.c gd.h
+testac_LDADD = libgd.la
+
+pngtogd_SOURCES = pngtogd.c gd.h
+pngtogd_LDADD = libgd.la
+
+webpng_SOURCES = webpng.c gd.h
+webpng_LDADD = libgd.la
+
+pngtogd2_SOURCES = pngtogd2.c gd.h
+pngtogd2_LDADD = libgd.la
+
+gdtopng_SOURCES = gdtopng.c gd.h
+gdtopng_LDADD = libgd.la
+
+gd2topng_SOURCES = gd2topng.c gd.h
+gd2topng_LDADD = libgd.la
+
+gd2copypal_SOURCES = gd2copypal.c gd.h
+gd2copypal_LDADD = libgd.la
+
+gdparttopng_SOURCES = gdparttopng.c gd.h
+gdparttopng_LDADD = libgd.la
+
+gdtest_SOURCES = gdtest.c gd.h
+gdtest_LDADD = libgd.la
+
+gd2time_SOURCES = gd2time.c gd.h
+gd2time_LDADD = libgd.la
+
+gdtestft_SOURCES = gdtestft.c gd.h
+gdtestft_LDADD = libgd.la
+
+EXTRA_DIST = demoin.png index.html test/*
+
+CLEANFILES = demoout.png
+ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
+mkinstalldirs = $(SHELL) $(top_srcdir)/mkinstalldirs
+CONFIG_CLEAN_FILES = 
+LTLIBRARIES =  $(lib_LTLIBRARIES)
+
+
+DEFS = @DEFS@ -I. -I$(srcdir) 
+CPPFLAGS = @CPPFLAGS@
+LDFLAGS = @LDFLAGS@
+LIBS = @LIBS@
+libgd_la_LIBADD = 
+libgd_la_OBJECTS =  gd.lo gd_io.lo gd_topal.lo gdfonts.lo gd_io_dp.lo \
+gd_wbmp.lo gdfontt.lo gd_io_file.lo gdcache.lo gdft.lo gd_io_ss.lo \
+gdhelpers.lo gdxpm.lo gd_jpeg.lo gdfontg.lo gdkanji.lo gd_gd.lo \
+gd_png.lo gdfontl.lo gd_gd2.lo gd_ss.lo gdfontmb.lo gdtables.lo wbmp.lo
+bin_PROGRAMS =  pngtogd$(EXEEXT) webpng$(EXEEXT) pngtogd2$(EXEEXT) \
+gdtopng$(EXEEXT) gd2topng$(EXEEXT) gd2copypal$(EXEEXT) \
+gdparttopng$(EXEEXT) gd2time$(EXEEXT)
+noinst_PROGRAMS =  gddemo$(EXEEXT) testac$(EXEEXT) gdtest$(EXEEXT) \
+gdtestft$(EXEEXT)
+PROGRAMS =  $(bin_PROGRAMS) $(noinst_PROGRAMS)
+
+pngtogd_OBJECTS =  pngtogd.$(OBJEXT)
+pngtogd_DEPENDENCIES =  libgd.la
+pngtogd_LDFLAGS = 
+webpng_OBJECTS =  webpng.$(OBJEXT)
+webpng_DEPENDENCIES =  libgd.la
+webpng_LDFLAGS = 
+pngtogd2_OBJECTS =  pngtogd2.$(OBJEXT)
+pngtogd2_DEPENDENCIES =  libgd.la
+pngtogd2_LDFLAGS = 
+gdtopng_OBJECTS =  gdtopng.$(OBJEXT)
+gdtopng_DEPENDENCIES =  libgd.la
+gdtopng_LDFLAGS = 
+gd2topng_OBJECTS =  gd2topng.$(OBJEXT)
+gd2topng_DEPENDENCIES =  libgd.la
+gd2topng_LDFLAGS = 
+gd2copypal_OBJECTS =  gd2copypal.$(OBJEXT)
+gd2copypal_DEPENDENCIES =  libgd.la
+gd2copypal_LDFLAGS = 
+gdparttopng_OBJECTS =  gdparttopng.$(OBJEXT)
+gdparttopng_DEPENDENCIES =  libgd.la
+gdparttopng_LDFLAGS = 
+gd2time_OBJECTS =  gd2time.$(OBJEXT)
+gd2time_DEPENDENCIES =  libgd.la
+gd2time_LDFLAGS = 
+gddemo_OBJECTS =  gddemo.$(OBJEXT)
+gddemo_DEPENDENCIES =  libgd.la
+gddemo_LDFLAGS = 
+testac_OBJECTS =  testac.$(OBJEXT)
+testac_DEPENDENCIES =  libgd.la
+testac_LDFLAGS = 
+gdtest_OBJECTS =  gdtest.$(OBJEXT)
+gdtest_DEPENDENCIES =  libgd.la
+gdtest_LDFLAGS = 
+gdtestft_OBJECTS =  gdtestft.$(OBJEXT)
+gdtestft_DEPENDENCIES =  libgd.la
+gdtestft_LDFLAGS = 
+CFLAGS = @CFLAGS@
+COMPILE = $(CC) $(DEFS) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
+LTCOMPILE = $(LIBTOOL) --mode=compile $(CC) $(DEFS) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
+CCLD = $(CC)
+LINK = $(LIBTOOL) --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(LDFLAGS) -o $@
+HEADERS =  $(include_HEADERS)
+
+DIST_COMMON =  README AUTHORS COPYING ChangeLog INSTALL Makefile.am \
+Makefile.in NEWS acinclude.m4 aclocal.m4 config.guess config.sub \
+configure configure.ac install-sh ltmain.sh missing mkinstalldirs
+
+
+DISTFILES = $(DIST_COMMON) $(SOURCES) $(HEADERS) $(TEXINFOS) $(EXTRA_DIST)
+
+TAR = tar
+GZIP_ENV = --best
+DEP_FILES =  .deps/gd.P .deps/gd2copypal.P .deps/gd2time.P \
+.deps/gd2topng.P .deps/gd_gd.P .deps/gd_gd2.P .deps/gd_io.P \
+.deps/gd_io_dp.P .deps/gd_io_file.P .deps/gd_io_ss.P .deps/gd_jpeg.P \
+.deps/gd_png.P .deps/gd_ss.P .deps/gd_topal.P .deps/gd_wbmp.P \
+.deps/gdcache.P .deps/gddemo.P .deps/gdfontg.P .deps/gdfontl.P \
+.deps/gdfontmb.P .deps/gdfonts.P .deps/gdfontt.P .deps/gdft.P \
+.deps/gdhelpers.P .deps/gdkanji.P .deps/gdparttopng.P .deps/gdtables.P \
+.deps/gdtest.P .deps/gdtestft.P .deps/gdtopng.P .deps/gdxpm.P \
+.deps/pngtogd.P .deps/pngtogd2.P .deps/testac.P .deps/wbmp.P \
+.deps/webpng.P
+SOURCES = $(libgd_la_SOURCES) $(pngtogd_SOURCES) $(webpng_SOURCES) $(pngtogd2_SOURCES) $(gdtopng_SOURCES) $(gd2topng_SOURCES) $(gd2copypal_SOURCES) $(gdparttopng_SOURCES) $(gd2time_SOURCES) $(gddemo_SOURCES) $(testac_SOURCES) $(gdtest_SOURCES) $(gdtestft_SOURCES)
+OBJECTS = $(libgd_la_OBJECTS) $(pngtogd_OBJECTS) $(webpng_OBJECTS) $(pngtogd2_OBJECTS) $(gdtopng_OBJECTS) $(gd2topng_OBJECTS) $(gd2copypal_OBJECTS) $(gdparttopng_OBJECTS) $(gd2time_OBJECTS) $(gddemo_OBJECTS) $(testac_OBJECTS) $(gdtest_OBJECTS) $(gdtestft_OBJECTS)
+
+all: all-redirect
+.SUFFIXES:
+.SUFFIXES: .S .c .lo .o .obj .s
+$(srcdir)/Makefile.in: Makefile.am $(top_srcdir)/configure.ac $(ACLOCAL_M4) 
+	cd $(top_srcdir) && $(AUTOMAKE) --gnu Makefile
+
+Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status $(BUILT_SOURCES)
+	cd $(top_builddir) \
+	  && CONFIG_FILES=$@ CONFIG_HEADERS= $(SHELL) ./config.status
+
+$(ACLOCAL_M4):  configure.ac  acinclude.m4
+	cd $(srcdir) && $(ACLOCAL)
+
+config.status: $(srcdir)/configure.ac $(CONFIG_STATUS_DEPENDENCIES)
+	$(SHELL) ./config.status --recheck
+$(srcdir)/configure: $(srcdir)/configure.ac $(ACLOCAL_M4) $(CONFIGURE_DEPENDENCIES)
+	cd $(srcdir) && $(AUTOCONF)
+
+mostlyclean-libLTLIBRARIES:
+
+clean-libLTLIBRARIES:
+	-test -z "$(lib_LTLIBRARIES)" || rm -f $(lib_LTLIBRARIES)
+
+distclean-libLTLIBRARIES:
+
+maintainer-clean-libLTLIBRARIES:
+
+install-libLTLIBRARIES: $(lib_LTLIBRARIES)
+	@$(NORMAL_INSTALL)
+	$(mkinstalldirs) $(DESTDIR)$(libdir)
+	@list='$(lib_LTLIBRARIES)'; for p in $$list; do \
+	  if test -f $$p; then \
+	    echo "$(LIBTOOL)  --mode=install $(INSTALL) $$p $(DESTDIR)$(libdir)/$$p"; \
+	    $(LIBTOOL)  --mode=install $(INSTALL) $$p $(DESTDIR)$(libdir)/$$p; \
+	  else :; fi; \
+	done
+
+uninstall-libLTLIBRARIES:
+	@$(NORMAL_UNINSTALL)
+	list='$(lib_LTLIBRARIES)'; for p in $$list; do \
+	  $(LIBTOOL)  --mode=uninstall rm -f $(DESTDIR)$(libdir)/$$p; \
+	done
+
+# FIXME: We should only use cygpath when building on Windows,
+# and only if it is available.
+.c.obj:
+	$(COMPILE) -c `cygpath -w $<`
+
+.s.o:
+	$(COMPILE) -c $<
+
+.S.o:
+	$(COMPILE) -c $<
+
+mostlyclean-compile:
+	-rm -f *.o core *.core
+	-rm -f *.$(OBJEXT)
+
+clean-compile:
+
+distclean-compile:
+	-rm -f *.tab.c
+
+maintainer-clean-compile:
+
+.s.lo:
+	$(LIBTOOL) --mode=compile $(COMPILE) -c $<
+
+.S.lo:
+	$(LIBTOOL) --mode=compile $(COMPILE) -c $<
+
+mostlyclean-libtool:
+	-rm -f *.lo
+
+clean-libtool:
+	-rm -rf .libs _libs
+
+distclean-libtool:
+
+maintainer-clean-libtool:
+
+libgd.la: $(libgd_la_OBJECTS) $(libgd_la_DEPENDENCIES)
+	$(LINK) -rpath $(libdir) $(libgd_la_LDFLAGS) $(libgd_la_OBJECTS) $(libgd_la_LIBADD) $(LIBS)
+
+mostlyclean-binPROGRAMS:
+
+clean-binPROGRAMS:
+	-test -z "$(bin_PROGRAMS)" || rm -f $(bin_PROGRAMS)
+
+distclean-binPROGRAMS:
+
+maintainer-clean-binPROGRAMS:
+
+install-binPROGRAMS: $(bin_PROGRAMS)
+	@$(NORMAL_INSTALL)
+	$(mkinstalldirs) $(DESTDIR)$(bindir)
+	@list='$(bin_PROGRAMS)'; for p in $$list; do \
+	  if test -f $$p; then \
+	    echo " $(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`"; \
+	    $(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`; \
+	  else :; fi; \
+	done
+
+uninstall-binPROGRAMS:
+	@$(NORMAL_UNINSTALL)
+	list='$(bin_PROGRAMS)'; for p in $$list; do \
+	  rm -f $(DESTDIR)$(bindir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`; \
+	done
+
+mostlyclean-noinstPROGRAMS:
+
+clean-noinstPROGRAMS:
+	-test -z "$(noinst_PROGRAMS)" || rm -f $(noinst_PROGRAMS)
+
+distclean-noinstPROGRAMS:
+
+maintainer-clean-noinstPROGRAMS:
+
+pngtogd$(EXEEXT): $(pngtogd_OBJECTS) $(pngtogd_DEPENDENCIES)
+	@rm -f pngtogd$(EXEEXT)
+	$(LINK) $(pngtogd_LDFLAGS) $(pngtogd_OBJECTS) $(pngtogd_LDADD) $(LIBS)
+
+webpng$(EXEEXT): $(webpng_OBJECTS) $(webpng_DEPENDENCIES)
+	@rm -f webpng$(EXEEXT)
+	$(LINK) $(webpng_LDFLAGS) $(webpng_OBJECTS) $(webpng_LDADD) $(LIBS)
+
+pngtogd2$(EXEEXT): $(pngtogd2_OBJECTS) $(pngtogd2_DEPENDENCIES)
+	@rm -f pngtogd2$(EXEEXT)
+	$(LINK) $(pngtogd2_LDFLAGS) $(pngtogd2_OBJECTS) $(pngtogd2_LDADD) $(LIBS)
+
+gdtopng$(EXEEXT): $(gdtopng_OBJECTS) $(gdtopng_DEPENDENCIES)
+	@rm -f gdtopng$(EXEEXT)
+	$(LINK) $(gdtopng_LDFLAGS) $(gdtopng_OBJECTS) $(gdtopng_LDADD) $(LIBS)
+
+gd2topng$(EXEEXT): $(gd2topng_OBJECTS) $(gd2topng_DEPENDENCIES)
+	@rm -f gd2topng$(EXEEXT)
+	$(LINK) $(gd2topng_LDFLAGS) $(gd2topng_OBJECTS) $(gd2topng_LDADD) $(LIBS)
+
+gd2copypal$(EXEEXT): $(gd2copypal_OBJECTS) $(gd2copypal_DEPENDENCIES)
+	@rm -f gd2copypal$(EXEEXT)
+	$(LINK) $(gd2copypal_LDFLAGS) $(gd2copypal_OBJECTS) $(gd2copypal_LDADD) $(LIBS)
+
+gdparttopng$(EXEEXT): $(gdparttopng_OBJECTS) $(gdparttopng_DEPENDENCIES)
+	@rm -f gdparttopng$(EXEEXT)
+	$(LINK) $(gdparttopng_LDFLAGS) $(gdparttopng_OBJECTS) $(gdparttopng_LDADD) $(LIBS)
+
+gd2time$(EXEEXT): $(gd2time_OBJECTS) $(gd2time_DEPENDENCIES)
+	@rm -f gd2time$(EXEEXT)
+	$(LINK) $(gd2time_LDFLAGS) $(gd2time_OBJECTS) $(gd2time_LDADD) $(LIBS)
+
+gddemo$(EXEEXT): $(gddemo_OBJECTS) $(gddemo_DEPENDENCIES)
+	@rm -f gddemo$(EXEEXT)
+	$(LINK) $(gddemo_LDFLAGS) $(gddemo_OBJECTS) $(gddemo_LDADD) $(LIBS)
+
+testac$(EXEEXT): $(testac_OBJECTS) $(testac_DEPENDENCIES)
+	@rm -f testac$(EXEEXT)
+	$(LINK) $(testac_LDFLAGS) $(testac_OBJECTS) $(testac_LDADD) $(LIBS)
+
+gdtest$(EXEEXT): $(gdtest_OBJECTS) $(gdtest_DEPENDENCIES)
+	@rm -f gdtest$(EXEEXT)
+	$(LINK) $(gdtest_LDFLAGS) $(gdtest_OBJECTS) $(gdtest_LDADD) $(LIBS)
+
+gdtestft$(EXEEXT): $(gdtestft_OBJECTS) $(gdtestft_DEPENDENCIES)
+	@rm -f gdtestft$(EXEEXT)
+	$(LINK) $(gdtestft_LDFLAGS) $(gdtestft_OBJECTS) $(gdtestft_LDADD) $(LIBS)
+
+install-includeHEADERS: $(include_HEADERS)
+	@$(NORMAL_INSTALL)
+	$(mkinstalldirs) $(DESTDIR)$(includedir)
+	@list='$(include_HEADERS)'; for p in $$list; do \
+	  if test -f "$$p"; then d= ; else d="$(srcdir)/"; fi; \
+	  echo " $(INSTALL_DATA) $$d$$p $(DESTDIR)$(includedir)/$$p"; \
+	  $(INSTALL_DATA) $$d$$p $(DESTDIR)$(includedir)/$$p; \
+	done
+
+uninstall-includeHEADERS:
+	@$(NORMAL_UNINSTALL)
+	list='$(include_HEADERS)'; for p in $$list; do \
+	  rm -f $(DESTDIR)$(includedir)/$$p; \
+	done
+
+tags: TAGS
+
+ID: $(HEADERS) $(SOURCES) $(LISP)
+	list='$(SOURCES) $(HEADERS)'; \
+	unique=`for i in $$list; do echo $$i; done | \
+	  awk '    { files[$$0] = 1; } \
+	       END { for (i in files) print i; }'`; \
+	here=`pwd` && cd $(srcdir) \
+	  && mkid -f$$here/ID $$unique $(LISP)
+
+TAGS:  $(HEADERS) $(SOURCES)  $(TAGS_DEPENDENCIES) $(LISP)
+	tags=; \
+	here=`pwd`; \
+	list='$(SOURCES) $(HEADERS)'; \
+	unique=`for i in $$list; do echo $$i; done | \
+	  awk '    { files[$$0] = 1; } \
+	       END { for (i in files) print i; }'`; \
+	test -z "$(ETAGS_ARGS)$$unique$(LISP)$$tags" \
+	  || (cd $(srcdir) && etags $(ETAGS_ARGS) $$tags  $$unique $(LISP) -o $$here/TAGS)
+
+mostlyclean-tags:
+
+clean-tags:
+
+distclean-tags:
+	-rm -f TAGS ID
+
+maintainer-clean-tags:
+
+distdir = $(PACKAGE)-$(VERSION)
+top_distdir = $(distdir)
+
+# This target untars the dist file and tries a VPATH configuration.  Then
+# it guarantees that the distribution is self-contained by making another
+# tarfile.
+distcheck: dist
+	-rm -rf $(distdir)
+	GZIP=$(GZIP_ENV) $(TAR) zxf $(distdir).tar.gz
+	mkdir $(distdir)/=build
+	mkdir $(distdir)/=inst
+	dc_install_base=`cd $(distdir)/=inst && pwd`; \
+	cd $(distdir)/=build \
+	  && ../configure --srcdir=.. --prefix=$$dc_install_base \
+	  && $(MAKE) $(AM_MAKEFLAGS) \
+	  && $(MAKE) $(AM_MAKEFLAGS) dvi \
+	  && $(MAKE) $(AM_MAKEFLAGS) check \
+	  && $(MAKE) $(AM_MAKEFLAGS) install \
+	  && $(MAKE) $(AM_MAKEFLAGS) installcheck \
+	  && $(MAKE) $(AM_MAKEFLAGS) dist
+	-rm -rf $(distdir)
+	@banner="$(distdir).tar.gz is ready for distribution"; \
+	dashes=`echo "$$banner" | sed s/./=/g`; \
+	echo "$$dashes"; \
+	echo "$$banner"; \
+	echo "$$dashes"
+dist: distdir
+	-chmod -R a+r $(distdir)
+	GZIP=$(GZIP_ENV) $(TAR) chozf $(distdir).tar.gz $(distdir)
+	-rm -rf $(distdir)
+dist-all: distdir
+	-chmod -R a+r $(distdir)
+	GZIP=$(GZIP_ENV) $(TAR) chozf $(distdir).tar.gz $(distdir)
+	-rm -rf $(distdir)
+distdir: $(DISTFILES)
+	-rm -rf $(distdir)
+	mkdir $(distdir)
+	-chmod 777 $(distdir)
+	here=`cd $(top_builddir) && pwd`; \
+	top_distdir=`cd $(distdir) && pwd`; \
+	distdir=`cd $(distdir) && pwd`; \
+	cd $(top_srcdir) \
+	  && $(AUTOMAKE) --include-deps --build-dir=$$here --srcdir-name=$(top_srcdir) --output-dir=$$top_distdir --gnu Makefile
+	$(mkinstalldirs) $(distdir)/test
+	@for file in $(DISTFILES); do \
+	  d=$(srcdir); \
+	  if test -d $$d/$$file; then \
+	    cp -pr $$d/$$file $(distdir)/$$file; \
+	  else \
+	    test -f $(distdir)/$$file \
+	    || ln $$d/$$file $(distdir)/$$file 2> /dev/null \
+	    || cp -p $$d/$$file $(distdir)/$$file || :; \
+	  fi; \
+	done
+
+DEPS_MAGIC := $(shell mkdir .deps > /dev/null 2>&1 || :)
+
+-include $(DEP_FILES)
+
+mostlyclean-depend:
+
+clean-depend:
+
+distclean-depend:
+	-rm -rf .deps
+
+maintainer-clean-depend:
+
+%.o: %.c
+	@echo '$(COMPILE) -c $<'; \
+	$(COMPILE) -Wp,-MD,.deps/$(*F).pp -c $<
+	@-cp .deps/$(*F).pp .deps/$(*F).P; \
+	tr ' ' '\012' < .deps/$(*F).pp \
+	  | sed -e 's/^\\$$//' -e '/^$$/ d' -e '/:$$/ d' -e 's/$$/ :/' \
+	    >> .deps/$(*F).P; \
+	rm .deps/$(*F).pp
+
+%.lo: %.c
+	@echo '$(LTCOMPILE) -c $<'; \
+	$(LTCOMPILE) -Wp,-MD,.deps/$(*F).pp -c $<
+	@-sed -e 's/^\([^:]*\)\.o[ 	]*:/\1.lo \1.o :/' \
+	  < .deps/$(*F).pp > .deps/$(*F).P; \
+	tr ' ' '\012' < .deps/$(*F).pp \
+	  | sed -e 's/^\\$$//' -e '/^$$/ d' -e '/:$$/ d' -e 's/$$/ :/' \
+	    >> .deps/$(*F).P; \
+	rm -f .deps/$(*F).pp
+info-am:
+info: info-am
+dvi-am:
+dvi: dvi-am
+check-am: all-am
+check: check-am
+installcheck-am:
+installcheck: installcheck-am
+install-exec-am: install-libLTLIBRARIES install-binPROGRAMS
+install-exec: install-exec-am
+
+install-data-am: install-includeHEADERS
+install-data: install-data-am
+
+install-am: all-am
+	@$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am
+install: install-am
+uninstall-am: uninstall-libLTLIBRARIES uninstall-binPROGRAMS \
+		uninstall-includeHEADERS
+uninstall: uninstall-am
+all-am: Makefile $(LTLIBRARIES) $(PROGRAMS) $(HEADERS)
+all-redirect: all-am
+install-strip:
+	$(MAKE) $(AM_MAKEFLAGS) AM_INSTALL_PROGRAM_FLAGS=-s install
+installdirs:
+	$(mkinstalldirs)  $(DESTDIR)$(libdir) $(DESTDIR)$(bindir) \
+		$(DESTDIR)$(includedir)
+
+
+mostlyclean-generic:
+
+clean-generic:
+	-test -z "$(CLEANFILES)" || rm -f $(CLEANFILES)
+
+distclean-generic:
+	-rm -f Makefile $(CONFIG_CLEAN_FILES)
+	-rm -f config.cache config.log stamp-h stamp-h[0-9]*
+
+maintainer-clean-generic:
+mostlyclean-am:  mostlyclean-libLTLIBRARIES mostlyclean-compile \
+		mostlyclean-libtool mostlyclean-binPROGRAMS \
+		mostlyclean-noinstPROGRAMS mostlyclean-tags \
+		mostlyclean-depend mostlyclean-generic
+
+mostlyclean: mostlyclean-am
+
+clean-am:  clean-libLTLIBRARIES clean-compile clean-libtool \
+		clean-binPROGRAMS clean-noinstPROGRAMS clean-tags \
+		clean-depend clean-generic mostlyclean-am
+
+clean: clean-am
+
+distclean-am:  distclean-libLTLIBRARIES distclean-compile \
+		distclean-libtool distclean-binPROGRAMS \
+		distclean-noinstPROGRAMS distclean-tags \
+		distclean-depend distclean-generic clean-am
+	-rm -f libtool
+
+distclean: distclean-am
+	-rm -f config.status
+
+maintainer-clean-am:  maintainer-clean-libLTLIBRARIES \
+		maintainer-clean-compile maintainer-clean-libtool \
+		maintainer-clean-binPROGRAMS \
+		maintainer-clean-noinstPROGRAMS maintainer-clean-tags \
+		maintainer-clean-depend maintainer-clean-generic \
+		distclean-am
+	@echo "This command is intended for maintainers to use;"
+	@echo "it deletes files that may require special tools to rebuild."
+
+maintainer-clean: maintainer-clean-am
+	-rm -f config.status
+
+.PHONY: mostlyclean-libLTLIBRARIES distclean-libLTLIBRARIES \
+clean-libLTLIBRARIES maintainer-clean-libLTLIBRARIES \
+uninstall-libLTLIBRARIES install-libLTLIBRARIES mostlyclean-compile \
+distclean-compile clean-compile maintainer-clean-compile \
+mostlyclean-libtool distclean-libtool clean-libtool \
+maintainer-clean-libtool mostlyclean-binPROGRAMS distclean-binPROGRAMS \
+clean-binPROGRAMS maintainer-clean-binPROGRAMS uninstall-binPROGRAMS \
+install-binPROGRAMS mostlyclean-noinstPROGRAMS distclean-noinstPROGRAMS \
+clean-noinstPROGRAMS maintainer-clean-noinstPROGRAMS \
+uninstall-includeHEADERS install-includeHEADERS tags mostlyclean-tags \
+distclean-tags clean-tags maintainer-clean-tags distdir \
+mostlyclean-depend distclean-depend clean-depend \
+maintainer-clean-depend info-am info dvi-am dvi check check-am \
+installcheck-am installcheck install-exec-am install-exec \
+install-data-am install-data install-am install uninstall-am uninstall \
+all-redirect all-am all installdirs mostlyclean-generic \
+distclean-generic clean-generic maintainer-clean-generic clean \
+mostlyclean distclean maintainer-clean
+
+
+# Tell versions [3.59,3.63) of GNU make to not export all variables.
+# Otherwise a system limit (for SysV at least) may be exceeded.
+.NOEXPORT:
diff -Naur gd-2.0.1/NEWS gd-2.0.1.patched/NEWS
--- gd-2.0.1/NEWS	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/NEWS	Tue Jul 30 05:29:17 2002
@@ -0,0 +1,132 @@
+990729 Thomas Boutell (TBB)
+	- It would probably be a good idea to free the 
+	  png_write_struct, wouldn't it.
+990727 Thomas Boutell (TBB)
+	- Sorted out -lm problem that prevented PNG library
+	  from being correctly detected or flagged as absent
+	- Got rid of unneeded Makefiles in test directory
+	- No version number change (no code changes)
+990721 Philip Warner (pjw)
+	- Added gdImageCompare
+	- Various fixes, including bottom line of polygon
+990720 Thomas Boutell (TBB)
+	- Removed automatic allocation of variably sized array 
+          from gdImagePngCtx, replaced with malloc call
+
+990720 Greg Roelofs
+        - Another new version of gd_png.c, with additional fixes
+ 
+990720 John Ellson (ellson@lucent.com)
+	- converted to GNU autoconf/automake/libtool
+	- added functions: gdImageStringTTF  gdImageColorResolve
+	- added source files: gdttf.c gdcache.c gdcche.h gdtestttf.c
+	- modified source files: gd.c gd.h
+	- renamed:  HISTORY -> ChangeLog
+	            readme.txt -> README
+	- updated docs: index.html, README
+	All changes should be fully backward compatible with gd1.6.1
+	If libttf is not found by configure then gdImageStringTTF is a stub.
+
+990718 Thomas Boutell (TBB)
+
+Incorporated Greg Roelofs' superior PNG read and write routines.
+
+990715 Thomas Boutell (TBB)
+
+Removed all GIF capability in favor of PNG
+in order to remove any possible LZW patent concerns.
+
+990701 Philip Warner (pjw) as documented by TBB
+
+Implemented gdImageSink (missing in initial 1.5 release),
+renamed all new source files to have a gd_ prefix.
+
+990628 Thomas Boutell (TBB)
+
+Removed all C++ style comments for broader compatibility.
+
+990310 Philip Warner (pjw)
+--------------------------
+
+Broke gd.c into multiple files; gd.c now has graphics operations, and gd_<zzz> has specific
+support for different formats (eg. GD, GD2, GIF).
+
+Restructured I/O so that reading from files/streams/anything is now possible. All handled
+through the IOCtx record which must define some basic I/O services. All services are defined
+for files, but only some are defined for in-memory pointers. The in-memory pointer 
+implementation is primarily for Perl compatibility. Changed basically involved writing some 
+low level IO routines, and relpacing most FILE* variables with IOCtx*.
+
+Added gdImageGdPtr, gdImageGd2Ptr, gdImageGifPtr, gdImageLzwPtr for Perl compatibility.
+
+Broke up the GIF handling routines; gd_gif_in.c does all GIF input (this did not change when
+support for LZW compression was removed). gd_gif_out.c not handles the miGif compression that
+was introduced in version 1.3
+
+Reinstated LZW support through the gdImageLzw function (defined in gd_lzw_out.c). 
+This is NOT built by default, and the header file must be modified to include it in the build.
+
+Added 'GD2' support. This is a zlib-compressed internal format useful for extracting portions
+of images without having to read entire image files. Informal tests suggest it is only 30% slower
+than the old GD format, and file space requirements are similar to GOF. The GD2 header fields 
+now contain version information, so the format can probably be considered stable across versions.
+
+Various other functions also added (see index.html).
+
+Informal Tests
+--------------
+
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t064.gd2 100 3000 2000 400 300
+Extracting 100 times from (3000, 2000), size is 400x300
+23 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t128.gd2 100 3000 2000 400 300
+Extracting 100 times from (3000, 2000), size is 400x300
+19 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t256.gd2 100 3000 2000 400 300
+Extracting 100 times from (3000, 2000), size is 400x300
+33 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t512.gd2 100 3000 2000 400 300
+Extracting 100 times from (3000, 2000), size is 400x300
+65 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t064.gd2 100 3000 2000 200 100
+Extracting 100 times from (3000, 2000), size is 200x100
+8 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t128.gd2 100 3000 2000 200 100
+Extracting 100 times from (3000, 2000), size is 200x100
+8 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t256.gd2 100 3000 2000 200 100
+Extracting 100 times from (3000, 2000), size is 200x100
+16 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t512.gd2 100 3000 2000 200 100
+Extracting 100 times from (3000, 2000), size is 200x100
+59 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t064.gd2 100 3000 2000 800 600
+Extracting 100 times from (3000, 2000), size is 800x600
+71 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t128.gd2 100 3000 2000 800 600
+Extracting 100 times from (3000, 2000), size is 800x600
+70 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t256.gd2 100 3000 2000 800 600
+Extracting 100 times from (3000, 2000), size is 800x600
+86 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t512.gd2 100 3000 2000 800 600
+Extracting 100 times from (3000, 2000), size is 800x600
+160 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ls -lrt t*.gd2
+-rw-r--r--   1 pjw      users     1363301 Mar 10 12:03 t512.gd2
+-rw-r--r--   1 pjw      users     1339003 Mar 10 12:06 t256.gd2
+-rw-r--r--   1 pjw      users     1323925 Mar 10 12:09 t128.gd2
+-rw-r--r--   1 pjw      users     1492096 Mar 10 12:12 t064.gd2
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t064.gd2 100 3000 2000 50 25
+Extracting 100 times from (3000, 2000), size is 50x25
+4 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t128.gd2 100 3000 2000 50 25
+Extracting 100 times from (3000, 2000), size is 50x25
+2 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t256.gd2 100 3000 2000 50 25
+Extracting 100 times from (3000, 2000), size is 50x25
+4 seconds to extract (& destroy) 100 times
+pjw@Acheron:/home/pjw/work/gd1.3pjw > ./gd2time t512.gd2 100 3000 2000 50 25
+Extracting 100 times from (3000, 2000), size is 50x25
+15 seconds to extract (& destroy) 100 times
+
diff -Naur gd-2.0.1/README gd-2.0.1.patched/README
--- gd-2.0.1/README	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/README	Tue Jul 30 22:21:05 2002
@@ -0,0 +1,25 @@
+GD 2.0.1_patch
+
+This is a patched version of Tom Boutell's GD library version 1.8.4.
+It uses the GNU Autoconfig system to make it easier to compile libgd
+as a shared library, as well as to locate the correct link libraries.
+Compiling libgd as a shared library will make it easier to run the
+Perl GD interface in some cases.
+
+Please see INSTALL and readme.txt for full instructions.
+
+Installation Synopsis
+---------------------
+
+ % ./configure --enable-jpeg --enable-freetype --enable-xpm
+ % make
+ % make install
+
+You may use the --x-includes option to tell configure about any .h files
+that may be installed in funny places, such as freetype.h
+
+Questions relating to the Perl GD module and to the functioning of
+this patch should be directed to Lincoln Stein (lstein@cshl.org).  All
+other questions relating to libgd should be directed to Tom Boutell
+(boutell@boutell.com).
+
diff -Naur gd-2.0.1/acinclude.m4 gd-2.0.1.patched/acinclude.m4
--- gd-2.0.1/acinclude.m4	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/acinclude.m4	Tue Jul 30 05:29:34 2002
@@ -0,0 +1 @@
+#placeholder for a real acinclude.m4 (someday)
diff -Naur gd-2.0.1/aclocal.m4 gd-2.0.1.patched/aclocal.m4
--- gd-2.0.1/aclocal.m4	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/aclocal.m4	Tue Jul 30 05:29:34 2002
@@ -0,0 +1,3448 @@
+dnl aclocal.m4 generated automatically by aclocal 1.4-p4
+
+dnl Copyright (C) 1994, 1995-8, 1999 Free Software Foundation, Inc.
+dnl This file is free software; the Free Software Foundation
+dnl gives unlimited permission to copy and/or distribute it,
+dnl with or without modifications, as long as this notice is preserved.
+
+dnl This program is distributed in the hope that it will be useful,
+dnl but WITHOUT ANY WARRANTY, to the extent permitted by law; without
+dnl even the implied warranty of MERCHANTABILITY or FITNESS FOR A
+dnl PARTICULAR PURPOSE.
+
+#placeholder for a real acinclude.m4 (someday)
+
+# Do all the work for Automake.  This macro actually does too much --
+# some checks are only needed if your package does certain things.
+# But this isn't really a big deal.
+
+# serial 1
+
+dnl Usage:
+dnl AM_INIT_AUTOMAKE(package,version, [no-define])
+
+AC_DEFUN(AM_INIT_AUTOMAKE,
+[AC_REQUIRE([AC_PROG_INSTALL])
+PACKAGE=[$1]
+AC_SUBST(PACKAGE)
+VERSION=[$2]
+AC_SUBST(VERSION)
+dnl test to see if srcdir already configured
+if test "`cd $srcdir && pwd`" != "`pwd`" && test -f $srcdir/config.status; then
+  AC_MSG_ERROR([source directory already configured; run "make distclean" there first])
+fi
+ifelse([$3],,
+AC_DEFINE_UNQUOTED(PACKAGE, "$PACKAGE", [Name of package])
+AC_DEFINE_UNQUOTED(VERSION, "$VERSION", [Version number of package]))
+AC_REQUIRE([AM_SANITY_CHECK])
+AC_REQUIRE([AC_ARG_PROGRAM])
+dnl FIXME This is truly gross.
+missing_dir=`cd $ac_aux_dir && pwd`
+AM_MISSING_PROG(ACLOCAL, aclocal, $missing_dir)
+AM_MISSING_PROG(AUTOCONF, autoconf, $missing_dir)
+AM_MISSING_PROG(AUTOMAKE, automake, $missing_dir)
+AM_MISSING_PROG(AUTOHEADER, autoheader, $missing_dir)
+AM_MISSING_PROG(MAKEINFO, makeinfo, $missing_dir)
+AC_REQUIRE([AC_PROG_MAKE_SET])])
+
+#
+# Check to make sure that the build environment is sane.
+#
+
+AC_DEFUN(AM_SANITY_CHECK,
+[AC_MSG_CHECKING([whether build environment is sane])
+# Just in case
+sleep 1
+echo timestamp > conftestfile
+# Do `set' in a subshell so we don't clobber the current shell's
+# arguments.  Must try -L first in case configure is actually a
+# symlink; some systems play weird games with the mod time of symlinks
+# (eg FreeBSD returns the mod time of the symlink's containing
+# directory).
+if (
+   set X `ls -Lt $srcdir/configure conftestfile 2> /dev/null`
+   if test "[$]*" = "X"; then
+      # -L didn't work.
+      set X `ls -t $srcdir/configure conftestfile`
+   fi
+   if test "[$]*" != "X $srcdir/configure conftestfile" \
+      && test "[$]*" != "X conftestfile $srcdir/configure"; then
+
+      # If neither matched, then we have a broken ls.  This can happen
+      # if, for instance, CONFIG_SHELL is bash and it inherits a
+      # broken ls alias from the environment.  This has actually
+      # happened.  Such a system could not be considered "sane".
+      AC_MSG_ERROR([ls -t appears to fail.  Make sure there is not a broken
+alias in your environment])
+   fi
+
+   test "[$]2" = conftestfile
+   )
+then
+   # Ok.
+   :
+else
+   AC_MSG_ERROR([newly created file is older than distributed files!
+Check your system clock])
+fi
+rm -f conftest*
+AC_MSG_RESULT(yes)])
+
+dnl AM_MISSING_PROG(NAME, PROGRAM, DIRECTORY)
+dnl The program must properly implement --version.
+AC_DEFUN(AM_MISSING_PROG,
+[AC_MSG_CHECKING(for working $2)
+# Run test in a subshell; some versions of sh will print an error if
+# an executable is not found, even if stderr is redirected.
+# Redirect stdin to placate older versions of autoconf.  Sigh.
+if ($2 --version) < /dev/null > /dev/null 2>&1; then
+   $1=$2
+   AC_MSG_RESULT(found)
+else
+   $1="$3/missing $2"
+   AC_MSG_RESULT(missing)
+fi
+AC_SUBST($1)])
+
+#serial 1
+# This test replaces the one in autoconf.
+# Currently this macro should have the same name as the autoconf macro
+# because gettext's gettext.m4 (distributed in the automake package)
+# still uses it.  Otherwise, the use in gettext.m4 makes autoheader
+# give these diagnostics:
+#   configure.in:556: AC_TRY_COMPILE was called before AC_ISC_POSIX
+#   configure.in:556: AC_TRY_RUN was called before AC_ISC_POSIX
+
+undefine([AC_ISC_POSIX])
+
+AC_DEFUN([AC_ISC_POSIX],
+  [
+    dnl This test replaces the obsolescent AC_ISC_POSIX kludge.
+    AC_CHECK_LIB(cposix, strerror, [LIBS="$LIBS -lcposix"])
+  ]
+)
+
+# libtool.m4 - Configure libtool for the host system. -*-Shell-script-*-
+
+# serial 46 AC_PROG_LIBTOOL
+AC_DEFUN([AC_PROG_LIBTOOL],
+[AC_REQUIRE([AC_LIBTOOL_SETUP])dnl
+
+# This can be used to rebuild libtool when needed
+LIBTOOL_DEPS="$ac_aux_dir/ltmain.sh"
+
+# Always use our own libtool.
+LIBTOOL='$(SHELL) $(top_builddir)/libtool'
+AC_SUBST(LIBTOOL)dnl
+
+# Prevent multiple expansion
+define([AC_PROG_LIBTOOL], [])
+])
+
+AC_DEFUN([AC_LIBTOOL_SETUP],
+[AC_PREREQ(2.13)dnl
+AC_REQUIRE([AC_ENABLE_SHARED])dnl
+AC_REQUIRE([AC_ENABLE_STATIC])dnl
+AC_REQUIRE([AC_ENABLE_FAST_INSTALL])dnl
+AC_REQUIRE([AC_CANONICAL_HOST])dnl
+AC_REQUIRE([AC_CANONICAL_BUILD])dnl
+AC_REQUIRE([AC_PROG_CC])dnl
+AC_REQUIRE([AC_PROG_LD])dnl
+AC_REQUIRE([AC_PROG_LD_RELOAD_FLAG])dnl
+AC_REQUIRE([AC_PROG_NM])dnl
+AC_REQUIRE([AC_PROG_LN_S])dnl
+AC_REQUIRE([AC_DEPLIBS_CHECK_METHOD])dnl
+AC_REQUIRE([AC_OBJEXT])dnl
+AC_REQUIRE([AC_EXEEXT])dnl
+dnl
+
+_LT_AC_PROG_ECHO_BACKSLASH
+# Only perform the check for file, if the check method requires it
+case $deplibs_check_method in
+file_magic*)
+  if test "$file_magic_cmd" = '$MAGIC_CMD'; then
+    AC_PATH_MAGIC
+  fi
+  ;;
+esac
+
+AC_CHECK_TOOL(RANLIB, ranlib, :)
+AC_CHECK_TOOL(STRIP, strip, :)
+
+ifdef([AC_PROVIDE_AC_LIBTOOL_DLOPEN], enable_dlopen=yes, enable_dlopen=no)
+ifdef([AC_PROVIDE_AC_LIBTOOL_WIN32_DLL],
+enable_win32_dll=yes, enable_win32_dll=no)
+
+AC_ARG_ENABLE(libtool-lock,
+  [  --disable-libtool-lock  avoid locking (might break parallel builds)])
+test "x$enable_libtool_lock" != xno && enable_libtool_lock=yes
+
+# Some flags need to be propagated to the compiler or linker for good
+# libtool support.
+case $host in
+*-*-irix6*)
+  # Find out which ABI we are using.
+  echo '[#]line __oline__ "configure"' > conftest.$ac_ext
+  if AC_TRY_EVAL(ac_compile); then
+    case `/usr/bin/file conftest.$ac_objext` in
+    *32-bit*)
+      LD="${LD-ld} -32"
+      ;;
+    *N32*)
+      LD="${LD-ld} -n32"
+      ;;
+    *64-bit*)
+      LD="${LD-ld} -64"
+      ;;
+    esac
+  fi
+  rm -rf conftest*
+  ;;
+
+*-*-sco3.2v5*)
+  # On SCO OpenServer 5, we need -belf to get full-featured binaries.
+  SAVE_CFLAGS="$CFLAGS"
+  CFLAGS="$CFLAGS -belf"
+  AC_CACHE_CHECK([whether the C compiler needs -belf], lt_cv_cc_needs_belf,
+    [AC_LANG_SAVE
+     AC_LANG_C
+     AC_TRY_LINK([],[],[lt_cv_cc_needs_belf=yes],[lt_cv_cc_needs_belf=no])
+     AC_LANG_RESTORE])
+  if test x"$lt_cv_cc_needs_belf" != x"yes"; then
+    # this is probably gcc 2.8.0, egcs 1.0 or newer; no need for -belf
+    CFLAGS="$SAVE_CFLAGS"
+  fi
+  ;;
+
+ifdef([AC_PROVIDE_AC_LIBTOOL_WIN32_DLL],
+[*-*-cygwin* | *-*-mingw* | *-*-pw32*)
+  AC_CHECK_TOOL(DLLTOOL, dlltool, false)
+  AC_CHECK_TOOL(AS, as, false)
+  AC_CHECK_TOOL(OBJDUMP, objdump, false)
+
+  # recent cygwin and mingw systems supply a stub DllMain which the user
+  # can override, but on older systems we have to supply one
+  AC_CACHE_CHECK([if libtool should supply DllMain function], lt_cv_need_dllmain,
+    [AC_TRY_LINK([],
+      [extern int __attribute__((__stdcall__)) DllMain(void*, int, void*);
+      DllMain (0, 0, 0);],
+      [lt_cv_need_dllmain=no],[lt_cv_need_dllmain=yes])])
+
+  case $host/$CC in
+  *-*-cygwin*/gcc*-mno-cygwin*|*-*-mingw*)
+    # old mingw systems require "-dll" to link a DLL, while more recent ones
+    # require "-mdll"
+    SAVE_CFLAGS="$CFLAGS"
+    CFLAGS="$CFLAGS -mdll"
+    AC_CACHE_CHECK([how to link DLLs], lt_cv_cc_dll_switch,
+      [AC_TRY_LINK([], [], [lt_cv_cc_dll_switch=-mdll],[lt_cv_cc_dll_switch=-dll])])
+    CFLAGS="$SAVE_CFLAGS" ;;
+  *-*-cygwin* | *-*-pw32*)
+    # cygwin systems need to pass --dll to the linker, and not link
+    # crt.o which will require a WinMain@16 definition.
+    lt_cv_cc_dll_switch="-Wl,--dll -nostartfiles" ;;
+  esac
+  ;;
+  ])
+esac
+
+_LT_AC_LTCONFIG_HACK
+
+])
+
+# _LT_AC_CHECK_DLFCN
+# --------------------
+AC_DEFUN(_LT_AC_CHECK_DLFCN,
+[AC_CHECK_HEADERS(dlfcn.h)
+])# _LT_AC_CHECK_DLFCN
+
+# AC_LIBTOOL_SYS_GLOBAL_SYMBOL_PIPE
+# ---------------------------------
+AC_DEFUN([AC_LIBTOOL_SYS_GLOBAL_SYMBOL_PIPE],
+[AC_REQUIRE([AC_CANONICAL_HOST])
+AC_REQUIRE([AC_PROG_NM])
+AC_REQUIRE([AC_OBJEXT])
+# Check for command to grab the raw symbol name followed by C symbol from nm.
+AC_MSG_CHECKING([command to parse $NM output])
+AC_CACHE_VAL([lt_cv_sys_global_symbol_pipe], [dnl
+
+# These are sane defaults that work on at least a few old systems.
+# [They come from Ultrix.  What could be older than Ultrix?!! ;)]
+
+# Character class describing NM global symbol codes.
+[symcode='[BCDEGRST]']
+
+# Regexp to match symbols that can be accessed directly from C.
+[sympat='\([_A-Za-z][_A-Za-z0-9]*\)']
+
+# Transform the above into a raw symbol and a C symbol.
+symxfrm='\1 \2\3 \3'
+
+# Transform an extracted symbol line into a proper C declaration
+lt_cv_global_symbol_to_cdecl="sed -n -e 's/^. .* \(.*\)$/extern char \1;/p'"
+
+# Define system-specific variables.
+case $host_os in
+aix*)
+  [symcode='[BCDT]']
+  ;;
+cygwin* | mingw* | pw32*)
+  [symcode='[ABCDGISTW]']
+  ;;
+hpux*) # Its linker distinguishes data from code symbols
+  lt_cv_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern char \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
+  ;;
+irix*)
+  [symcode='[BCDEGRST]']
+  ;;
+solaris* | sysv5*)
+  [symcode='[BDT]']
+  ;;
+sysv4)
+  [symcode='[DFNSTU]']
+  ;;
+esac
+
+# Handle CRLF in mingw tool chain
+opt_cr=
+case $host_os in
+mingw*)
+  opt_cr=`echo 'x\{0,1\}' | tr x '\015'` # option cr in regexp
+  ;;
+esac
+
+# If we're using GNU nm, then use its standard symbol codes.
+if $NM -V 2>&1 | egrep '(GNU|with BFD)' > /dev/null; then
+  [symcode='[ABCDGISTW]']
+fi
+
+# Try without a prefix undercore, then with it.
+for ac_symprfx in "" "_"; do
+
+  # Write the raw and C identifiers.
+[lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[ 	]\($symcode$symcode*\)[ 	][ 	]*\($ac_symprfx\)$sympat$opt_cr$/$symxfrm/p'"]
+
+  # Check to see that the pipe works correctly.
+  pipe_works=no
+  rm -f conftest*
+  cat > conftest.$ac_ext <<EOF
+#ifdef __cplusplus
+extern "C" {
+#endif
+char nm_test_var;
+void nm_test_func(){}
+#ifdef __cplusplus
+}
+#endif
+int main(){nm_test_var='a';nm_test_func();return(0);}
+EOF
+
+  if AC_TRY_EVAL(ac_compile); then
+    # Now try to grab the symbols.
+    nlist=conftest.nm
+    if AC_TRY_EVAL(NM conftest.$ac_objext \| $lt_cv_sys_global_symbol_pipe \> $nlist) && test -s "$nlist"; then
+      # Try sorting and uniquifying the output.
+      if sort "$nlist" | uniq > "$nlist"T; then
+	mv -f "$nlist"T "$nlist"
+      else
+	rm -f "$nlist"T
+      fi
+
+      # Make sure that we snagged all the symbols we need.
+      if egrep ' nm_test_var$' "$nlist" >/dev/null; then
+	if egrep ' nm_test_func$' "$nlist" >/dev/null; then
+	  cat <<EOF > conftest.$ac_ext
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+EOF
+	  # Now generate the symbol file.
+	  eval "$lt_cv_global_symbol_to_cdecl"' < "$nlist" >> conftest.$ac_ext'
+
+	  cat <<EOF >> conftest.$ac_ext
+#if defined (__STDC__) && __STDC__
+# define lt_ptr_t void *
+#else
+# define lt_ptr_t char *
+# define const
+#endif
+
+/* The mapping between symbol names and symbols. */
+const struct {
+  const char *name;
+  lt_ptr_t address;
+}
+[lt_preloaded_symbols[] =]
+{
+EOF
+	  sed "s/^$symcode$symcode* \(.*\) \(.*\)$/  {\"\2\", (lt_ptr_t) \&\2},/" < "$nlist" >> conftest.$ac_ext
+	  cat <<\EOF >> conftest.$ac_ext
+  {0, (lt_ptr_t) 0}
+};
+
+#ifdef __cplusplus
+}
+#endif
+EOF
+	  # Now try linking the two files.
+	  mv conftest.$ac_objext conftstm.$ac_objext
+	  save_LIBS="$LIBS"
+	  save_CFLAGS="$CFLAGS"
+	  LIBS="conftstm.$ac_objext"
+	  CFLAGS="$CFLAGS$no_builtin_flag"
+	  if AC_TRY_EVAL(ac_link) && test -s conftest; then
+	    pipe_works=yes
+	  fi
+	  LIBS="$save_LIBS"
+	  CFLAGS="$save_CFLAGS"
+	else
+	  echo "cannot find nm_test_func in $nlist" >&AC_FD_CC
+	fi
+      else
+	echo "cannot find nm_test_var in $nlist" >&AC_FD_CC
+      fi
+    else
+      echo "cannot run $lt_cv_sys_global_symbol_pipe" >&AC_FD_CC
+    fi
+  else
+    echo "$progname: failed program was:" >&AC_FD_CC
+    cat conftest.$ac_ext >&5
+  fi
+  rm -f conftest* conftst*
+
+  # Do not use the global_symbol_pipe unless it works.
+  if test "$pipe_works" = yes; then
+    break
+  else
+    lt_cv_sys_global_symbol_pipe=
+  fi
+done
+])
+global_symbol_pipe="$lt_cv_sys_global_symbol_pipe"
+if test -z "$lt_cv_sys_global_symbol_pipe"; then
+  global_symbol_to_cdecl=
+else
+  global_symbol_to_cdecl="$lt_cv_global_symbol_to_cdecl"
+fi
+if test -z "$global_symbol_pipe$global_symbol_to_cdecl"; then
+  AC_MSG_RESULT(failed)
+else
+  AC_MSG_RESULT(ok)
+fi
+]) # AC_LIBTOOL_SYS_GLOBAL_SYMBOL_PIPE
+
+# _LT_AC_LIBTOOL_SYS_PATH_SEPARATOR
+# ---------------------------------
+AC_DEFUN([_LT_AC_LIBTOOL_SYS_PATH_SEPARATOR],
+[# Find the correct PATH separator.  Usually this is `:', but
+# DJGPP uses `;' like DOS.
+if test "X${PATH_SEPARATOR+set}" != Xset; then
+  UNAME=${UNAME-`uname 2>/dev/null`}
+  case X$UNAME in
+    *-DOS) lt_cv_sys_path_separator=';' ;;
+    *)     lt_cv_sys_path_separator=':' ;;
+  esac
+fi
+])# _LT_AC_LIBTOOL_SYS_PATH_SEPARATOR
+
+# _LT_AC_PROG_ECHO_BACKSLASH
+# --------------------------
+# Add some code to the start of the generated configure script which
+# will find an echo command which doesn;t interpret backslashes.
+AC_DEFUN([_LT_AC_PROG_ECHO_BACKSLASH],
+[ifdef([AC_DIVERSION_NOTICE], [AC_DIVERT_PUSH(AC_DIVERSION_NOTICE)],
+                              [AC_DIVERT_PUSH(NOTICE)])
+_LT_AC_LIBTOOL_SYS_PATH_SEPARATOR
+
+# Check that we are running under the correct shell.
+SHELL=${CONFIG_SHELL-/bin/sh}
+
+case X$ECHO in
+X*--fallback-echo)
+  # Remove one level of quotation (which was required for Make).
+  ECHO=`echo "$ECHO" | sed 's,\\\\\[$]\\[$]0,'[$]0','`
+  ;;
+esac
+
+echo=${ECHO-echo}
+if test "X[$]1" = X--no-reexec; then
+  # Discard the --no-reexec flag, and continue.
+  shift
+elif test "X[$]1" = X--fallback-echo; then
+  # Avoid inline document here, it may be left over
+  :
+elif test "X`($echo '\t') 2>/dev/null`" = 'X\t'; then
+  # Yippee, $echo works!
+  :
+else
+  # Restart under the correct shell.
+  exec $SHELL "[$]0" --no-reexec ${1+"[$]@"}
+fi
+
+if test "X[$]1" = X--fallback-echo; then
+  # used as fallback echo
+  shift
+  cat <<EOF
+$*
+EOF
+  exit 0
+fi
+
+# The HP-UX ksh and POSIX shell print the target directory to stdout
+# if CDPATH is set.
+if test "X${CDPATH+set}" = Xset; then CDPATH=:; export CDPATH; fi
+
+if test -z "$ECHO"; then
+if test "X${echo_test_string+set}" != Xset; then
+# find a string as large as possible, as long as the shell can cope with it
+  for cmd in 'sed 50q "[$]0"' 'sed 20q "[$]0"' 'sed 10q "[$]0"' 'sed 2q "[$]0"' 'echo test'; do
+    # expected sizes: less than 2Kb, 1Kb, 512 bytes, 16 bytes, ...
+    if (echo_test_string="`eval $cmd`") 2>/dev/null &&
+       echo_test_string="`eval $cmd`" &&
+       (test "X$echo_test_string" = "X$echo_test_string") 2>/dev/null
+    then
+      break
+    fi
+  done
+fi
+
+if test "X`($echo '\t') 2>/dev/null`" = 'X\t' &&
+   echo_testing_string=`($echo "$echo_test_string") 2>/dev/null` &&
+   test "X$echo_testing_string" = "X$echo_test_string"; then
+  :
+else
+  # The Solaris, AIX, and Digital Unix default echo programs unquote
+  # backslashes.  This makes it impossible to quote backslashes using
+  #   echo "$something" | sed 's/\\/\\\\/g'
+  #
+  # So, first we look for a working echo in the user's PATH.
+
+  IFS="${IFS= 	}"; save_ifs="$IFS"; IFS="${IFS}${PATH_SEPARATOR}"
+  for dir in $PATH /usr/ucb; do
+    if (test -f $dir/echo || test -f $dir/echo$ac_exeext) &&
+       test "X`($dir/echo '\t') 2>/dev/null`" = 'X\t' &&
+       echo_testing_string=`($dir/echo "$echo_test_string") 2>/dev/null` &&
+       test "X$echo_testing_string" = "X$echo_test_string"; then
+      echo="$dir/echo"
+      break
+    fi
+  done
+  IFS="$save_ifs"
+
+  if test "X$echo" = Xecho; then
+    # We didn't find a better echo, so look for alternatives.
+    if test "X`(print -r '\t') 2>/dev/null`" = 'X\t' &&
+       echo_testing_string=`(print -r "$echo_test_string") 2>/dev/null` &&
+       test "X$echo_testing_string" = "X$echo_test_string"; then
+      # This shell has a builtin print -r that does the trick.
+      echo='print -r'
+    elif (test -f /bin/ksh || test -f /bin/ksh$ac_exeext) &&
+	 test "X$CONFIG_SHELL" != X/bin/ksh; then
+      # If we have ksh, try running configure again with it.
+      ORIGINAL_CONFIG_SHELL=${CONFIG_SHELL-/bin/sh}
+      export ORIGINAL_CONFIG_SHELL
+      CONFIG_SHELL=/bin/ksh
+      export CONFIG_SHELL
+      exec $CONFIG_SHELL "[$]0" --no-reexec ${1+"[$]@"}
+    else
+      # Try using printf.
+      echo='printf %s\n'
+      if test "X`($echo '\t') 2>/dev/null`" = 'X\t' &&
+	 echo_testing_string=`($echo "$echo_test_string") 2>/dev/null` &&
+	 test "X$echo_testing_string" = "X$echo_test_string"; then
+	# Cool, printf works
+	:
+      elif echo_testing_string=`($ORIGINAL_CONFIG_SHELL "[$]0" --fallback-echo '\t') 2>/dev/null` &&
+	   test "X$echo_testing_string" = 'X\t' &&
+	   echo_testing_string=`($ORIGINAL_CONFIG_SHELL "[$]0" --fallback-echo "$echo_test_string") 2>/dev/null` &&
+	   test "X$echo_testing_string" = "X$echo_test_string"; then
+	CONFIG_SHELL=$ORIGINAL_CONFIG_SHELL
+	export CONFIG_SHELL
+	SHELL="$CONFIG_SHELL"
+	export SHELL
+	echo="$CONFIG_SHELL [$]0 --fallback-echo"
+      elif echo_testing_string=`($CONFIG_SHELL "[$]0" --fallback-echo '\t') 2>/dev/null` &&
+	   test "X$echo_testing_string" = 'X\t' &&
+	   echo_testing_string=`($CONFIG_SHELL "[$]0" --fallback-echo "$echo_test_string") 2>/dev/null` &&
+	   test "X$echo_testing_string" = "X$echo_test_string"; then
+	echo="$CONFIG_SHELL [$]0 --fallback-echo"
+      else
+	# maybe with a smaller string...
+	prev=:
+
+	for cmd in 'echo test' 'sed 2q "[$]0"' 'sed 10q "[$]0"' 'sed 20q "[$]0"' 'sed 50q "[$]0"'; do
+	  if (test "X$echo_test_string" = "X`eval $cmd`") 2>/dev/null
+	  then
+	    break
+	  fi
+	  prev="$cmd"
+	done
+
+	if test "$prev" != 'sed 50q "[$]0"'; then
+	  echo_test_string=`eval $prev`
+	  export echo_test_string
+	  exec ${ORIGINAL_CONFIG_SHELL-${CONFIG_SHELL-/bin/sh}} "[$]0" ${1+"[$]@"}
+	else
+	  # Oops.  We lost completely, so just stick with echo.
+	  echo=echo
+	fi
+      fi
+    fi
+  fi
+fi
+fi
+
+# Copy echo and quote the copy suitably for passing to libtool from
+# the Makefile, instead of quoting the original, which is used later.
+ECHO=$echo
+if test "X$ECHO" = "X$CONFIG_SHELL [$]0 --fallback-echo"; then
+   ECHO="$CONFIG_SHELL \\\$\[$]0 --fallback-echo"
+fi
+
+AC_SUBST(ECHO)
+AC_DIVERT_POP
+])# _LT_AC_PROG_ECHO_BACKSLASH
+
+# _LT_AC_TRY_DLOPEN_SELF (ACTION-IF-TRUE, ACTION-IF-TRUE-W-USCORE,
+#                           ACTION-IF-FALSE, ACTION-IF-CROSS-COMPILING)
+# ------------------------------------------------------------------
+AC_DEFUN(_LT_AC_TRY_DLOPEN_SELF,
+[if test "$cross_compiling" = yes; then :
+  [$4]
+else
+  AC_REQUIRE([_LT_AC_CHECK_DLFCN])dnl
+  lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+  lt_status=$lt_dlunknown
+  cat > conftest.$ac_ext <<EOF
+[#line __oline__ "configure"
+#include "confdefs.h"
+
+#if HAVE_DLFCN_H
+#include <dlfcn.h>
+#endif
+
+#include <stdio.h>
+
+#ifdef RTLD_GLOBAL
+#  define LT_DLGLOBAL		RTLD_GLOBAL
+#else
+#  ifdef DL_GLOBAL
+#    define LT_DLGLOBAL		DL_GLOBAL
+#  else
+#    define LT_DLGLOBAL		0
+#  endif
+#endif
+
+/* We may have to define LT_DLLAZY_OR_NOW in the command line if we
+   find out it does not work in some platform. */
+#ifndef LT_DLLAZY_OR_NOW
+#  ifdef RTLD_LAZY
+#    define LT_DLLAZY_OR_NOW		RTLD_LAZY
+#  else
+#    ifdef DL_LAZY
+#      define LT_DLLAZY_OR_NOW		DL_LAZY
+#    else
+#      ifdef RTLD_NOW
+#        define LT_DLLAZY_OR_NOW	RTLD_NOW
+#      else
+#        ifdef DL_NOW
+#          define LT_DLLAZY_OR_NOW	DL_NOW
+#        else
+#          define LT_DLLAZY_OR_NOW	0
+#        endif
+#      endif
+#    endif
+#  endif
+#endif
+
+#ifdef __cplusplus
+extern "C" void exit (int);
+#endif
+
+void fnord() { int i=42;}
+int main ()
+{
+  void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
+  int status = $lt_dlunknown;
+
+  if (self)
+    {
+      if (dlsym (self,"fnord"))       status = $lt_dlno_uscore;
+      else if (dlsym( self,"_fnord")) status = $lt_dlneed_uscore;
+      /* dlclose (self); */
+    }
+
+    exit (status);
+}]
+EOF
+  if AC_TRY_EVAL(ac_link) && test -s conftest${ac_exeext} 2>/dev/null; then
+    (./conftest; exit; ) 2>/dev/null
+    lt_status=$?
+    case x$lt_status in
+      x$lt_dlno_uscore) $1 ;;
+      x$lt_dlneed_uscore) $2 ;;
+      x$lt_unknown|x*) $3 ;;
+    esac
+  else :
+    # compilation failed
+    $3
+  fi
+fi
+rm -fr conftest*
+])# _LT_AC_TRY_DLOPEN_SELF
+
+# AC_LIBTOOL_DLOPEN_SELF
+# -------------------
+AC_DEFUN(AC_LIBTOOL_DLOPEN_SELF,
+[if test "x$enable_dlopen" != xyes; then
+  enable_dlopen=unknown
+  enable_dlopen_self=unknown
+  enable_dlopen_self_static=unknown
+else
+  lt_cv_dlopen=no
+  lt_cv_dlopen_libs=
+
+  case $host_os in
+  beos*)
+    lt_cv_dlopen="load_add_on"
+    lt_cv_dlopen_libs=
+    lt_cv_dlopen_self=yes
+    ;;
+
+  cygwin* | mingw* | pw32*)
+    lt_cv_dlopen="LoadLibrary"
+    lt_cv_dlopen_libs=
+   ;;
+
+  *)
+    AC_CHECK_LIB(dl, dlopen,  [lt_cv_dlopen="dlopen" lt_cv_dlopen_libs="-ldl"],
+      [AC_CHECK_FUNC(dlopen, lt_cv_dlopen="dlopen",
+        [AC_CHECK_FUNC(shl_load, lt_cv_dlopen="shl_load",
+          [AC_CHECK_LIB(svld, dlopen,
+	    [lt_cv_dlopen="dlopen" lt_cv_dlopen_libs="-lsvld"],
+            [AC_CHECK_LIB(dld, shl_load,
+              [lt_cv_dlopen="dld_link" lt_cv_dlopen_libs="-dld"])
+	    ])
+          ])
+        ])
+      ])
+    ;;
+  esac
+
+  if test "x$lt_cv_dlopen" != xno; then
+    enable_dlopen=yes
+  else
+    enable_dlopen=no
+  fi
+
+  case $lt_cv_dlopen in
+  dlopen)
+    save_CPPFLAGS="$CPPFLAGS"
+    AC_REQUIRE([_LT_AC_CHECK_DLFCN])dnl
+    test "x$ac_cv_header_dlfcn_h" = xyes && CPPFLAGS="$CPPFLAGS -DHAVE_DLFCN_H"
+
+    save_LDFLAGS="$LDFLAGS"
+    eval LDFLAGS=\"\$LDFLAGS $export_dynamic_flag_spec\"
+
+    save_LIBS="$LIBS"
+    LIBS="$lt_cv_dlopen_libs $LIBS"
+
+    AC_CACHE_CHECK([whether a program can dlopen itself],
+	  lt_cv_dlopen_self, [dnl
+	  _LT_AC_TRY_DLOPEN_SELF(
+	    lt_cv_dlopen_self=yes, lt_cv_dlopen_self=yes,
+	    lt_cv_dlopen_self=no, lt_cv_dlopen_self=cross)
+    ])
+
+    if test "x$lt_cv_dlopen_self" = xyes; then
+      LDFLAGS="$LDFLAGS $link_static_flag"
+      AC_CACHE_CHECK([whether a statically linked program can dlopen itself],
+    	  lt_cv_dlopen_self_static, [dnl
+	  _LT_AC_TRY_DLOPEN_SELF(
+	    lt_cv_dlopen_self_static=yes, lt_cv_dlopen_self_static=yes,
+	    lt_cv_dlopen_self_static=no,  lt_cv_dlopen_self_static=cross)
+      ])
+    fi
+
+    CPPFLAGS="$save_CPPFLAGS"
+    LDFLAGS="$save_LDFLAGS"
+    LIBS="$save_LIBS"
+    ;;
+  esac
+
+  case $lt_cv_dlopen_self in
+  yes|no) enable_dlopen_self=$lt_cv_dlopen_self ;;
+  *) enable_dlopen_self=unknown ;;
+  esac
+
+  case $lt_cv_dlopen_self_static in
+  yes|no) enable_dlopen_self_static=$lt_cv_dlopen_self_static ;;
+  *) enable_dlopen_self_static=unknown ;;
+  esac
+fi
+])# AC_LIBTOOL_DLOPEN_SELF
+
+AC_DEFUN([_LT_AC_LTCONFIG_HACK],
+[AC_REQUIRE([AC_LIBTOOL_SYS_GLOBAL_SYMBOL_PIPE])dnl
+# Sed substitution that helps us do robust quoting.  It backslashifies
+# metacharacters that are still active within double-quoted strings.
+Xsed='sed -e s/^X//'
+[sed_quote_subst='s/\([\\"\\`$\\\\]\)/\\\1/g']
+
+# Same as above, but do not quote variable references.
+[double_quote_subst='s/\([\\"\\`\\\\]\)/\\\1/g']
+
+# Sed substitution to delay expansion of an escaped shell variable in a
+# double_quote_subst'ed string.
+delay_variable_subst='s/\\\\\\\\\\\$/\\\\\\$/g'
+
+# Constants:
+rm="rm -f"
+
+# Global variables:
+default_ofile=libtool
+can_build_shared=yes
+
+# All known linkers require a `.a' archive for static linking (except M$VC,
+# which needs '.lib').
+libext=a
+ltmain="$ac_aux_dir/ltmain.sh"
+ofile="$default_ofile"
+with_gnu_ld="$lt_cv_prog_gnu_ld"
+need_locks="$enable_libtool_lock"
+
+old_CC="$CC"
+old_CFLAGS="$CFLAGS"
+
+# Set sane defaults for various variables
+test -z "$AR" && AR=ar
+test -z "$AR_FLAGS" && AR_FLAGS=cru
+test -z "$AS" && AS=as
+test -z "$CC" && CC=cc
+test -z "$DLLTOOL" && DLLTOOL=dlltool
+test -z "$LD" && LD=ld
+test -z "$LN_S" && LN_S="ln -s"
+test -z "$MAGIC_CMD" && MAGIC_CMD=file
+test -z "$NM" && NM=nm
+test -z "$OBJDUMP" && OBJDUMP=objdump
+test -z "$RANLIB" && RANLIB=:
+test -z "$STRIP" && STRIP=:
+test -z "$ac_objext" && ac_objext=o
+
+if test x"$host" != x"$build"; then
+  ac_tool_prefix=${host_alias}-
+else
+  ac_tool_prefix=
+fi
+
+# Transform linux* to *-*-linux-gnu*, to support old configure scripts.
+case $host_os in
+linux-gnu*) ;;
+linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
+esac
+
+case $host_os in
+aix3*)
+  # AIX sometimes has problems with the GCC collect2 program.  For some
+  # reason, if we set the COLLECT_NAMES environment variable, the problems
+  # vanish in a puff of smoke.
+  if test "X${COLLECT_NAMES+set}" != Xset; then
+    COLLECT_NAMES=
+    export COLLECT_NAMES
+  fi
+  ;;
+esac
+
+# Determine commands to create old-style static archives.
+old_archive_cmds='$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs'
+old_postinstall_cmds='chmod 644 $oldlib'
+old_postuninstall_cmds=
+
+if test -n "$RANLIB"; then
+  old_archive_cmds="$old_archive_cmds~\$RANLIB \$oldlib"
+  old_postinstall_cmds="\$RANLIB \$oldlib~$old_postinstall_cmds"
+fi
+
+# Allow CC to be a program name with arguments.
+set dummy $CC
+compiler="[$]2"
+
+AC_MSG_CHECKING([for objdir])
+rm -f .libs 2>/dev/null
+mkdir .libs 2>/dev/null
+if test -d .libs; then
+  objdir=.libs
+else
+  # MS-DOS does not allow filenames that begin with a dot.
+  objdir=_libs
+fi
+rmdir .libs 2>/dev/null
+AC_MSG_RESULT($objdir)
+
+
+AC_ARG_WITH(pic, 
+[  --with-pic              try to use only PIC/non-PIC objects [default=use both]],
+pic_mode="$withval", pic_mode=default)
+test -z "$pic_mode" && pic_mode=default
+
+# We assume here that the value for lt_cv_prog_cc_pic will not be cached
+# in isolation, and that seeing it set (from the cache) indicates that
+# the associated values are set (in the cache) correctly too.
+AC_MSG_CHECKING([for $compiler option to produce PIC])
+AC_CACHE_VAL(lt_cv_prog_cc_pic,
+[ lt_cv_prog_cc_pic=
+  lt_cv_prog_cc_shlib=
+  lt_cv_prog_cc_wl=
+  lt_cv_prog_cc_static=
+  lt_cv_prog_cc_no_builtin=
+  lt_cv_prog_cc_can_build_shared=$can_build_shared
+
+  if test "$GCC" = yes; then
+    lt_cv_prog_cc_wl='-Wl,'
+    lt_cv_prog_cc_static='-static'
+
+    case $host_os in
+    aix*)
+      # Below there is a dirty hack to force normal static linking with -ldl
+      # The problem is because libdl dynamically linked with both libc and
+      # libC (AIX C++ library), which obviously doesn't included in libraries
+      # list by gcc. This cause undefined symbols with -static flags.
+      # This hack allows C programs to be linked with "-static -ldl", but
+      # we not sure about C++ programs.
+      lt_cv_prog_cc_static="$lt_cv_prog_cc_static ${lt_cv_prog_cc_wl}-lC"
+      ;;
+    amigaos*)
+      # FIXME: we need at least 68020 code to build shared libraries, but
+      # adding the `-m68020' flag to GCC prevents building anything better,
+      # like `-m68040'.
+      lt_cv_prog_cc_pic='-m68020 -resident32 -malways-restore-a4'
+      ;;
+    beos* | irix5* | irix6* | osf3* | osf4* | osf5*)
+      # PIC is the default for these OSes.
+      ;;
+    darwin* | rhapsody*)
+      # PIC is the default on this platform
+      # Common symbols not allowed in MH_DYLIB files
+      lt_cv_prog_cc_pic='-fno-common'
+      ;;
+    cygwin* | mingw* | pw32* | os2*)
+      # This hack is so that the source file can tell whether it is being
+      # built for inclusion in a dll (and should export symbols for example).
+      lt_cv_prog_cc_pic='-DDLL_EXPORT'
+      ;;
+    sysv4*MP*)
+      if test -d /usr/nec; then
+	 lt_cv_prog_cc_pic=-Kconform_pic
+      fi
+      ;;
+    *)
+      lt_cv_prog_cc_pic='-fPIC'
+      ;;
+    esac
+  else
+    # PORTME Check for PIC flags for the system compiler.
+    case $host_os in
+    aix3* | aix4* | aix5*)
+      # All AIX code is PIC.
+      if test "$host_cpu" = ia64; then
+        # AIX 5 now supports IA64 processor
+        lt_cv_prog_cc_static='-Bstatic'
+        lt_cv_prog_cc_wl='-Wl,'
+      else
+        lt_cv_prog_cc_static='-bnso -bI:/lib/syscalls.exp'
+      fi
+      ;;
+
+    hpux9* | hpux10* | hpux11*)
+      # Is there a better lt_cv_prog_cc_static that works with the bundled CC?
+      lt_cv_prog_cc_wl='-Wl,'
+      lt_cv_prog_cc_static="${lt_cv_prog_cc_wl}-a ${lt_cv_prog_cc_wl}archive"
+      lt_cv_prog_cc_pic='+Z'
+      ;;
+
+    irix5* | irix6*)
+      lt_cv_prog_cc_wl='-Wl,'
+      lt_cv_prog_cc_static='-non_shared'
+      # PIC (with -KPIC) is the default.
+      ;;
+
+    cygwin* | mingw* | pw32* | os2*)
+      # This hack is so that the source file can tell whether it is being
+      # built for inclusion in a dll (and should export symbols for example).
+      lt_cv_prog_cc_pic='-DDLL_EXPORT'
+      ;;
+
+    newsos6)
+      lt_cv_prog_cc_pic='-KPIC'
+      lt_cv_prog_cc_static='-Bstatic'
+      ;;
+
+    osf3* | osf4* | osf5*)
+      # All OSF/1 code is PIC.
+      lt_cv_prog_cc_wl='-Wl,'
+      lt_cv_prog_cc_static='-non_shared'
+      ;;
+
+    sco3.2v5*)
+      lt_cv_prog_cc_pic='-Kpic'
+      lt_cv_prog_cc_static='-dn'
+      lt_cv_prog_cc_shlib='-belf'
+      ;;
+
+    solaris*)
+      lt_cv_prog_cc_pic='-KPIC'
+      lt_cv_prog_cc_static='-Bstatic'
+      lt_cv_prog_cc_wl='-Wl,'
+      ;;
+
+    sunos4*)
+      lt_cv_prog_cc_pic='-PIC'
+      lt_cv_prog_cc_static='-Bstatic'
+      lt_cv_prog_cc_wl='-Qoption ld '
+      ;;
+
+    sysv4 | sysv4.2uw2* | sysv4.3* | sysv5*)
+      lt_cv_prog_cc_pic='-KPIC'
+      lt_cv_prog_cc_static='-Bstatic'
+      if test "x$host_vendor" = xsni; then
+        lt_cv_prog_cc_wl='-LD'
+      else
+        lt_cv_prog_cc_wl='-Wl,'
+      fi
+      ;;
+
+    uts4*)
+      lt_cv_prog_cc_pic='-pic'
+      lt_cv_prog_cc_static='-Bstatic'
+      ;;
+
+    sysv4*MP*)
+      if test -d /usr/nec ;then
+	lt_cv_prog_cc_pic='-Kconform_pic'
+	lt_cv_prog_cc_static='-Bstatic'
+      fi
+      ;;
+
+    *)
+      lt_cv_prog_cc_can_build_shared=no
+      ;;
+    esac
+  fi
+])
+if test -z "$lt_cv_prog_cc_pic"; then
+  AC_MSG_RESULT([none])
+else
+  AC_MSG_RESULT([$lt_cv_prog_cc_pic])
+
+  # Check to make sure the pic_flag actually works.
+  AC_MSG_CHECKING([if $compiler PIC flag $lt_cv_prog_cc_pic works])
+  AC_CACHE_VAL(lt_cv_prog_cc_pic_works, [dnl
+    save_CFLAGS="$CFLAGS"
+    CFLAGS="$CFLAGS $lt_cv_prog_cc_pic -DPIC"
+    AC_TRY_COMPILE([], [], [dnl
+      case $host_os in
+      hpux9* | hpux10* | hpux11*)
+	# On HP-UX, both CC and GCC only warn that PIC is supported... then
+	# they create non-PIC objects.  So, if there were any warnings, we
+	# assume that PIC is not supported.
+	if test -s conftest.err; then
+	  lt_cv_prog_cc_pic_works=no
+	else
+	  lt_cv_prog_cc_pic_works=yes
+	fi
+	;;
+      *)
+	lt_cv_prog_cc_pic_works=yes
+	;;
+      esac
+    ], [dnl
+      lt_cv_prog_cc_pic_works=no
+    ])
+    CFLAGS="$save_CFLAGS"
+  ])
+
+  if test "X$lt_cv_prog_cc_pic_works" = Xno; then
+    lt_cv_prog_cc_pic=
+    lt_cv_prog_cc_can_build_shared=no
+  else
+    lt_cv_prog_cc_pic=" $lt_cv_prog_cc_pic"
+  fi
+
+  AC_MSG_RESULT([$lt_cv_prog_cc_pic_works])
+fi
+
+# Check for any special shared library compilation flags.
+if test -n "$lt_cv_prog_cc_shlib"; then
+  AC_MSG_WARN([\`$CC' requires \`$lt_cv_prog_cc_shlib' to build shared libraries])
+  if echo "$old_CC $old_CFLAGS " | [egrep -e "[ 	]$lt_cv_prog_cc_shlib[ 	]"] >/dev/null; then :
+  else
+   AC_MSG_WARN([add \`$lt_cv_prog_cc_shlib' to the CC or CFLAGS env variable and reconfigure])
+    lt_cv_prog_cc_can_build_shared=no
+  fi
+fi
+
+AC_MSG_CHECKING([if $compiler static flag $lt_cv_prog_cc_static works])
+AC_CACHE_VAL([lt_cv_prog_cc_static_works], [dnl
+  lt_cv_prog_cc_static_works=no
+  save_LDFLAGS="$LDFLAGS"
+  LDFLAGS="$LDFLAGS $lt_cv_prog_cc_static"
+  AC_TRY_LINK([], [], [lt_cv_prog_cc_static_works=yes])
+  LDFLAGS="$save_LDFLAGS"
+])
+
+# Belt *and* braces to stop my trousers falling down:
+test "X$lt_cv_prog_cc_static_works" = Xno && lt_cv_prog_cc_static=
+AC_MSG_RESULT([$lt_cv_prog_cc_static_works])
+
+pic_flag="$lt_cv_prog_cc_pic"
+special_shlib_compile_flags="$lt_cv_prog_cc_shlib"
+wl="$lt_cv_prog_cc_wl"
+link_static_flag="$lt_cv_prog_cc_static"
+no_builtin_flag="$lt_cv_prog_cc_no_builtin"
+can_build_shared="$lt_cv_prog_cc_can_build_shared"
+
+
+# Check to see if options -o and -c are simultaneously supported by compiler
+AC_MSG_CHECKING([if $compiler supports -c -o file.$ac_objext])
+AC_CACHE_VAL([lt_cv_compiler_c_o], [
+$rm -r conftest 2>/dev/null
+mkdir conftest
+cd conftest
+echo "int some_variable = 0;" > conftest.$ac_ext
+mkdir out
+# According to Tom Tromey, Ian Lance Taylor reported there are C compilers
+# that will create temporary files in the current directory regardless of
+# the output directory.  Thus, making CWD read-only will cause this test
+# to fail, enabling locking or at least warning the user not to do parallel
+# builds.
+chmod -w .
+save_CFLAGS="$CFLAGS"
+CFLAGS="$CFLAGS -o out/conftest2.$ac_objext"
+compiler_c_o=no
+if { (eval echo configure:__oline__: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>out/conftest.err; } && test -s out/conftest2.$ac_objext; then
+  # The compiler can only warn and ignore the option if not recognized
+  # So say no if there are warnings
+  if test -s out/conftest.err; then
+    lt_cv_compiler_c_o=no
+  else
+    lt_cv_compiler_c_o=yes
+  fi
+else
+  # Append any errors to the config.log.
+  cat out/conftest.err 1>&AC_FD_CC
+  lt_cv_compiler_c_o=no
+fi
+CFLAGS="$save_CFLAGS"
+chmod u+w .
+$rm conftest* out/*
+rmdir out
+cd ..
+rmdir conftest
+$rm -r conftest 2>/dev/null
+])
+compiler_c_o=$lt_cv_compiler_c_o
+AC_MSG_RESULT([$compiler_c_o])
+
+if test x"$compiler_c_o" = x"yes"; then
+  # Check to see if we can write to a .lo
+  AC_MSG_CHECKING([if $compiler supports -c -o file.lo])
+  AC_CACHE_VAL([lt_cv_compiler_o_lo], [
+  lt_cv_compiler_o_lo=no
+  save_CFLAGS="$CFLAGS"
+  CFLAGS="$CFLAGS -c -o conftest.lo"
+  AC_TRY_COMPILE([], [int some_variable = 0;], [dnl
+    # The compiler can only warn and ignore the option if not recognized
+    # So say no if there are warnings
+    if test -s conftest.err; then
+      lt_cv_compiler_o_lo=no
+    else
+      lt_cv_compiler_o_lo=yes
+    fi
+  ])
+  CFLAGS="$save_CFLAGS"
+  ])
+  compiler_o_lo=$lt_cv_compiler_o_lo
+  AC_MSG_RESULT([$compiler_c_lo])
+else
+  compiler_o_lo=no
+fi
+
+# Check to see if we can do hard links to lock some files if needed
+hard_links="nottested"
+if test "$compiler_c_o" = no && test "$need_locks" != no; then
+  # do not overwrite the value of need_locks provided by the user
+  AC_MSG_CHECKING([if we can lock with hard links])
+  hard_links=yes
+  $rm conftest*
+  ln conftest.a conftest.b 2>/dev/null && hard_links=no
+  touch conftest.a
+  ln conftest.a conftest.b 2>&5 || hard_links=no
+  ln conftest.a conftest.b 2>/dev/null && hard_links=no
+  AC_MSG_RESULT([$hard_links])
+  if test "$hard_links" = no; then
+    AC_MSG_WARN([\`$CC' does not support \`-c -o', so \`make -j' may be unsafe])
+    need_locks=warn
+  fi
+else
+  need_locks=no
+fi
+
+if test "$GCC" = yes; then
+  # Check to see if options -fno-rtti -fno-exceptions are supported by compiler
+  AC_MSG_CHECKING([if $compiler supports -fno-rtti -fno-exceptions])
+  echo "int some_variable = 0;" > conftest.$ac_ext
+  save_CFLAGS="$CFLAGS"
+  CFLAGS="$CFLAGS -fno-rtti -fno-exceptions -c conftest.$ac_ext"
+  compiler_rtti_exceptions=no
+  AC_TRY_COMPILE([], [int some_variable = 0;], [dnl
+    # The compiler can only warn and ignore the option if not recognized
+    # So say no if there are warnings
+    if test -s conftest.err; then
+      compiler_rtti_exceptions=no
+    else
+      compiler_rtti_exceptions=yes
+    fi
+  ])
+  CFLAGS="$save_CFLAGS"
+  AC_MSG_RESULT([$compiler_rtti_exceptions])
+
+  if test "$compiler_rtti_exceptions" = "yes"; then
+    no_builtin_flag=' -fno-builtin -fno-rtti -fno-exceptions'
+  else
+    no_builtin_flag=' -fno-builtin'
+  fi
+fi
+
+# See if the linker supports building shared libraries.
+AC_MSG_CHECKING([whether the linker ($LD) supports shared libraries])
+
+allow_undefined_flag=
+no_undefined_flag=
+need_lib_prefix=unknown
+need_version=unknown
+# when you set need_version to no, make sure it does not cause -set_version
+# flags to be left without arguments
+archive_cmds=
+archive_expsym_cmds=
+old_archive_from_new_cmds=
+old_archive_from_expsyms_cmds=
+export_dynamic_flag_spec=
+whole_archive_flag_spec=
+thread_safe_flag_spec=
+hardcode_into_libs=no
+hardcode_libdir_flag_spec=
+hardcode_libdir_separator=
+hardcode_direct=no
+hardcode_minus_L=no
+hardcode_shlibpath_var=unsupported
+runpath_var=
+link_all_deplibs=unknown
+always_export_symbols=no
+export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | sed '\''s/.* //'\'' | sort | uniq > $export_symbols'
+# include_expsyms should be a list of space-separated symbols to be *always*
+# included in the symbol list
+include_expsyms=
+# exclude_expsyms can be an egrep regular expression of symbols to exclude
+# it will be wrapped by ` (' and `)$', so one must not match beginning or
+# end of line.  Example: `a|bc|.*d.*' will exclude the symbols `a' and `bc',
+# as well as any symbol that contains `d'.
+exclude_expsyms="_GLOBAL_OFFSET_TABLE_"
+# Although _GLOBAL_OFFSET_TABLE_ is a valid symbol C name, most a.out
+# platforms (ab)use it in PIC code, but their linkers get confused if
+# the symbol is explicitly referenced.  Since portable code cannot
+# rely on this symbol name, it's probably fine to never include it in
+# preloaded symbol tables.
+extract_expsyms_cmds=
+
+case $host_os in
+cygwin* | mingw* | pw32* )
+  # FIXME: the MSVC++ port hasn't been tested in a loooong time
+  # When not using gcc, we currently assume that we are using
+  # Microsoft Visual C++.
+  if test "$GCC" != yes; then
+    with_gnu_ld=no
+  fi
+  ;;
+
+esac
+
+ld_shlibs=yes
+if test "$with_gnu_ld" = yes; then
+  # If archive_cmds runs LD, not CC, wlarc should be empty
+  wlarc='${wl}'
+
+  # See if GNU ld supports shared libraries.
+  case $host_os in
+  aix3* | aix4* | aix5*)
+    # On AIX, the GNU linker is very broken
+    # Note:Check GNU linker on AIX 5-IA64 when/if it becomes available.
+    ld_shlibs=no
+    cat <<EOF 1>&2
+
+*** Warning: the GNU linker, at least up to release 2.9.1, is reported
+*** to be unable to reliably create shared libraries on AIX.
+*** Therefore, libtool is disabling shared libraries support.  If you
+*** really care for shared libraries, you may want to modify your PATH
+*** so that a non-GNU linker is found, and then restart.
+
+EOF
+    ;;
+
+  amigaos*)
+    archive_cmds='$rm $output_objdir/a2ixlibrary.data~$echo "#define NAME $libname" > $output_objdir/a2ixlibrary.data~$echo "#define LIBRARY_ID 1" >> $output_objdir/a2ixlibrary.data~$echo "#define VERSION $major" >> $output_objdir/a2ixlibrary.data~$echo "#define REVISION $revision" >> $output_objdir/a2ixlibrary.data~$AR $AR_FLAGS $lib $libobjs~$RANLIB $lib~(cd $output_objdir && a2ixlibrary -32)'
+    hardcode_libdir_flag_spec='-L$libdir'
+    hardcode_minus_L=yes
+
+    # Samuel A. Falvo II <kc5tja@dolphin.openprojects.net> reports
+    # that the semantics of dynamic libraries on AmigaOS, at least up
+    # to version 4, is to share data among multiple programs linked
+    # with the same dynamic library.  Since this doesn't match the
+    # behavior of shared libraries on other platforms, we can use
+    # them.
+    ld_shlibs=no
+    ;;
+
+  beos*)
+    if $LD --help 2>&1 | egrep ': supported targets:.* elf' > /dev/null; then
+      allow_undefined_flag=unsupported
+      # Joseph Beckenbach <jrb3@best.com> says some releases of gcc
+      # support --undefined.  This deserves some investigation.  FIXME
+      archive_cmds='$CC -nostart $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+    else
+      ld_shlibs=no
+    fi
+    ;;
+
+  cygwin* | mingw* | pw32*)
+    # hardcode_libdir_flag_spec is actually meaningless, as there is
+    # no search path for DLLs.
+    hardcode_libdir_flag_spec='-L$libdir'
+    allow_undefined_flag=unsupported
+    always_export_symbols=yes
+
+    extract_expsyms_cmds='test -f $output_objdir/impgen.c || \
+      sed -e "/^# \/\* impgen\.c starts here \*\//,/^# \/\* impgen.c ends here \*\// { s/^# //;s/^# *$//; p; }" -e d < $''0 > $output_objdir/impgen.c~
+      test -f $output_objdir/impgen.exe || (cd $output_objdir && \
+      if test "x$HOST_CC" != "x" ; then $HOST_CC -o impgen impgen.c ; \
+      else $CC -o impgen impgen.c ; fi)~
+      $output_objdir/impgen $dir/$soroot > $output_objdir/$soname-def'
+
+    old_archive_from_expsyms_cmds='$DLLTOOL --as=$AS --dllname $soname --def $output_objdir/$soname-def --output-lib $output_objdir/$newlib'
+
+    # cygwin and mingw dlls have different entry points and sets of symbols
+    # to exclude.
+    # FIXME: what about values for MSVC?
+    dll_entry=__cygwin_dll_entry@12
+    dll_exclude_symbols=DllMain@12,_cygwin_dll_entry@12,_cygwin_noncygwin_dll_entry@12~
+    case $host_os in
+    mingw*)
+      # mingw values
+      dll_entry=_DllMainCRTStartup@12
+      dll_exclude_symbols=DllMain@12,DllMainCRTStartup@12,DllEntryPoint@12~
+      ;;
+    esac
+
+    # mingw and cygwin differ, and it's simplest to just exclude the union
+    # of the two symbol sets.
+    dll_exclude_symbols=DllMain@12,_cygwin_dll_entry@12,_cygwin_noncygwin_dll_entry@12,DllMainCRTStartup@12,DllEntryPoint@12
+
+    # recent cygwin and mingw systems supply a stub DllMain which the user
+    # can override, but on older systems we have to supply one (in ltdll.c)
+    if test "x$lt_cv_need_dllmain" = "xyes"; then
+      ltdll_obj='$output_objdir/$soname-ltdll.'"$ac_objext "
+      ltdll_cmds='test -f $output_objdir/$soname-ltdll.c || sed -e "/^# \/\* ltdll\.c starts here \*\//,/^# \/\* ltdll.c ends here \*\// { s/^# //; p; }" -e d < [$]0 > $output_objdir/$soname-ltdll.c~
+	test -f $output_objdir/$soname-ltdll.$ac_objext || (cd $output_objdir && $CC -c $soname-ltdll.c)~'
+    else
+      ltdll_obj=
+      ltdll_cmds=
+    fi
+
+    # Extract the symbol export list from an `--export-all' def file,
+    # then regenerate the def file from the symbol export list, so that
+    # the compiled dll only exports the symbol export list.
+    # Be careful not to strip the DATA tag left be newer dlltools.
+    export_symbols_cmds="$ltdll_cmds"'
+      $DLLTOOL --export-all --exclude-symbols '$dll_exclude_symbols' --output-def $output_objdir/$soname-def '$ltdll_obj'$libobjs $convenience~
+      [sed -e "1,/EXPORTS/d" -e "s/ @ [0-9]*//" -e "s/ *;.*$//"] < $output_objdir/$soname-def > $export_symbols'
+
+    # If the export-symbols file already is a .def file (1st line
+    # is EXPORTS), use it as is.
+    # If DATA tags from a recent dlltool are present, honour them!
+    archive_expsym_cmds='if test "x`head -1 $export_symbols`" = xEXPORTS; then
+        cp $export_symbols $output_objdir/$soname-def;
+      else
+        echo EXPORTS > $output_objdir/$soname-def;
+        _lt_hint=1;
+        cat $export_symbols | while read symbol; do
+         set dummy \$symbol;
+         case \[$]# in
+           2) echo "   \[$]2 @ \$_lt_hint ; " >> $output_objdir/$soname-def;;
+           *) echo "     \[$]2 @ \$_lt_hint \[$]3 ; " >> $output_objdir/$soname-def;;
+         esac;
+         _lt_hint=`expr 1 + \$_lt_hint`;
+        done;
+      fi~
+      '"$ltdll_cmds"'
+      $CC -Wl,--base-file,$output_objdir/$soname-base '$lt_cv_cc_dll_switch' -Wl,-e,'$dll_entry' -o $output_objdir/$soname '$ltdll_obj'$libobjs $deplibs $compiler_flags~
+      $DLLTOOL --as=$AS --dllname $soname --exclude-symbols '$dll_exclude_symbols' --def $output_objdir/$soname-def --base-file $output_objdir/$soname-base --output-exp $output_objdir/$soname-exp~
+      $CC -Wl,--base-file,$output_objdir/$soname-base $output_objdir/$soname-exp '$lt_cv_cc_dll_switch' -Wl,-e,'$dll_entry' -o $output_objdir/$soname '$ltdll_obj'$libobjs $deplibs $compiler_flags~
+      $DLLTOOL --as=$AS --dllname $soname --exclude-symbols '$dll_exclude_symbols' --def $output_objdir/$soname-def --base-file $output_objdir/$soname-base --output-exp $output_objdir/$soname-exp --output-lib $output_objdir/$libname.dll.a~
+      $CC $output_objdir/$soname-exp '$lt_cv_cc_dll_switch' -Wl,-e,'$dll_entry' -o $output_objdir/$soname '$ltdll_obj'$libobjs $deplibs $compiler_flags'
+    ;;
+
+  netbsd*)
+    if echo __ELF__ | $CC -E - | grep __ELF__ >/dev/null; then
+      archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
+      wlarc=
+    else
+      archive_cmds='$CC -shared -nodefaultlibs $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+      archive_expsym_cmds='$CC -shared -nodefaultlibs $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+    fi
+    ;;
+
+  solaris* | sysv5*)
+    if $LD -v 2>&1 | egrep 'BFD 2\.8' > /dev/null; then
+      ld_shlibs=no
+      cat <<EOF 1>&2
+
+*** Warning: The releases 2.8.* of the GNU linker cannot reliably
+*** create shared libraries on Solaris systems.  Therefore, libtool
+*** is disabling shared libraries support.  We urge you to upgrade GNU
+*** binutils to release 2.9.1 or newer.  Another option is to modify
+*** your PATH or compiler configuration so that the native linker is
+*** used, and then restart.
+
+EOF
+    elif $LD --help 2>&1 | egrep ': supported targets:.* elf' > /dev/null; then
+      archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+      archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+    else
+      ld_shlibs=no
+    fi
+    ;;
+
+  sunos4*)
+    archive_cmds='$LD -assert pure-text -Bshareable -o $lib $libobjs $deplibs $linker_flags'
+    wlarc=
+    hardcode_direct=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  *)
+    if $LD --help 2>&1 | egrep ': supported targets:.* elf' > /dev/null; then
+      archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+      archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+    else
+      ld_shlibs=no
+    fi
+    ;;
+  esac
+
+  if test "$ld_shlibs" = yes; then
+    runpath_var=LD_RUN_PATH
+    hardcode_libdir_flag_spec='${wl}--rpath ${wl}$libdir'
+    export_dynamic_flag_spec='${wl}--export-dynamic'
+    case $host_os in
+    cygwin* | mingw* | pw32*)
+      # dlltool doesn't understand --whole-archive et. al.
+      whole_archive_flag_spec=
+      ;;
+    *)
+      # ancient GNU ld didn't support --whole-archive et. al.
+      if $LD --help 2>&1 | egrep 'no-whole-archive' > /dev/null; then
+	whole_archive_flag_spec="$wlarc"'--whole-archive$convenience '"$wlarc"'--no-whole-archive'
+      else
+	whole_archive_flag_spec=
+      fi
+      ;;
+    esac
+  fi
+else
+  # PORTME fill in a description of your system's linker (not GNU ld)
+  case $host_os in
+  aix3*)
+    allow_undefined_flag=unsupported
+    always_export_symbols=yes
+    archive_expsym_cmds='$LD -o $output_objdir/$soname $libobjs $deplibs $linker_flags -bE:$export_symbols -T512 -H512 -bM:SRE~$AR $AR_FLAGS $lib $output_objdir/$soname'
+    # Note: this linker hardcodes the directories in LIBPATH if there
+    # are no directories specified by -L.
+    hardcode_minus_L=yes
+    if test "$GCC" = yes && test -z "$link_static_flag"; then
+      # Neither direct hardcoding nor static linking is supported with a
+      # broken collect2.
+      hardcode_direct=unsupported
+    fi
+    ;;
+
+  aix4* | aix5*)
+    # When large executables or shared objects are built, AIX ld can
+    # have problems creating the table of contents.  If linking a library
+    # or program results in "error TOC overflow" add -mminimal-toc to
+    # CXXFLAGS/CFLAGS for g++/gcc.  In the cases where that is not
+    # enough to fix the problem, add -Wl,-bbigtoc to LDFLAGS.
+
+    archive_cmds=''
+    hardcode_libdir_separator=':'
+    if test "$GCC" = yes; then
+      collect2name=`${CC} -print-prog-name=collect2`
+      if test -f "$collect2name" && \
+	 strings "$collect2name" | grep resolve_lib_name >/dev/null
+      then
+	# We have reworked collect2
+	hardcode_direct=yes
+      else
+        # We have old collect2
+        hardcode_direct=unsupported
+        # It fails to find uninstalled libraries when the uninstalled
+        # path is not listed in the libpath.  Setting hardcode_minus_L
+        # to unsupported forces relinking
+        hardcode_minus_L=yes
+        hardcode_libdir_flag_spec='-L$libdir'
+        hardcode_libdir_separator=
+      fi
+      shared_flag='-shared'
+    else
+      if test "$host_cpu" = ia64; then
+        shared_flag='-G'
+      else
+        shared_flag='${wl}-bM:SRE'
+      fi
+      hardcode_direct=yes
+    fi
+
+    if test "$host_cpu" = ia64; then
+      # On IA64, the linker does run time linking by default, so we don't
+      # have to do anything special.
+      aix_use_runtimelinking=no
+      exp_sym_flag='-Bexport'
+      no_entry_flag=""
+    else
+      # Test if we are trying to use run time linking, or normal AIX style linking.
+      # If -brtl is somewhere in LDFLAGS, we need to do run time linking.
+      aix_use_runtimelinking=no
+      for ld_flag in $LDFLAGS; do
+        if (test $ld_flag = "-brtl" || test $ld_flag = "-Wl,-brtl" ); then
+          aix_use_runtimelinking=yes
+          break
+        fi
+      done
+      exp_sym_flag='-bexport'
+      no_entry_flag='-bnoentry'
+    fi
+    # It seems that -bexpall can do strange things, so it is better to
+    # generate a list of symbols to export.
+    always_export_symbols=yes
+    if test "$aix_use_runtimelinking" = yes; then
+      hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:/usr/lib:/lib'
+      allow_undefined_flag=' -Wl,-G'
+      archive_expsym_cmds="\$CC $shared_flag"' -o $output_objdir/$soname $libobjs $deplibs $compiler_flags ${allow_undefined_flag} '"\${wl}$no_entry_flag \${wl}$exp_sym_flag:\$export_symbols"
+    else
+      if test "$host_cpu" = ia64; then
+        hardcode_libdir_flag_spec='${wl}-R $libdir:/usr/lib:/lib'
+       allow_undefined_flag="-znodefs"
+        archive_expsym_cmds="\$CC $shared_flag"' -o $output_objdir/$soname ${wl}-h$soname $libobjs $deplibs $compiler_flags ${wl}${allow_undefined_flag} '"\${wl}$no_entry_flag \${wl}$exp_sym_flag:\$export_symbols"
+      else
+        hardcode_libdir_flag_spec='${wl}-bnolibpath ${wl}-blibpath:$libdir:/usr/lib:/lib'
+        # Warning - without using the other run time loading flags, -berok will
+        #           link without error, but may produce a broken library.
+        allow_undefined_flag='${wl}-berok"
+        # This is a bit strange, but is similar to how AIX traditionally builds
+        # it's shared libraries.
+        archive_expsym_cmds="\$CC $shared_flag"' -o $output_objdir/$soname $libobjs $deplibs $compiler_flags ${allow_undefined_flag} '"\${wl}$no_entry_flag \${wl}$exp_sym_flag:\$export_symbols"' ~$AR -crlo $objdir/$libname$release.a $objdir/$soname'
+      fi
+    fi
+    ;;
+
+  amigaos*)
+    archive_cmds='$rm $output_objdir/a2ixlibrary.data~$echo "#define NAME $libname" > $output_objdir/a2ixlibrary.data~$echo "#define LIBRARY_ID 1" >> $output_objdir/a2ixlibrary.data~$echo "#define VERSION $major" >> $output_objdir/a2ixlibrary.data~$echo "#define REVISION $revision" >> $output_objdir/a2ixlibrary.data~$AR $AR_FLAGS $lib $libobjs~$RANLIB $lib~(cd $output_objdir && a2ixlibrary -32)'
+    hardcode_libdir_flag_spec='-L$libdir'
+    hardcode_minus_L=yes
+    # see comment about different semantics on the GNU ld section
+    ld_shlibs=no
+    ;;
+
+  cygwin* | mingw* | pw32*)
+    # When not using gcc, we currently assume that we are using
+    # Microsoft Visual C++.
+    # hardcode_libdir_flag_spec is actually meaningless, as there is
+    # no search path for DLLs.
+    hardcode_libdir_flag_spec=' '
+    allow_undefined_flag=unsupported
+    # Tell ltmain to make .lib files, not .a files.
+    libext=lib
+    # FIXME: Setting linknames here is a bad hack.
+    archive_cmds='$CC -o $lib $libobjs $compiler_flags `echo "$deplibs" | sed -e '\''s/ -lc$//'\''` -link -dll~linknames='
+    # The linker will automatically build a .lib file if we build a DLL.
+    old_archive_from_new_cmds='true'
+    # FIXME: Should let the user specify the lib program.
+    old_archive_cmds='lib /OUT:$oldlib$oldobjs$old_deplibs'
+    fix_srcfile_path='`cygpath -w "$srcfile"`'
+    ;;
+
+  darwin* | rhapsody*)
+    allow_undefined_flag='-undefined suppress'
+    # FIXME: Relying on posixy $() will cause problems for
+    #        cross-compilation, but unfortunately the echo tests do not
+    #        yet detect zsh echo's removal of \ escapes.
+    archive_cmds='$CC $(test .$module = .yes && echo -bundle || echo -dynamiclib) $allow_undefined_flag -o $lib $libobjs $deplibs$linkopts -install_name $rpath/$soname $(test -n "$verstring" -a x$verstring != x0.0 && echo $verstring)'
+    # We need to add '_' to the symbols in $export_symbols first
+    #archive_expsym_cmds="$archive_cmds"' && strip -s $export_symbols'
+    hardcode_direct=yes
+    hardcode_shlibpath_var=no
+    whole_archive_flag_spec='-all_load $convenience'
+    ;;
+
+  freebsd1*)
+    ld_shlibs=no
+    ;;
+
+  # FreeBSD 2.2.[012] allows us to include c++rt0.o to get C++ constructor
+  # support.  Future versions do this automatically, but an explicit c++rt0.o
+  # does not break anything, and helps significantly (at the cost of a little
+  # extra space).
+  freebsd2.2*)
+    archive_cmds='$LD -Bshareable -o $lib $libobjs $deplibs $linker_flags /usr/lib/c++rt0.o'
+    hardcode_libdir_flag_spec='-R$libdir'
+    hardcode_direct=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  # Unfortunately, older versions of FreeBSD 2 do not have this feature.
+  freebsd2*)
+    archive_cmds='$LD -Bshareable -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_direct=yes
+    hardcode_minus_L=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
+  freebsd*)
+    archive_cmds='$CC -shared -o $lib $libobjs $deplibs $compiler_flags'
+    hardcode_libdir_flag_spec='-R$libdir'
+    hardcode_direct=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  hpux9* | hpux10* | hpux11*)
+    case $host_os in
+    hpux9*) archive_cmds='$rm $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib' ;;
+    *) archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags' ;;
+    esac
+    hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
+    hardcode_libdir_separator=:
+    hardcode_direct=yes
+    hardcode_minus_L=yes # Not in the search PATH, but as the default
+			 # location of the library.
+    export_dynamic_flag_spec='${wl}-E'
+    ;;
+
+  irix5* | irix6*)
+    if test "$GCC" = yes; then
+      archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && echo ${wl}-set_version ${wl}$verstring` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+    else
+      archive_cmds='$LD -shared $libobjs $deplibs $linker_flags -soname $soname `test -n "$verstring" && echo -set_version $verstring` -update_registry ${output_objdir}/so_locations -o $lib'
+    fi
+    hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+    hardcode_libdir_separator=:
+    link_all_deplibs=yes
+    ;;
+
+  netbsd*)
+    if echo __ELF__ | $CC -E - | grep __ELF__ >/dev/null; then
+      archive_cmds='$LD -Bshareable -o $lib $libobjs $deplibs $linker_flags'  # a.out
+    else
+      archive_cmds='$LD -shared -o $lib $libobjs $deplibs $linker_flags'      # ELF
+    fi
+    hardcode_libdir_flag_spec='-R$libdir'
+    hardcode_direct=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  newsos6)
+    archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linkopts'
+    hardcode_direct=yes
+    hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+    hardcode_libdir_separator=:
+    hardcode_shlibpath_var=no
+    ;;
+
+  openbsd*)
+    archive_cmds='$LD -Bshareable -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_libdir_flag_spec='-R$libdir'
+    hardcode_direct=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  os2*)
+    hardcode_libdir_flag_spec='-L$libdir'
+    hardcode_minus_L=yes
+    allow_undefined_flag=unsupported
+    archive_cmds='$echo "LIBRARY $libname INITINSTANCE" > $output_objdir/$libname.def~$echo "DESCRIPTION \"$libname\"" >> $output_objdir/$libname.def~$echo DATA >> $output_objdir/$libname.def~$echo " SINGLE NONSHARED" >> $output_objdir/$libname.def~$echo EXPORTS >> $output_objdir/$libname.def~emxexp $libobjs >> $output_objdir/$libname.def~$CC -Zdll -Zcrtdll -o $lib $libobjs $deplibs $compiler_flags $output_objdir/$libname.def'
+    old_archive_from_new_cmds='emximp -o $output_objdir/$libname.a $output_objdir/$libname.def'
+    ;;
+
+  osf3*)
+    if test "$GCC" = yes; then
+      allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
+      archive_cmds='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && echo ${wl}-set_version ${wl}$verstring` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+    else
+      allow_undefined_flag=' -expect_unresolved \*'
+      archive_cmds='$LD -shared${allow_undefined_flag} $libobjs $deplibs $linker_flags -soname $soname `test -n "$verstring" && echo -set_version $verstring` -update_registry ${output_objdir}/so_locations -o $lib'
+    fi
+    hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+    hardcode_libdir_separator=:
+    ;;
+
+  osf4* | osf5*)	# as osf3* with the addition of -msym flag
+    if test "$GCC" = yes; then
+      allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
+      archive_cmds='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && echo ${wl}-set_version ${wl}$verstring` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+      hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+    else
+      allow_undefined_flag=' -expect_unresolved \*'
+      archive_cmds='$LD -shared${allow_undefined_flag} $libobjs $deplibs $linker_flags -msym -soname $soname `test -n "$verstring" && echo -set_version $verstring` -update_registry ${output_objdir}/so_locations -o $lib'
+      archive_expsym_cmds='for i in `cat $export_symbols`; do printf "-exported_symbol " >> $lib.exp; echo "\$i" >> $lib.exp; done; echo "-hidden">> $lib.exp~
+      $LD -shared${allow_undefined_flag} -input $lib.exp $linker_flags $libobjs $deplibs -soname $soname `test -n "$verstring" && echo -set_version $verstring` -update_registry ${objdir}/so_locations -o $lib~$rm $lib.exp'
+
+      #Both c and cxx compiler support -rpath directly
+      hardcode_libdir_flag_spec='-rpath $libdir'
+    fi
+    hardcode_libdir_separator=:
+    ;;
+
+  sco3.2v5*)
+    archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_shlibpath_var=no
+    runpath_var=LD_RUN_PATH
+    hardcode_runpath_var=yes
+    ;;
+
+  solaris*)
+    no_undefined_flag=' -z defs'
+    # $CC -shared without GNU ld will not create a library from C++
+    # object files and a static libstdc++, better avoid it by now
+    archive_cmds='$LD -G${allow_undefined_flag} -h $soname -o $lib $libobjs $deplibs $linker_flags'
+    archive_expsym_cmds='$echo "{ global:" > $lib.exp~cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $lib.exp~$echo "local: *; };" >> $lib.exp~
+		$LD -G${allow_undefined_flag} -M $lib.exp -h $soname -o $lib $libobjs $deplibs $linker_flags~$rm $lib.exp'
+    hardcode_libdir_flag_spec='-R$libdir'
+    hardcode_shlibpath_var=no
+    case $host_os in
+    [solaris2.[0-5] | solaris2.[0-5].*]) ;;
+    *) # Supported since Solaris 2.6 (maybe 2.5.1?)
+      whole_archive_flag_spec='-z allextract$convenience -z defaultextract' ;;
+    esac
+    link_all_deplibs=yes
+    ;;
+
+  sunos4*)
+    if test "x$host_vendor" = xsequent; then
+      # Use $CC to link under sequent, because it throws in some extra .o
+      # files that make .init and .fini sections work.
+      archive_cmds='$CC -G ${wl}-h $soname -o $lib $libobjs $deplibs $compiler_flags'
+    else
+      archive_cmds='$LD -assert pure-text -Bstatic -o $lib $libobjs $deplibs $linker_flags'
+    fi
+    hardcode_libdir_flag_spec='-L$libdir'
+    hardcode_direct=yes
+    hardcode_minus_L=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  sysv4)
+    if test "x$host_vendor" = xsno; then
+      archive_cmds='$LD -G -Bsymbolic -h $soname -o $lib $libobjs $deplibs $linkopts'
+      hardcode_direct=yes # is this really true???
+    else
+      archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
+      hardcode_direct=no #Motorola manual says yes, but my tests say they lie
+    fi
+    runpath_var='LD_RUN_PATH'
+    hardcode_shlibpath_var=no
+    ;;
+
+  sysv4.3*)
+    archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_shlibpath_var=no
+    export_dynamic_flag_spec='-Bexport'
+    ;;
+
+  sysv5*)
+    no_undefined_flag=' -z text'
+    # $CC -shared without GNU ld will not create a library from C++
+    # object files and a static libstdc++, better avoid it by now
+    archive_cmds='$LD -G${allow_undefined_flag} -h $soname -o $lib $libobjs $deplibs $linker_flags'
+    archive_expsym_cmds='$echo "{ global:" > $lib.exp~cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $lib.exp~$echo "local: *; };" >> $lib.exp~
+		$LD -G${allow_undefined_flag} -M $lib.exp -h $soname -o $lib $libobjs $deplibs $linker_flags~$rm $lib.exp'
+    hardcode_libdir_flag_spec=
+    hardcode_shlibpath_var=no
+    runpath_var='LD_RUN_PATH'
+    ;;
+
+  uts4*)
+    archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_libdir_flag_spec='-L$libdir'
+    hardcode_shlibpath_var=no
+    ;;
+
+  dgux*)
+    archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_libdir_flag_spec='-L$libdir'
+    hardcode_shlibpath_var=no
+    ;;
+
+  sysv4*MP*)
+    if test -d /usr/nec; then
+      archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
+      hardcode_shlibpath_var=no
+      runpath_var=LD_RUN_PATH
+      hardcode_runpath_var=yes
+      ld_shlibs=yes
+    fi
+    ;;
+
+  sysv4.2uw2*)
+    archive_cmds='$LD -G -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_direct=yes
+    hardcode_minus_L=no
+    hardcode_shlibpath_var=no
+    hardcode_runpath_var=yes
+    runpath_var=LD_RUN_PATH
+    ;;
+
+  sysv5uw7* | unixware7*)
+    no_undefined_flag='${wl}-z ${wl}text'
+    if test "$GCC" = yes; then
+      archive_cmds='$CC -shared ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+    else
+      archive_cmds='$CC -G ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+    fi
+    runpath_var='LD_RUN_PATH'
+    hardcode_shlibpath_var=no
+    ;;
+
+  *)
+    ld_shlibs=no
+    ;;
+  esac
+fi
+AC_MSG_RESULT([$ld_shlibs])
+test "$ld_shlibs" = no && can_build_shared=no
+
+# Check hardcoding attributes.
+AC_MSG_CHECKING([how to hardcode library paths into programs])
+hardcode_action=
+if test -n "$hardcode_libdir_flag_spec" || \
+   test -n "$runpath_var"; then
+
+  # We can hardcode non-existant directories.
+  if test "$hardcode_direct" != no &&
+     # If the only mechanism to avoid hardcoding is shlibpath_var, we
+     # have to relink, otherwise we might link with an installed library
+     # when we should be linking with a yet-to-be-installed one
+     ## test "$hardcode_shlibpath_var" != no &&
+     test "$hardcode_minus_L" != no; then
+    # Linking always hardcodes the temporary library directory.
+    hardcode_action=relink
+  else
+    # We can link without hardcoding, and we can hardcode nonexisting dirs.
+    hardcode_action=immediate
+  fi
+else
+  # We cannot hardcode anything, or else we can only hardcode existing
+  # directories.
+  hardcode_action=unsupported
+fi
+AC_MSG_RESULT([$hardcode_action])
+
+striplib=
+old_striplib=
+AC_MSG_CHECKING([whether stripping libraries is possible])
+if test -n "$STRIP" && $STRIP -V 2>&1 | grep "GNU strip" >/dev/null; then
+  test -z "$old_striplib" && old_striplib="$STRIP --strip-debug"
+  test -z "$striplib" && striplib="$STRIP --strip-unneeded"
+  AC_MSG_RESULT([yes])
+else
+  AC_MSG_RESULT([no])
+fi
+
+reload_cmds='$LD$reload_flag -o $output$reload_objs'
+test -z "$deplibs_check_method" && deplibs_check_method=unknown
+
+# PORTME Fill in your ld.so characteristics
+AC_MSG_CHECKING([dynamic linker characteristics])
+library_names_spec=
+libname_spec='lib$name'
+soname_spec=
+postinstall_cmds=
+postuninstall_cmds=
+finish_cmds=
+finish_eval=
+shlibpath_var=
+shlibpath_overrides_runpath=unknown
+version_type=none
+dynamic_linker="$host_os ld.so"
+sys_lib_dlsearch_path_spec="/lib /usr/lib"
+sys_lib_search_path_spec="/lib /usr/lib /usr/local/lib"
+
+case $host_os in
+aix3*)
+  version_type=linux
+  library_names_spec='${libname}${release}.so$versuffix $libname.a'
+  shlibpath_var=LIBPATH
+
+  # AIX has no versioning support, so we append a major version to the name.
+  soname_spec='${libname}${release}.so$major'
+  ;;
+
+aix4* | aix5*)
+  version_type=linux
+  if test "$host_cpu" = ia64; then
+    # AIX 5 supports IA64
+    library_names_spec='${libname}${release}.so$major ${libname}${release}.so$versuffix $libname.so'
+    shlibpath_var=LD_LIBRARY_PATH
+  else
+    # With GCC up to 2.95.x, collect2 would create an import file
+    # for dependence libraries.  The import file would start with
+    # the line `#! .'.  This would cause the generated library to
+    # depend on `.', always an invalid library.  This was fixed in
+    # development snapshots of GCC prior to 3.0.
+    case $host_os in
+      [ aix4 | aix4.[01] | aix4.[01].*)]
+      if { echo '#if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ >= 97)'
+           echo ' yes '
+           echo '#endif'; } | ${CC} -E - | grep yes > /dev/null; then
+        :
+      else
+        can_build_shared=no
+      fi
+      ;;
+    esac
+    # AIX (on Power*) has no versioning support, so currently we can not hardcode correct
+    # soname into executable. Probably we can add versioning support to
+    # collect2, so additional links can be useful in future.
+    if test "$aix_use_runtimelinking" = yes; then
+      # If using run time linking (on AIX 4.2 or later) use lib<name>.so instead of
+      # lib<name>.a to let people know that these are not typical AIX shared libraries.
+      library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+    else
+      # We preserve .a as extension for shared libraries through AIX4.2
+      # and later when we are not doing run time linking.
+      library_names_spec='${libname}${release}.a $libname.a'
+      soname_spec='${libname}${release}.so$major'
+    fi
+    shlibpath_var=LIBPATH
+    deplibs_check_method=pass_all
+  fi
+  ;;
+
+amigaos*)
+  library_names_spec='$libname.ixlibrary $libname.a'
+  # Create ${libname}_ixlibrary.a entries in /sys/libs.
+  finish_eval='for lib in `ls $libdir/*.ixlibrary 2>/dev/null`; do libname=`$echo "X$lib" | [$Xsed -e '\''s%^.*/\([^/]*\)\.ixlibrary$%\1%'\'']`; test $rm /sys/libs/${libname}_ixlibrary.a; $show "(cd /sys/libs && $LN_S $lib ${libname}_ixlibrary.a)"; (cd /sys/libs && $LN_S $lib ${libname}_ixlibrary.a) || exit 1; done'
+  ;;
+
+beos*)
+  library_names_spec='${libname}.so'
+  dynamic_linker="$host_os ld.so"
+  shlibpath_var=LIBRARY_PATH
+  ;;
+
+bsdi4*)
+  version_type=linux
+  need_version=no
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  soname_spec='${libname}${release}.so$major'
+  finish_cmds='PATH="\$PATH:/sbin" ldconfig $libdir'
+  shlibpath_var=LD_LIBRARY_PATH
+  sys_lib_search_path_spec="/shlib /usr/lib /usr/X11/lib /usr/contrib/lib /lib /usr/local/lib"
+  sys_lib_dlsearch_path_spec="/shlib /usr/lib /usr/local/lib"
+  export_dynamic_flag_spec=-rdynamic
+  # the default ld.so.conf also contains /usr/contrib/lib and
+  # /usr/X11R6/lib (/usr/X11 is a link to /usr/X11R6), but let us allow
+  # libtool to hard-code these into programs
+  ;;
+
+cygwin* | mingw* | pw32*)
+  version_type=windows
+  need_version=no
+  need_lib_prefix=no
+  case $GCC,$host_os in
+  yes,cygwin*)
+    library_names_spec='$libname.dll.a'
+    soname_spec='`echo ${libname} | sed -e 's/^lib/cyg/'``echo ${release} | [sed -e 's/[.]/-/g']`${versuffix}.dll'
+    postinstall_cmds='dlpath=`bash 2>&1 -c '\''. $dir/${file}i;echo \$dlname'\''`~
+      dldir=$destdir/`dirname \$dlpath`~
+      test -d \$dldir || mkdir -p \$dldir~
+      $install_prog .libs/$dlname \$dldir/$dlname'
+    postuninstall_cmds='dldll=`bash 2>&1 -c '\''. $file; echo \$dlname'\''`~
+      dlpath=$dir/\$dldll~
+       $rm \$dlpath'
+    ;;
+  yes,mingw*)
+    library_names_spec='${libname}`echo ${release} | [sed -e 's/[.]/-/g']`${versuffix}.dll'
+    sys_lib_search_path_spec=`$CC -print-search-dirs | grep "^libraries:" | sed -e "s/^libraries://" -e "s/;/ /g"`
+    ;;
+  yes,pw32*)
+    library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | sed -e 's/[.]/-/g'`${versuffix}.dll'
+    ;;
+  *)
+    library_names_spec='${libname}`echo ${release} | [sed -e 's/[.]/-/g']`${versuffix}.dll $libname.lib'
+    ;;
+  esac
+  dynamic_linker='Win32 ld.exe'
+  # FIXME: first we should search . and the directory the executable is in
+  shlibpath_var=PATH
+  ;;
+
+darwin* | rhapsody*)
+  dynamic_linker="$host_os dyld"
+  version_type=darwin
+  need_lib_prefix=no
+  need_version=no
+  # FIXME: Relying on posixy $() will cause problems for
+  #        cross-compilation, but unfortunately the echo tests do not
+  #        yet detect zsh echo's removal of \ escapes.
+  library_names_spec='${libname}${release}${versuffix}.$(test .$module = .yes && echo so || echo dylib) ${libname}${release}${major}.$(test .$module = .yes && echo so || echo dylib) ${libname}.$(test .$module = .yes && echo so || echo dylib)'
+  soname_spec='${libname}${release}${major}.$(test .$module = .yes && echo so || echo dylib)'
+  shlibpath_overrides_runpath=yes
+  shlibpath_var=DYLD_LIBRARY_PATH
+  ;;
+
+freebsd1*)
+  dynamic_linker=no
+  ;;
+
+freebsd*)
+  objformat=`test -x /usr/bin/objformat && /usr/bin/objformat || echo aout`
+  version_type=freebsd-$objformat
+  case $version_type in
+    freebsd-elf*)
+      library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so $libname.so'
+      need_version=no
+      need_lib_prefix=no
+      ;;
+    freebsd-*)
+      library_names_spec='${libname}${release}.so$versuffix $libname.so$versuffix'
+      need_version=yes
+      ;;
+  esac
+  shlibpath_var=LD_LIBRARY_PATH
+  case $host_os in
+  freebsd2*)
+    shlibpath_overrides_runpath=yes
+    ;;
+  *)
+    shlibpath_overrides_runpath=no
+    hardcode_into_libs=yes
+    ;;
+  esac
+  ;;
+
+gnu*)
+  version_type=linux
+  need_lib_prefix=no
+  need_version=no
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so${major} ${libname}.so'
+  soname_spec='${libname}${release}.so$major'
+  shlibpath_var=LD_LIBRARY_PATH
+  hardcode_into_libs=yes
+  ;;
+
+hpux9* | hpux10* | hpux11*)
+  # Give a soname corresponding to the major version so that dld.sl refuses to
+  # link against other versions.
+  dynamic_linker="$host_os dld.sl"
+  version_type=sunos
+  need_lib_prefix=no
+  need_version=no
+  shlibpath_var=SHLIB_PATH
+  shlibpath_overrides_runpath=no # +s is required to enable SHLIB_PATH
+  library_names_spec='${libname}${release}.sl$versuffix ${libname}${release}.sl$major $libname.sl'
+  soname_spec='${libname}${release}.sl$major'
+  # HP-UX runs *really* slowly unless shared libraries are mode 555.
+  postinstall_cmds='chmod 555 $lib'
+  ;;
+
+irix5* | irix6*)
+  version_type=irix
+  need_lib_prefix=no
+  need_version=no
+  soname_spec='${libname}${release}.so$major'
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major ${libname}${release}.so $libname.so'
+  case $host_os in
+  irix5*)
+    libsuff= shlibsuff=
+    ;;
+  *)
+    case $LD in # libtool.m4 will add one of these switches to LD
+    *-32|*"-32 ") libsuff= shlibsuff= libmagic=32-bit;;
+    *-n32|*"-n32 ") libsuff=32 shlibsuff=N32 libmagic=N32;;
+    *-64|*"-64 ") libsuff=64 shlibsuff=64 libmagic=64-bit;;
+    *) libsuff= shlibsuff= libmagic=never-match;;
+    esac
+    ;;
+  esac
+  shlibpath_var=LD_LIBRARY${shlibsuff}_PATH
+  shlibpath_overrides_runpath=no
+  sys_lib_search_path_spec="/usr/lib${libsuff} /lib${libsuff} /usr/local/lib${libsuff}"
+  sys_lib_dlsearch_path_spec="/usr/lib${libsuff} /lib${libsuff}"
+  ;;
+
+# No shared lib support for Linux oldld, aout, or coff.
+linux-gnuoldld* | linux-gnuaout* | linux-gnucoff*)
+  dynamic_linker=no
+  ;;
+
+# This must be Linux ELF.
+linux-gnu*)
+  version_type=linux
+  need_lib_prefix=no
+  need_version=no
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  soname_spec='${libname}${release}.so$major'
+  finish_cmds='PATH="\$PATH:/sbin" ldconfig -n $libdir'
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=no
+  # This implies no fast_install, which is unacceptable.
+  # Some rework will be needed to allow for fast_install
+  # before this can be enabled.
+  hardcode_into_libs=yes
+
+  # We used to test for /lib/ld.so.1 and disable shared libraries on
+  # powerpc, because MkLinux only supported shared libraries with the
+  # GNU dynamic linker.  Since this was broken with cross compilers,
+  # most powerpc-linux boxes support dynamic linking these days and
+  # people can always --disable-shared, the test was removed, and we
+  # assume the GNU/Linux dynamic linker is in use.
+  dynamic_linker='GNU/Linux ld.so'
+  ;;
+
+netbsd*)
+  version_type=sunos
+  need_lib_prefix=no
+  need_version=no
+  if echo __ELF__ | $CC -E - | grep __ELF__ >/dev/null; then
+    library_names_spec='${libname}${release}.so$versuffix ${libname}.so$versuffix'
+    finish_cmds='PATH="\$PATH:/sbin" ldconfig -m $libdir'
+    dynamic_linker='NetBSD (a.out) ld.so'
+  else
+    library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major ${libname}${release}.so ${libname}.so'
+    soname_spec='${libname}${release}.so$major'
+    dynamic_linker='NetBSD ld.elf_so'
+  fi
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=yes
+  hardcode_into_libs=yes
+  ;;
+
+newsos6)
+  version_type=linux
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=yes
+  ;;
+
+openbsd*)
+  version_type=sunos
+  if test "$with_gnu_ld" = yes; then
+    need_lib_prefix=no
+    need_version=no
+  fi
+  library_names_spec='${libname}${release}.so$versuffix ${libname}.so$versuffix'
+  finish_cmds='PATH="\$PATH:/sbin" ldconfig -m $libdir'
+  shlibpath_var=LD_LIBRARY_PATH
+  ;;
+
+os2*)
+  libname_spec='$name'
+  need_lib_prefix=no
+  library_names_spec='$libname.dll $libname.a'
+  dynamic_linker='OS/2 ld.exe'
+  shlibpath_var=LIBPATH
+  ;;
+
+osf3* | osf4* | osf5*)
+  version_type=osf
+  need_version=no
+  soname_spec='${libname}${release}.so'
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so $libname.so'
+  shlibpath_var=LD_LIBRARY_PATH
+  sys_lib_search_path_spec="/usr/shlib /usr/ccs/lib /usr/lib/cmplrs/cc /usr/lib /usr/local/lib /var/shlib"
+  sys_lib_dlsearch_path_spec="$sys_lib_search_path_spec"
+  ;;
+
+sco3.2v5*)
+  version_type=osf
+  soname_spec='${libname}${release}.so$major'
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  shlibpath_var=LD_LIBRARY_PATH
+  ;;
+
+solaris*)
+  version_type=linux
+  need_lib_prefix=no
+  need_version=no
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  soname_spec='${libname}${release}.so$major'
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=yes
+  hardcode_into_libs=yes
+  # ldd complains unless libraries are executable
+  postinstall_cmds='chmod +x $lib'
+  ;;
+
+sunos4*)
+  version_type=sunos
+  library_names_spec='${libname}${release}.so$versuffix ${libname}.so$versuffix'
+  finish_cmds='PATH="\$PATH:/usr/etc" ldconfig $libdir'
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=yes
+  if test "$with_gnu_ld" = yes; then
+    need_lib_prefix=no
+  fi
+  need_version=yes
+  ;;
+
+sysv4 | sysv4.2uw2* | sysv4.3* | sysv5*)
+  version_type=linux
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  soname_spec='${libname}${release}.so$major'
+  shlibpath_var=LD_LIBRARY_PATH
+  case $host_vendor in
+    sni)
+      shlibpath_overrides_runpath=no
+      ;;
+    motorola)
+      need_lib_prefix=no
+      need_version=no
+      shlibpath_overrides_runpath=no
+      sys_lib_search_path_spec='/lib /usr/lib /usr/ccs/lib'
+      ;;
+  esac
+  ;;
+
+uts4*)
+  version_type=linux
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  soname_spec='${libname}${release}.so$major'
+  shlibpath_var=LD_LIBRARY_PATH
+  ;;
+
+dgux*)
+  version_type=linux
+  need_lib_prefix=no
+  need_version=no
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  soname_spec='${libname}${release}.so$major'
+  shlibpath_var=LD_LIBRARY_PATH
+  ;;
+
+sysv4*MP*)
+  if test -d /usr/nec ;then
+    version_type=linux
+    library_names_spec='$libname.so.$versuffix $libname.so.$major $libname.so'
+    soname_spec='$libname.so.$major'
+    shlibpath_var=LD_LIBRARY_PATH
+  fi
+  ;;
+
+*)
+  dynamic_linker=no
+  ;;
+esac
+AC_MSG_RESULT([$dynamic_linker])
+test "$dynamic_linker" = no && can_build_shared=no
+
+# Report the final consequences.
+AC_MSG_CHECKING([if libtool supports shared libraries])
+AC_MSG_RESULT([$can_build_shared])
+
+if test "$hardcode_action" = relink; then
+  # Fast installation is not supported
+  enable_fast_install=no
+elif test "$shlibpath_overrides_runpath" = yes ||
+     test "$enable_shared" = no; then
+  # Fast installation is not necessary
+  enable_fast_install=needless
+fi
+
+variables_saved_for_relink="PATH $shlibpath_var $runpath_var"
+if test "$GCC" = yes; then
+  variables_saved_for_relink="$variables_saved_for_relink GCC_EXEC_PREFIX COMPILER_PATH LIBRARY_PATH"
+fi
+
+AC_LIBTOOL_DLOPEN_SELF
+
+if test "$enable_shared" = yes && test "$GCC" = yes; then
+  case $archive_cmds in
+  *'~'*)
+    # FIXME: we may have to deal with multi-command sequences.
+    ;;
+  '$CC '*)
+    # Test whether the compiler implicitly links with -lc since on some
+    # systems, -lgcc has to come before -lc. If gcc already passes -lc
+    # to ld, don't add -lc before -lgcc.
+    AC_MSG_CHECKING([whether -lc should be explicitly linked in])
+    AC_CACHE_VAL([lt_cv_archive_cmds_need_lc],
+    [$rm conftest*
+    echo 'static int dummy;' > conftest.$ac_ext
+
+    if AC_TRY_EVAL(ac_compile); then
+      soname=conftest
+      lib=conftest
+      libobjs=conftest.$ac_objext
+      deplibs=
+      wl=$lt_cv_prog_cc_wl
+      compiler_flags=-v
+      linker_flags=-v
+      verstring=
+      output_objdir=.
+      libname=conftest
+      save_allow_undefined_flag=$allow_undefined_flag
+      allow_undefined_flag=
+      if AC_TRY_EVAL(archive_cmds 2\>\&1 \| grep \" -lc \" \>/dev/null 2\>\&1)
+      then
+	lt_cv_archive_cmds_need_lc=no
+      else
+	lt_cv_archive_cmds_need_lc=yes
+      fi
+      allow_undefined_flag=$save_allow_undefined_flag
+    else
+      cat conftest.err 1>&5
+    fi])
+    AC_MSG_RESULT([$lt_cv_archive_cmds_need_lc])
+    ;;
+  esac
+fi
+need_lc=${lt_cv_archive_cmds_need_lc-yes}
+
+# The second clause should only fire when bootstrapping the
+# libtool distribution, otherwise you forgot to ship ltmain.sh
+# with your package, and you will get complaints that there are
+# no rules to generate ltmain.sh.
+if test -f "$ltmain"; then
+  :
+else
+  # If there is no Makefile yet, we rely on a make rule to execute
+  # `config.status --recheck' to rerun these tests and create the
+  # libtool script then.
+  test -f Makefile && make "$ltmain"
+fi
+
+if test -f "$ltmain"; then
+  trap "$rm \"${ofile}T\"; exit 1" 1 2 15
+  $rm -f "${ofile}T"
+
+  echo creating $ofile
+
+  # Now quote all the things that may contain metacharacters while being
+  # careful not to overquote the AC_SUBSTed values.  We take copies of the
+  # variables and quote the copies for generation of the libtool script.
+  for var in echo old_CC old_CFLAGS \
+    AR AR_FLAGS CC LD LN_S NM SHELL \
+    reload_flag reload_cmds wl \
+    pic_flag link_static_flag no_builtin_flag export_dynamic_flag_spec \
+    thread_safe_flag_spec whole_archive_flag_spec libname_spec \
+    library_names_spec soname_spec \
+    RANLIB old_archive_cmds old_archive_from_new_cmds old_postinstall_cmds \
+    old_postuninstall_cmds archive_cmds archive_expsym_cmds postinstall_cmds \
+    postuninstall_cmds extract_expsyms_cmds old_archive_from_expsyms_cmds \
+    old_striplib striplib file_magic_cmd export_symbols_cmds \
+    deplibs_check_method allow_undefined_flag no_undefined_flag \
+    finish_cmds finish_eval global_symbol_pipe global_symbol_to_cdecl \
+    hardcode_libdir_flag_spec hardcode_libdir_separator  \
+    sys_lib_search_path_spec sys_lib_dlsearch_path_spec \
+    compiler_c_o compiler_o_lo need_locks exclude_expsyms include_expsyms; do
+
+    case $var in
+    reload_cmds | old_archive_cmds | old_archive_from_new_cmds | \
+    old_postinstall_cmds | old_postuninstall_cmds | \
+    export_symbols_cmds | archive_cmds | archive_expsym_cmds | \
+    extract_expsyms_cmds | old_archive_from_expsyms_cmds | \
+    postinstall_cmds | postuninstall_cmds | \
+    finish_cmds | sys_lib_search_path_spec | sys_lib_dlsearch_path_spec)
+      # Double-quote double-evaled strings.
+      eval "lt_$var=\\\"\`\$echo \"X\$$var\" | \$Xsed -e \"\$double_quote_subst\" -e \"\$sed_quote_subst\" -e \"\$delay_variable_subst\"\`\\\""
+      ;;
+    *)
+      eval "lt_$var=\\\"\`\$echo \"X\$$var\" | \$Xsed -e \"\$sed_quote_subst\"\`\\\""
+      ;;
+    esac
+  done
+
+  cat <<__EOF__ > "${ofile}T"
+#! $SHELL
+
+# `$echo "$ofile" | sed 's%^.*/%%'` - Provide generalized library-building support services.
+# Generated automatically by $PROGRAM (GNU $PACKAGE $VERSION$TIMESTAMP)
+# NOTE: Changes made to this file will be lost: look at ltmain.sh.
+#
+# Copyright (C) 1996-2000 Free Software Foundation, Inc.
+# Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+# As a special exception to the GNU General Public License, if you
+# distribute this file as part of a program that contains a
+# configuration script generated by Autoconf, you may include it under
+# the same distribution terms that you use for the rest of that program.
+
+# Sed that helps us avoid accidentally triggering echo(1) options like -n.
+Xsed="sed -e s/^X//"
+
+# The HP-UX ksh and POSIX shell print the target directory to stdout
+# if CDPATH is set.
+if test "X\${CDPATH+set}" = Xset; then CDPATH=:; export CDPATH; fi
+
+# ### BEGIN LIBTOOL CONFIG
+
+# Libtool was configured on host `(hostname || uname -n) 2>/dev/null | sed 1q`:
+
+# Shell to use when invoking shell scripts.
+SHELL=$lt_SHELL
+
+# Whether or not to build shared libraries.
+build_libtool_libs=$enable_shared
+
+# Whether or not to add -lc for building shared libraries.
+build_libtool_need_lc=$need_lc
+
+# Whether or not to build static libraries.
+build_old_libs=$enable_static
+
+# Whether or not to optimize for fast installation.
+fast_install=$enable_fast_install
+
+# The host system.
+host_alias=$host_alias
+host=$host
+
+# An echo program that does not interpret backslashes.
+echo=$lt_echo
+
+# The archiver.
+AR=$lt_AR
+AR_FLAGS=$lt_AR_FLAGS
+
+# The default C compiler.
+CC=$lt_CC
+
+# Is the compiler the GNU C compiler?
+with_gcc=$GCC
+
+# The linker used to build libraries.
+LD=$lt_LD
+
+# Whether we need hard or soft links.
+LN_S=$lt_LN_S
+
+# A BSD-compatible nm program.
+NM=$lt_NM
+
+# A symbol stripping program
+STRIP=$STRIP
+
+# Used to examine libraries when file_magic_cmd begins "file"
+MAGIC_CMD=$MAGIC_CMD
+
+# Used on cygwin: DLL creation program.
+DLLTOOL="$DLLTOOL"
+
+# Used on cygwin: object dumper.
+OBJDUMP="$OBJDUMP"
+
+# Used on cygwin: assembler.
+AS="$AS"
+
+# The name of the directory that contains temporary libtool files.
+objdir=$objdir
+
+# How to create reloadable object files.
+reload_flag=$lt_reload_flag
+reload_cmds=$lt_reload_cmds
+
+# How to pass a linker flag through the compiler.
+wl=$lt_wl
+
+# Object file suffix (normally "o").
+objext="$ac_objext"
+
+# Old archive suffix (normally "a").
+libext="$libext"
+
+# Executable file suffix (normally "").
+exeext="$exeext"
+
+# Additional compiler flags for building library objects.
+pic_flag=$lt_pic_flag
+pic_mode=$pic_mode
+
+# Does compiler simultaneously support -c and -o options?
+compiler_c_o=$lt_compiler_c_o
+
+# Can we write directly to a .lo ?
+compiler_o_lo=$lt_compiler_o_lo
+
+# Must we lock files when doing compilation ?
+need_locks=$lt_need_locks
+
+# Do we need the lib prefix for modules?
+need_lib_prefix=$need_lib_prefix
+
+# Do we need a version for libraries?
+need_version=$need_version
+
+# Whether dlopen is supported.
+dlopen_support=$enable_dlopen
+
+# Whether dlopen of programs is supported.
+dlopen_self=$enable_dlopen_self
+
+# Whether dlopen of statically linked programs is supported.
+dlopen_self_static=$enable_dlopen_self_static
+
+# Compiler flag to prevent dynamic linking.
+link_static_flag=$lt_link_static_flag
+
+# Compiler flag to turn off builtin functions.
+no_builtin_flag=$lt_no_builtin_flag
+
+# Compiler flag to allow reflexive dlopens.
+export_dynamic_flag_spec=$lt_export_dynamic_flag_spec
+
+# Compiler flag to generate shared objects directly from archives.
+whole_archive_flag_spec=$lt_whole_archive_flag_spec
+
+# Compiler flag to generate thread-safe objects.
+thread_safe_flag_spec=$lt_thread_safe_flag_spec
+
+# Library versioning type.
+version_type=$version_type
+
+# Format of library name prefix.
+libname_spec=$lt_libname_spec
+
+# List of archive names.  First name is the real one, the rest are links.
+# The last name is the one that the linker finds with -lNAME.
+library_names_spec=$lt_library_names_spec
+
+# The coded name of the library, if different from the real name.
+soname_spec=$lt_soname_spec
+
+# Commands used to build and install an old-style archive.
+RANLIB=$lt_RANLIB
+old_archive_cmds=$lt_old_archive_cmds
+old_postinstall_cmds=$lt_old_postinstall_cmds
+old_postuninstall_cmds=$lt_old_postuninstall_cmds
+
+# Create an old-style archive from a shared archive.
+old_archive_from_new_cmds=$lt_old_archive_from_new_cmds
+
+# Create a temporary old-style archive to link instead of a shared archive.
+old_archive_from_expsyms_cmds=$lt_old_archive_from_expsyms_cmds
+
+# Commands used to build and install a shared archive.
+archive_cmds=$lt_archive_cmds
+archive_expsym_cmds=$lt_archive_expsym_cmds
+postinstall_cmds=$lt_postinstall_cmds
+postuninstall_cmds=$lt_postuninstall_cmds
+
+# Commands to strip libraries.
+old_striplib=$lt_old_striplib
+striplib=$lt_striplib
+
+# Method to check whether dependent libraries are shared objects.
+deplibs_check_method=$lt_deplibs_check_method
+
+# Command to use when deplibs_check_method == file_magic.
+file_magic_cmd=$lt_file_magic_cmd
+
+# Flag that allows shared libraries with undefined symbols to be built.
+allow_undefined_flag=$lt_allow_undefined_flag
+
+# Flag that forces no undefined symbols.
+no_undefined_flag=$lt_no_undefined_flag
+
+# Commands used to finish a libtool library installation in a directory.
+finish_cmds=$lt_finish_cmds
+
+# Same as above, but a single script fragment to be evaled but not shown.
+finish_eval=$lt_finish_eval
+
+# Take the output of nm and produce a listing of raw symbols and C names.
+global_symbol_pipe=$lt_global_symbol_pipe
+
+# Transform the output of nm in a proper C declaration
+global_symbol_to_cdecl=$lt_global_symbol_to_cdecl
+
+# This is the shared library runtime path variable.
+runpath_var=$runpath_var
+
+# This is the shared library path variable.
+shlibpath_var=$shlibpath_var
+
+# Is shlibpath searched before the hard-coded library search path?
+shlibpath_overrides_runpath=$shlibpath_overrides_runpath
+
+# How to hardcode a shared library path into an executable.
+hardcode_action=$hardcode_action
+
+# Whether we should hardcode library paths into libraries.
+hardcode_into_libs=$hardcode_into_libs
+
+# Flag to hardcode \$libdir into a binary during linking.
+# This must work even if \$libdir does not exist.
+hardcode_libdir_flag_spec=$lt_hardcode_libdir_flag_spec
+
+# Whether we need a single -rpath flag with a separated argument.
+hardcode_libdir_separator=$lt_hardcode_libdir_separator
+
+# Set to yes if using DIR/libNAME.so during linking hardcodes DIR into the
+# resulting binary.
+hardcode_direct=$hardcode_direct
+
+# Set to yes if using the -LDIR flag during linking hardcodes DIR into the
+# resulting binary.
+hardcode_minus_L=$hardcode_minus_L
+
+# Set to yes if using SHLIBPATH_VAR=DIR during linking hardcodes DIR into
+# the resulting binary.
+hardcode_shlibpath_var=$hardcode_shlibpath_var
+
+# Variables whose values should be saved in libtool wrapper scripts and
+# restored at relink time.
+variables_saved_for_relink="$variables_saved_for_relink"
+
+# Whether libtool must link a program against all its dependency libraries.
+link_all_deplibs=$link_all_deplibs
+
+# Compile-time system search path for libraries
+sys_lib_search_path_spec=$lt_sys_lib_search_path_spec
+
+# Run-time system search path for libraries
+sys_lib_dlsearch_path_spec=$lt_sys_lib_dlsearch_path_spec
+
+# Fix the shell variable \$srcfile for the compiler.
+fix_srcfile_path="$fix_srcfile_path"
+
+# Set to yes if exported symbols are required.
+always_export_symbols=$always_export_symbols
+
+# The commands to list exported symbols.
+export_symbols_cmds=$lt_export_symbols_cmds
+
+# The commands to extract the exported symbol list from a shared archive.
+extract_expsyms_cmds=$lt_extract_expsyms_cmds
+
+# Symbols that should not be listed in the preloaded symbols.
+exclude_expsyms=$lt_exclude_expsyms
+
+# Symbols that must always be exported.
+include_expsyms=$lt_include_expsyms
+
+# ### END LIBTOOL CONFIG
+
+__EOF__
+
+  case $host_os in
+  aix3*)
+    cat <<\EOF >> "${ofile}T"
+
+# AIX sometimes has problems with the GCC collect2 program.  For some
+# reason, if we set the COLLECT_NAMES environment variable, the problems
+# vanish in a puff of smoke.
+if test "X${COLLECT_NAMES+set}" != Xset; then
+  COLLECT_NAMES=
+  export COLLECT_NAMES
+fi
+EOF
+    ;;
+  esac
+
+  case $host_os in
+  cygwin* | mingw* | pw32* | os2*)
+    cat <<'EOF' >> "${ofile}T"
+      # This is a source program that is used to create dlls on Windows
+      # Don't remove nor modify the starting and closing comments
+# /* ltdll.c starts here */
+# #define WIN32_LEAN_AND_MEAN
+# #include <windows.h>
+# #undef WIN32_LEAN_AND_MEAN
+# #include <stdio.h>
+#
+# #ifndef __CYGWIN__
+# #  ifdef __CYGWIN32__
+# #    define __CYGWIN__ __CYGWIN32__
+# #  endif
+# #endif
+#
+# #ifdef __cplusplus
+# extern "C" {
+# #endif
+# BOOL APIENTRY DllMain (HINSTANCE hInst, DWORD reason, LPVOID reserved);
+# #ifdef __cplusplus
+# }
+# #endif
+#
+# #ifdef __CYGWIN__
+# #include <cygwin/cygwin_dll.h>
+# DECLARE_CYGWIN_DLL( DllMain );
+# #endif
+# HINSTANCE __hDllInstance_base;
+#
+# BOOL APIENTRY
+# DllMain (HINSTANCE hInst, DWORD reason, LPVOID reserved)
+# {
+#   __hDllInstance_base = hInst;
+#   return TRUE;
+# }
+# /* ltdll.c ends here */
+        # This is a source program that is used to create import libraries
+        # on Windows for dlls which lack them. Don't remove nor modify the
+        # starting and closing comments
+# /* impgen.c starts here */
+# /*   Copyright (C) 1999-2000 Free Software Foundation, Inc.
+#
+#  This file is part of GNU libtool.
+#
+#  This program is free software; you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation; either version 2 of the License, or
+#  (at your option) any later version.
+#
+#  This program is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#  GNU General Public License for more details.
+#
+#  You should have received a copy of the GNU General Public License
+#  along with this program; if not, write to the Free Software
+#  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#  */
+#
+# #include <stdio.h>		/* for printf() */
+# #include <unistd.h>		/* for open(), lseek(), read() */
+# #include <fcntl.h>		/* for O_RDONLY, O_BINARY */
+# #include <string.h>		/* for strdup() */
+#
+# /* O_BINARY isn't required (or even defined sometimes) under Unix */
+# #ifndef O_BINARY
+# #define O_BINARY 0
+# #endif
+#
+# static unsigned int
+# pe_get16 (fd, offset)
+#      int fd;
+#      int offset;
+# {
+#   unsigned char b[2];
+#   lseek (fd, offset, SEEK_SET);
+#   read (fd, b, 2);
+#   return b[0] + (b[1]<<8);
+# }
+#
+# static unsigned int
+# pe_get32 (fd, offset)
+#     int fd;
+#     int offset;
+# {
+#   unsigned char b[4];
+#   lseek (fd, offset, SEEK_SET);
+#   read (fd, b, 4);
+#   return b[0] + (b[1]<<8) + (b[2]<<16) + (b[3]<<24);
+# }
+#
+# static unsigned int
+# pe_as32 (ptr)
+#      void *ptr;
+# {
+#   unsigned char *b = ptr;
+#   return b[0] + (b[1]<<8) + (b[2]<<16) + (b[3]<<24);
+# }
+#
+# int
+# main (argc, argv)
+#     int argc;
+#     char *argv[];
+# {
+#     int dll;
+#     unsigned long pe_header_offset, opthdr_ofs, num_entries, i;
+#     unsigned long export_rva, export_size, nsections, secptr, expptr;
+#     unsigned long name_rvas, nexp;
+#     unsigned char *expdata, *erva;
+#     char *filename, *dll_name;
+#
+#     filename = argv[1];
+#
+#     dll = open(filename, O_RDONLY|O_BINARY);
+#     if (dll < 1)
+# 	return 1;
+#
+#     dll_name = filename;
+#
+#     for (i=0; filename[i]; i++)
+# 	if (filename[i] == '/' || filename[i] == '\\'  || filename[i] == ':')
+# 	    dll_name = filename + i +1;
+#
+#     pe_header_offset = pe_get32 (dll, 0x3c);
+#     opthdr_ofs = pe_header_offset + 4 + 20;
+#     num_entries = pe_get32 (dll, opthdr_ofs + 92);
+#
+#     if (num_entries < 1) /* no exports */
+# 	return 1;
+#
+#     export_rva = pe_get32 (dll, opthdr_ofs + 96);
+#     export_size = pe_get32 (dll, opthdr_ofs + 100);
+#     nsections = pe_get16 (dll, pe_header_offset + 4 +2);
+#     secptr = (pe_header_offset + 4 + 20 +
+# 	      pe_get16 (dll, pe_header_offset + 4 + 16));
+#
+#     expptr = 0;
+#     for (i = 0; i < nsections; i++)
+#     {
+# 	char sname[8];
+# 	unsigned long secptr1 = secptr + 40 * i;
+# 	unsigned long vaddr = pe_get32 (dll, secptr1 + 12);
+# 	unsigned long vsize = pe_get32 (dll, secptr1 + 16);
+# 	unsigned long fptr = pe_get32 (dll, secptr1 + 20);
+# 	lseek(dll, secptr1, SEEK_SET);
+# 	read(dll, sname, 8);
+# 	if (vaddr <= export_rva && vaddr+vsize > export_rva)
+# 	{
+# 	    expptr = fptr + (export_rva - vaddr);
+# 	    if (export_rva + export_size > vaddr + vsize)
+# 		export_size = vsize - (export_rva - vaddr);
+# 	    break;
+# 	}
+#     }
+#
+#     expdata = (unsigned char*)malloc(export_size);
+#     lseek (dll, expptr, SEEK_SET);
+#     read (dll, expdata, export_size);
+#     erva = expdata - export_rva;
+#
+#     nexp = pe_as32 (expdata+24);
+#     name_rvas = pe_as32 (expdata+32);
+#
+#     printf ("EXPORTS\n");
+#     for (i = 0; i<nexp; i++)
+#     {
+# 	unsigned long name_rva = pe_as32 (erva+name_rvas+i*4);
+# 	printf ("\t%s @ %ld ;\n", erva+name_rva, 1+ i);
+#     }
+#
+#     return 0;
+# }
+# /* impgen.c ends here */
+
+EOF
+    ;;
+  esac
+
+  # We use sed instead of cat because bash on DJGPP gets confused if
+  # if finds mixed CR/LF and LF-only lines.  Since sed operates in
+  # text mode, it properly converts lines to CR/LF.  This bash problem
+  # is reportedly fixed, but why not run on old versions too?
+  sed '$q' "$ltmain" >> "${ofile}T" || (rm -f "${ofile}T"; exit 1)
+
+  mv -f "${ofile}T" "$ofile" || \
+    (rm -f "$ofile" && cp "${ofile}T" "$ofile" && rm -f "${ofile}T")
+  chmod +x "$ofile"
+fi
+
+])# _LT_AC_LTCONFIG_HACK
+
+# AC_LIBTOOL_DLOPEN - enable checks for dlopen support
+AC_DEFUN([AC_LIBTOOL_DLOPEN], [AC_BEFORE([$0],[AC_LIBTOOL_SETUP])])
+
+# AC_LIBTOOL_WIN32_DLL - declare package support for building win32 dll's
+AC_DEFUN([AC_LIBTOOL_WIN32_DLL], [AC_BEFORE([$0], [AC_LIBTOOL_SETUP])])
+
+# AC_ENABLE_SHARED - implement the --enable-shared flag
+# Usage: AC_ENABLE_SHARED[(DEFAULT)]
+#   Where DEFAULT is either `yes' or `no'.  If omitted, it defaults to
+#   `yes'.
+AC_DEFUN([AC_ENABLE_SHARED],
+[define([AC_ENABLE_SHARED_DEFAULT], ifelse($1, no, no, yes))dnl
+AC_ARG_ENABLE(shared,
+changequote(<<, >>)dnl
+<<  --enable-shared[=PKGS]  build shared libraries [default=>>AC_ENABLE_SHARED_DEFAULT],
+changequote([, ])dnl
+[p=${PACKAGE-default}
+case $enableval in
+yes) enable_shared=yes ;;
+no) enable_shared=no ;;
+*)
+  enable_shared=no
+  # Look at the argument we got.  We use all the common list separators.
+  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
+  for pkg in $enableval; do
+    if test "X$pkg" = "X$p"; then
+      enable_shared=yes
+    fi
+  done
+  IFS="$ac_save_ifs"
+  ;;
+esac],
+enable_shared=AC_ENABLE_SHARED_DEFAULT)dnl
+])
+
+# AC_DISABLE_SHARED - set the default shared flag to --disable-shared
+AC_DEFUN([AC_DISABLE_SHARED],
+[AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
+AC_ENABLE_SHARED(no)])
+
+# AC_ENABLE_STATIC - implement the --enable-static flag
+# Usage: AC_ENABLE_STATIC[(DEFAULT)]
+#   Where DEFAULT is either `yes' or `no'.  If omitted, it defaults to
+#   `yes'.
+AC_DEFUN([AC_ENABLE_STATIC],
+[define([AC_ENABLE_STATIC_DEFAULT], ifelse($1, no, no, yes))dnl
+AC_ARG_ENABLE(static,
+changequote(<<, >>)dnl
+<<  --enable-static[=PKGS]  build static libraries [default=>>AC_ENABLE_STATIC_DEFAULT],
+changequote([, ])dnl
+[p=${PACKAGE-default}
+case $enableval in
+yes) enable_static=yes ;;
+no) enable_static=no ;;
+*)
+  enable_static=no
+  # Look at the argument we got.  We use all the common list separators.
+  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
+  for pkg in $enableval; do
+    if test "X$pkg" = "X$p"; then
+      enable_static=yes
+    fi
+  done
+  IFS="$ac_save_ifs"
+  ;;
+esac],
+enable_static=AC_ENABLE_STATIC_DEFAULT)dnl
+])
+
+# AC_DISABLE_STATIC - set the default static flag to --disable-static
+AC_DEFUN([AC_DISABLE_STATIC],
+[AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
+AC_ENABLE_STATIC(no)])
+
+
+# AC_ENABLE_FAST_INSTALL - implement the --enable-fast-install flag
+# Usage: AC_ENABLE_FAST_INSTALL[(DEFAULT)]
+#   Where DEFAULT is either `yes' or `no'.  If omitted, it defaults to
+#   `yes'.
+AC_DEFUN([AC_ENABLE_FAST_INSTALL],
+[define([AC_ENABLE_FAST_INSTALL_DEFAULT], ifelse($1, no, no, yes))dnl
+AC_ARG_ENABLE(fast-install,
+changequote(<<, >>)dnl
+<<  --enable-fast-install[=PKGS]  optimize for fast installation [default=>>AC_ENABLE_FAST_INSTALL_DEFAULT],
+changequote([, ])dnl
+[p=${PACKAGE-default}
+case $enableval in
+yes) enable_fast_install=yes ;;
+no) enable_fast_install=no ;;
+*)
+  enable_fast_install=no
+  # Look at the argument we got.  We use all the common list separators.
+  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
+  for pkg in $enableval; do
+    if test "X$pkg" = "X$p"; then
+      enable_fast_install=yes
+    fi
+  done
+  IFS="$ac_save_ifs"
+  ;;
+esac],
+enable_fast_install=AC_ENABLE_FAST_INSTALL_DEFAULT)dnl
+])
+
+# AC_DISABLE_FAST_INSTALL - set the default to --disable-fast-install
+AC_DEFUN([AC_DISABLE_FAST_INSTALL],
+[AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
+AC_ENABLE_FAST_INSTALL(no)])
+
+# AC_LIBTOOL_PICMODE - implement the --with-pic flag
+# Usage: AC_LIBTOOL_PICMODE[(MODE)]
+#   Where MODE is either `yes' or `no'.  If omitted, it defaults to
+#   `both'.
+AC_DEFUN([AC_LIBTOOL_PICMODE],
+[AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
+pic_mode=ifelse($#,1,$1,default)])
+
+
+# AC_PATH_TOOL_PREFIX - find a file program which can recognise shared library
+AC_DEFUN([AC_PATH_TOOL_PREFIX],
+[AC_MSG_CHECKING([for $1])
+AC_CACHE_VAL(lt_cv_path_MAGIC_CMD,
+[case $MAGIC_CMD in
+  /*)
+  lt_cv_path_MAGIC_CMD="$MAGIC_CMD" # Let the user override the test with a path.
+  ;;
+  ?:/*)
+  lt_cv_path_MAGIC_CMD="$MAGIC_CMD" # Let the user override the test with a dos path.
+  ;;
+  *)
+  ac_save_MAGIC_CMD="$MAGIC_CMD"
+  IFS="${IFS=   }"; ac_save_ifs="$IFS"; IFS=":"
+dnl $ac_dummy forces splitting on constant user-supplied paths.
+dnl POSIX.2 word splitting is done only on the output of word expansions,
+dnl not every word.  This closes a longstanding sh security hole.
+  ac_dummy="ifelse([$2], , $PATH, [$2])"
+  for ac_dir in $ac_dummy; do
+    test -z "$ac_dir" && ac_dir=.
+    if test -f $ac_dir/$1; then
+      lt_cv_path_MAGIC_CMD="$ac_dir/$1"
+      if test -n "$file_magic_test_file"; then
+	case $deplibs_check_method in
+	"file_magic "*)
+	  file_magic_regex="`expr \"$deplibs_check_method\" : \"file_magic \(.*\)\"`"
+	  MAGIC_CMD="$lt_cv_path_MAGIC_CMD"
+	  if eval $file_magic_cmd \$file_magic_test_file 2> /dev/null |
+	    egrep "$file_magic_regex" > /dev/null; then
+	    :
+	  else
+	    cat <<EOF 1>&2
+
+*** Warning: the command libtool uses to detect shared libraries,
+*** $file_magic_cmd, produces output that libtool cannot recognize.
+*** The result is that libtool may fail to recognize shared libraries
+*** as such.  This will affect the creation of libtool libraries that
+*** depend on shared libraries, but programs linked with such libtool
+*** libraries will work regardless of this problem.  Nevertheless, you
+*** may want to report the problem to your system manager and/or to
+*** bug-libtool@gnu.org
+
+EOF
+	  fi ;;
+	esac
+      fi
+      break
+    fi
+  done
+  IFS="$ac_save_ifs"
+  MAGIC_CMD="$ac_save_MAGIC_CMD"
+  ;;
+esac])
+MAGIC_CMD="$lt_cv_path_MAGIC_CMD"
+if test -n "$MAGIC_CMD"; then
+  AC_MSG_RESULT($MAGIC_CMD)
+else
+  AC_MSG_RESULT(no)
+fi
+])
+
+
+# AC_PATH_MAGIC - find a file program which can recognise a shared library
+AC_DEFUN([AC_PATH_MAGIC],
+[AC_REQUIRE([AC_CHECK_TOOL_PREFIX])dnl
+AC_PATH_TOOL_PREFIX(${ac_tool_prefix}file, /usr/bin:$PATH)
+if test -z "$lt_cv_path_MAGIC_CMD"; then
+  if test -n "$ac_tool_prefix"; then
+    AC_PATH_TOOL_PREFIX(file, /usr/bin:$PATH)
+  else
+    MAGIC_CMD=:
+  fi
+fi
+])
+
+
+# AC_PROG_LD - find the path to the GNU or non-GNU linker
+AC_DEFUN([AC_PROG_LD],
+[AC_ARG_WITH(gnu-ld,
+[  --with-gnu-ld           assume the C compiler uses GNU ld [default=no]],
+test "$withval" = no || with_gnu_ld=yes, with_gnu_ld=no)
+AC_REQUIRE([AC_PROG_CC])dnl
+AC_REQUIRE([AC_CANONICAL_HOST])dnl
+AC_REQUIRE([AC_CANONICAL_BUILD])dnl
+ac_prog=ld
+if test "$GCC" = yes; then
+  # Check if gcc -print-prog-name=ld gives a path.
+  AC_MSG_CHECKING([for ld used by GCC])
+  case $host in
+  *-*-mingw*)
+    # gcc leaves a trailing carriage return which upsets mingw
+    ac_prog=`($CC -print-prog-name=ld) 2>&5 | tr -d '\015'` ;;
+  *)
+    ac_prog=`($CC -print-prog-name=ld) 2>&5` ;;
+  esac
+  case $ac_prog in
+    # Accept absolute paths.
+    [[\\/]* | [A-Za-z]:[\\/]*)]
+      [re_direlt='/[^/][^/]*/\.\./']
+      # Canonicalize the path of ld
+      ac_prog=`echo $ac_prog| sed 's%\\\\%/%g'`
+      while echo $ac_prog | grep "$re_direlt" > /dev/null 2>&1; do
+	ac_prog=`echo $ac_prog| sed "s%$re_direlt%/%"`
+      done
+      test -z "$LD" && LD="$ac_prog"
+      ;;
+  "")
+    # If it fails, then pretend we aren't using GCC.
+    ac_prog=ld
+    ;;
+  *)
+    # If it is relative, then search for the first ld in PATH.
+    with_gnu_ld=unknown
+    ;;
+  esac
+elif test "$with_gnu_ld" = yes; then
+  AC_MSG_CHECKING([for GNU ld])
+else
+  AC_MSG_CHECKING([for non-GNU ld])
+fi
+AC_CACHE_VAL(lt_cv_path_LD,
+[if test -z "$LD"; then
+  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}${PATH_SEPARATOR-:}"
+  for ac_dir in $PATH; do
+    test -z "$ac_dir" && ac_dir=.
+    if test -f "$ac_dir/$ac_prog" || test -f "$ac_dir/$ac_prog$ac_exeext"; then
+      lt_cv_path_LD="$ac_dir/$ac_prog"
+      # Check to see if the program is GNU ld.  I'd rather use --version,
+      # but apparently some GNU ld's only accept -v.
+      # Break only if it was the GNU/non-GNU ld that we prefer.
+      if "$lt_cv_path_LD" -v 2>&1 < /dev/null | egrep '(GNU|with BFD)' > /dev/null; then
+	test "$with_gnu_ld" != no && break
+      else
+	test "$with_gnu_ld" != yes && break
+      fi
+    fi
+  done
+  IFS="$ac_save_ifs"
+else
+  lt_cv_path_LD="$LD" # Let the user override the test with a path.
+fi])
+LD="$lt_cv_path_LD"
+if test -n "$LD"; then
+  AC_MSG_RESULT($LD)
+else
+  AC_MSG_RESULT(no)
+fi
+test -z "$LD" && AC_MSG_ERROR([no acceptable ld found in \$PATH])
+AC_PROG_LD_GNU
+])
+
+# AC_PROG_LD_GNU -
+AC_DEFUN([AC_PROG_LD_GNU],
+[AC_CACHE_CHECK([if the linker ($LD) is GNU ld], lt_cv_prog_gnu_ld,
+[# I'd rather use --version here, but apparently some GNU ld's only accept -v.
+if $LD -v 2>&1 </dev/null | egrep '(GNU|with BFD)' 1>&5; then
+  lt_cv_prog_gnu_ld=yes
+else
+  lt_cv_prog_gnu_ld=no
+fi])
+with_gnu_ld=$lt_cv_prog_gnu_ld
+])
+
+# AC_PROG_LD_RELOAD_FLAG - find reload flag for linker
+#   -- PORTME Some linkers may need a different reload flag.
+AC_DEFUN([AC_PROG_LD_RELOAD_FLAG],
+[AC_CACHE_CHECK([for $LD option to reload object files], lt_cv_ld_reload_flag,
+[lt_cv_ld_reload_flag='-r'])
+reload_flag=$lt_cv_ld_reload_flag
+test -n "$reload_flag" && reload_flag=" $reload_flag"
+])
+
+# AC_DEPLIBS_CHECK_METHOD - how to check for library dependencies
+#  -- PORTME fill in with the dynamic library characteristics
+AC_DEFUN([AC_DEPLIBS_CHECK_METHOD],
+[AC_CACHE_CHECK([how to recognise dependant libraries],
+lt_cv_deplibs_check_method,
+[lt_cv_file_magic_cmd='$MAGIC_CMD'
+lt_cv_file_magic_test_file=
+lt_cv_deplibs_check_method='unknown'
+# Need to set the preceding variable on all platforms that support
+# interlibrary dependencies.
+# 'none' -- dependencies not supported.
+# `unknown' -- same as none, but documents that we really don't know.
+# 'pass_all' -- all dependencies passed with no checks.
+# 'test_compile' -- check by making test program.
+# ['file_magic [regex]'] -- check by looking for files in library path
+# which responds to the $file_magic_cmd with a given egrep regex.
+# If you have `file' or equivalent on your system and you're not sure
+# whether `pass_all' will *always* work, you probably want this one.
+
+case $host_os in
+aix4* | aix5*)
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+beos*)
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+bsdi4*)
+  [lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [ML]SB (shared object|dynamic lib)']
+  lt_cv_file_magic_cmd='/usr/bin/file -L'
+  lt_cv_file_magic_test_file=/shlib/libc.so
+  ;;
+
+cygwin* | mingw* | pw32*)
+  lt_cv_deplibs_check_method='file_magic file format pei*-i386(.*architecture: i386)?'
+  lt_cv_file_magic_cmd='$OBJDUMP -f'
+  ;;
+
+darwin* | rhapsody*)
+  lt_cv_deplibs_check_method='file_magic Mach-O dynamically linked shared library'
+  lt_cv_file_magic_cmd='/usr/bin/file -L'
+  case "$host_os" in
+  rhapsody* | darwin1.[012])
+    lt_cv_file_magic_test_file=`echo /System/Library/Frameworks/System.framework/Versions/*/System | head -1`
+    ;;
+  *) # Darwin 1.3 on
+    lt_cv_file_magic_test_file='/usr/lib/libSystem.dylib'
+    ;;
+  esac
+  ;;
+
+freebsd*)
+  if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
+    case $host_cpu in
+    i*86 )
+      # Not sure whether the presence of OpenBSD here was a mistake.
+      # Let's accept both of them until this is cleared up.
+      [lt_cv_deplibs_check_method='file_magic (FreeBSD|OpenBSD)/i[3-9]86 (compact )?demand paged shared library']
+      lt_cv_file_magic_cmd=/usr/bin/file
+      lt_cv_file_magic_test_file=`echo /usr/lib/libc.so.*`
+      ;;
+    esac
+  else
+    lt_cv_deplibs_check_method=pass_all
+  fi
+  ;;
+
+gnu*)
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+hpux10.20*|hpux11*)
+  [lt_cv_deplibs_check_method='file_magic (s[0-9][0-9][0-9]|PA-RISC[0-9].[0-9]) shared library']
+  lt_cv_file_magic_cmd=/usr/bin/file
+  lt_cv_file_magic_test_file=/usr/lib/libc.sl
+  ;;
+
+irix5* | irix6*)
+  case $host_os in
+  irix5*)
+    # this will be overridden with pass_all, but let us keep it just in case
+    lt_cv_deplibs_check_method="file_magic ELF 32-bit MSB dynamic lib MIPS - version 1"
+    ;;
+  *)
+    case $LD in
+    *-32|*"-32 ") libmagic=32-bit;;
+    *-n32|*"-n32 ") libmagic=N32;;
+    *-64|*"-64 ") libmagic=64-bit;;
+    *) libmagic=never-match;;
+    esac
+    # this will be overridden with pass_all, but let us keep it just in case
+    [lt_cv_deplibs_check_method="file_magic ELF ${libmagic} MSB mips-[1234] dynamic lib MIPS - version 1"]
+    ;;
+  esac
+  lt_cv_file_magic_test_file=`echo /lib${libsuff}/libc.so*`
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+# This must be Linux ELF.
+linux-gnu*)
+  case $host_cpu in
+  alpha* | i*86 | powerpc* | sparc* | ia64* )
+    lt_cv_deplibs_check_method=pass_all ;;
+  *)
+    # glibc up to 2.1.1 does not perform some relocations on ARM
+    [lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [LM]SB (shared object|dynamic lib )' ;;]
+  esac
+  lt_cv_file_magic_test_file=`echo /lib/libc.so* /lib/libc-*.so`
+  ;;
+
+netbsd*)
+  if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
+    [lt_cv_deplibs_check_method='match_pattern /lib[^/\.]+\.so\.[0-9]+\.[0-9]+$']
+  else
+    [lt_cv_deplibs_check_method='match_pattern /lib[^/\.]+\.so$']
+  fi
+  ;;
+
+newos6*)
+  [lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [ML]SB (executable|dynamic lib)']
+  lt_cv_file_magic_cmd=/usr/bin/file
+  lt_cv_file_magic_test_file=/usr/lib/libnls.so
+  ;;
+
+osf3* | osf4* | osf5*)
+  # this will be overridden with pass_all, but let us keep it just in case
+  lt_cv_deplibs_check_method='file_magic COFF format alpha shared library'
+  lt_cv_file_magic_test_file=/shlib/libc.so
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+sco3.2v5*)
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+solaris*)
+  lt_cv_deplibs_check_method=pass_all
+  lt_cv_file_magic_test_file=/lib/libc.so
+  ;;
+
+[sysv5uw[78]* | sysv4*uw2*)]
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+sysv4 | sysv4.2uw2* | sysv4.3* | sysv5*)
+  case $host_vendor in
+  motorola)
+    [lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [ML]SB (shared object|dynamic lib) M[0-9][0-9]* Version [0-9]']
+    lt_cv_file_magic_test_file=`echo /usr/lib/libc.so*`
+    ;;
+  ncr)
+    lt_cv_deplibs_check_method=pass_all
+    ;;
+  sequent)
+    lt_cv_file_magic_cmd='/bin/file'
+    [lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [LM]SB (shared object|dynamic lib )']
+    ;;
+  sni)
+    lt_cv_file_magic_cmd='/bin/file'
+    [lt_cv_deplibs_check_method="file_magic ELF [0-9][0-9]*-bit [LM]SB dynamic lib"]
+    lt_cv_file_magic_test_file=/lib/libc.so
+    ;;
+  esac
+  ;;
+esac
+])
+file_magic_cmd=$lt_cv_file_magic_cmd
+deplibs_check_method=$lt_cv_deplibs_check_method
+])
+
+
+# AC_PROG_NM - find the path to a BSD-compatible name lister
+AC_DEFUN([AC_PROG_NM],
+[AC_MSG_CHECKING([for BSD-compatible nm])
+AC_CACHE_VAL(lt_cv_path_NM,
+[if test -n "$NM"; then
+  # Let the user override the test.
+  lt_cv_path_NM="$NM"
+else
+  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}${PATH_SEPARATOR-:}"
+  for ac_dir in $PATH /usr/ccs/bin /usr/ucb /bin; do
+    test -z "$ac_dir" && ac_dir=.
+    tmp_nm=$ac_dir/${ac_tool_prefix}nm
+    if test -f $tmp_nm || test -f $tmp_nm$ac_exeext ; then
+      # Check to see if the nm accepts a BSD-compat flag.
+      # Adding the `sed 1q' prevents false positives on HP-UX, which says:
+      #   nm: unknown option "B" ignored
+      # Tru64's nm complains that /dev/null is an invalid object file
+      if ($tmp_nm -B /dev/null 2>&1 | sed '1q'; exit 0) | egrep '(/dev/null|Invalid file or object type)' >/dev/null; then
+	lt_cv_path_NM="$tmp_nm -B"
+	break
+      elif ($tmp_nm -p /dev/null 2>&1 | sed '1q'; exit 0) | egrep /dev/null >/dev/null; then
+	lt_cv_path_NM="$tmp_nm -p"
+	break
+      else
+	lt_cv_path_NM=${lt_cv_path_NM="$tmp_nm"} # keep the first match, but
+	continue # so that we can try to find one that supports BSD flags
+      fi
+    fi
+  done
+  IFS="$ac_save_ifs"
+  test -z "$lt_cv_path_NM" && lt_cv_path_NM=nm
+fi])
+NM="$lt_cv_path_NM"
+AC_MSG_RESULT([$NM])
+])
+
+# AC_CHECK_LIBM - check for math library
+AC_DEFUN([AC_CHECK_LIBM],
+[AC_REQUIRE([AC_CANONICAL_HOST])dnl
+LIBM=
+case $host in
+*-*-beos* | *-*-cygwin* | *-*-pw32*)
+  # These system don't have libm
+  ;;
+*-ncr-sysv4.3*)
+  AC_CHECK_LIB(mw, _mwvalidcheckl, LIBM="-lmw")
+  AC_CHECK_LIB(m, main, LIBM="$LIBM -lm")
+  ;;
+*)
+  AC_CHECK_LIB(m, main, LIBM="-lm")
+  ;;
+esac
+])
+
+# AC_LIBLTDL_CONVENIENCE[(dir)] - sets LIBLTDL to the link flags for
+# the libltdl convenience library and INCLTDL to the include flags for
+# the libltdl header and adds --enable-ltdl-convenience to the
+# configure arguments.  Note that LIBLTDL and INCLTDL are not
+# AC_SUBSTed, nor is AC_CONFIG_SUBDIRS called.  If DIR is not
+# provided, it is assumed to be `libltdl'.  LIBLTDL will be prefixed
+# with '${top_builddir}/' and INCLTDL will be prefixed with
+# '${top_srcdir}/' (note the single quotes!).  If your package is not
+# flat and you're not using automake, define top_builddir and
+# top_srcdir appropriately in the Makefiles.
+AC_DEFUN([AC_LIBLTDL_CONVENIENCE],
+[AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
+  case $enable_ltdl_convenience in
+  no) AC_MSG_ERROR([this package needs a convenience libltdl]) ;;
+  "") enable_ltdl_convenience=yes
+      ac_configure_args="$ac_configure_args --enable-ltdl-convenience" ;;
+  esac
+  LIBLTDL='${top_builddir}/'ifelse($#,1,[$1],['libltdl'])/libltdlc.la
+  INCLTDL='-I${top_srcdir}/'ifelse($#,1,[$1],['libltdl'])
+])
+
+# AC_LIBLTDL_INSTALLABLE[(dir)] - sets LIBLTDL to the link flags for
+# the libltdl installable library and INCLTDL to the include flags for
+# the libltdl header and adds --enable-ltdl-install to the configure
+# arguments.  Note that LIBLTDL and INCLTDL are not AC_SUBSTed, nor is
+# AC_CONFIG_SUBDIRS called.  If DIR is not provided and an installed
+# libltdl is not found, it is assumed to be `libltdl'.  LIBLTDL will
+# be prefixed with '${top_builddir}/' and INCLTDL will be prefixed
+# with '${top_srcdir}/' (note the single quotes!).  If your package is
+# not flat and you're not using automake, define top_builddir and
+# top_srcdir appropriately in the Makefiles.
+# In the future, this macro may have to be called after AC_PROG_LIBTOOL.
+AC_DEFUN([AC_LIBLTDL_INSTALLABLE],
+[AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
+  AC_CHECK_LIB(ltdl, main,
+  [test x"$enable_ltdl_install" != xyes && enable_ltdl_install=no],
+  [if test x"$enable_ltdl_install" = xno; then
+     AC_MSG_WARN([libltdl not installed, but installation disabled])
+   else
+     enable_ltdl_install=yes
+   fi
+  ])
+  if test x"$enable_ltdl_install" = x"yes"; then
+    ac_configure_args="$ac_configure_args --enable-ltdl-install"
+    LIBLTDL='${top_builddir}/'ifelse($#,1,[$1],['libltdl'])/libltdl.la
+    INCLTDL='-I${top_srcdir}/'ifelse($#,1,[$1],['libltdl'])
+  else
+    ac_configure_args="$ac_configure_args --enable-ltdl-install=no"
+    LIBLTDL="-lltdl"
+    INCLTDL=
+  fi
+])
+
+# old names
+AC_DEFUN([AM_PROG_LIBTOOL],   [AC_PROG_LIBTOOL])
+AC_DEFUN([AM_ENABLE_SHARED],  [AC_ENABLE_SHARED($@)])
+AC_DEFUN([AM_ENABLE_STATIC],  [AC_ENABLE_STATIC($@)])
+AC_DEFUN([AM_DISABLE_SHARED], [AC_DISABLE_SHARED($@)])
+AC_DEFUN([AM_DISABLE_STATIC], [AC_DISABLE_STATIC($@)])
+AC_DEFUN([AM_PROG_LD],        [AC_PROG_LD])
+AC_DEFUN([AM_PROG_NM],        [AC_PROG_NM])
+
+# This is just to silence aclocal about the macro not being used
+ifelse([AC_DISABLE_FAST_INSTALL])
+
diff -Naur gd-2.0.1/config.guess gd-2.0.1.patched/config.guess
--- gd-2.0.1/config.guess	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/config.guess	Tue Jul 30 05:38:57 2002
@@ -0,0 +1,1371 @@
+#! /bin/sh
+# Attempt to guess a canonical system name.
+#   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001
+#   Free Software Foundation, Inc.
+
+timestamp='2001-04-20'
+
+# This file is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+# As a special exception to the GNU General Public License, if you
+# distribute this file as part of a program that contains a
+# configuration script generated by Autoconf, you may include it under
+# the same distribution terms that you use for the rest of that program.
+
+# Written by Per Bothner <bothner@cygnus.com>.
+# Please send patches to <config-patches@gnu.org>.
+#
+# This script attempts to guess a canonical system name similar to
+# config.sub.  If it succeeds, it prints the system name on stdout, and
+# exits with 0.  Otherwise, it exits with 1.
+#
+# The plan is that this can be called by configure scripts if you
+# don't specify an explicit build system type.
+
+me=`echo "$0" | sed -e 's,.*/,,'`
+
+usage="\
+Usage: $0 [OPTION]
+
+Output the configuration name of the system \`$me' is run on.
+
+Operation modes:
+  -h, --help         print this help, then exit
+  -t, --time-stamp   print date of last modification, then exit
+  -v, --version      print version number, then exit
+
+Report bugs and patches to <config-patches@gnu.org>."
+
+version="\
+GNU config.guess ($timestamp)
+
+Originally written by Per Bothner.
+Copyright (C) 1992, 93, 94, 95, 96, 97, 98, 99, 2000
+Free Software Foundation, Inc.
+
+This is free software; see the source for copying conditions.  There is NO
+warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."
+
+help="
+Try \`$me --help' for more information."
+
+# Parse command line
+while test $# -gt 0 ; do
+  case $1 in
+    --time-stamp | --time* | -t )
+       echo "$timestamp" ; exit 0 ;;
+    --version | -v )
+       echo "$version" ; exit 0 ;;
+    --help | --h* | -h )
+       echo "$usage"; exit 0 ;;
+    -- )     # Stop option processing
+       shift; break ;;
+    - )	# Use stdin as input.
+       break ;;
+    -* )
+       echo "$me: invalid option $1$help" >&2
+       exit 1 ;;
+    * )
+       break ;;
+  esac
+done
+
+if test $# != 0; then
+  echo "$me: too many arguments$help" >&2
+  exit 1
+fi
+
+
+dummy=dummy-$$
+trap 'rm -f $dummy.c $dummy.o $dummy.rel $dummy; exit 1' 1 2 15
+
+# CC_FOR_BUILD -- compiler used by this script.
+# Historically, `CC_FOR_BUILD' used to be named `HOST_CC'. We still
+# use `HOST_CC' if defined, but it is deprecated.
+
+case $CC_FOR_BUILD,$HOST_CC,$CC in
+ ,,)    echo "int dummy(){}" > $dummy.c
+	for c in cc gcc c89 ; do
+	  ($c $dummy.c -c -o $dummy.o) >/dev/null 2>&1
+	  if test $? = 0 ; then
+	     CC_FOR_BUILD="$c"; break
+	  fi
+	done
+	rm -f $dummy.c $dummy.o $dummy.rel
+	if test x"$CC_FOR_BUILD" = x ; then
+	  CC_FOR_BUILD=no_compiler_found
+	fi
+	;;
+ ,,*)   CC_FOR_BUILD=$CC ;;
+ ,*,*)  CC_FOR_BUILD=$HOST_CC ;;
+esac
+
+# This is needed to find uname on a Pyramid OSx when run in the BSD universe.
+# (ghazi@noc.rutgers.edu 8/24/94.)
+if (test -f /.attbin/uname) >/dev/null 2>&1 ; then
+	PATH=$PATH:/.attbin ; export PATH
+fi
+
+UNAME_MACHINE=`(uname -m) 2>/dev/null` || UNAME_MACHINE=unknown
+UNAME_RELEASE=`(uname -r) 2>/dev/null` || UNAME_RELEASE=unknown
+UNAME_SYSTEM=`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=unknown
+UNAME_VERSION=`(uname -v) 2>/dev/null` || UNAME_VERSION=unknown
+
+# Note: order is significant - the case branches are not exclusive.
+
+case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
+    *:NetBSD:*:*)
+	# Netbsd (nbsd) targets should (where applicable) match one or
+	# more of the tupples: *-*-netbsdelf*, *-*-netbsdaout*,
+	# *-*-netbsdecoff* and *-*-netbsd*.  For targets that recently
+	# switched to ELF, *-*-netbsd* would select the old
+	# object file format.  This provides both forward
+	# compatibility and a consistent mechanism for selecting the
+	# object file format.
+	# Determine the machine/vendor (is the vendor relevant).
+	case "${UNAME_MACHINE}" in
+	    amiga) machine=m68k-unknown ;;
+	    arm32) machine=arm-unknown ;;
+	    atari*) machine=m68k-atari ;;
+	    sun3*) machine=m68k-sun ;;
+	    mac68k) machine=m68k-apple ;;
+	    macppc) machine=powerpc-apple ;;
+	    hp3[0-9][05]) machine=m68k-hp ;;
+	    ibmrt|romp-ibm) machine=romp-ibm ;;
+	    *) machine=${UNAME_MACHINE}-unknown ;;
+	esac
+	# The Operating System including object format, if it has switched
+	# to ELF recently, or will in the future.
+	case "${UNAME_MACHINE}" in
+	    i386|sparc|amiga|arm*|hp300|mvme68k|vax|atari|luna68k|mac68k|news68k|next68k|pc532|sun3*|x68k)
+		if echo __ELF__ | $CC_FOR_BUILD -E - 2>/dev/null \
+			| grep __ELF__ >/dev/null
+		then
+		    # Once all utilities can be ECOFF (netbsdecoff) or a.out (netbsdaout).
+		    # Return netbsd for either.  FIX?
+		    os=netbsd
+		else
+		    os=netbsdelf
+		fi
+		;;
+	    *)
+	        os=netbsd
+		;;
+	esac
+	# The OS release
+	release=`echo ${UNAME_RELEASE}|sed -e 's/[-_].*/\./'`
+	# Since CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM:
+	# contains redundant information, the shorter form:
+	# CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM is used.
+	echo "${machine}-${os}${release}"
+	exit 0 ;;
+    alpha:OSF1:*:*)
+	if test $UNAME_RELEASE = "V4.0"; then
+		UNAME_RELEASE=`/usr/sbin/sizer -v | awk '{print $3}'`
+	fi
+	# A Vn.n version is a released version.
+	# A Tn.n version is a released field test version.
+	# A Xn.n version is an unreleased experimental baselevel.
+	# 1.2 uses "1.2" for uname -r.
+	cat <<EOF >$dummy.s
+	.data
+\$Lformat:
+	.byte 37,100,45,37,120,10,0	# "%d-%x\n"
+
+	.text
+	.globl main
+	.align 4
+	.ent main
+main:
+	.frame \$30,16,\$26,0
+	ldgp \$29,0(\$27)
+	.prologue 1
+	.long 0x47e03d80 # implver \$0
+	lda \$2,-1
+	.long 0x47e20c21 # amask \$2,\$1
+	lda \$16,\$Lformat
+	mov \$0,\$17
+	not \$1,\$18
+	jsr \$26,printf
+	ldgp \$29,0(\$26)
+	mov 0,\$16
+	jsr \$26,exit
+	.end main
+EOF
+	$CC_FOR_BUILD $dummy.s -o $dummy 2>/dev/null
+	if test "$?" = 0 ; then
+		case `./$dummy` in
+			0-0)
+				UNAME_MACHINE="alpha"
+				;;
+			1-0)
+				UNAME_MACHINE="alphaev5"
+				;;
+			1-1)
+				UNAME_MACHINE="alphaev56"
+				;;
+			1-101)
+				UNAME_MACHINE="alphapca56"
+				;;
+			2-303)
+				UNAME_MACHINE="alphaev6"
+				;;
+			2-307)
+				UNAME_MACHINE="alphaev67"
+				;;
+		esac
+	fi
+	rm -f $dummy.s $dummy
+	echo ${UNAME_MACHINE}-dec-osf`echo ${UNAME_RELEASE} | sed -e 's/^[VTX]//' | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz'`
+	exit 0 ;;
+    Alpha\ *:Windows_NT*:*)
+	# How do we know it's Interix rather than the generic POSIX subsystem?
+	# Should we change UNAME_MACHINE based on the output of uname instead
+	# of the specific Alpha model?
+	echo alpha-pc-interix
+	exit 0 ;;
+    21064:Windows_NT:50:3)
+	echo alpha-dec-winnt3.5
+	exit 0 ;;
+    Amiga*:UNIX_System_V:4.0:*)
+	echo m68k-unknown-sysv4
+	exit 0;;
+    amiga:OpenBSD:*:*)
+	echo m68k-unknown-openbsd${UNAME_RELEASE}
+	exit 0 ;;
+    *:[Aa]miga[Oo][Ss]:*:*)
+	echo ${UNAME_MACHINE}-unknown-amigaos
+	exit 0 ;;
+    arc64:OpenBSD:*:*)
+	echo mips64el-unknown-openbsd${UNAME_RELEASE}
+	exit 0 ;;
+    arc:OpenBSD:*:*)
+	echo mipsel-unknown-openbsd${UNAME_RELEASE}
+	exit 0 ;;
+    hkmips:OpenBSD:*:*)
+	echo mips-unknown-openbsd${UNAME_RELEASE}
+	exit 0 ;;
+    pmax:OpenBSD:*:*)
+	echo mipsel-unknown-openbsd${UNAME_RELEASE}
+	exit 0 ;;
+    sgi:OpenBSD:*:*)
+	echo mips-unknown-openbsd${UNAME_RELEASE}
+	exit 0 ;;
+    wgrisc:OpenBSD:*:*)
+	echo mipsel-unknown-openbsd${UNAME_RELEASE}
+	exit 0 ;;
+    *:OS/390:*:*)
+	echo i370-ibm-openedition
+	exit 0 ;;
+    arm:RISC*:1.[012]*:*|arm:riscix:1.[012]*:*)
+	echo arm-acorn-riscix${UNAME_RELEASE}
+	exit 0;;
+    SR2?01:HI-UX/MPP:*:* | SR8000:HI-UX/MPP:*:*)
+	echo hppa1.1-hitachi-hiuxmpp
+	exit 0;;
+    Pyramid*:OSx*:*:* | MIS*:OSx*:*:* | MIS*:SMP_DC-OSx*:*:*)
+	# akee@wpdis03.wpafb.af.mil (Earle F. Ake) contributed MIS and NILE.
+	if test "`(/bin/universe) 2>/dev/null`" = att ; then
+		echo pyramid-pyramid-sysv3
+	else
+		echo pyramid-pyramid-bsd
+	fi
+	exit 0 ;;
+    NILE*:*:*:dcosx)
+	echo pyramid-pyramid-svr4
+	exit 0 ;;
+    sun4H:SunOS:5.*:*)
+	echo sparc-hal-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
+	exit 0 ;;
+    sun4*:SunOS:5.*:* | tadpole*:SunOS:5.*:*)
+	echo sparc-sun-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
+	exit 0 ;;
+    i86pc:SunOS:5.*:*)
+	echo i386-pc-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
+	exit 0 ;;
+    sun4*:SunOS:6*:*)
+	# According to config.sub, this is the proper way to canonicalize
+	# SunOS6.  Hard to guess exactly what SunOS6 will be like, but
+	# it's likely to be more like Solaris than SunOS4.
+	echo sparc-sun-solaris3`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
+	exit 0 ;;
+    sun4*:SunOS:*:*)
+	case "`/usr/bin/arch -k`" in
+	    Series*|S4*)
+		UNAME_RELEASE=`uname -v`
+		;;
+	esac
+	# Japanese Language versions have a version number like `4.1.3-JL'.
+	echo sparc-sun-sunos`echo ${UNAME_RELEASE}|sed -e 's/-/_/'`
+	exit 0 ;;
+    sun3*:SunOS:*:*)
+	echo m68k-sun-sunos${UNAME_RELEASE}
+	exit 0 ;;
+    sun*:*:4.2BSD:*)
+	UNAME_RELEASE=`(head -1 /etc/motd | awk '{print substr($5,1,3)}') 2>/dev/null`
+	test "x${UNAME_RELEASE}" = "x" && UNAME_RELEASE=3
+	case "`/bin/arch`" in
+	    sun3)
+		echo m68k-sun-sunos${UNAME_RELEASE}
+		;;
+	    sun4)
+		echo sparc-sun-sunos${UNAME_RELEASE}
+		;;
+	esac
+	exit 0 ;;
+    aushp:SunOS:*:*)
+	echo sparc-auspex-sunos${UNAME_RELEASE}
+	exit 0 ;;
+    atari*:OpenBSD:*:*)
+	echo m68k-unknown-openbsd${UNAME_RELEASE}
+	exit 0 ;;
+    # The situation for MiNT is a little confusing.  The machine name
+    # can be virtually everything (everything which is not
+    # "atarist" or "atariste" at least should have a processor
+    # > m68000).  The system name ranges from "MiNT" over "FreeMiNT"
+    # to the lowercase version "mint" (or "freemint").  Finally
+    # the system name "TOS" denotes a system which is actually not
+    # MiNT.  But MiNT is downward compatible to TOS, so this should
+    # be no problem.
+    atarist[e]:*MiNT:*:* | atarist[e]:*mint:*:* | atarist[e]:*TOS:*:*)
+        echo m68k-atari-mint${UNAME_RELEASE}
+	exit 0 ;;
+    atari*:*MiNT:*:* | atari*:*mint:*:* | atarist[e]:*TOS:*:*)
+	echo m68k-atari-mint${UNAME_RELEASE}
+        exit 0 ;;
+    *falcon*:*MiNT:*:* | *falcon*:*mint:*:* | *falcon*:*TOS:*:*)
+        echo m68k-atari-mint${UNAME_RELEASE}
+	exit 0 ;;
+    milan*:*MiNT:*:* | milan*:*mint:*:* | *milan*:*TOS:*:*)
+        echo m68k-milan-mint${UNAME_RELEASE}
+        exit 0 ;;
+    hades*:*MiNT:*:* | hades*:*mint:*:* | *hades*:*TOS:*:*)
+        echo m68k-hades-mint${UNAME_RELEASE}
+        exit 0 ;;
+    *:*MiNT:*:* | *:*mint:*:* | *:*TOS:*:*)
+        echo m68k-unknown-mint${UNAME_RELEASE}
+        exit 0 ;;
+    sun3*:OpenBSD:*:*)
+	echo m68k-unknown-openbsd${UNAME_RELEASE}
+	exit 0 ;;
+    mac68k:OpenBSD:*:*)
+	echo m68k-unknown-openbsd${UNAME_RELEASE}
+	exit 0 ;;
+    mvme68k:OpenBSD:*:*)
+	echo m68k-unknown-openbsd${UNAME_RELEASE}
+	exit 0 ;;
+    mvme88k:OpenBSD:*:*)
+	echo m88k-unknown-openbsd${UNAME_RELEASE}
+	exit 0 ;;
+    powerpc:machten:*:*)
+	echo powerpc-apple-machten${UNAME_RELEASE}
+	exit 0 ;;
+    RISC*:Mach:*:*)
+	echo mips-dec-mach_bsd4.3
+	exit 0 ;;
+    RISC*:ULTRIX:*:*)
+	echo mips-dec-ultrix${UNAME_RELEASE}
+	exit 0 ;;
+    VAX*:ULTRIX*:*:*)
+	echo vax-dec-ultrix${UNAME_RELEASE}
+	exit 0 ;;
+    2020:CLIX:*:* | 2430:CLIX:*:*)
+	echo clipper-intergraph-clix${UNAME_RELEASE}
+	exit 0 ;;
+    mips:*:*:UMIPS | mips:*:*:RISCos)
+	sed 's/^	//' << EOF >$dummy.c
+#ifdef __cplusplus
+#include <stdio.h>  /* for printf() prototype */
+	int main (int argc, char *argv[]) {
+#else
+	int main (argc, argv) int argc; char *argv[]; {
+#endif
+	#if defined (host_mips) && defined (MIPSEB)
+	#if defined (SYSTYPE_SYSV)
+	  printf ("mips-mips-riscos%ssysv\n", argv[1]); exit (0);
+	#endif
+	#if defined (SYSTYPE_SVR4)
+	  printf ("mips-mips-riscos%ssvr4\n", argv[1]); exit (0);
+	#endif
+	#if defined (SYSTYPE_BSD43) || defined(SYSTYPE_BSD)
+	  printf ("mips-mips-riscos%sbsd\n", argv[1]); exit (0);
+	#endif
+	#endif
+	  exit (-1);
+	}
+EOF
+	$CC_FOR_BUILD $dummy.c -o $dummy \
+	  && ./$dummy `echo "${UNAME_RELEASE}" | sed -n 's/\([0-9]*\).*/\1/p'` \
+	  && rm -f $dummy.c $dummy && exit 0
+	rm -f $dummy.c $dummy
+	echo mips-mips-riscos${UNAME_RELEASE}
+	exit 0 ;;
+    Motorola:PowerMAX_OS:*:*)
+	echo powerpc-motorola-powermax
+	exit 0 ;;
+    Night_Hawk:Power_UNIX:*:*)
+	echo powerpc-harris-powerunix
+	exit 0 ;;
+    m88k:CX/UX:7*:*)
+	echo m88k-harris-cxux7
+	exit 0 ;;
+    m88k:*:4*:R4*)
+	echo m88k-motorola-sysv4
+	exit 0 ;;
+    m88k:*:3*:R3*)
+	echo m88k-motorola-sysv3
+	exit 0 ;;
+    AViiON:dgux:*:*)
+        # DG/UX returns AViiON for all architectures
+        UNAME_PROCESSOR=`/usr/bin/uname -p`
+	if [ $UNAME_PROCESSOR = mc88100 ] || [ $UNAME_PROCESSOR = mc88110 ]
+	then
+	    if [ ${TARGET_BINARY_INTERFACE}x = m88kdguxelfx ] || \
+	       [ ${TARGET_BINARY_INTERFACE}x = x ]
+	    then
+		echo m88k-dg-dgux${UNAME_RELEASE}
+	    else
+		echo m88k-dg-dguxbcs${UNAME_RELEASE}
+	    fi
+	else
+	    echo i586-dg-dgux${UNAME_RELEASE}
+	fi
+ 	exit 0 ;;
+    M88*:DolphinOS:*:*)	# DolphinOS (SVR3)
+	echo m88k-dolphin-sysv3
+	exit 0 ;;
+    M88*:*:R3*:*)
+	# Delta 88k system running SVR3
+	echo m88k-motorola-sysv3
+	exit 0 ;;
+    XD88*:*:*:*) # Tektronix XD88 system running UTekV (SVR3)
+	echo m88k-tektronix-sysv3
+	exit 0 ;;
+    Tek43[0-9][0-9]:UTek:*:*) # Tektronix 4300 system running UTek (BSD)
+	echo m68k-tektronix-bsd
+	exit 0 ;;
+    *:IRIX*:*:*)
+	echo mips-sgi-irix`echo ${UNAME_RELEASE}|sed -e 's/-/_/g'`
+	exit 0 ;;
+    ????????:AIX?:[12].1:2)   # AIX 2.2.1 or AIX 2.1.1 is RT/PC AIX.
+	echo romp-ibm-aix      # uname -m gives an 8 hex-code CPU id
+	exit 0 ;;              # Note that: echo "'`uname -s`'" gives 'AIX '
+    i*86:AIX:*:*)
+	echo i386-ibm-aix
+	exit 0 ;;
+    ia64:AIX:*:*)
+	if [ -x /usr/bin/oslevel ] ; then
+		IBM_REV=`/usr/bin/oslevel`
+	else
+		IBM_REV=${UNAME_VERSION}.${UNAME_RELEASE}
+	fi
+	echo ${UNAME_MACHINE}-ibm-aix${IBM_REV}
+	exit 0 ;;
+    *:AIX:2:3)
+	if grep bos325 /usr/include/stdio.h >/dev/null 2>&1; then
+		sed 's/^		//' << EOF >$dummy.c
+		#include <sys/systemcfg.h>
+
+		main()
+			{
+			if (!__power_pc())
+				exit(1);
+			puts("powerpc-ibm-aix3.2.5");
+			exit(0);
+			}
+EOF
+		$CC_FOR_BUILD $dummy.c -o $dummy && ./$dummy && rm -f $dummy.c $dummy && exit 0
+		rm -f $dummy.c $dummy
+		echo rs6000-ibm-aix3.2.5
+	elif grep bos324 /usr/include/stdio.h >/dev/null 2>&1; then
+		echo rs6000-ibm-aix3.2.4
+	else
+		echo rs6000-ibm-aix3.2
+	fi
+	exit 0 ;;
+    *:AIX:*:[45])
+	IBM_CPU_ID=`/usr/sbin/lsdev -C -c processor -S available | head -1 | awk '{ print $1 }'`
+	if /usr/sbin/lsattr -El ${IBM_CPU_ID} | grep ' POWER' >/dev/null 2>&1; then
+		IBM_ARCH=rs6000
+	else
+		IBM_ARCH=powerpc
+	fi
+	if [ -x /usr/bin/oslevel ] ; then
+		IBM_REV=`/usr/bin/oslevel`
+	else
+		IBM_REV=${UNAME_VERSION}.${UNAME_RELEASE}
+	fi
+	echo ${IBM_ARCH}-ibm-aix${IBM_REV}
+	exit 0 ;;
+    *:AIX:*:*)
+	echo rs6000-ibm-aix
+	exit 0 ;;
+    ibmrt:4.4BSD:*|romp-ibm:BSD:*)
+	echo romp-ibm-bsd4.4
+	exit 0 ;;
+    ibmrt:*BSD:*|romp-ibm:BSD:*)            # covers RT/PC BSD and
+	echo romp-ibm-bsd${UNAME_RELEASE}   # 4.3 with uname added to
+	exit 0 ;;                           # report: romp-ibm BSD 4.3
+    *:BOSX:*:*)
+	echo rs6000-bull-bosx
+	exit 0 ;;
+    DPX/2?00:B.O.S.:*:*)
+	echo m68k-bull-sysv3
+	exit 0 ;;
+    9000/[34]??:4.3bsd:1.*:*)
+	echo m68k-hp-bsd
+	exit 0 ;;
+    hp300:4.4BSD:*:* | 9000/[34]??:4.3bsd:2.*:*)
+	echo m68k-hp-bsd4.4
+	exit 0 ;;
+    9000/[34678]??:HP-UX:*:*)
+	HPUX_REV=`echo ${UNAME_RELEASE}|sed -e 's/[^.]*.[0B]*//'`
+	case "${UNAME_MACHINE}" in
+	    9000/31? )            HP_ARCH=m68000 ;;
+	    9000/[34]?? )         HP_ARCH=m68k ;;
+	    9000/[678][0-9][0-9])
+              case "${HPUX_REV}" in
+                11.[0-9][0-9])
+                  if [ -x /usr/bin/getconf ]; then
+                    sc_cpu_version=`/usr/bin/getconf SC_CPU_VERSION 2>/dev/null`
+                    sc_kernel_bits=`/usr/bin/getconf SC_KERNEL_BITS 2>/dev/null`
+                    case "${sc_cpu_version}" in
+                      523) HP_ARCH="hppa1.0" ;; # CPU_PA_RISC1_0
+                      528) HP_ARCH="hppa1.1" ;; # CPU_PA_RISC1_1
+                      532)                      # CPU_PA_RISC2_0
+                        case "${sc_kernel_bits}" in
+                          32) HP_ARCH="hppa2.0n" ;;
+                          64) HP_ARCH="hppa2.0w" ;;
+                        esac ;;
+                    esac
+                  fi ;;
+              esac
+              if [ "${HP_ARCH}" = "" ]; then
+              sed 's/^              //' << EOF >$dummy.c
+
+              #define _HPUX_SOURCE
+              #include <stdlib.h>
+              #include <unistd.h>
+
+              int main ()
+              {
+              #if defined(_SC_KERNEL_BITS)
+                  long bits = sysconf(_SC_KERNEL_BITS);
+              #endif
+                  long cpu  = sysconf (_SC_CPU_VERSION);
+
+                  switch (cpu)
+              	{
+              	case CPU_PA_RISC1_0: puts ("hppa1.0"); break;
+              	case CPU_PA_RISC1_1: puts ("hppa1.1"); break;
+              	case CPU_PA_RISC2_0:
+              #if defined(_SC_KERNEL_BITS)
+              	    switch (bits)
+              		{
+              		case 64: puts ("hppa2.0w"); break;
+              		case 32: puts ("hppa2.0n"); break;
+              		default: puts ("hppa2.0"); break;
+              		} break;
+              #else  /* !defined(_SC_KERNEL_BITS) */
+              	    puts ("hppa2.0"); break;
+              #endif
+              	default: puts ("hppa1.0"); break;
+              	}
+                  exit (0);
+              }
+EOF
+	(CCOPTS= $CC_FOR_BUILD $dummy.c -o $dummy 2>/dev/null ) && HP_ARCH=`./$dummy`
+	if test -z "$HP_ARCH"; then HP_ARCH=hppa; fi
+	rm -f $dummy.c $dummy
+	fi ;;
+	esac
+	echo ${HP_ARCH}-hp-hpux${HPUX_REV}
+	exit 0 ;;
+    ia64:HP-UX:*:*)
+	HPUX_REV=`echo ${UNAME_RELEASE}|sed -e 's/[^.]*.[0B]*//'`
+	echo ia64-hp-hpux${HPUX_REV}
+	exit 0 ;;
+    3050*:HI-UX:*:*)
+	sed 's/^	//' << EOF >$dummy.c
+	#include <unistd.h>
+	int
+	main ()
+	{
+	  long cpu = sysconf (_SC_CPU_VERSION);
+	  /* The order matters, because CPU_IS_HP_MC68K erroneously returns
+	     true for CPU_PA_RISC1_0.  CPU_IS_PA_RISC returns correct
+	     results, however.  */
+	  if (CPU_IS_PA_RISC (cpu))
+	    {
+	      switch (cpu)
+		{
+		  case CPU_PA_RISC1_0: puts ("hppa1.0-hitachi-hiuxwe2"); break;
+		  case CPU_PA_RISC1_1: puts ("hppa1.1-hitachi-hiuxwe2"); break;
+		  case CPU_PA_RISC2_0: puts ("hppa2.0-hitachi-hiuxwe2"); break;
+		  default: puts ("hppa-hitachi-hiuxwe2"); break;
+		}
+	    }
+	  else if (CPU_IS_HP_MC68K (cpu))
+	    puts ("m68k-hitachi-hiuxwe2");
+	  else puts ("unknown-hitachi-hiuxwe2");
+	  exit (0);
+	}
+EOF
+	$CC_FOR_BUILD $dummy.c -o $dummy && ./$dummy && rm -f $dummy.c $dummy && exit 0
+	rm -f $dummy.c $dummy
+	echo unknown-hitachi-hiuxwe2
+	exit 0 ;;
+    9000/7??:4.3bsd:*:* | 9000/8?[79]:4.3bsd:*:* )
+	echo hppa1.1-hp-bsd
+	exit 0 ;;
+    9000/8??:4.3bsd:*:*)
+	echo hppa1.0-hp-bsd
+	exit 0 ;;
+    *9??*:MPE/iX:*:*)
+	echo hppa1.0-hp-mpeix
+	exit 0 ;;
+    hp7??:OSF1:*:* | hp8?[79]:OSF1:*:* )
+	echo hppa1.1-hp-osf
+	exit 0 ;;
+    hp8??:OSF1:*:*)
+	echo hppa1.0-hp-osf
+	exit 0 ;;
+    i*86:OSF1:*:*)
+	if [ -x /usr/sbin/sysversion ] ; then
+	    echo ${UNAME_MACHINE}-unknown-osf1mk
+	else
+	    echo ${UNAME_MACHINE}-unknown-osf1
+	fi
+	exit 0 ;;
+    parisc*:Lites*:*:*)
+	echo hppa1.1-hp-lites
+	exit 0 ;;
+    hppa*:OpenBSD:*:*)
+	echo hppa-unknown-openbsd
+	exit 0 ;;
+    C1*:ConvexOS:*:* | convex:ConvexOS:C1*:*)
+	echo c1-convex-bsd
+        exit 0 ;;
+    C2*:ConvexOS:*:* | convex:ConvexOS:C2*:*)
+	if getsysinfo -f scalar_acc
+	then echo c32-convex-bsd
+	else echo c2-convex-bsd
+	fi
+        exit 0 ;;
+    C34*:ConvexOS:*:* | convex:ConvexOS:C34*:*)
+	echo c34-convex-bsd
+        exit 0 ;;
+    C38*:ConvexOS:*:* | convex:ConvexOS:C38*:*)
+	echo c38-convex-bsd
+        exit 0 ;;
+    C4*:ConvexOS:*:* | convex:ConvexOS:C4*:*)
+	echo c4-convex-bsd
+        exit 0 ;;
+    CRAY*X-MP:*:*:*)
+	echo xmp-cray-unicos
+        exit 0 ;;
+    CRAY*Y-MP:*:*:*)
+	echo ymp-cray-unicos${UNAME_RELEASE}
+	exit 0 ;;
+    CRAY*[A-Z]90:*:*:*)
+	echo ${UNAME_MACHINE}-cray-unicos${UNAME_RELEASE} \
+	| sed -e 's/CRAY.*\([A-Z]90\)/\1/' \
+	      -e y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/
+	exit 0 ;;
+    CRAY*TS:*:*:*)
+	echo t90-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
+	exit 0 ;;
+    CRAY*T3D:*:*:*)
+	echo alpha-cray-unicosmk${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
+	exit 0 ;;
+    CRAY*T3E:*:*:*)
+	echo alphaev5-cray-unicosmk${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
+	exit 0 ;;
+    CRAY*SV1:*:*:*)
+	echo sv1-cray-unicos${UNAME_RELEASE} | sed -e 's/\.[^.]*$/.X/'
+	exit 0 ;;
+    CRAY-2:*:*:*)
+	echo cray2-cray-unicos
+        exit 0 ;;
+    F30[01]:UNIX_System_V:*:* | F700:UNIX_System_V:*:*)
+	FUJITSU_PROC=`uname -m | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz'`
+        FUJITSU_SYS=`uname -p | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' 'abcdefghijklmnopqrstuvwxyz' | sed -e 's/\///'`
+        FUJITSU_REL=`echo ${UNAME_RELEASE} | sed -e 's/ /_/'`
+        echo "${FUJITSU_PROC}-fujitsu-${FUJITSU_SYS}${FUJITSU_REL}"
+        exit 0 ;;
+    hp300:OpenBSD:*:*)
+	echo m68k-unknown-openbsd${UNAME_RELEASE}
+	exit 0 ;;
+    i*86:BSD/386:*:* | i*86:BSD/OS:*:* | *:Ascend\ Embedded/OS:*:*)
+	echo ${UNAME_MACHINE}-pc-bsdi${UNAME_RELEASE}
+	exit 0 ;;
+    sparc*:BSD/OS:*:*)
+	echo sparc-unknown-bsdi${UNAME_RELEASE}
+	exit 0 ;;
+    *:BSD/OS:*:*)
+	echo ${UNAME_MACHINE}-unknown-bsdi${UNAME_RELEASE}
+	exit 0 ;;
+    *:FreeBSD:*:*)
+	echo ${UNAME_MACHINE}-unknown-freebsd`echo ${UNAME_RELEASE}|sed -e 's/[-(].*//'`
+	exit 0 ;;
+    *:OpenBSD:*:*)
+	echo ${UNAME_MACHINE}-unknown-openbsd`echo ${UNAME_RELEASE}|sed -e 's/[-_].*/\./'`
+	exit 0 ;;
+    i*:CYGWIN*:*)
+	echo ${UNAME_MACHINE}-pc-cygwin
+	exit 0 ;;
+    i*:MINGW*:*)
+	echo ${UNAME_MACHINE}-pc-mingw32
+	exit 0 ;;
+    i*:PW*:*)
+	echo ${UNAME_MACHINE}-pc-pw32
+	exit 0 ;;
+    i*:Windows_NT*:* | Pentium*:Windows_NT*:*)
+	# How do we know it's Interix rather than the generic POSIX subsystem?
+	# It also conflicts with pre-2.0 versions of AT&T UWIN. Should we
+	# UNAME_MACHINE based on the output of uname instead of i386?
+	echo i386-pc-interix
+	exit 0 ;;
+    i*:UWIN*:*)
+	echo ${UNAME_MACHINE}-pc-uwin
+	exit 0 ;;
+    p*:CYGWIN*:*)
+	echo powerpcle-unknown-cygwin
+	exit 0 ;;
+    prep*:SunOS:5.*:*)
+	echo powerpcle-unknown-solaris2`echo ${UNAME_RELEASE}|sed -e 's/[^.]*//'`
+	exit 0 ;;
+    *:GNU:*:*)
+	echo `echo ${UNAME_MACHINE}|sed -e 's,[-/].*$,,'`-unknown-gnu`echo ${UNAME_RELEASE}|sed -e 's,/.*$,,'`
+	exit 0 ;;
+    i*86:Minix:*:*)
+	echo ${UNAME_MACHINE}-pc-minix
+	exit 0 ;;
+    arm*:Linux:*:*)
+	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	exit 0 ;;
+    ia64:Linux:*:*)
+	echo ${UNAME_MACHINE}-unknown-linux
+	exit 0 ;;
+    m68*:Linux:*:*)
+	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	exit 0 ;;
+    mips:Linux:*:*)
+	cat >$dummy.c <<EOF
+#ifdef __cplusplus
+#include <stdio.h>  /* for printf() prototype */
+int main (int argc, char *argv[]) {
+#else
+int main (argc, argv) int argc; char *argv[]; {
+#endif
+#ifdef __MIPSEB__
+  printf ("%s-unknown-linux-gnu\n", argv[1]);
+#endif
+#ifdef __MIPSEL__
+  printf ("%sel-unknown-linux-gnu\n", argv[1]);
+#endif
+  return 0;
+}
+EOF
+	$CC_FOR_BUILD $dummy.c -o $dummy 2>/dev/null && ./$dummy "${UNAME_MACHINE}" && rm -f $dummy.c $dummy && exit 0
+	rm -f $dummy.c $dummy
+	;;
+    ppc:Linux:*:*)
+	# Determine Lib Version
+	cat >$dummy.c <<EOF
+#include <features.h>
+#if defined(__GLIBC__)
+extern char __libc_version[];
+extern char __libc_release[];
+#endif
+main(argc, argv)
+     int argc;
+     char *argv[];
+{
+#if defined(__GLIBC__)
+  printf("%s %s\n", __libc_version, __libc_release);
+#else
+  printf("unknown\n");
+#endif
+  return 0;
+}
+EOF
+	LIBC=""
+	$CC_FOR_BUILD $dummy.c -o $dummy 2>/dev/null
+	if test "$?" = 0 ; then
+		./$dummy | grep 1\.99 > /dev/null
+		if test "$?" = 0 ; then LIBC="libc1" ; fi
+	fi
+	rm -f $dummy.c $dummy
+	echo powerpc-unknown-linux-gnu${LIBC}
+	exit 0 ;;
+    alpha:Linux:*:*)
+	cat <<EOF >$dummy.s
+	  .data
+	  \$Lformat:
+		.byte 37,100,45,37,120,10,0	# "%d-%x\n"
+	   .text
+		.globl main
+		.align 4
+		.ent main
+	    main:
+		.frame \$30,16,\$26,0
+		ldgp \$29,0(\$27)
+		.prologue 1
+		.long 0x47e03d80 # implver \$0
+		lda \$2,-1
+		.long 0x47e20c21 # amask \$2,\$1
+		lda \$16,\$Lformat
+		mov \$0,\$17
+		not \$1,\$18
+		jsr \$26,printf
+		ldgp \$29,0(\$26)
+		mov 0,\$16
+		jsr \$26,exit
+		.end main
+EOF
+	LIBC=""
+	$CC_FOR_BUILD $dummy.s -o $dummy 2>/dev/null
+	if test "$?" = 0 ; then
+		case `./$dummy` in
+		0-0)	UNAME_MACHINE="alpha" ;;
+		1-0)	UNAME_MACHINE="alphaev5" ;;
+		1-1)    UNAME_MACHINE="alphaev56" ;;
+		1-101)	UNAME_MACHINE="alphapca56" ;;
+		2-303)	UNAME_MACHINE="alphaev6" ;;
+		2-307)	UNAME_MACHINE="alphaev67" ;;
+		esac
+		objdump --private-headers $dummy | \
+		  grep ld.so.1 > /dev/null
+		if test "$?" = 0 ; then
+			LIBC="libc1"
+		fi
+	fi
+	rm -f $dummy.s $dummy
+	echo ${UNAME_MACHINE}-unknown-linux-gnu${LIBC}
+	exit 0 ;;
+    parisc:Linux:*:* | hppa:Linux:*:*)
+	# Look for CPU level
+	case `grep '^cpu[^a-z]*:' /proc/cpuinfo 2>/dev/null | cut -d' ' -f2` in
+	  PA7*) echo hppa1.1-unknown-linux-gnu ;;
+	  PA8*) echo hppa2.0-unknown-linux-gnu ;;
+	  *)    echo hppa-unknown-linux-gnu ;;
+	esac
+	exit 0 ;;
+    parisc64:Linux:*:* | hppa64:Linux:*:*)
+	echo hppa64-unknown-linux-gnu
+	exit 0 ;;
+    s390:Linux:*:* | s390x:Linux:*:*)
+	echo ${UNAME_MACHINE}-ibm-linux
+	exit 0 ;;
+    sh*:Linux:*:*)
+	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	exit 0 ;;
+    sparc:Linux:*:* | sparc64:Linux:*:*)
+	echo ${UNAME_MACHINE}-unknown-linux-gnu
+	exit 0 ;;
+    x86_64:Linux:*:*)
+	echo x86_64-unknown-linux-gnu
+	exit 0 ;;
+    i*86:Linux:*:*)
+	# The BFD linker knows what the default object file format is, so
+	# first see if it will tell us. cd to the root directory to prevent
+	# problems with other programs or directories called `ld' in the path.
+	ld_supported_emulations=`cd /; ld --help 2>&1 \
+			 | sed -ne '/supported emulations:/!d
+				    s/[ 	][ 	]*/ /g
+				    s/.*supported emulations: *//
+				    s/ .*//
+				    p'`
+        case "$ld_supported_emulations" in
+	  i*86linux)
+		echo "${UNAME_MACHINE}-pc-linux-gnuaout"
+		exit 0
+		;;
+	  elf_i*86)
+		TENTATIVE="${UNAME_MACHINE}-pc-linux-gnu"
+		;;
+	  i*86coff)
+		echo "${UNAME_MACHINE}-pc-linux-gnucoff"
+		exit 0
+		;;
+	esac
+	# Either a pre-BFD a.out linker (linux-gnuoldld)
+	# or one that does not give us useful --help.
+	# GCC wants to distinguish between linux-gnuoldld and linux-gnuaout.
+	# If ld does not provide *any* "supported emulations:"
+	# that means it is gnuoldld.
+	test -z "$ld_supported_emulations" && echo "${UNAME_MACHINE}-pc-linux-gnuoldld" && exit 0
+	case "${UNAME_MACHINE}" in
+	i*86)
+	  VENDOR=pc;
+	  ;;
+	*)
+	  VENDOR=unknown;
+	  ;;
+	esac
+	# Determine whether the default compiler is a.out or elf
+	cat >$dummy.c <<EOF
+#include <features.h>
+#ifdef __cplusplus
+#include <stdio.h>  /* for printf() prototype */
+	int main (int argc, char *argv[]) {
+#else
+	int main (argc, argv) int argc; char *argv[]; {
+#endif
+#ifdef __ELF__
+# ifdef __GLIBC__
+#  if __GLIBC__ >= 2
+    printf ("%s-${VENDOR}-linux-gnu\n", argv[1]);
+#  else
+    printf ("%s-${VENDOR}-linux-gnulibc1\n", argv[1]);
+#  endif
+# else
+   printf ("%s-${VENDOR}-linux-gnulibc1\n", argv[1]);
+# endif
+#else
+  printf ("%s-${VENDOR}-linux-gnuaout\n", argv[1]);
+#endif
+  return 0;
+}
+EOF
+	$CC_FOR_BUILD $dummy.c -o $dummy 2>/dev/null && ./$dummy "${UNAME_MACHINE}" && rm -f $dummy.c $dummy && exit 0
+	rm -f $dummy.c $dummy
+	test x"${TENTATIVE}" != x && echo "${TENTATIVE}" && exit 0
+	;;
+# ptx 4.0 does uname -s correctly, with DYNIX/ptx in there.  earlier versions
+# are messed up and put the nodename in both sysname and nodename.
+    i*86:DYNIX/ptx:4*:*)
+	echo i386-sequent-sysv4
+	exit 0 ;;
+    i*86:UNIX_SV:4.2MP:2.*)
+        # Unixware is an offshoot of SVR4, but it has its own version
+        # number series starting with 2...
+        # I am not positive that other SVR4 systems won't match this,
+	# I just have to hope.  -- rms.
+        # Use sysv4.2uw... so that sysv4* matches it.
+	echo ${UNAME_MACHINE}-pc-sysv4.2uw${UNAME_VERSION}
+	exit 0 ;;
+    i*86:*:4.*:* | i*86:SYSTEM_V:4.*:*)
+	UNAME_REL=`echo ${UNAME_RELEASE} | sed 's/\/MP$//'`
+	if grep Novell /usr/include/link.h >/dev/null 2>/dev/null; then
+		echo ${UNAME_MACHINE}-univel-sysv${UNAME_REL}
+	else
+		echo ${UNAME_MACHINE}-pc-sysv${UNAME_REL}
+	fi
+	exit 0 ;;
+    i*86:*:5:7*)
+        # Fixed at (any) Pentium or better
+        UNAME_MACHINE=i586
+        if [ ${UNAME_SYSTEM} = "UnixWare" ] ; then
+	    echo ${UNAME_MACHINE}-sco-sysv${UNAME_RELEASE}uw${UNAME_VERSION}
+	else
+	    echo ${UNAME_MACHINE}-pc-sysv${UNAME_RELEASE}
+	fi
+	exit 0 ;;
+    i*86:*:3.2:*)
+	if test -f /usr/options/cb.name; then
+		UNAME_REL=`sed -n 's/.*Version //p' </usr/options/cb.name`
+		echo ${UNAME_MACHINE}-pc-isc$UNAME_REL
+	elif /bin/uname -X 2>/dev/null >/dev/null ; then
+		UNAME_REL=`(/bin/uname -X|egrep Release|sed -e 's/.*= //')`
+		(/bin/uname -X|egrep i80486 >/dev/null) && UNAME_MACHINE=i486
+		(/bin/uname -X|egrep '^Machine.*Pentium' >/dev/null) \
+			&& UNAME_MACHINE=i586
+		(/bin/uname -X|egrep '^Machine.*Pent ?II' >/dev/null) \
+			&& UNAME_MACHINE=i686
+		(/bin/uname -X|egrep '^Machine.*Pentium Pro' >/dev/null) \
+			&& UNAME_MACHINE=i686
+		echo ${UNAME_MACHINE}-pc-sco$UNAME_REL
+	else
+		echo ${UNAME_MACHINE}-pc-sysv32
+	fi
+	exit 0 ;;
+    i*86:*DOS:*:*)
+	echo ${UNAME_MACHINE}-pc-msdosdjgpp
+	exit 0 ;;
+    pc:*:*:*)
+	# Left here for compatibility:
+        # uname -m prints for DJGPP always 'pc', but it prints nothing about
+        # the processor, so we play safe by assuming i386.
+	echo i386-pc-msdosdjgpp
+        exit 0 ;;
+    Intel:Mach:3*:*)
+	echo i386-pc-mach3
+	exit 0 ;;
+    paragon:*:*:*)
+	echo i860-intel-osf1
+	exit 0 ;;
+    i860:*:4.*:*) # i860-SVR4
+	if grep Stardent /usr/include/sys/uadmin.h >/dev/null 2>&1 ; then
+	  echo i860-stardent-sysv${UNAME_RELEASE} # Stardent Vistra i860-SVR4
+	else # Add other i860-SVR4 vendors below as they are discovered.
+	  echo i860-unknown-sysv${UNAME_RELEASE}  # Unknown i860-SVR4
+	fi
+	exit 0 ;;
+    mini*:CTIX:SYS*5:*)
+	# "miniframe"
+	echo m68010-convergent-sysv
+	exit 0 ;;
+    M68*:*:R3V[567]*:*)
+	test -r /sysV68 && echo 'm68k-motorola-sysv' && exit 0 ;;
+    3[34]??:*:4.0:3.0 | 3[34]??A:*:4.0:3.0 | 3[34]??,*:*:4.0:3.0 | 4850:*:4.0:3.0)
+	OS_REL=''
+	test -r /etc/.relid \
+	&& OS_REL=.`sed -n 's/[^ ]* [^ ]* \([0-9][0-9]\).*/\1/p' < /etc/.relid`
+	/bin/uname -p 2>/dev/null | grep 86 >/dev/null \
+	  && echo i486-ncr-sysv4.3${OS_REL} && exit 0
+	/bin/uname -p 2>/dev/null | /bin/grep entium >/dev/null \
+	  && echo i586-ncr-sysv4.3${OS_REL} && exit 0 ;;
+    3[34]??:*:4.0:* | 3[34]??,*:*:4.0:*)
+        /bin/uname -p 2>/dev/null | grep 86 >/dev/null \
+          && echo i486-ncr-sysv4 && exit 0 ;;
+    m68*:LynxOS:2.*:* | m68*:LynxOS:3.0*:*)
+	echo m68k-unknown-lynxos${UNAME_RELEASE}
+	exit 0 ;;
+    mc68030:UNIX_System_V:4.*:*)
+	echo m68k-atari-sysv4
+	exit 0 ;;
+    i*86:LynxOS:2.*:* | i*86:LynxOS:3.[01]*:* | i*86:LynxOS:4.0*:*)
+	echo i386-unknown-lynxos${UNAME_RELEASE}
+	exit 0 ;;
+    TSUNAMI:LynxOS:2.*:*)
+	echo sparc-unknown-lynxos${UNAME_RELEASE}
+	exit 0 ;;
+    rs6000:LynxOS:2.*:*)
+	echo rs6000-unknown-lynxos${UNAME_RELEASE}
+	exit 0 ;;
+    PowerPC:LynxOS:2.*:* | PowerPC:LynxOS:3.[01]*:* | PowerPC:LynxOS:4.0*:*)
+	echo powerpc-unknown-lynxos${UNAME_RELEASE}
+	exit 0 ;;
+    SM[BE]S:UNIX_SV:*:*)
+	echo mips-dde-sysv${UNAME_RELEASE}
+	exit 0 ;;
+    RM*:ReliantUNIX-*:*:*)
+	echo mips-sni-sysv4
+	exit 0 ;;
+    RM*:SINIX-*:*:*)
+	echo mips-sni-sysv4
+	exit 0 ;;
+    *:SINIX-*:*:*)
+	if uname -p 2>/dev/null >/dev/null ; then
+		UNAME_MACHINE=`(uname -p) 2>/dev/null`
+		echo ${UNAME_MACHINE}-sni-sysv4
+	else
+		echo ns32k-sni-sysv
+	fi
+	exit 0 ;;
+    PENTIUM:CPunix:4.0*:*) # Unisys `ClearPath HMP IX 4000' SVR4/MP effort
+                           # says <Richard.M.Bartel@ccMail.Census.GOV>
+        echo i586-unisys-sysv4
+        exit 0 ;;
+    *:UNIX_System_V:4*:FTX*)
+	# From Gerald Hewes <hewes@openmarket.com>.
+	# How about differentiating between stratus architectures? -djm
+	echo hppa1.1-stratus-sysv4
+	exit 0 ;;
+    *:*:*:FTX*)
+	# From seanf@swdc.stratus.com.
+	echo i860-stratus-sysv4
+	exit 0 ;;
+    mc68*:A/UX:*:*)
+	echo m68k-apple-aux${UNAME_RELEASE}
+	exit 0 ;;
+    news*:NEWS-OS:6*:*)
+	echo mips-sony-newsos6
+	exit 0 ;;
+    R[34]000:*System_V*:*:* | R4000:UNIX_SYSV:*:* | R*000:UNIX_SV:*:*)
+	if [ -d /usr/nec ]; then
+	        echo mips-nec-sysv${UNAME_RELEASE}
+	else
+	        echo mips-unknown-sysv${UNAME_RELEASE}
+	fi
+        exit 0 ;;
+    BeBox:BeOS:*:*)	# BeOS running on hardware made by Be, PPC only.
+	echo powerpc-be-beos
+	exit 0 ;;
+    BeMac:BeOS:*:*)	# BeOS running on Mac or Mac clone, PPC only.
+	echo powerpc-apple-beos
+	exit 0 ;;
+    BePC:BeOS:*:*)	# BeOS running on Intel PC compatible.
+	echo i586-pc-beos
+	exit 0 ;;
+    SX-4:SUPER-UX:*:*)
+	echo sx4-nec-superux${UNAME_RELEASE}
+	exit 0 ;;
+    SX-5:SUPER-UX:*:*)
+	echo sx5-nec-superux${UNAME_RELEASE}
+	exit 0 ;;
+    Power*:Rhapsody:*:*)
+	echo powerpc-apple-rhapsody${UNAME_RELEASE}
+	exit 0 ;;
+    *:Rhapsody:*:*)
+	echo ${UNAME_MACHINE}-apple-rhapsody${UNAME_RELEASE}
+	exit 0 ;;
+    *:Darwin:*:*)
+	echo `uname -p`-apple-darwin${UNAME_RELEASE}
+	exit 0 ;;
+    *:procnto*:*:* | *:QNX:[0123456789]*:*)
+	if test "${UNAME_MACHINE}" = "x86pc"; then
+		UNAME_MACHINE=pc
+	fi
+	echo `uname -p`-${UNAME_MACHINE}-nto-qnx
+	exit 0 ;;
+    *:QNX:*:4*)
+	echo i386-pc-qnx
+	exit 0 ;;
+    NSR-[KW]:NONSTOP_KERNEL:*:*)
+	echo nsr-tandem-nsk${UNAME_RELEASE}
+	exit 0 ;;
+    *:NonStop-UX:*:*)
+	echo mips-compaq-nonstopux
+	exit 0 ;;
+    BS2000:POSIX*:*:*)
+	echo bs2000-siemens-sysv
+	exit 0 ;;
+    DS/*:UNIX_System_V:*:*)
+	echo ${UNAME_MACHINE}-${UNAME_SYSTEM}-${UNAME_RELEASE}
+	exit 0 ;;
+    *:Plan9:*:*)
+	# "uname -m" is not consistent, so use $cputype instead. 386
+	# is converted to i386 for consistency with other x86
+	# operating systems.
+	if test "$cputype" = "386"; then
+	    UNAME_MACHINE=i386
+	else
+	    UNAME_MACHINE="$cputype"
+	fi
+	echo ${UNAME_MACHINE}-unknown-plan9
+	exit 0 ;;
+    i*86:OS/2:*:*)
+	# If we were able to find `uname', then EMX Unix compatibility
+	# is probably installed.
+	echo ${UNAME_MACHINE}-pc-os2-emx
+	exit 0 ;;
+    *:TOPS-10:*:*)
+	echo pdp10-unknown-tops10
+	exit 0 ;;
+    *:TENEX:*:*)
+	echo pdp10-unknown-tenex
+	exit 0 ;;
+    KS10:TOPS-20:*:* | KL10:TOPS-20:*:* | TYPE4:TOPS-20:*:*)
+	echo pdp10-dec-tops20
+	exit 0 ;;
+    XKL-1:TOPS-20:*:* | TYPE5:TOPS-20:*:*)
+	echo pdp10-xkl-tops20
+	exit 0 ;;
+    *:TOPS-20:*:*)
+	echo pdp10-unknown-tops20
+	exit 0 ;;
+    *:ITS:*:*)
+	echo pdp10-unknown-its
+	exit 0 ;;
+esac
+
+#echo '(No uname command or uname output not recognized.)' 1>&2
+#echo "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" 1>&2
+
+cat >$dummy.c <<EOF
+#ifdef _SEQUENT_
+# include <sys/types.h>
+# include <sys/utsname.h>
+#endif
+main ()
+{
+#if defined (sony)
+#if defined (MIPSEB)
+  /* BFD wants "bsd" instead of "newsos".  Perhaps BFD should be changed,
+     I don't know....  */
+  printf ("mips-sony-bsd\n"); exit (0);
+#else
+#include <sys/param.h>
+  printf ("m68k-sony-newsos%s\n",
+#ifdef NEWSOS4
+          "4"
+#else
+	  ""
+#endif
+         ); exit (0);
+#endif
+#endif
+
+#if defined (__arm) && defined (__acorn) && defined (__unix)
+  printf ("arm-acorn-riscix"); exit (0);
+#endif
+
+#if defined (hp300) && !defined (hpux)
+  printf ("m68k-hp-bsd\n"); exit (0);
+#endif
+
+#if defined (NeXT)
+#if !defined (__ARCHITECTURE__)
+#define __ARCHITECTURE__ "m68k"
+#endif
+  int version;
+  version=`(hostinfo | sed -n 's/.*NeXT Mach \([0-9]*\).*/\1/p') 2>/dev/null`;
+  if (version < 4)
+    printf ("%s-next-nextstep%d\n", __ARCHITECTURE__, version);
+  else
+    printf ("%s-next-openstep%d\n", __ARCHITECTURE__, version);
+  exit (0);
+#endif
+
+#if defined (MULTIMAX) || defined (n16)
+#if defined (UMAXV)
+  printf ("ns32k-encore-sysv\n"); exit (0);
+#else
+#if defined (CMU)
+  printf ("ns32k-encore-mach\n"); exit (0);
+#else
+  printf ("ns32k-encore-bsd\n"); exit (0);
+#endif
+#endif
+#endif
+
+#if defined (__386BSD__)
+  printf ("i386-pc-bsd\n"); exit (0);
+#endif
+
+#if defined (sequent)
+#if defined (i386)
+  printf ("i386-sequent-dynix\n"); exit (0);
+#endif
+#if defined (ns32000)
+  printf ("ns32k-sequent-dynix\n"); exit (0);
+#endif
+#endif
+
+#if defined (_SEQUENT_)
+    struct utsname un;
+
+    uname(&un);
+
+    if (strncmp(un.version, "V2", 2) == 0) {
+	printf ("i386-sequent-ptx2\n"); exit (0);
+    }
+    if (strncmp(un.version, "V1", 2) == 0) { /* XXX is V1 correct? */
+	printf ("i386-sequent-ptx1\n"); exit (0);
+    }
+    printf ("i386-sequent-ptx\n"); exit (0);
+
+#endif
+
+#if defined (vax)
+# if !defined (ultrix)
+#  include <sys/param.h>
+#  if defined (BSD)
+#   if BSD == 43
+      printf ("vax-dec-bsd4.3\n"); exit (0);
+#   else
+#    if BSD == 199006
+      printf ("vax-dec-bsd4.3reno\n"); exit (0);
+#    else
+      printf ("vax-dec-bsd\n"); exit (0);
+#    endif
+#   endif
+#  else
+    printf ("vax-dec-bsd\n"); exit (0);
+#  endif
+# else
+    printf ("vax-dec-ultrix\n"); exit (0);
+# endif
+#endif
+
+#if defined (alliant) && defined (i860)
+  printf ("i860-alliant-bsd\n"); exit (0);
+#endif
+
+  exit (1);
+}
+EOF
+
+$CC_FOR_BUILD $dummy.c -o $dummy 2>/dev/null && ./$dummy && rm -f $dummy.c $dummy && exit 0
+rm -f $dummy.c $dummy
+
+# Apollos put the system type in the environment.
+
+test -d /usr/apollo && { echo ${ISP}-apollo-${SYSTYPE}; exit 0; }
+
+# Convex versions that predate uname can use getsysinfo(1)
+
+if [ -x /usr/convex/getsysinfo ]
+then
+    case `getsysinfo -f cpu_type` in
+    c1*)
+	echo c1-convex-bsd
+	exit 0 ;;
+    c2*)
+	if getsysinfo -f scalar_acc
+	then echo c32-convex-bsd
+	else echo c2-convex-bsd
+	fi
+	exit 0 ;;
+    c34*)
+	echo c34-convex-bsd
+	exit 0 ;;
+    c38*)
+	echo c38-convex-bsd
+	exit 0 ;;
+    c4*)
+	echo c4-convex-bsd
+	exit 0 ;;
+    esac
+fi
+
+cat >&2 <<EOF
+$0: unable to guess system type
+
+This script, last modified $timestamp, has failed to recognize
+the operating system you are using. It is advised that you
+download the most up to date version of the config scripts from
+
+    ftp://ftp.gnu.org/pub/gnu/config/
+
+If the version you run ($0) is already up to date, please
+send the following data and any information you think might be
+pertinent to <config-patches@gnu.org> in order to provide the needed
+information to handle your system.
+
+config.guess timestamp = $timestamp
+
+uname -m = `(uname -m) 2>/dev/null || echo unknown`
+uname -r = `(uname -r) 2>/dev/null || echo unknown`
+uname -s = `(uname -s) 2>/dev/null || echo unknown`
+uname -v = `(uname -v) 2>/dev/null || echo unknown`
+
+/usr/bin/uname -p = `(/usr/bin/uname -p) 2>/dev/null`
+/bin/uname -X     = `(/bin/uname -X) 2>/dev/null`
+
+hostinfo               = `(hostinfo) 2>/dev/null`
+/bin/universe          = `(/bin/universe) 2>/dev/null`
+/usr/bin/arch -k       = `(/usr/bin/arch -k) 2>/dev/null`
+/bin/arch              = `(/bin/arch) 2>/dev/null`
+/usr/bin/oslevel       = `(/usr/bin/oslevel) 2>/dev/null`
+/usr/convex/getsysinfo = `(/usr/convex/getsysinfo) 2>/dev/null`
+
+UNAME_MACHINE = ${UNAME_MACHINE}
+UNAME_RELEASE = ${UNAME_RELEASE}
+UNAME_SYSTEM  = ${UNAME_SYSTEM}
+UNAME_VERSION = ${UNAME_VERSION}
+EOF
+
+exit 1
+
+# Local variables:
+# eval: (add-hook 'write-file-hooks 'time-stamp)
+# time-stamp-start: "timestamp='"
+# time-stamp-format: "%:y-%02m-%02d"
+# time-stamp-end: "'"
+# End:
diff -Naur gd-2.0.1/config.sub gd-2.0.1.patched/config.sub
--- gd-2.0.1/config.sub	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/config.sub	Tue Jul 30 05:38:59 2002
@@ -0,0 +1,1362 @@
+#! /bin/sh
+# Configuration validation subroutine script.
+#   Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001
+#   Free Software Foundation, Inc.
+
+timestamp='2001-04-20'
+
+# This file is (in principle) common to ALL GNU software.
+# The presence of a machine in this file suggests that SOME GNU software
+# can handle that machine.  It does not imply ALL GNU software can.
+#
+# This file is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place - Suite 330,
+# Boston, MA 02111-1307, USA.
+
+# As a special exception to the GNU General Public License, if you
+# distribute this file as part of a program that contains a
+# configuration script generated by Autoconf, you may include it under
+# the same distribution terms that you use for the rest of that program.
+
+# Please send patches to <config-patches@gnu.org>.
+#
+# Configuration subroutine to validate and canonicalize a configuration type.
+# Supply the specified configuration type as an argument.
+# If it is invalid, we print an error message on stderr and exit with code 1.
+# Otherwise, we print the canonical config type on stdout and succeed.
+
+# This file is supposed to be the same for all GNU packages
+# and recognize all the CPU types, system types and aliases
+# that are meaningful with *any* GNU software.
+# Each package is responsible for reporting which valid configurations
+# it does not support.  The user should be able to distinguish
+# a failure to support a valid configuration from a meaningless
+# configuration.
+
+# The goal of this file is to map all the various variations of a given
+# machine specification into a single specification in the form:
+#	CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM
+# or in some cases, the newer four-part form:
+#	CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM
+# It is wrong to echo any other type of specification.
+
+me=`echo "$0" | sed -e 's,.*/,,'`
+
+usage="\
+Usage: $0 [OPTION] CPU-MFR-OPSYS
+       $0 [OPTION] ALIAS
+
+Canonicalize a configuration name.
+
+Operation modes:
+  -h, --help         print this help, then exit
+  -t, --time-stamp   print date of last modification, then exit
+  -v, --version      print version number, then exit
+
+Report bugs and patches to <config-patches@gnu.org>."
+
+version="\
+GNU config.sub ($timestamp)
+
+Copyright (C) 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001
+Free Software Foundation, Inc.
+
+This is free software; see the source for copying conditions.  There is NO
+warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."
+
+help="
+Try \`$me --help' for more information."
+
+# Parse command line
+while test $# -gt 0 ; do
+  case $1 in
+    --time-stamp | --time* | -t )
+       echo "$timestamp" ; exit 0 ;;
+    --version | -v )
+       echo "$version" ; exit 0 ;;
+    --help | --h* | -h )
+       echo "$usage"; exit 0 ;;
+    -- )     # Stop option processing
+       shift; break ;;
+    - )	# Use stdin as input.
+       break ;;
+    -* )
+       echo "$me: invalid option $1$help"
+       exit 1 ;;
+
+    *local*)
+       # First pass through any local machine types.
+       echo $1
+       exit 0;;
+
+    * )
+       break ;;
+  esac
+done
+
+case $# in
+ 0) echo "$me: missing argument$help" >&2
+    exit 1;;
+ 1) ;;
+ *) echo "$me: too many arguments$help" >&2
+    exit 1;;
+esac
+
+# Separate what the user gave into CPU-COMPANY and OS or KERNEL-OS (if any).
+# Here we must recognize all the valid KERNEL-OS combinations.
+maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
+case $maybe_os in
+  nto-qnx* | linux-gnu* | storm-chaos* | os2-emx*)
+    os=-$maybe_os
+    basic_machine=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\1/'`
+    ;;
+  *)
+    basic_machine=`echo $1 | sed 's/-[^-]*$//'`
+    if [ $basic_machine != $1 ]
+    then os=`echo $1 | sed 's/.*-/-/'`
+    else os=; fi
+    ;;
+esac
+
+### Let's recognize common machines as not being operating systems so
+### that things like config.sub decstation-3100 work.  We also
+### recognize some manufacturers as not being operating systems, so we
+### can provide default operating systems below.
+case $os in
+	-sun*os*)
+		# Prevent following clause from handling this invalid input.
+		;;
+	-dec* | -mips* | -sequent* | -encore* | -pc532* | -sgi* | -sony* | \
+	-att* | -7300* | -3300* | -delta* | -motorola* | -sun[234]* | \
+	-unicom* | -ibm* | -next | -hp | -isi* | -apollo | -altos* | \
+	-convergent* | -ncr* | -news | -32* | -3600* | -3100* | -hitachi* |\
+	-c[123]* | -convex* | -sun | -crds | -omron* | -dg | -ultra | -tti* | \
+	-harris | -dolphin | -highlevel | -gould | -cbm | -ns | -masscomp | \
+	-apple | -axis)
+		os=
+		basic_machine=$1
+		;;
+	-sim | -cisco | -oki | -wec | -winbond)
+		os=
+		basic_machine=$1
+		;;
+	-scout)
+		;;
+	-wrs)
+		os=-vxworks
+		basic_machine=$1
+		;;
+	-hiux*)
+		os=-hiuxwe2
+		;;
+	-sco5)
+		os=-sco3.2v5
+		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+		;;
+	-sco4)
+		os=-sco3.2v4
+		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+		;;
+	-sco3.2.[4-9]*)
+		os=`echo $os | sed -e 's/sco3.2./sco3.2v/'`
+		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+		;;
+	-sco3.2v[4-9]*)
+		# Don't forget version if it is 3.2v4 or newer.
+		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+		;;
+	-sco*)
+		os=-sco3.2v2
+		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+		;;
+	-udk*)
+		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+		;;
+	-isc)
+		os=-isc2.2
+		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+		;;
+	-clix*)
+		basic_machine=clipper-intergraph
+		;;
+	-isc*)
+		basic_machine=`echo $1 | sed -e 's/86-.*/86-pc/'`
+		;;
+	-lynx*)
+		os=-lynxos
+		;;
+	-ptx*)
+		basic_machine=`echo $1 | sed -e 's/86-.*/86-sequent/'`
+		;;
+	-windowsnt*)
+		os=`echo $os | sed -e 's/windowsnt/winnt/'`
+		;;
+	-psos*)
+		os=-psos
+		;;
+	-mint | -mint[0-9]*)
+		basic_machine=m68k-atari
+		os=-mint
+		;;
+esac
+
+# Decode aliases for certain CPU-COMPANY combinations.
+case $basic_machine in
+	# Recognize the basic CPU types without company name.
+	# Some are omitted here because they have special meanings below.
+	tahoe | i860 | ia64 | m32r | m68k | m68000 | m88k | ns32k | arc \
+	        | arm | arme[lb] | arm[bl]e | armv[2345] | armv[345][lb] | strongarm | xscale \
+		| pyramid | mn10200 | mn10300 | tron | a29k \
+		| 580 | i960 | h8300 \
+		| x86 | ppcbe | mipsbe | mipsle | shbe | shle \
+		| hppa | hppa1.0 | hppa1.1 | hppa2.0 | hppa2.0w | hppa2.0n \
+		| hppa64 \
+		| alpha | alphaev[4-8] | alphaev56 | alphapca5[67] \
+		| alphaev6[78] \
+		| we32k | ns16k | clipper | i370 | sh | sh[34] \
+		| powerpc | powerpcle \
+		| 1750a | dsp16xx | pdp10 | pdp11 \
+		| mips16 | mips64 | mipsel | mips64el \
+		| mips64orion | mips64orionel | mipstx39 | mipstx39el \
+		| mips64vr4300 | mips64vr4300el | mips64vr4100 | mips64vr4100el \
+		| mips64vr5000 | miprs64vr5000el | mcore | s390 | s390x \
+		| sparc | sparclet | sparclite | sparc64 | sparcv9 | sparcv9b \
+		| v850 | c4x \
+		| thumb | d10v | d30v | fr30 | avr | openrisc | tic80 \
+		| pj | pjl | h8500)
+		basic_machine=$basic_machine-unknown
+		;;
+	m6811 | m68hc11 | m6812 | m68hc12)
+		# Motorola 68HC11/12.
+		basic_machine=$basic_machine-unknown
+		os=-none
+		;;
+	m88110 | m680[12346]0 | m683?2 | m68360 | m5200 | z8k | v70 | w65)
+		;;
+
+	# We use `pc' rather than `unknown'
+	# because (1) that's what they normally are, and
+	# (2) the word "unknown" tends to confuse beginning users.
+	i*86 | x86_64)
+	  basic_machine=$basic_machine-pc
+	  ;;
+	# Object if more than one company name word.
+	*-*-*)
+		echo Invalid configuration \`$1\': machine \`$basic_machine\' not recognized 1>&2
+		exit 1
+		;;
+	# Recognize the basic CPU types with company name.
+	# FIXME: clean up the formatting here.
+	vax-* | tahoe-* | i*86-* | i860-* | ia64-* | m32r-* | m68k-* | m68000-* \
+	      | m88k-* | sparc-* | ns32k-* | fx80-* | arc-* | c[123]* \
+	      | arm-*  | armbe-* | armle-* | armv*-* | strongarm-* | xscale-* \
+	      | mips-* | pyramid-* | tron-* | a29k-* | romp-* | rs6000-* \
+	      | power-* | none-* | 580-* | cray2-* | h8300-* | h8500-* | i960-* \
+	      | xmp-* | ymp-* \
+	      | x86-* | ppcbe-* | mipsbe-* | mipsle-* | shbe-* | shle-* \
+	      | hppa-* | hppa1.0-* | hppa1.1-* | hppa2.0-* | hppa2.0w-* \
+	      | hppa2.0n-* | hppa64-* \
+	      | alpha-* | alphaev[4-8]-* | alphaev56-* | alphapca5[67]-* \
+	      | alphaev6[78]-* \
+	      | we32k-* | cydra-* | ns16k-* | pn-* | np1-* | xps100-* \
+	      | clipper-* | orion-* \
+	      | sparclite-* | pdp10-* | pdp11-* | sh-* | powerpc-* | powerpcle-* \
+	      | sparc64-* | sparcv9-* | sparcv9b-* | sparc86x-* \
+	      | mips16-* | mips64-* | mipsel-* \
+	      | mips64el-* | mips64orion-* | mips64orionel-* \
+	      | mips64vr4100-* | mips64vr4100el-* | mips64vr4300-* | mips64vr4300el-* \
+	      | mipstx39-* | mipstx39el-* | mcore-* \
+	      | f30[01]-* | f700-* | s390-* | s390x-* | sv1-* | t3e-* \
+	      | [cjt]90-* \
+	      | m88110-* | m680[01234]0-* | m683?2-* | m68360-* | z8k-* | d10v-* \
+	      | thumb-* | v850-* | d30v-* | tic30-* | tic80-* | c30-* | fr30-* \
+	      | bs2000-* | tic54x-* | c54x-* | x86_64-* | pj-* | pjl-*)
+		;;
+	# Recognize the various machine names and aliases which stand
+	# for a CPU type and a company and sometimes even an OS.
+	386bsd)
+		basic_machine=i386-unknown
+		os=-bsd
+		;;
+	3b1 | 7300 | 7300-att | att-7300 | pc7300 | safari | unixpc)
+		basic_machine=m68000-att
+		;;
+	3b*)
+		basic_machine=we32k-att
+		;;
+	a29khif)
+		basic_machine=a29k-amd
+		os=-udi
+		;;
+	adobe68k)
+		basic_machine=m68010-adobe
+		os=-scout
+		;;
+	alliant | fx80)
+		basic_machine=fx80-alliant
+		;;
+	altos | altos3068)
+		basic_machine=m68k-altos
+		;;
+	am29k)
+		basic_machine=a29k-none
+		os=-bsd
+		;;
+	amdahl)
+		basic_machine=580-amdahl
+		os=-sysv
+		;;
+	amiga | amiga-*)
+		basic_machine=m68k-unknown
+		;;
+	amigaos | amigados)
+		basic_machine=m68k-unknown
+		os=-amigaos
+		;;
+	amigaunix | amix)
+		basic_machine=m68k-unknown
+		os=-sysv4
+		;;
+	apollo68)
+		basic_machine=m68k-apollo
+		os=-sysv
+		;;
+	apollo68bsd)
+		basic_machine=m68k-apollo
+		os=-bsd
+		;;
+	aux)
+		basic_machine=m68k-apple
+		os=-aux
+		;;
+	balance)
+		basic_machine=ns32k-sequent
+		os=-dynix
+		;;
+	convex-c1)
+		basic_machine=c1-convex
+		os=-bsd
+		;;
+	convex-c2)
+		basic_machine=c2-convex
+		os=-bsd
+		;;
+	convex-c32)
+		basic_machine=c32-convex
+		os=-bsd
+		;;
+	convex-c34)
+		basic_machine=c34-convex
+		os=-bsd
+		;;
+	convex-c38)
+		basic_machine=c38-convex
+		os=-bsd
+		;;
+	cray | ymp)
+		basic_machine=ymp-cray
+		os=-unicos
+		;;
+	cray2)
+		basic_machine=cray2-cray
+		os=-unicos
+		;;
+	[cjt]90)
+		basic_machine=${basic_machine}-cray
+		os=-unicos
+		;;
+	crds | unos)
+		basic_machine=m68k-crds
+		;;
+	cris | cris-* | etrax*)
+		basic_machine=cris-axis
+		;;
+	da30 | da30-*)
+		basic_machine=m68k-da30
+		;;
+	decstation | decstation-3100 | pmax | pmax-* | pmin | dec3100 | decstatn)
+		basic_machine=mips-dec
+		;;
+	delta | 3300 | motorola-3300 | motorola-delta \
+	      | 3300-motorola | delta-motorola)
+		basic_machine=m68k-motorola
+		;;
+	delta88)
+		basic_machine=m88k-motorola
+		os=-sysv3
+		;;
+	dpx20 | dpx20-*)
+		basic_machine=rs6000-bull
+		os=-bosx
+		;;
+	dpx2* | dpx2*-bull)
+		basic_machine=m68k-bull
+		os=-sysv3
+		;;
+	ebmon29k)
+		basic_machine=a29k-amd
+		os=-ebmon
+		;;
+	elxsi)
+		basic_machine=elxsi-elxsi
+		os=-bsd
+		;;
+	encore | umax | mmax)
+		basic_machine=ns32k-encore
+		;;
+	es1800 | OSE68k | ose68k | ose | OSE)
+		basic_machine=m68k-ericsson
+		os=-ose
+		;;
+	fx2800)
+		basic_machine=i860-alliant
+		;;
+	genix)
+		basic_machine=ns32k-ns
+		;;
+	gmicro)
+		basic_machine=tron-gmicro
+		os=-sysv
+		;;
+	go32)
+		basic_machine=i386-pc
+		os=-go32
+		;;
+	h3050r* | hiux*)
+		basic_machine=hppa1.1-hitachi
+		os=-hiuxwe2
+		;;
+	h8300hms)
+		basic_machine=h8300-hitachi
+		os=-hms
+		;;
+	h8300xray)
+		basic_machine=h8300-hitachi
+		os=-xray
+		;;
+	h8500hms)
+		basic_machine=h8500-hitachi
+		os=-hms
+		;;
+	harris)
+		basic_machine=m88k-harris
+		os=-sysv3
+		;;
+	hp300-*)
+		basic_machine=m68k-hp
+		;;
+	hp300bsd)
+		basic_machine=m68k-hp
+		os=-bsd
+		;;
+	hp300hpux)
+		basic_machine=m68k-hp
+		os=-hpux
+		;;
+	hp3k9[0-9][0-9] | hp9[0-9][0-9])
+		basic_machine=hppa1.0-hp
+		;;
+	hp9k2[0-9][0-9] | hp9k31[0-9])
+		basic_machine=m68000-hp
+		;;
+	hp9k3[2-9][0-9])
+		basic_machine=m68k-hp
+		;;
+	hp9k6[0-9][0-9] | hp6[0-9][0-9])
+		basic_machine=hppa1.0-hp
+		;;
+	hp9k7[0-79][0-9] | hp7[0-79][0-9])
+		basic_machine=hppa1.1-hp
+		;;
+	hp9k78[0-9] | hp78[0-9])
+		# FIXME: really hppa2.0-hp
+		basic_machine=hppa1.1-hp
+		;;
+	hp9k8[67]1 | hp8[67]1 | hp9k80[24] | hp80[24] | hp9k8[78]9 | hp8[78]9 | hp9k893 | hp893)
+		# FIXME: really hppa2.0-hp
+		basic_machine=hppa1.1-hp
+		;;
+	hp9k8[0-9][13679] | hp8[0-9][13679])
+		basic_machine=hppa1.1-hp
+		;;
+	hp9k8[0-9][0-9] | hp8[0-9][0-9])
+		basic_machine=hppa1.0-hp
+		;;
+	hppa-next)
+		os=-nextstep3
+		;;
+	hppaosf)
+		basic_machine=hppa1.1-hp
+		os=-osf
+		;;
+	hppro)
+		basic_machine=hppa1.1-hp
+		os=-proelf
+		;;
+	i370-ibm* | ibm*)
+		basic_machine=i370-ibm
+		;;
+# I'm not sure what "Sysv32" means.  Should this be sysv3.2?
+	i*86v32)
+		basic_machine=`echo $1 | sed -e 's/86.*/86-pc/'`
+		os=-sysv32
+		;;
+	i*86v4*)
+		basic_machine=`echo $1 | sed -e 's/86.*/86-pc/'`
+		os=-sysv4
+		;;
+	i*86v)
+		basic_machine=`echo $1 | sed -e 's/86.*/86-pc/'`
+		os=-sysv
+		;;
+	i*86sol2)
+		basic_machine=`echo $1 | sed -e 's/86.*/86-pc/'`
+		os=-solaris2
+		;;
+	i386mach)
+		basic_machine=i386-mach
+		os=-mach
+		;;
+	i386-vsta | vsta)
+		basic_machine=i386-unknown
+		os=-vsta
+		;;
+	iris | iris4d)
+		basic_machine=mips-sgi
+		case $os in
+		    -irix*)
+			;;
+		    *)
+			os=-irix4
+			;;
+		esac
+		;;
+	isi68 | isi)
+		basic_machine=m68k-isi
+		os=-sysv
+		;;
+	m88k-omron*)
+		basic_machine=m88k-omron
+		;;
+	magnum | m3230)
+		basic_machine=mips-mips
+		os=-sysv
+		;;
+	merlin)
+		basic_machine=ns32k-utek
+		os=-sysv
+		;;
+	mingw32)
+		basic_machine=i386-pc
+		os=-mingw32
+		;;
+	miniframe)
+		basic_machine=m68000-convergent
+		;;
+	*mint | -mint[0-9]* | *MiNT | *MiNT[0-9]*)
+		basic_machine=m68k-atari
+		os=-mint
+		;;
+	mipsel*-linux*)
+		basic_machine=mipsel-unknown
+		os=-linux-gnu
+		;;
+	mips*-linux*)
+		basic_machine=mips-unknown
+		os=-linux-gnu
+		;;
+	mips3*-*)
+		basic_machine=`echo $basic_machine | sed -e 's/mips3/mips64/'`
+		;;
+	mips3*)
+		basic_machine=`echo $basic_machine | sed -e 's/mips3/mips64/'`-unknown
+		;;
+	mmix*)
+		basic_machine=mmix-knuth
+		os=-mmixware
+		;;
+	monitor)
+		basic_machine=m68k-rom68k
+		os=-coff
+		;;
+	msdos)
+		basic_machine=i386-pc
+		os=-msdos
+		;;
+	mvs)
+		basic_machine=i370-ibm
+		os=-mvs
+		;;
+	ncr3000)
+		basic_machine=i486-ncr
+		os=-sysv4
+		;;
+	netbsd386)
+		basic_machine=i386-unknown
+		os=-netbsd
+		;;
+	netwinder)
+		basic_machine=armv4l-rebel
+		os=-linux
+		;;
+	news | news700 | news800 | news900)
+		basic_machine=m68k-sony
+		os=-newsos
+		;;
+	news1000)
+		basic_machine=m68030-sony
+		os=-newsos
+		;;
+	news-3600 | risc-news)
+		basic_machine=mips-sony
+		os=-newsos
+		;;
+	necv70)
+		basic_machine=v70-nec
+		os=-sysv
+		;;
+	next | m*-next )
+		basic_machine=m68k-next
+		case $os in
+		    -nextstep* )
+			;;
+		    -ns2*)
+		      os=-nextstep2
+			;;
+		    *)
+		      os=-nextstep3
+			;;
+		esac
+		;;
+	nh3000)
+		basic_machine=m68k-harris
+		os=-cxux
+		;;
+	nh[45]000)
+		basic_machine=m88k-harris
+		os=-cxux
+		;;
+	nindy960)
+		basic_machine=i960-intel
+		os=-nindy
+		;;
+	mon960)
+		basic_machine=i960-intel
+		os=-mon960
+		;;
+	nonstopux)
+		basic_machine=mips-compaq
+		os=-nonstopux
+		;;
+	np1)
+		basic_machine=np1-gould
+		;;
+	nsr-tandem)
+		basic_machine=nsr-tandem
+		;;
+	op50n-* | op60c-*)
+		basic_machine=hppa1.1-oki
+		os=-proelf
+		;;
+	OSE68000 | ose68000)
+		basic_machine=m68000-ericsson
+		os=-ose
+		;;
+	os68k)
+		basic_machine=m68k-none
+		os=-os68k
+		;;
+	pa-hitachi)
+		basic_machine=hppa1.1-hitachi
+		os=-hiuxwe2
+		;;
+	paragon)
+		basic_machine=i860-intel
+		os=-osf
+		;;
+	pbd)
+		basic_machine=sparc-tti
+		;;
+	pbb)
+		basic_machine=m68k-tti
+		;;
+        pc532 | pc532-*)
+		basic_machine=ns32k-pc532
+		;;
+	pentium | p5 | k5 | k6 | nexgen)
+		basic_machine=i586-pc
+		;;
+	pentiumpro | p6 | 6x86 | athlon)
+		basic_machine=i686-pc
+		;;
+	pentiumii | pentium2)
+		basic_machine=i686-pc
+		;;
+	pentium-* | p5-* | k5-* | k6-* | nexgen-*)
+		basic_machine=i586-`echo $basic_machine | sed 's/^[^-]*-//'`
+		;;
+	pentiumpro-* | p6-* | 6x86-* | athlon-*)
+		basic_machine=i686-`echo $basic_machine | sed 's/^[^-]*-//'`
+		;;
+	pentiumii-* | pentium2-*)
+		basic_machine=i686-`echo $basic_machine | sed 's/^[^-]*-//'`
+		;;
+	pn)
+		basic_machine=pn-gould
+		;;
+	power)	basic_machine=power-ibm
+		;;
+	ppc)	basic_machine=powerpc-unknown
+	        ;;
+	ppc-*)	basic_machine=powerpc-`echo $basic_machine | sed 's/^[^-]*-//'`
+		;;
+	ppcle | powerpclittle | ppc-le | powerpc-little)
+		basic_machine=powerpcle-unknown
+	        ;;
+	ppcle-* | powerpclittle-*)
+		basic_machine=powerpcle-`echo $basic_machine | sed 's/^[^-]*-//'`
+		;;
+	ps2)
+		basic_machine=i386-ibm
+		;;
+	pw32)
+		basic_machine=i586-unknown
+		os=-pw32
+		;;
+	rom68k)
+		basic_machine=m68k-rom68k
+		os=-coff
+		;;
+	rm[46]00)
+		basic_machine=mips-siemens
+		;;
+	rtpc | rtpc-*)
+		basic_machine=romp-ibm
+		;;
+	sa29200)
+		basic_machine=a29k-amd
+		os=-udi
+		;;
+	sequent)
+		basic_machine=i386-sequent
+		;;
+	sh)
+		basic_machine=sh-hitachi
+		os=-hms
+		;;
+	sparclite-wrs)
+		basic_machine=sparclite-wrs
+		os=-vxworks
+		;;
+	sps7)
+		basic_machine=m68k-bull
+		os=-sysv2
+		;;
+	spur)
+		basic_machine=spur-unknown
+		;;
+	st2000)
+		basic_machine=m68k-tandem
+		;;
+	stratus)
+		basic_machine=i860-stratus
+		os=-sysv4
+		;;
+	sun2)
+		basic_machine=m68000-sun
+		;;
+	sun2os3)
+		basic_machine=m68000-sun
+		os=-sunos3
+		;;
+	sun2os4)
+		basic_machine=m68000-sun
+		os=-sunos4
+		;;
+	sun3os3)
+		basic_machine=m68k-sun
+		os=-sunos3
+		;;
+	sun3os4)
+		basic_machine=m68k-sun
+		os=-sunos4
+		;;
+	sun4os3)
+		basic_machine=sparc-sun
+		os=-sunos3
+		;;
+	sun4os4)
+		basic_machine=sparc-sun
+		os=-sunos4
+		;;
+	sun4sol2)
+		basic_machine=sparc-sun
+		os=-solaris2
+		;;
+	sun3 | sun3-*)
+		basic_machine=m68k-sun
+		;;
+	sun4)
+		basic_machine=sparc-sun
+		;;
+	sun386 | sun386i | roadrunner)
+		basic_machine=i386-sun
+		;;
+	sv1)
+		basic_machine=sv1-cray
+		os=-unicos
+		;;
+	symmetry)
+		basic_machine=i386-sequent
+		os=-dynix
+		;;
+	t3e)
+		basic_machine=t3e-cray
+		os=-unicos
+		;;
+	tic54x | c54x*)
+		basic_machine=tic54x-unknown
+		os=-coff
+		;;
+	tx39)
+		basic_machine=mipstx39-unknown
+		;;
+	tx39el)
+		basic_machine=mipstx39el-unknown
+		;;
+	tower | tower-32)
+		basic_machine=m68k-ncr
+		;;
+	udi29k)
+		basic_machine=a29k-amd
+		os=-udi
+		;;
+	ultra3)
+		basic_machine=a29k-nyu
+		os=-sym1
+		;;
+	v810 | necv810)
+		basic_machine=v810-nec
+		os=-none
+		;;
+	vaxv)
+		basic_machine=vax-dec
+		os=-sysv
+		;;
+	vms)
+		basic_machine=vax-dec
+		os=-vms
+		;;
+	vpp*|vx|vx-*)
+               basic_machine=f301-fujitsu
+               ;;
+	vxworks960)
+		basic_machine=i960-wrs
+		os=-vxworks
+		;;
+	vxworks68)
+		basic_machine=m68k-wrs
+		os=-vxworks
+		;;
+	vxworks29k)
+		basic_machine=a29k-wrs
+		os=-vxworks
+		;;
+	w65*)
+		basic_machine=w65-wdc
+		os=-none
+		;;
+	w89k-*)
+		basic_machine=hppa1.1-winbond
+		os=-proelf
+		;;
+	xmp)
+		basic_machine=xmp-cray
+		os=-unicos
+		;;
+        xps | xps100)
+		basic_machine=xps100-honeywell
+		;;
+	z8k-*-coff)
+		basic_machine=z8k-unknown
+		os=-sim
+		;;
+	none)
+		basic_machine=none-none
+		os=-none
+		;;
+
+# Here we handle the default manufacturer of certain CPU types.  It is in
+# some cases the only manufacturer, in others, it is the most popular.
+	w89k)
+		basic_machine=hppa1.1-winbond
+		;;
+	op50n)
+		basic_machine=hppa1.1-oki
+		;;
+	op60c)
+		basic_machine=hppa1.1-oki
+		;;
+	mips)
+		if [ x$os = x-linux-gnu ]; then
+			basic_machine=mips-unknown
+		else
+			basic_machine=mips-mips
+		fi
+		;;
+	romp)
+		basic_machine=romp-ibm
+		;;
+	rs6000)
+		basic_machine=rs6000-ibm
+		;;
+	vax)
+		basic_machine=vax-dec
+		;;
+	pdp10)
+		# there are many clones, so DEC is not a safe bet
+		basic_machine=pdp10-unknown
+		;;
+	pdp11)
+		basic_machine=pdp11-dec
+		;;
+	we32k)
+		basic_machine=we32k-att
+		;;
+	sh3 | sh4)
+		basic_machine=sh-unknown
+		;;
+	sparc | sparcv9 | sparcv9b)
+		basic_machine=sparc-sun
+		;;
+        cydra)
+		basic_machine=cydra-cydrome
+		;;
+	orion)
+		basic_machine=orion-highlevel
+		;;
+	orion105)
+		basic_machine=clipper-highlevel
+		;;
+	mac | mpw | mac-mpw)
+		basic_machine=m68k-apple
+		;;
+	pmac | pmac-mpw)
+		basic_machine=powerpc-apple
+		;;
+	c4x*)
+		basic_machine=c4x-none
+		os=-coff
+		;;
+	*-unknown)
+		# Make sure to match an already-canonicalized machine name.
+		;;
+	*)
+		echo Invalid configuration \`$1\': machine \`$basic_machine\' not recognized 1>&2
+		exit 1
+		;;
+esac
+
+# Here we canonicalize certain aliases for manufacturers.
+case $basic_machine in
+	*-digital*)
+		basic_machine=`echo $basic_machine | sed 's/digital.*/dec/'`
+		;;
+	*-commodore*)
+		basic_machine=`echo $basic_machine | sed 's/commodore.*/cbm/'`
+		;;
+	*)
+		;;
+esac
+
+# Decode manufacturer-specific aliases for certain operating systems.
+
+if [ x"$os" != x"" ]
+then
+case $os in
+        # First match some system type aliases
+        # that might get confused with valid system types.
+	# -solaris* is a basic system type, with this one exception.
+	-solaris1 | -solaris1.*)
+		os=`echo $os | sed -e 's|solaris1|sunos4|'`
+		;;
+	-solaris)
+		os=-solaris2
+		;;
+	-svr4*)
+		os=-sysv4
+		;;
+	-unixware*)
+		os=-sysv4.2uw
+		;;
+	-gnu/linux*)
+		os=`echo $os | sed -e 's|gnu/linux|linux-gnu|'`
+		;;
+	# First accept the basic system types.
+	# The portable systems comes first.
+	# Each alternative MUST END IN A *, to match a version number.
+	# -sysv* is not here because it comes later, after sysvr4.
+	-gnu* | -bsd* | -mach* | -minix* | -genix* | -ultrix* | -irix* \
+	      | -*vms* | -sco* | -esix* | -isc* | -aix* | -sunos | -sunos[34]*\
+	      | -hpux* | -unos* | -osf* | -luna* | -dgux* | -solaris* | -sym* \
+	      | -amigaos* | -amigados* | -msdos* | -newsos* | -unicos* | -aof* \
+	      | -aos* \
+	      | -nindy* | -vxsim* | -vxworks* | -ebmon* | -hms* | -mvs* \
+	      | -clix* | -riscos* | -uniplus* | -iris* | -rtu* | -xenix* \
+	      | -hiux* | -386bsd* | -netbsd* | -openbsd* | -freebsd* | -riscix* \
+	      | -lynxos* | -bosx* | -nextstep* | -cxux* | -aout* | -elf* | -oabi* \
+	      | -ptx* | -coff* | -ecoff* | -winnt* | -domain* | -vsta* \
+	      | -udi* | -eabi* | -lites* | -ieee* | -go32* | -aux* \
+	      | -cygwin* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
+	      | -mingw32* | -linux-gnu* | -uxpv* | -beos* | -mpeix* | -udk* \
+	      | -interix* | -uwin* | -rhapsody* | -darwin* | -opened* \
+	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
+	      | -storm-chaos* | -tops10* | -tenex* | -tops20* | -its* | -os2*)
+	# Remember, each alternative MUST END IN *, to match a version number.
+		;;
+	-qnx*)
+		case $basic_machine in
+		    x86-* | i*86-*)
+			;;
+		    *)
+			os=-nto$os
+			;;
+		esac
+		;;
+	-nto*)
+		os=-nto-qnx
+		;;
+	-sim | -es1800* | -hms* | -xray | -os68k* | -none* | -v88r* \
+	      | -windows* | -osx | -abug | -netware* | -os9* | -beos* \
+	      | -macos* | -mpw* | -magic* | -mmixware* | -mon960* | -lnews*)
+		;;
+	-mac*)
+		os=`echo $os | sed -e 's|mac|macos|'`
+		;;
+	-linux*)
+		os=`echo $os | sed -e 's|linux|linux-gnu|'`
+		;;
+	-sunos5*)
+		os=`echo $os | sed -e 's|sunos5|solaris2|'`
+		;;
+	-sunos6*)
+		os=`echo $os | sed -e 's|sunos6|solaris3|'`
+		;;
+	-opened*)
+		os=-openedition
+		;;
+	-wince*)
+		os=-wince
+		;;
+	-osfrose*)
+		os=-osfrose
+		;;
+	-osf*)
+		os=-osf
+		;;
+	-utek*)
+		os=-bsd
+		;;
+	-dynix*)
+		os=-bsd
+		;;
+	-acis*)
+		os=-aos
+		;;
+	-386bsd)
+		os=-bsd
+		;;
+	-ctix* | -uts*)
+		os=-sysv
+		;;
+	-ns2 )
+	        os=-nextstep2
+		;;
+	-nsk*)
+		os=-nsk
+		;;
+	# Preserve the version number of sinix5.
+	-sinix5.*)
+		os=`echo $os | sed -e 's|sinix|sysv|'`
+		;;
+	-sinix*)
+		os=-sysv4
+		;;
+	-triton*)
+		os=-sysv3
+		;;
+	-oss*)
+		os=-sysv3
+		;;
+	-svr4)
+		os=-sysv4
+		;;
+	-svr3)
+		os=-sysv3
+		;;
+	-sysvr4)
+		os=-sysv4
+		;;
+	# This must come after -sysvr4.
+	-sysv*)
+		;;
+	-ose*)
+		os=-ose
+		;;
+	-es1800*)
+		os=-ose
+		;;
+	-xenix)
+		os=-xenix
+		;;
+        -*mint | -mint[0-9]* | -*MiNT | -MiNT[0-9]*)
+	        os=-mint
+		;;
+	-none)
+		;;
+	*)
+		# Get rid of the `-' at the beginning of $os.
+		os=`echo $os | sed 's/[^-]*-//'`
+		echo Invalid configuration \`$1\': system \`$os\' not recognized 1>&2
+		exit 1
+		;;
+esac
+else
+
+# Here we handle the default operating systems that come with various machines.
+# The value should be what the vendor currently ships out the door with their
+# machine or put another way, the most popular os provided with the machine.
+
+# Note that if you're going to try to match "-MANUFACTURER" here (say,
+# "-sun"), then you have to tell the case statement up towards the top
+# that MANUFACTURER isn't an operating system.  Otherwise, code above
+# will signal an error saying that MANUFACTURER isn't an operating
+# system, and we'll never get to this point.
+
+case $basic_machine in
+	*-acorn)
+		os=-riscix1.2
+		;;
+	arm*-rebel)
+		os=-linux
+		;;
+	arm*-semi)
+		os=-aout
+		;;
+	pdp10-*)
+		os=-tops20
+		;;
+        pdp11-*)
+		os=-none
+		;;
+	*-dec | vax-*)
+		os=-ultrix4.2
+		;;
+	m68*-apollo)
+		os=-domain
+		;;
+	i386-sun)
+		os=-sunos4.0.2
+		;;
+	m68000-sun)
+		os=-sunos3
+		# This also exists in the configure program, but was not the
+		# default.
+		# os=-sunos4
+		;;
+	m68*-cisco)
+		os=-aout
+		;;
+	mips*-cisco)
+		os=-elf
+		;;
+	mips*-*)
+		os=-elf
+		;;
+	*-tti)	# must be before sparc entry or we get the wrong os.
+		os=-sysv3
+		;;
+	sparc-* | *-sun)
+		os=-sunos4.1.1
+		;;
+	*-be)
+		os=-beos
+		;;
+	*-ibm)
+		os=-aix
+		;;
+	*-wec)
+		os=-proelf
+		;;
+	*-winbond)
+		os=-proelf
+		;;
+	*-oki)
+		os=-proelf
+		;;
+	*-hp)
+		os=-hpux
+		;;
+	*-hitachi)
+		os=-hiux
+		;;
+	i860-* | *-att | *-ncr | *-altos | *-motorola | *-convergent)
+		os=-sysv
+		;;
+	*-cbm)
+		os=-amigaos
+		;;
+	*-dg)
+		os=-dgux
+		;;
+	*-dolphin)
+		os=-sysv3
+		;;
+	m68k-ccur)
+		os=-rtu
+		;;
+	m88k-omron*)
+		os=-luna
+		;;
+	*-next )
+		os=-nextstep
+		;;
+	*-sequent)
+		os=-ptx
+		;;
+	*-crds)
+		os=-unos
+		;;
+	*-ns)
+		os=-genix
+		;;
+	i370-*)
+		os=-mvs
+		;;
+	*-next)
+		os=-nextstep3
+		;;
+        *-gould)
+		os=-sysv
+		;;
+        *-highlevel)
+		os=-bsd
+		;;
+	*-encore)
+		os=-bsd
+		;;
+        *-sgi)
+		os=-irix
+		;;
+        *-siemens)
+		os=-sysv4
+		;;
+	*-masscomp)
+		os=-rtu
+		;;
+	f30[01]-fujitsu | f700-fujitsu)
+		os=-uxpv
+		;;
+	*-rom68k)
+		os=-coff
+		;;
+	*-*bug)
+		os=-coff
+		;;
+	*-apple)
+		os=-macos
+		;;
+	*-atari*)
+		os=-mint
+		;;
+	*)
+		os=-none
+		;;
+esac
+fi
+
+# Here we handle the case where we know the os, and the CPU type, but not the
+# manufacturer.  We pick the logical manufacturer.
+vendor=unknown
+case $basic_machine in
+	*-unknown)
+		case $os in
+			-riscix*)
+				vendor=acorn
+				;;
+			-sunos*)
+				vendor=sun
+				;;
+			-aix*)
+				vendor=ibm
+				;;
+			-beos*)
+				vendor=be
+				;;
+			-hpux*)
+				vendor=hp
+				;;
+			-mpeix*)
+				vendor=hp
+				;;
+			-hiux*)
+				vendor=hitachi
+				;;
+			-unos*)
+				vendor=crds
+				;;
+			-dgux*)
+				vendor=dg
+				;;
+			-luna*)
+				vendor=omron
+				;;
+			-genix*)
+				vendor=ns
+				;;
+			-mvs* | -opened*)
+				vendor=ibm
+				;;
+			-ptx*)
+				vendor=sequent
+				;;
+			-vxsim* | -vxworks*)
+				vendor=wrs
+				;;
+			-aux*)
+				vendor=apple
+				;;
+			-hms*)
+				vendor=hitachi
+				;;
+			-mpw* | -macos*)
+				vendor=apple
+				;;
+			-*mint | -mint[0-9]* | -*MiNT | -MiNT[0-9]*)
+				vendor=atari
+				;;
+		esac
+		basic_machine=`echo $basic_machine | sed "s/unknown/$vendor/"`
+		;;
+esac
+
+echo $basic_machine$os
+exit 0
+
+# Local variables:
+# eval: (add-hook 'write-file-hooks 'time-stamp)
+# time-stamp-start: "timestamp='"
+# time-stamp-format: "%:y-%02m-%02d"
+# time-stamp-end: "'"
+# End:
diff -Naur gd-2.0.1/configure gd-2.0.1.patched/configure
--- gd-2.0.1/configure	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/configure	Tue Jul 30 05:46:01 2002
@@ -0,0 +1,8085 @@
+#! /bin/sh
+# Guess values for system-dependent variables and create Makefiles.
+# Generated by Autoconf 2.50.
+#
+# Copyright 1992, 1993, 1994, 1995, 1996, 1998, 1999, 2000, 2001
+# Free Software Foundation, Inc.
+# This configure script is free software; the Free Software Foundation
+# gives unlimited permission to copy, distribute and modify it.
+
+# Find the correct PATH separator.  Usually this is `:', but
+# DJGPP uses `;' like DOS.
+if test "X${PATH_SEPARATOR+set}" != Xset; then
+  UNAME=${UNAME-`uname 2>/dev/null`}
+  case X$UNAME in
+    *-DOS) lt_cv_sys_path_separator=';' ;;
+    *)     lt_cv_sys_path_separator=':' ;;
+  esac
+fi
+
+# Check that we are running under the correct shell.
+SHELL=${CONFIG_SHELL-/bin/sh}
+
+case X$ECHO in
+X*--fallback-echo)
+  # Remove one level of quotation (which was required for Make).
+  ECHO=`echo "$ECHO" | sed 's,\\\\\$\\$0,'$0','`
+  ;;
+esac
+
+echo=${ECHO-echo}
+if test "X$1" = X--no-reexec; then
+  # Discard the --no-reexec flag, and continue.
+  shift
+elif test "X$1" = X--fallback-echo; then
+  # Avoid inline document here, it may be left over
+  :
+elif test "X`($echo '\t') 2>/dev/null`" = 'X\t'; then
+  # Yippee, $echo works!
+  :
+else
+  # Restart under the correct shell.
+  exec $SHELL "$0" --no-reexec ${1+"$@"}
+fi
+
+if test "X$1" = X--fallback-echo; then
+  # used as fallback echo
+  shift
+  cat <<EOF
+
+EOF
+  exit 0
+fi
+
+# The HP-UX ksh and POSIX shell print the target directory to stdout
+# if CDPATH is set.
+if test "X${CDPATH+set}" = Xset; then CDPATH=:; export CDPATH; fi
+
+if test -z "$ECHO"; then
+if test "X${echo_test_string+set}" != Xset; then
+# find a string as large as possible, as long as the shell can cope with it
+  for cmd in 'sed 50q "$0"' 'sed 20q "$0"' 'sed 10q "$0"' 'sed 2q "$0"' 'echo test'; do
+    # expected sizes: less than 2Kb, 1Kb, 512 bytes, 16 bytes, ...
+    if (echo_test_string="`eval $cmd`") 2>/dev/null &&
+       echo_test_string="`eval $cmd`" &&
+       (test "X$echo_test_string" = "X$echo_test_string") 2>/dev/null
+    then
+      break
+    fi
+  done
+fi
+
+if test "X`($echo '\t') 2>/dev/null`" = 'X\t' &&
+   echo_testing_string=`($echo "$echo_test_string") 2>/dev/null` &&
+   test "X$echo_testing_string" = "X$echo_test_string"; then
+  :
+else
+  # The Solaris, AIX, and Digital Unix default echo programs unquote
+  # backslashes.  This makes it impossible to quote backslashes using
+  #   echo "$something" | sed 's/\\/\\\\/g'
+  #
+  # So, first we look for a working echo in the user's PATH.
+
+  IFS="${IFS= 	}"; save_ifs="$IFS"; IFS="${IFS}${PATH_SEPARATOR}"
+  for dir in $PATH /usr/ucb; do
+    if (test -f $dir/echo || test -f $dir/echo$ac_exeext) &&
+       test "X`($dir/echo '\t') 2>/dev/null`" = 'X\t' &&
+       echo_testing_string=`($dir/echo "$echo_test_string") 2>/dev/null` &&
+       test "X$echo_testing_string" = "X$echo_test_string"; then
+      echo="$dir/echo"
+      break
+    fi
+  done
+  IFS="$save_ifs"
+
+  if test "X$echo" = Xecho; then
+    # We didn't find a better echo, so look for alternatives.
+    if test "X`(print -r '\t') 2>/dev/null`" = 'X\t' &&
+       echo_testing_string=`(print -r "$echo_test_string") 2>/dev/null` &&
+       test "X$echo_testing_string" = "X$echo_test_string"; then
+      # This shell has a builtin print -r that does the trick.
+      echo='print -r'
+    elif (test -f /bin/ksh || test -f /bin/ksh$ac_exeext) &&
+	 test "X$CONFIG_SHELL" != X/bin/ksh; then
+      # If we have ksh, try running configure again with it.
+      ORIGINAL_CONFIG_SHELL=${CONFIG_SHELL-/bin/sh}
+      export ORIGINAL_CONFIG_SHELL
+      CONFIG_SHELL=/bin/ksh
+      export CONFIG_SHELL
+      exec $CONFIG_SHELL "$0" --no-reexec ${1+"$@"}
+    else
+      # Try using printf.
+      echo='printf %s\n'
+      if test "X`($echo '\t') 2>/dev/null`" = 'X\t' &&
+	 echo_testing_string=`($echo "$echo_test_string") 2>/dev/null` &&
+	 test "X$echo_testing_string" = "X$echo_test_string"; then
+	# Cool, printf works
+	:
+      elif echo_testing_string=`($ORIGINAL_CONFIG_SHELL "$0" --fallback-echo '\t') 2>/dev/null` &&
+	   test "X$echo_testing_string" = 'X\t' &&
+	   echo_testing_string=`($ORIGINAL_CONFIG_SHELL "$0" --fallback-echo "$echo_test_string") 2>/dev/null` &&
+	   test "X$echo_testing_string" = "X$echo_test_string"; then
+	CONFIG_SHELL=$ORIGINAL_CONFIG_SHELL
+	export CONFIG_SHELL
+	SHELL="$CONFIG_SHELL"
+	export SHELL
+	echo="$CONFIG_SHELL $0 --fallback-echo"
+      elif echo_testing_string=`($CONFIG_SHELL "$0" --fallback-echo '\t') 2>/dev/null` &&
+	   test "X$echo_testing_string" = 'X\t' &&
+	   echo_testing_string=`($CONFIG_SHELL "$0" --fallback-echo "$echo_test_string") 2>/dev/null` &&
+	   test "X$echo_testing_string" = "X$echo_test_string"; then
+	echo="$CONFIG_SHELL $0 --fallback-echo"
+      else
+	# maybe with a smaller string...
+	prev=:
+
+	for cmd in 'echo test' 'sed 2q "$0"' 'sed 10q "$0"' 'sed 20q "$0"' 'sed 50q "$0"'; do
+	  if (test "X$echo_test_string" = "X`eval $cmd`") 2>/dev/null
+	  then
+	    break
+	  fi
+	  prev="$cmd"
+	done
+
+	if test "$prev" != 'sed 50q "$0"'; then
+	  echo_test_string=`eval $prev`
+	  export echo_test_string
+	  exec ${ORIGINAL_CONFIG_SHELL-${CONFIG_SHELL-/bin/sh}} "$0" ${1+"$@"}
+	else
+	  # Oops.  We lost completely, so just stick with echo.
+	  echo=echo
+	fi
+      fi
+    fi
+  fi
+fi
+fi
+
+# Copy echo and quote the copy suitably for passing to libtool from
+# the Makefile, instead of quoting the original, which is used later.
+ECHO=$echo
+if test "X$ECHO" = "X$CONFIG_SHELL $0 --fallback-echo"; then
+   ECHO="$CONFIG_SHELL \\\$\$0 --fallback-echo"
+fi
+
+# Be Bourne compatible
+if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then
+  emulate sh
+  NULLCMD=:
+elif test -n "${BASH_VERSION+set}" && (set -o posix) >/dev/null 2>&1; then
+  set -o posix
+fi
+
+# Name of the executable.
+as_me=`echo "$0" |sed 's,.*[\\/],,'`
+
+if expr a : '\(a\)' >/dev/null 2>&1; then
+  as_expr=expr
+else
+  as_expr=false
+fi
+
+rm -f conf$$ conf$$.exe conf$$.file
+echo >conf$$.file
+if ln -s conf$$.file conf$$ 2>/dev/null; then
+  # We could just check for DJGPP; but this test a) works b) is more generic
+  # and c) will remain valid once DJGPP supports symlinks (DJGPP 2.04).
+  if test -f conf$$.exe; then
+    # Don't use ln at all; we don't have any links
+    as_ln_s='cp -p'
+  else
+    as_ln_s='ln -s'
+  fi
+elif ln conf$$.file conf$$ 2>/dev/null; then
+  as_ln_s=ln
+else
+  as_ln_s='cp -p'
+fi
+rm -f conf$$ conf$$.exe conf$$.file
+
+as_executable_p="test -f"
+
+# Support unset when possible.
+if (FOO=FOO; unset FOO) >/dev/null 2>&1; then
+  as_unset=unset
+else
+  as_unset=false
+fi
+
+# NLS nuisances.
+$as_unset LANG || test "${LANG+set}" != set || { LANG=C; export LANG; }
+$as_unset LC_ALL || test "${LC_ALL+set}" != set || { LC_ALL=C; export LC_ALL; }
+$as_unset LC_TIME || test "${LC_TIME+set}" != set || { LC_TIME=C; export LC_TIME; }
+$as_unset LC_CTYPE || test "${LC_CTYPE+set}" != set || { LC_CTYPE=C; export LC_CTYPE; }
+$as_unset LANGUAGE || test "${LANGUAGE+set}" != set || { LANGUAGE=C; export LANGUAGE; }
+$as_unset LC_COLLATE || test "${LC_COLLATE+set}" != set || { LC_COLLATE=C; export LC_COLLATE; }
+$as_unset LC_NUMERIC || test "${LC_NUMERIC+set}" != set || { LC_NUMERIC=C; export LC_NUMERIC; }
+$as_unset LC_MESSAGES || test "${LC_MESSAGES+set}" != set || { LC_MESSAGES=C; export LC_MESSAGES; }
+
+# IFS
+# We need space, tab and new line, in precisely that order.
+as_nl='
+'
+IFS=" 	$as_nl"
+
+# CDPATH.
+$as_unset CDPATH || test "${CDPATH+set}" != set || { CDPATH=:; export CDPATH; }
+
+# Name of the host.
+# hostname on some systems (SVR3.2, Linux) returns a bogus exit status,
+# so uname gets run too.
+ac_hostname=`(hostname || uname -n) 2>/dev/null | sed 1q`
+
+exec 6>&1
+
+#
+# Initializations.
+#
+ac_default_prefix=/usr/local
+cross_compiling=no
+subdirs=
+MFLAGS= MAKEFLAGS=
+SHELL=${CONFIG_SHELL-/bin/sh}
+
+# Maximum number of lines to put in a shell here document.
+# This variable seems obsolete.  It should probably be removed, and
+# only ac_max_sed_lines should be used.
+: ${ac_max_here_lines=38}
+
+# Avoid depending upon Character Ranges.
+ac_cr_az='abcdefghijklmnopqrstuvwxyz'
+ac_cr_AZ='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
+ac_cr_09='0123456789'
+ac_cr_alnum=$ac_cr_az$ac_cr_AZ$ac_cr_09
+
+# Sed expression to map a string onto a valid sh and CPP variable names.
+ac_tr_sh="sed y%*+%pp%;s%[^_$ac_cr_alnum]%_%g"
+ac_tr_cpp="sed y%*$ac_cr_az%P$ac_cr_AZ%;s%[^_$ac_cr_alnum]%_%g"
+
+ac_unique_file="gd.c"
+
+# Initialize some variables set by options.
+ac_init_help=
+ac_init_version=false
+# The variables have the same names as the options, with
+# dashes changed to underlines.
+cache_file=/dev/null
+exec_prefix=NONE
+no_create=
+no_recursion=
+prefix=NONE
+program_prefix=NONE
+program_suffix=NONE
+program_transform_name=s,x,x,
+silent=
+site=
+srcdir=
+verbose=
+x_includes=NONE
+x_libraries=NONE
+
+# Installation directory options.
+# These are left unexpanded so users can "make install exec_prefix=/foo"
+# and all the variables that are supposed to be based on exec_prefix
+# by default will actually change.
+# Use braces instead of parens because sh, perl, etc. also accept them.
+bindir='${exec_prefix}/bin'
+sbindir='${exec_prefix}/sbin'
+libexecdir='${exec_prefix}/libexec'
+datadir='${prefix}/share'
+sysconfdir='${prefix}/etc'
+sharedstatedir='${prefix}/com'
+localstatedir='${prefix}/var'
+libdir='${exec_prefix}/lib'
+includedir='${prefix}/include'
+oldincludedir='/usr/include'
+infodir='${prefix}/info'
+mandir='${prefix}/man'
+
+# Identity of this package.
+PACKAGE_NAME=
+PACKAGE_TARNAME=
+PACKAGE_VERSION=
+PACKAGE_STRING=
+PACKAGE_BUGREPORT=
+
+ac_prev=
+for ac_option
+do
+  # If the previous option needs an argument, assign it.
+  if test -n "$ac_prev"; then
+    eval "$ac_prev=\$ac_option"
+    ac_prev=
+    continue
+  fi
+
+  ac_optarg=`expr "x$ac_option" : 'x[^=]*=\(.*\)'`
+
+  # Accept the important Cygnus configure options, so we can diagnose typos.
+
+  case $ac_option in
+
+  -bindir | --bindir | --bindi | --bind | --bin | --bi)
+    ac_prev=bindir ;;
+  -bindir=* | --bindir=* | --bindi=* | --bind=* | --bin=* | --bi=*)
+    bindir=$ac_optarg ;;
+
+  -build | --build | --buil | --bui | --bu)
+    ac_prev=build_alias ;;
+  -build=* | --build=* | --buil=* | --bui=* | --bu=*)
+    build_alias=$ac_optarg ;;
+
+  -cache-file | --cache-file | --cache-fil | --cache-fi \
+  | --cache-f | --cache- | --cache | --cach | --cac | --ca | --c)
+    ac_prev=cache_file ;;
+  -cache-file=* | --cache-file=* | --cache-fil=* | --cache-fi=* \
+  | --cache-f=* | --cache-=* | --cache=* | --cach=* | --cac=* | --ca=* | --c=*)
+    cache_file=$ac_optarg ;;
+
+  --config-cache | -C)
+    cache_file=config.cache ;;
+
+  -datadir | --datadir | --datadi | --datad | --data | --dat | --da)
+    ac_prev=datadir ;;
+  -datadir=* | --datadir=* | --datadi=* | --datad=* | --data=* | --dat=* \
+  | --da=*)
+    datadir=$ac_optarg ;;
+
+  -disable-* | --disable-*)
+    ac_feature=`expr "x$ac_option" : 'x-*disable-\(.*\)'`
+    # Reject names that are not valid shell variable names.
+    expr "x$ac_feature" : ".*[^-_$ac_cr_alnum]" >/dev/null &&
+      { echo "$as_me: error: invalid feature name: $ac_feature" >&2
+   { (exit 1); exit 1; }; }
+    ac_feature=`echo $ac_feature | sed 's/-/_/g'`
+    eval "enable_$ac_feature=no" ;;
+
+  -enable-* | --enable-*)
+    ac_feature=`expr "x$ac_option" : 'x-*enable-\([^=]*\)'`
+    # Reject names that are not valid shell variable names.
+    expr "x$ac_feature" : ".*[^-_$ac_cr_alnum]" >/dev/null &&
+      { echo "$as_me: error: invalid feature name: $ac_feature" >&2
+   { (exit 1); exit 1; }; }
+    ac_feature=`echo $ac_feature | sed 's/-/_/g'`
+    case $ac_option in
+      *=*) ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`;;
+      *) ac_optarg=yes ;;
+    esac
+    eval "enable_$ac_feature='$ac_optarg'" ;;
+
+  -exec-prefix | --exec_prefix | --exec-prefix | --exec-prefi \
+  | --exec-pref | --exec-pre | --exec-pr | --exec-p | --exec- \
+  | --exec | --exe | --ex)
+    ac_prev=exec_prefix ;;
+  -exec-prefix=* | --exec_prefix=* | --exec-prefix=* | --exec-prefi=* \
+  | --exec-pref=* | --exec-pre=* | --exec-pr=* | --exec-p=* | --exec-=* \
+  | --exec=* | --exe=* | --ex=*)
+    exec_prefix=$ac_optarg ;;
+
+  -gas | --gas | --ga | --g)
+    # Obsolete; use --with-gas.
+    with_gas=yes ;;
+
+  -help | --help | --hel | --he | -h)
+    ac_init_help=long ;;
+  -help=r* | --help=r* | --hel=r* | --he=r* | -hr*)
+    ac_init_help=recursive ;;
+  -help=s* | --help=s* | --hel=s* | --he=s* | -hs*)
+    ac_init_help=short ;;
+
+  -host | --host | --hos | --ho)
+    ac_prev=host_alias ;;
+  -host=* | --host=* | --hos=* | --ho=*)
+    host_alias=$ac_optarg ;;
+
+  -includedir | --includedir | --includedi | --included | --include \
+  | --includ | --inclu | --incl | --inc)
+    ac_prev=includedir ;;
+  -includedir=* | --includedir=* | --includedi=* | --included=* | --include=* \
+  | --includ=* | --inclu=* | --incl=* | --inc=*)
+    includedir=$ac_optarg ;;
+
+  -infodir | --infodir | --infodi | --infod | --info | --inf)
+    ac_prev=infodir ;;
+  -infodir=* | --infodir=* | --infodi=* | --infod=* | --info=* | --inf=*)
+    infodir=$ac_optarg ;;
+
+  -libdir | --libdir | --libdi | --libd)
+    ac_prev=libdir ;;
+  -libdir=* | --libdir=* | --libdi=* | --libd=*)
+    libdir=$ac_optarg ;;
+
+  -libexecdir | --libexecdir | --libexecdi | --libexecd | --libexec \
+  | --libexe | --libex | --libe)
+    ac_prev=libexecdir ;;
+  -libexecdir=* | --libexecdir=* | --libexecdi=* | --libexecd=* | --libexec=* \
+  | --libexe=* | --libex=* | --libe=*)
+    libexecdir=$ac_optarg ;;
+
+  -localstatedir | --localstatedir | --localstatedi | --localstated \
+  | --localstate | --localstat | --localsta | --localst \
+  | --locals | --local | --loca | --loc | --lo)
+    ac_prev=localstatedir ;;
+  -localstatedir=* | --localstatedir=* | --localstatedi=* | --localstated=* \
+  | --localstate=* | --localstat=* | --localsta=* | --localst=* \
+  | --locals=* | --local=* | --loca=* | --loc=* | --lo=*)
+    localstatedir=$ac_optarg ;;
+
+  -mandir | --mandir | --mandi | --mand | --man | --ma | --m)
+    ac_prev=mandir ;;
+  -mandir=* | --mandir=* | --mandi=* | --mand=* | --man=* | --ma=* | --m=*)
+    mandir=$ac_optarg ;;
+
+  -nfp | --nfp | --nf)
+    # Obsolete; use --without-fp.
+    with_fp=no ;;
+
+  -no-create | --no-create | --no-creat | --no-crea | --no-cre \
+  | --no-cr | --no-c)
+    no_create=yes ;;
+
+  -no-recursion | --no-recursion | --no-recursio | --no-recursi \
+  | --no-recurs | --no-recur | --no-recu | --no-rec | --no-re | --no-r)
+    no_recursion=yes ;;
+
+  -oldincludedir | --oldincludedir | --oldincludedi | --oldincluded \
+  | --oldinclude | --oldinclud | --oldinclu | --oldincl | --oldinc \
+  | --oldin | --oldi | --old | --ol | --o)
+    ac_prev=oldincludedir ;;
+  -oldincludedir=* | --oldincludedir=* | --oldincludedi=* | --oldincluded=* \
+  | --oldinclude=* | --oldinclud=* | --oldinclu=* | --oldincl=* | --oldinc=* \
+  | --oldin=* | --oldi=* | --old=* | --ol=* | --o=*)
+    oldincludedir=$ac_optarg ;;
+
+  -prefix | --prefix | --prefi | --pref | --pre | --pr | --p)
+    ac_prev=prefix ;;
+  -prefix=* | --prefix=* | --prefi=* | --pref=* | --pre=* | --pr=* | --p=*)
+    prefix=$ac_optarg ;;
+
+  -program-prefix | --program-prefix | --program-prefi | --program-pref \
+  | --program-pre | --program-pr | --program-p)
+    ac_prev=program_prefix ;;
+  -program-prefix=* | --program-prefix=* | --program-prefi=* \
+  | --program-pref=* | --program-pre=* | --program-pr=* | --program-p=*)
+    program_prefix=$ac_optarg ;;
+
+  -program-suffix | --program-suffix | --program-suffi | --program-suff \
+  | --program-suf | --program-su | --program-s)
+    ac_prev=program_suffix ;;
+  -program-suffix=* | --program-suffix=* | --program-suffi=* \
+  | --program-suff=* | --program-suf=* | --program-su=* | --program-s=*)
+    program_suffix=$ac_optarg ;;
+
+  -program-transform-name | --program-transform-name \
+  | --program-transform-nam | --program-transform-na \
+  | --program-transform-n | --program-transform- \
+  | --program-transform | --program-transfor \
+  | --program-transfo | --program-transf \
+  | --program-trans | --program-tran \
+  | --progr-tra | --program-tr | --program-t)
+    ac_prev=program_transform_name ;;
+  -program-transform-name=* | --program-transform-name=* \
+  | --program-transform-nam=* | --program-transform-na=* \
+  | --program-transform-n=* | --program-transform-=* \
+  | --program-transform=* | --program-transfor=* \
+  | --program-transfo=* | --program-transf=* \
+  | --program-trans=* | --program-tran=* \
+  | --progr-tra=* | --program-tr=* | --program-t=*)
+    program_transform_name=$ac_optarg ;;
+
+  -q | -quiet | --quiet | --quie | --qui | --qu | --q \
+  | -silent | --silent | --silen | --sile | --sil)
+    silent=yes ;;
+
+  -sbindir | --sbindir | --sbindi | --sbind | --sbin | --sbi | --sb)
+    ac_prev=sbindir ;;
+  -sbindir=* | --sbindir=* | --sbindi=* | --sbind=* | --sbin=* \
+  | --sbi=* | --sb=*)
+    sbindir=$ac_optarg ;;
+
+  -sharedstatedir | --sharedstatedir | --sharedstatedi \
+  | --sharedstated | --sharedstate | --sharedstat | --sharedsta \
+  | --sharedst | --shareds | --shared | --share | --shar \
+  | --sha | --sh)
+    ac_prev=sharedstatedir ;;
+  -sharedstatedir=* | --sharedstatedir=* | --sharedstatedi=* \
+  | --sharedstated=* | --sharedstate=* | --sharedstat=* | --sharedsta=* \
+  | --sharedst=* | --shareds=* | --shared=* | --share=* | --shar=* \
+  | --sha=* | --sh=*)
+    sharedstatedir=$ac_optarg ;;
+
+  -site | --site | --sit)
+    ac_prev=site ;;
+  -site=* | --site=* | --sit=*)
+    site=$ac_optarg ;;
+
+  -srcdir | --srcdir | --srcdi | --srcd | --src | --sr)
+    ac_prev=srcdir ;;
+  -srcdir=* | --srcdir=* | --srcdi=* | --srcd=* | --src=* | --sr=*)
+    srcdir=$ac_optarg ;;
+
+  -sysconfdir | --sysconfdir | --sysconfdi | --sysconfd | --sysconf \
+  | --syscon | --sysco | --sysc | --sys | --sy)
+    ac_prev=sysconfdir ;;
+  -sysconfdir=* | --sysconfdir=* | --sysconfdi=* | --sysconfd=* | --sysconf=* \
+  | --syscon=* | --sysco=* | --sysc=* | --sys=* | --sy=*)
+    sysconfdir=$ac_optarg ;;
+
+  -target | --target | --targe | --targ | --tar | --ta | --t)
+    ac_prev=target_alias ;;
+  -target=* | --target=* | --targe=* | --targ=* | --tar=* | --ta=* | --t=*)
+    target_alias=$ac_optarg ;;
+
+  -v | -verbose | --verbose | --verbos | --verbo | --verb)
+    verbose=yes ;;
+
+  -version | --version | --versio | --versi | --vers | -V)
+    ac_init_version=: ;;
+
+  -with-* | --with-*)
+    ac_package=`expr "x$ac_option" : 'x-*with-\([^=]*\)'`
+    # Reject names that are not valid shell variable names.
+    expr "x$ac_package" : ".*[^-_$ac_cr_alnum]" >/dev/null &&
+      { echo "$as_me: error: invalid package name: $ac_package" >&2
+   { (exit 1); exit 1; }; }
+    ac_package=`echo $ac_package| sed 's/-/_/g'`
+    case $ac_option in
+      *=*) ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`;;
+      *) ac_optarg=yes ;;
+    esac
+    eval "with_$ac_package='$ac_optarg'" ;;
+
+  -without-* | --without-*)
+    ac_package=`expr "x$ac_option" : 'x-*without-\(.*\)'`
+    # Reject names that are not valid shell variable names.
+    expr "x$ac_package" : ".*[^-_$ac_cr_alnum]" >/dev/null &&
+      { echo "$as_me: error: invalid package name: $ac_package" >&2
+   { (exit 1); exit 1; }; }
+    ac_package=`echo $ac_package | sed 's/-/_/g'`
+    eval "with_$ac_package=no" ;;
+
+  --x)
+    # Obsolete; use --with-x.
+    with_x=yes ;;
+
+  -x-includes | --x-includes | --x-include | --x-includ | --x-inclu \
+  | --x-incl | --x-inc | --x-in | --x-i)
+    ac_prev=x_includes ;;
+  -x-includes=* | --x-includes=* | --x-include=* | --x-includ=* | --x-inclu=* \
+  | --x-incl=* | --x-inc=* | --x-in=* | --x-i=*)
+    x_includes=$ac_optarg ;;
+
+  -x-libraries | --x-libraries | --x-librarie | --x-librari \
+  | --x-librar | --x-libra | --x-libr | --x-lib | --x-li | --x-l)
+    ac_prev=x_libraries ;;
+  -x-libraries=* | --x-libraries=* | --x-librarie=* | --x-librari=* \
+  | --x-librar=* | --x-libra=* | --x-libr=* | --x-lib=* | --x-li=* | --x-l=*)
+    x_libraries=$ac_optarg ;;
+
+  -*) { echo "$as_me: error: unrecognized option: $ac_option
+Try \`$0 --help' for more information." >&2
+   { (exit 1); exit 1; }; }
+    ;;
+
+  *=*)
+    ac_envvar=`expr "x$ac_option" : 'x\([^=]*\)='`
+    # Reject names that are not valid shell variable names.
+    expr "x$ac_envvar" : ".*[^_$ac_cr_alnum]" >/dev/null &&
+      { echo "$as_me: error: invalid variable name: $ac_envvar" >&2
+   { (exit 1); exit 1; }; }
+    ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`
+    eval "$ac_envvar='$ac_optarg'"
+    export $ac_envvar ;;
+
+  *)
+    # FIXME: should be removed in autoconf 3.0.
+    echo "$as_me: WARNING: you should use --build, --host, --target" >&2
+    expr "x$ac_option" : ".*[^-._$ac_cr_alnum]" >/dev/null &&
+      echo "$as_me: WARNING: invalid host type: $ac_option" >&2
+    : ${build_alias=$ac_option} ${host_alias=$ac_option} ${target_alias=$ac_option}
+    ;;
+
+  esac
+done
+
+if test -n "$ac_prev"; then
+  ac_option=--`echo $ac_prev | sed 's/_/-/g'`
+  { echo "$as_me: error: missing argument to $ac_option" >&2
+   { (exit 1); exit 1; }; }
+fi
+
+# Be sure to have absolute paths.
+for ac_var in bindir sbindir libexecdir datadir sysconfdir sharedstatedir \
+              localstatedir libdir includedir oldincludedir infodir mandir \
+              exec_prefix prefix
+do
+  eval ac_val=$`echo $ac_var`
+  case $ac_val in
+    [\\/$]* | ?:[\\/]* ) ;;
+    NONE ) ;;
+    *)  { echo "$as_me: error: expected an absolute path for --$ac_var: $ac_val" >&2
+   { (exit 1); exit 1; }; };;
+  esac
+done
+
+# There might be people who depend on the old broken behavior: `$host'
+# used to hold the argument of --host etc.
+build=$build_alias
+host=$host_alias
+target=$target_alias
+
+# FIXME: should be removed in autoconf 3.0.
+if test "x$host_alias" != x; then
+  if test "x$build_alias" = x; then
+    cross_compiling=maybe
+    echo "$as_me: WARNING: If you wanted to set the --build type, don't use --host.
+    If a cross compiler is detected then cross compile mode will be used." >&2
+  elif test "x$build_alias" != "x$host_alias"; then
+    cross_compiling=yes
+  fi
+fi
+
+ac_tool_prefix=
+test -n "$host_alias" && ac_tool_prefix=$host_alias-
+
+test "$silent" = yes && exec 6>/dev/null
+
+# Find the source files, if location was not specified.
+if test -z "$srcdir"; then
+  ac_srcdir_defaulted=yes
+  # Try the directory containing this script, then its parent.
+  ac_prog=$0
+  ac_confdir=`echo "$ac_prog" | sed 's%[\\/][^\\/][^\\/]*$%%'`
+  test "x$ac_confdir" = "x$ac_prog" && ac_confdir=.
+  srcdir=$ac_confdir
+  if test ! -r $srcdir/$ac_unique_file; then
+    srcdir=..
+  fi
+else
+  ac_srcdir_defaulted=no
+fi
+if test ! -r $srcdir/$ac_unique_file; then
+  if test "$ac_srcdir_defaulted" = yes; then
+    { echo "$as_me: error: cannot find sources in $ac_confdir or .." >&2
+   { (exit 1); exit 1; }; }
+  else
+    { echo "$as_me: error: cannot find sources in $srcdir" >&2
+   { (exit 1); exit 1; }; }
+  fi
+fi
+srcdir=`echo "$srcdir" | sed 's%\([^\\/]\)[\\/]*$%\1%'`
+ac_env_build_alias_set=${build_alias+set}
+ac_env_build_alias_value=$build_alias
+ac_cv_env_build_alias_set=${build_alias+set}
+ac_cv_env_build_alias_value=$build_alias
+ac_env_host_alias_set=${host_alias+set}
+ac_env_host_alias_value=$host_alias
+ac_cv_env_host_alias_set=${host_alias+set}
+ac_cv_env_host_alias_value=$host_alias
+ac_env_target_alias_set=${target_alias+set}
+ac_env_target_alias_value=$target_alias
+ac_cv_env_target_alias_set=${target_alias+set}
+ac_cv_env_target_alias_value=$target_alias
+ac_env_CC_set=${CC+set}
+ac_env_CC_value=$CC
+ac_cv_env_CC_set=${CC+set}
+ac_cv_env_CC_value=$CC
+ac_env_CFLAGS_set=${CFLAGS+set}
+ac_env_CFLAGS_value=$CFLAGS
+ac_cv_env_CFLAGS_set=${CFLAGS+set}
+ac_cv_env_CFLAGS_value=$CFLAGS
+ac_env_LDFLAGS_set=${LDFLAGS+set}
+ac_env_LDFLAGS_value=$LDFLAGS
+ac_cv_env_LDFLAGS_set=${LDFLAGS+set}
+ac_cv_env_LDFLAGS_value=$LDFLAGS
+ac_env_CPPFLAGS_set=${CPPFLAGS+set}
+ac_env_CPPFLAGS_value=$CPPFLAGS
+ac_cv_env_CPPFLAGS_set=${CPPFLAGS+set}
+ac_cv_env_CPPFLAGS_value=$CPPFLAGS
+ac_env_CPP_set=${CPP+set}
+ac_env_CPP_value=$CPP
+ac_cv_env_CPP_set=${CPP+set}
+ac_cv_env_CPP_value=$CPP
+
+#
+# Report the --help message.
+#
+if test "$ac_init_help" = "long"; then
+  # Omit some internal or obsolete options to make the list less imposing.
+  # This message is too long to be a string in the A/UX 3.1 sh.
+  cat <<EOF
+\`configure' configures this package to adapt to many kinds of systems.
+
+Usage: $0 [OPTION]... [VAR=VALUE]...
+
+To assign environment variables (e.g., CC, CFLAGS...), specify them as
+VAR=VALUE.  See below for descriptions of some of the useful variables.
+
+Defaults for the options are specified in brackets.
+
+Configuration:
+  -h, --help              display this help and exit
+      --help=short        display options specific to this package
+      --help=recursive    display the short help of all the included packages
+  -V, --version           display version information and exit
+  -q, --quiet, --silent   do not print \`checking...' messages
+      --cache-file=FILE   cache test results in FILE [disabled]
+  -C, --config-cache      alias for \`--cache-file=config.cache'
+  -n, --no-create         do not create output files
+      --srcdir=DIR        find the sources in DIR [configure dir or \`..']
+
+EOF
+
+  cat <<EOF
+Installation directories:
+  --prefix=PREFIX         install architecture-independent files in PREFIX
+                          [$ac_default_prefix]
+  --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
+                          [PREFIX]
+
+By default, \`make install' will install all the files in
+\`$ac_default_prefix/bin', \`$ac_default_prefix/lib' etc.  You can specify
+an installation prefix other than \`$ac_default_prefix' using \`--prefix',
+for instance \`--prefix=\$HOME'.
+
+For better control, use the options below.
+
+Fine tuning of the installation directories:
+  --bindir=DIR           user executables [EPREFIX/bin]
+  --sbindir=DIR          system admin executables [EPREFIX/sbin]
+  --libexecdir=DIR       program executables [EPREFIX/libexec]
+  --datadir=DIR          read-only architecture-independent data [PREFIX/share]
+  --sysconfdir=DIR       read-only single-machine data [PREFIX/etc]
+  --sharedstatedir=DIR   modifiable architecture-independent data [PREFIX/com]
+  --localstatedir=DIR    modifiable single-machine data [PREFIX/var]
+  --libdir=DIR           object code libraries [EPREFIX/lib]
+  --includedir=DIR       C header files [PREFIX/include]
+  --oldincludedir=DIR    C header files for non-gcc [/usr/include]
+  --infodir=DIR          info documentation [PREFIX/info]
+  --mandir=DIR           man documentation [PREFIX/man]
+EOF
+
+  cat <<\EOF
+
+Program names:
+  --program-prefix=PREFIX            prepend PREFIX to installed program names
+  --program-suffix=SUFFIX            append SUFFIX to installed program names
+  --program-transform-name=PROGRAM   run sed PROGRAM on installed program names
+
+X features:
+  --x-includes=DIR    X include files are in DIR
+  --x-libraries=DIR   X library files are in DIR
+
+System types:
+  --build=BUILD     configure for building on BUILD [guessed]
+  --host=HOST       build programs to run on HOST [BUILD]
+EOF
+fi
+
+if test -n "$ac_init_help"; then
+
+  cat <<\EOF
+
+Optional Features:
+  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
+  --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
+  --enable-shared=PKGS  build shared libraries default=yes
+  --enable-static=PKGS  build static libraries default=yes
+  --enable-fast-install=PKGS  optimize for fast installation default=yes
+  --disable-libtool-lock  avoid locking (might break parallel builds)
+  --enable-jpeg           enable support for JPEG default=no
+  --enable-freetype       enable support for FreeType default=no
+  --enable-xpm            enable support for XPM default=no
+
+Optional Packages:
+  --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
+  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
+  --with-gnu-ld           assume the C compiler uses GNU ld default=no
+  --with-pic              try to use only PIC/non-PIC objects default=use both
+  --with-x                use the X Window System
+
+Some influential environment variables:
+  CC          C compiler command
+  CFLAGS      C compiler flags
+  LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
+              nonstandard directory <lib dir>
+  CPPFLAGS    C/C++ preprocessor flags, e.g. -I<include dir> if you have
+              headers in a nonstandard directory <include dir>
+  CPP         C preprocessor
+
+Use these variables to override the choices made by `configure' or to help
+it to find libraries and programs with nonstandard names/locations.
+
+EOF
+fi
+
+if test "$ac_init_help" = "recursive"; then
+  # If there are subdirs, report their specific --help.
+  ac_popdir=`pwd`
+  for ac_subdir in : $ac_subdirs_all; do test "x$ac_subdir" = x: && continue
+    cd $ac_subdir
+    # A "../" for each directory in /$ac_subdir.
+    ac_dots=`echo $ac_subdir |
+             sed 's,^\./,,;s,[^/]$,&/,;s,[^/]*/,../,g'`
+
+    case $srcdir in
+    .) # No --srcdir option.  We are building in place.
+      ac_sub_srcdir=$srcdir ;;
+    [\\/]* | ?:[\\/]* ) # Absolute path.
+      ac_sub_srcdir=$srcdir/$ac_subdir ;;
+    *) # Relative path.
+      ac_sub_srcdir=$ac_dots$srcdir/$ac_subdir ;;
+    esac
+
+    # Check for guested configure; otherwise get Cygnus style configure.
+    if test -f $ac_sub_srcdir/configure.gnu; then
+      echo
+      $SHELL $ac_sub_srcdir/configure.gnu  --help=recursive
+    elif test -f $ac_sub_srcdir/configure; then
+      echo
+      $SHELL $ac_sub_srcdir/configure  --help=recursive
+    elif test -f $ac_sub_srcdir/configure.ac ||
+           test -f $ac_sub_srcdir/configure.in; then
+      echo
+      $ac_configure --help
+    else
+      echo "$as_me: WARNING: no configuration information is in $ac_subdir" >&2
+    fi
+    cd $ac_popdir
+  done
+fi
+
+test -n "$ac_init_help" && exit 0
+if $ac_init_version; then
+  cat <<\EOF
+
+Copyright 1992, 1993, 1994, 1995, 1996, 1998, 1999, 2000, 2001
+Free Software Foundation, Inc.
+This configure script is free software; the Free Software Foundation
+gives unlimited permission to copy, distribute and modify it.
+EOF
+  exit 0
+fi
+exec 5>config.log
+cat >&5 <<EOF
+This file contains any messages produced by compilers while
+running configure, to aid debugging if configure makes a mistake.
+
+It was created by $as_me, which was
+generated by GNU Autoconf 2.50.  Invocation command line was
+
+  $ $0 $@
+
+EOF
+{
+cat <<_ASUNAME
+## ---------- ##
+## Platform.  ##
+## ---------- ##
+
+hostname = `(hostname || uname -n) 2>/dev/null | sed 1q`
+uname -m = `(uname -m) 2>/dev/null || echo unknown`
+uname -r = `(uname -r) 2>/dev/null || echo unknown`
+uname -s = `(uname -s) 2>/dev/null || echo unknown`
+uname -v = `(uname -v) 2>/dev/null || echo unknown`
+
+/usr/bin/uname -p = `(/usr/bin/uname -p) 2>/dev/null || echo unknown`
+/bin/uname -X     = `(/bin/uname -X) 2>/dev/null     || echo unknown`
+
+/bin/arch              = `(/bin/arch) 2>/dev/null              || echo unknown`
+/usr/bin/arch -k       = `(/usr/bin/arch -k) 2>/dev/null       || echo unknown`
+/usr/convex/getsysinfo = `(/usr/convex/getsysinfo) 2>/dev/null || echo unknown`
+hostinfo               = `(hostinfo) 2>/dev/null               || echo unknown`
+/bin/machine           = `(/bin/machine) 2>/dev/null           || echo unknown`
+/usr/bin/oslevel       = `(/usr/bin/oslevel) 2>/dev/null       || echo unknown`
+/bin/universe          = `(/bin/universe) 2>/dev/null          || echo unknown`
+
+PATH = $PATH
+
+_ASUNAME
+} >&5
+
+cat >&5 <<EOF
+## ------------ ##
+## Core tests.  ##
+## ------------ ##
+
+EOF
+
+# Keep a trace of the command line.
+# Strip out --no-create and --no-recursion so they do not pile up.
+# Also quote any args containing shell meta-characters.
+ac_configure_args=
+ac_sep=
+for ac_arg
+do
+  case $ac_arg in
+  -no-create | --no-create | --no-creat | --no-crea | --no-cre \
+  | --no-cr | --no-c) ;;
+  -no-recursion | --no-recursion | --no-recursio | --no-recursi \
+  | --no-recurs | --no-recur | --no-recu | --no-rec | --no-re | --no-r) ;;
+  *" "*|*"	"*|*[\[\]\~\#\$\^\&\*\(\)\{\}\\\|\;\<\>\?\"\']*)
+    ac_arg=`echo "$ac_arg" | sed "s/'/'\\\\\\\\''/g"`
+    ac_configure_args="$ac_configure_args$ac_sep'$ac_arg'"
+    ac_sep=" " ;;
+  *) ac_configure_args="$ac_configure_args$ac_sep$ac_arg"
+     ac_sep=" " ;;
+  esac
+  # Get rid of the leading space.
+done
+
+# When interrupted or exit'd, cleanup temporary files, and complete
+# config.log.  We remove comments because anyway the quotes in there
+# would cause problems or look ugly.
+trap 'exit_status=$?
+  # Save into config.log some information that might help in debugging.
+  echo >&5
+  echo "## ----------------- ##" >&5
+  echo "## Cache variables.  ##" >&5
+  echo "## ----------------- ##" >&5
+  echo >&5
+  # The following way of writing the cache mishandles newlines in values,
+{
+  (set) 2>&1 |
+    case `(ac_space='"'"' '"'"'; set | grep ac_space) 2>&1` in
+    *ac_space=\ *)
+      sed -n \
+        "s/'"'"'/'"'"'\\\\'"'"''"'"'/g;
+    	  s/^\\([_$ac_cr_alnum]*_cv_[_$ac_cr_alnum]*\\)=\\(.*\\)/\\1='"'"'\\2'"'"'/p"
+      ;;
+    *)
+      sed -n \
+        "s/^\\([_$ac_cr_alnum]*_cv_[_$ac_cr_alnum]*\\)=\\(.*\\)/\\1=\\2/p"
+      ;;
+    esac;
+} >&5
+  sed "/^$/d" confdefs.h >conftest.log
+  if test -s conftest.log; then
+    echo >&5
+    echo "## ------------ ##" >&5
+    echo "## confdefs.h.  ##" >&5
+    echo "## ------------ ##" >&5
+    echo >&5
+    cat conftest.log >&5
+  fi
+  (echo; echo) >&5
+  test "$ac_signal" != 0 &&
+    echo "$as_me: caught signal $ac_signal" >&5
+  echo "$as_me: exit $exit_status" >&5
+  rm -rf conftest* confdefs* core core.* *.core conf$$* $ac_clean_files &&
+    exit $exit_status
+     ' 0
+for ac_signal in 1 2 13 15; do
+  trap 'ac_status=$?; ac_signal='$ac_signal'; { (exit $ac_status); exit $ac_status; }' $ac_signal
+done
+ac_signal=0
+
+# confdefs.h avoids OS command line length limits that DEFS can exceed.
+rm -rf conftest* confdefs.h
+# AIX cpp loses on an empty file, so make sure it contains at least a newline.
+echo >confdefs.h
+
+# Let the site file select an alternate cache file if it wants to.
+# Prefer explicitly selected file to automatically selected ones.
+if test -z "$CONFIG_SITE"; then
+  if test "x$prefix" != xNONE; then
+    CONFIG_SITE="$prefix/share/config.site $prefix/etc/config.site"
+  else
+    CONFIG_SITE="$ac_default_prefix/share/config.site $ac_default_prefix/etc/config.site"
+  fi
+fi
+for ac_site_file in $CONFIG_SITE; do
+  if test -r "$ac_site_file"; then
+    { echo "$as_me:993: loading site script $ac_site_file" >&5
+echo "$as_me: loading site script $ac_site_file" >&6;}
+    cat "$ac_site_file" >&5
+    . "$ac_site_file"
+  fi
+done
+
+if test -r "$cache_file"; then
+  # Some versions of bash will fail to source /dev/null (special
+  # files actually), so we avoid doing that.
+  if test -f "$cache_file"; then
+    { echo "$as_me:1004: loading cache $cache_file" >&5
+echo "$as_me: loading cache $cache_file" >&6;}
+    case $cache_file in
+      [\\/]* | ?:[\\/]* ) . $cache_file;;
+      *)                      . ./$cache_file;;
+    esac
+  fi
+else
+  { echo "$as_me:1012: creating cache $cache_file" >&5
+echo "$as_me: creating cache $cache_file" >&6;}
+  >$cache_file
+fi
+
+# Check that the precious variables saved in the cache have kept the same
+# value.
+ac_suggest_removing_cache=false
+for ac_var in `(set) 2>&1 |
+               sed -n 's/^ac_env_\([a-zA-Z_0-9]*\)_set=.*/\1/p'`; do
+  eval ac_old_set=\$ac_cv_env_${ac_var}_set
+  eval ac_new_set=\$ac_env_${ac_var}_set
+  eval ac_old_val="\$ac_cv_env_${ac_var}_value"
+  eval ac_new_val="\$ac_env_${ac_var}_value"
+  case $ac_old_set,$ac_new_set in
+    set,)
+      { echo "$as_me:1028: WARNING: \`$ac_var' was set to \`$ac_old_val' in the previous run" >&5
+echo "$as_me: WARNING: \`$ac_var' was set to \`$ac_old_val' in the previous run" >&2;}
+      ac_suggest_removing_cache=: ;;
+    ,set)
+      { echo "$as_me:1032: WARNING: \`$ac_var' was not set in the previous run" >&5
+echo "$as_me: WARNING: \`$ac_var' was not set in the previous run" >&2;}
+      ac_suggest_removing_cache=: ;;
+    ,);;
+    *)
+      if test "x$ac_old_val" != "x$ac_new_val"; then
+        { echo "$as_me:1038: WARNING: \`$ac_var' has changed since the previous run:" >&5
+echo "$as_me: WARNING: \`$ac_var' has changed since the previous run:" >&2;}
+        { echo "$as_me:1040: WARNING:   former value:  $ac_old_val" >&5
+echo "$as_me: WARNING:   former value:  $ac_old_val" >&2;}
+        { echo "$as_me:1042: WARNING:   current value: $ac_new_val" >&5
+echo "$as_me: WARNING:   current value: $ac_new_val" >&2;}
+        ac_suggest_removing_cache=:
+      fi;;
+  esac
+done
+if $ac_suggest_removing_cache; then
+  { echo "$as_me:1049: WARNING: changes in the environment can compromise the build" >&5
+echo "$as_me: WARNING: changes in the environment can compromise the build" >&2;}
+  { echo "$as_me:1051: WARNING: consider removing $cache_file and starting over" >&5
+echo "$as_me: WARNING: consider removing $cache_file and starting over" >&2;}
+fi
+
+ac_ext=c
+ac_cpp='$CPP $CPPFLAGS'
+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+
+case `echo "testing\c"; echo 1,2,3`,`echo -n testing; echo 1,2,3` in
+  *c*,-n*) ECHO_N= ECHO_C='
+' ECHO_T='	' ;;
+  *c*,*  ) ECHO_N=-n ECHO_C= ECHO_T= ;;
+  *)      ECHO_N= ECHO_C='\c' ECHO_T= ;;
+esac
+echo "#! $SHELL" >conftest.sh
+echo  "exit 0"   >>conftest.sh
+chmod +x conftest.sh
+if { (echo "$as_me:1070: PATH=\".;.\"; conftest.sh") >&5
+  (PATH=".;."; conftest.sh) 2>&5
+  ac_status=$?
+  echo "$as_me:1073: \$? = $ac_status" >&5
+  (exit $ac_status); }; then
+  ac_path_separator=';'
+else
+  ac_path_separator=:
+fi
+PATH_SEPARATOR="$ac_path_separator"
+rm -f conftest.sh
+
+ac_aux_dir=
+for ac_dir in $srcdir $srcdir/.. $srcdir/../..; do
+  if test -f $ac_dir/install-sh; then
+    ac_aux_dir=$ac_dir
+    ac_install_sh="$ac_aux_dir/install-sh -c"
+    break
+  elif test -f $ac_dir/install.sh; then
+    ac_aux_dir=$ac_dir
+    ac_install_sh="$ac_aux_dir/install.sh -c"
+    break
+  elif test -f $ac_dir/shtool; then
+    ac_aux_dir=$ac_dir
+    ac_install_sh="$ac_aux_dir/shtool install -c"
+    break
+  fi
+done
+if test -z "$ac_aux_dir"; then
+  { { echo "$as_me:1099: error: cannot find install-sh or install.sh in $srcdir $srcdir/.. $srcdir/../.." >&5
+echo "$as_me: error: cannot find install-sh or install.sh in $srcdir $srcdir/.. $srcdir/../.." >&2;}
+   { (exit 1); exit 1; }; }
+fi
+ac_config_guess="$SHELL $ac_aux_dir/config.guess"
+ac_config_sub="$SHELL $ac_aux_dir/config.sub"
+ac_configure="$SHELL $ac_aux_dir/configure" # This should be Cygnus configure.
+
+# Find a good install program.  We prefer a C program (faster),
+# so one script is as good as another.  But avoid the broken or
+# incompatible versions:
+# SysV /etc/install, /usr/sbin/install
+# SunOS /usr/etc/install
+# IRIX /sbin/install
+# AIX /bin/install
+# AmigaOS /C/install, which installs bootblocks on floppy discs
+# AIX 4 /usr/bin/installbsd, which doesn't work without a -g flag
+# AFS /usr/afsws/bin/install, which mishandles nonexistent args
+# SVR4 /usr/ucb/install, which tries to use the nonexistent group "staff"
+# ./install, which can be erroneously created by make from ./install.sh.
+echo "$as_me:1119: checking for a BSD compatible install" >&5
+echo $ECHO_N "checking for a BSD compatible install... $ECHO_C" >&6
+if test -z "$INSTALL"; then
+if test "${ac_cv_path_install+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+    ac_save_IFS=$IFS; IFS=$ac_path_separator
+  for ac_dir in $PATH; do
+    IFS=$ac_save_IFS
+    # Account for people who put trailing slashes in PATH elements.
+    case $ac_dir/ in
+    / | ./ | .// | /cC/* \
+    | /etc/* | /usr/sbin/* | /usr/etc/* | /sbin/* | /usr/afsws/bin/* \
+    | /usr/ucb/* ) ;;
+    *)
+      # OSF1 and SCO ODT 3.0 have their own names for install.
+      # Don't use installbsd from OSF since it installs stuff as root
+      # by default.
+      for ac_prog in ginstall scoinst install; do
+        if $as_executable_p "$ac_dir/$ac_prog"; then
+	  if test $ac_prog = install &&
+            grep dspmsg "$ac_dir/$ac_prog" >/dev/null 2>&1; then
+	    # AIX install.  It has an incompatible calling convention.
+	    :
+	  elif test $ac_prog = install &&
+	    grep pwplus "$ac_dir/$ac_prog" >/dev/null 2>&1; then
+	    # program-specific install script used by HP pwplus--don't use.
+	    :
+	  else
+	    ac_cv_path_install="$ac_dir/$ac_prog -c"
+	    break 2
+	  fi
+	fi
+      done
+      ;;
+    esac
+  done
+
+fi
+  if test "${ac_cv_path_install+set}" = set; then
+    INSTALL=$ac_cv_path_install
+  else
+    # As a last resort, use the slow shell script.  We don't cache a
+    # path for INSTALL within a source directory, because that will
+    # break other packages using the cache if that directory is
+    # removed, or if the path is relative.
+    INSTALL=$ac_install_sh
+  fi
+fi
+echo "$as_me:1168: result: $INSTALL" >&5
+echo "${ECHO_T}$INSTALL" >&6
+
+# Use test -z because SunOS4 sh mishandles braces in ${var-val}.
+# It thinks the first close brace ends the variable substitution.
+test -z "$INSTALL_PROGRAM" && INSTALL_PROGRAM='${INSTALL}'
+
+test -z "$INSTALL_SCRIPT" && INSTALL_SCRIPT='${INSTALL}'
+
+test -z "$INSTALL_DATA" && INSTALL_DATA='${INSTALL} -m 644'
+
+echo "$as_me:1179: checking whether build environment is sane" >&5
+echo $ECHO_N "checking whether build environment is sane... $ECHO_C" >&6
+# Just in case
+sleep 1
+echo timestamp > conftestfile
+# Do `set' in a subshell so we don't clobber the current shell's
+# arguments.  Must try -L first in case configure is actually a
+# symlink; some systems play weird games with the mod time of symlinks
+# (eg FreeBSD returns the mod time of the symlink's containing
+# directory).
+if (
+   set X `ls -Lt $srcdir/configure conftestfile 2> /dev/null`
+   if test "$*" = "X"; then
+      # -L didn't work.
+      set X `ls -t $srcdir/configure conftestfile`
+   fi
+   if test "$*" != "X $srcdir/configure conftestfile" \
+      && test "$*" != "X conftestfile $srcdir/configure"; then
+
+      # If neither matched, then we have a broken ls.  This can happen
+      # if, for instance, CONFIG_SHELL is bash and it inherits a
+      # broken ls alias from the environment.  This has actually
+      # happened.  Such a system could not be considered "sane".
+      { { echo "$as_me:1202: error: ls -t appears to fail.  Make sure there is not a broken
+alias in your environment" >&5
+echo "$as_me: error: ls -t appears to fail.  Make sure there is not a broken
+alias in your environment" >&2;}
+   { (exit 1); exit 1; }; }
+   fi
+
+   test "$2" = conftestfile
+   )
+then
+   # Ok.
+   :
+else
+   { { echo "$as_me:1215: error: newly created file is older than distributed files!
+Check your system clock" >&5
+echo "$as_me: error: newly created file is older than distributed files!
+Check your system clock" >&2;}
+   { (exit 1); exit 1; }; }
+fi
+rm -f conftest*
+echo "$as_me:1222: result: yes" >&5
+echo "${ECHO_T}yes" >&6
+if test "$program_transform_name" = s,x,x,; then
+  program_transform_name=
+else
+  # Double any \ or $.  echo might interpret backslashes.
+  cat <<\EOF >conftest.sed
+s,\\,\\\\,g; s,\$,$$,g
+EOF
+  program_transform_name=`echo $program_transform_name | sed -f conftest.sed`
+  rm -f conftest.sed
+fi
+test "$program_prefix" != NONE &&
+  program_transform_name="s,^,${program_prefix},;$program_transform_name"
+# Use a double $ so make ignores it.
+test "$program_suffix" != NONE &&
+  program_transform_name="s,\$\$,${program_suffix},;$program_transform_name"
+
+# sed with no file args requires a program.
+test -z "$program_transform_name" && program_transform_name="s,x,x,"
+
+echo "$as_me:1243: checking whether ${MAKE-make} sets \${MAKE}" >&5
+echo $ECHO_N "checking whether ${MAKE-make} sets \${MAKE}... $ECHO_C" >&6
+set dummy ${MAKE-make}; ac_make=`echo "$2" | sed 'y,./+-,__p_,'`
+if eval "test \"\${ac_cv_prog_make_${ac_make}_set+set}\" = set"; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.make <<\EOF
+all:
+	@echo 'ac_maketemp="${MAKE}"'
+EOF
+# GNU make sometimes prints "make[1]: Entering...", which would confuse us.
+eval `${MAKE-make} -f conftest.make 2>/dev/null | grep temp=`
+if test -n "$ac_maketemp"; then
+  eval ac_cv_prog_make_${ac_make}_set=yes
+else
+  eval ac_cv_prog_make_${ac_make}_set=no
+fi
+rm -f conftest.make
+fi
+if eval "test \"`echo '$ac_cv_prog_make_'${ac_make}_set`\" = yes"; then
+  echo "$as_me:1263: result: yes" >&5
+echo "${ECHO_T}yes" >&6
+  SET_MAKE=
+else
+  echo "$as_me:1267: result: no" >&5
+echo "${ECHO_T}no" >&6
+  SET_MAKE="MAKE=${MAKE-make}"
+fi
+
+PACKAGE=gd
+
+VERSION=1.8.4
+
+if test "`cd $srcdir && pwd`" != "`pwd`" && test -f $srcdir/config.status; then
+  { { echo "$as_me:1277: error: source directory already configured; run \"make distclean\" there first" >&5
+echo "$as_me: error: source directory already configured; run \"make distclean\" there first" >&2;}
+   { (exit 1); exit 1; }; }
+fi
+
+cat >>confdefs.h <<EOF
+#define PACKAGE "$PACKAGE"
+EOF
+
+cat >>confdefs.h <<EOF
+#define VERSION "$VERSION"
+EOF
+
+missing_dir=`cd $ac_aux_dir && pwd`
+echo "$as_me:1291: checking for working aclocal" >&5
+echo $ECHO_N "checking for working aclocal... $ECHO_C" >&6
+# Run test in a subshell; some versions of sh will print an error if
+# an executable is not found, even if stderr is redirected.
+# Redirect stdin to placate older versions of autoconf.  Sigh.
+if (aclocal --version) < /dev/null > /dev/null 2>&1; then
+   ACLOCAL=aclocal
+   echo "$as_me:1298: result: found" >&5
+echo "${ECHO_T}found" >&6
+else
+   ACLOCAL="$missing_dir/missing aclocal"
+   echo "$as_me:1302: result: missing" >&5
+echo "${ECHO_T}missing" >&6
+fi
+
+echo "$as_me:1306: checking for working autoconf" >&5
+echo $ECHO_N "checking for working autoconf... $ECHO_C" >&6
+# Run test in a subshell; some versions of sh will print an error if
+# an executable is not found, even if stderr is redirected.
+# Redirect stdin to placate older versions of autoconf.  Sigh.
+if (autoconf --version) < /dev/null > /dev/null 2>&1; then
+   AUTOCONF=autoconf
+   echo "$as_me:1313: result: found" >&5
+echo "${ECHO_T}found" >&6
+else
+   AUTOCONF="$missing_dir/missing autoconf"
+   echo "$as_me:1317: result: missing" >&5
+echo "${ECHO_T}missing" >&6
+fi
+
+echo "$as_me:1321: checking for working automake" >&5
+echo $ECHO_N "checking for working automake... $ECHO_C" >&6
+# Run test in a subshell; some versions of sh will print an error if
+# an executable is not found, even if stderr is redirected.
+# Redirect stdin to placate older versions of autoconf.  Sigh.
+if (automake --version) < /dev/null > /dev/null 2>&1; then
+   AUTOMAKE=automake
+   echo "$as_me:1328: result: found" >&5
+echo "${ECHO_T}found" >&6
+else
+   AUTOMAKE="$missing_dir/missing automake"
+   echo "$as_me:1332: result: missing" >&5
+echo "${ECHO_T}missing" >&6
+fi
+
+echo "$as_me:1336: checking for working autoheader" >&5
+echo $ECHO_N "checking for working autoheader... $ECHO_C" >&6
+# Run test in a subshell; some versions of sh will print an error if
+# an executable is not found, even if stderr is redirected.
+# Redirect stdin to placate older versions of autoconf.  Sigh.
+if (autoheader --version) < /dev/null > /dev/null 2>&1; then
+   AUTOHEADER=autoheader
+   echo "$as_me:1343: result: found" >&5
+echo "${ECHO_T}found" >&6
+else
+   AUTOHEADER="$missing_dir/missing autoheader"
+   echo "$as_me:1347: result: missing" >&5
+echo "${ECHO_T}missing" >&6
+fi
+
+echo "$as_me:1351: checking for working makeinfo" >&5
+echo $ECHO_N "checking for working makeinfo... $ECHO_C" >&6
+# Run test in a subshell; some versions of sh will print an error if
+# an executable is not found, even if stderr is redirected.
+# Redirect stdin to placate older versions of autoconf.  Sigh.
+if (makeinfo --version) < /dev/null > /dev/null 2>&1; then
+   MAKEINFO=makeinfo
+   echo "$as_me:1358: result: found" >&5
+echo "${ECHO_T}found" >&6
+else
+   MAKEINFO="$missing_dir/missing makeinfo"
+   echo "$as_me:1362: result: missing" >&5
+echo "${ECHO_T}missing" >&6
+fi
+
+ac_ext=c
+ac_cpp='$CPP $CPPFLAGS'
+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+if test -n "$ac_tool_prefix"; then
+  # Extract the first word of "${ac_tool_prefix}gcc", so it can be a program name with args.
+set dummy ${ac_tool_prefix}gcc; ac_word=$2
+echo "$as_me:1374: checking for $ac_word" >&5
+echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+if test "${ac_cv_prog_CC+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  if test -n "$CC"; then
+  ac_cv_prog_CC="$CC" # Let the user override the test.
+else
+  ac_save_IFS=$IFS; IFS=$ac_path_separator
+ac_dummy="$PATH"
+for ac_dir in $ac_dummy; do
+  IFS=$ac_save_IFS
+  test -z "$ac_dir" && ac_dir=.
+  $as_executable_p "$ac_dir/$ac_word" || continue
+ac_cv_prog_CC="${ac_tool_prefix}gcc"
+echo "$as_me:1389: found $ac_dir/$ac_word" >&5
+break
+done
+
+fi
+fi
+CC=$ac_cv_prog_CC
+if test -n "$CC"; then
+  echo "$as_me:1397: result: $CC" >&5
+echo "${ECHO_T}$CC" >&6
+else
+  echo "$as_me:1400: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+fi
+if test -z "$ac_cv_prog_CC"; then
+  ac_ct_CC=$CC
+  # Extract the first word of "gcc", so it can be a program name with args.
+set dummy gcc; ac_word=$2
+echo "$as_me:1409: checking for $ac_word" >&5
+echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+if test "${ac_cv_prog_ac_ct_CC+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  if test -n "$ac_ct_CC"; then
+  ac_cv_prog_ac_ct_CC="$ac_ct_CC" # Let the user override the test.
+else
+  ac_save_IFS=$IFS; IFS=$ac_path_separator
+ac_dummy="$PATH"
+for ac_dir in $ac_dummy; do
+  IFS=$ac_save_IFS
+  test -z "$ac_dir" && ac_dir=.
+  $as_executable_p "$ac_dir/$ac_word" || continue
+ac_cv_prog_ac_ct_CC="gcc"
+echo "$as_me:1424: found $ac_dir/$ac_word" >&5
+break
+done
+
+fi
+fi
+ac_ct_CC=$ac_cv_prog_ac_ct_CC
+if test -n "$ac_ct_CC"; then
+  echo "$as_me:1432: result: $ac_ct_CC" >&5
+echo "${ECHO_T}$ac_ct_CC" >&6
+else
+  echo "$as_me:1435: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+  CC=$ac_ct_CC
+else
+  CC="$ac_cv_prog_CC"
+fi
+
+if test -z "$CC"; then
+  if test -n "$ac_tool_prefix"; then
+  # Extract the first word of "${ac_tool_prefix}cc", so it can be a program name with args.
+set dummy ${ac_tool_prefix}cc; ac_word=$2
+echo "$as_me:1448: checking for $ac_word" >&5
+echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+if test "${ac_cv_prog_CC+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  if test -n "$CC"; then
+  ac_cv_prog_CC="$CC" # Let the user override the test.
+else
+  ac_save_IFS=$IFS; IFS=$ac_path_separator
+ac_dummy="$PATH"
+for ac_dir in $ac_dummy; do
+  IFS=$ac_save_IFS
+  test -z "$ac_dir" && ac_dir=.
+  $as_executable_p "$ac_dir/$ac_word" || continue
+ac_cv_prog_CC="${ac_tool_prefix}cc"
+echo "$as_me:1463: found $ac_dir/$ac_word" >&5
+break
+done
+
+fi
+fi
+CC=$ac_cv_prog_CC
+if test -n "$CC"; then
+  echo "$as_me:1471: result: $CC" >&5
+echo "${ECHO_T}$CC" >&6
+else
+  echo "$as_me:1474: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+fi
+if test -z "$ac_cv_prog_CC"; then
+  ac_ct_CC=$CC
+  # Extract the first word of "cc", so it can be a program name with args.
+set dummy cc; ac_word=$2
+echo "$as_me:1483: checking for $ac_word" >&5
+echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+if test "${ac_cv_prog_ac_ct_CC+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  if test -n "$ac_ct_CC"; then
+  ac_cv_prog_ac_ct_CC="$ac_ct_CC" # Let the user override the test.
+else
+  ac_save_IFS=$IFS; IFS=$ac_path_separator
+ac_dummy="$PATH"
+for ac_dir in $ac_dummy; do
+  IFS=$ac_save_IFS
+  test -z "$ac_dir" && ac_dir=.
+  $as_executable_p "$ac_dir/$ac_word" || continue
+ac_cv_prog_ac_ct_CC="cc"
+echo "$as_me:1498: found $ac_dir/$ac_word" >&5
+break
+done
+
+fi
+fi
+ac_ct_CC=$ac_cv_prog_ac_ct_CC
+if test -n "$ac_ct_CC"; then
+  echo "$as_me:1506: result: $ac_ct_CC" >&5
+echo "${ECHO_T}$ac_ct_CC" >&6
+else
+  echo "$as_me:1509: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+  CC=$ac_ct_CC
+else
+  CC="$ac_cv_prog_CC"
+fi
+
+fi
+if test -z "$CC"; then
+  # Extract the first word of "cc", so it can be a program name with args.
+set dummy cc; ac_word=$2
+echo "$as_me:1522: checking for $ac_word" >&5
+echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+if test "${ac_cv_prog_CC+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  if test -n "$CC"; then
+  ac_cv_prog_CC="$CC" # Let the user override the test.
+else
+  ac_prog_rejected=no
+  ac_save_IFS=$IFS; IFS=$ac_path_separator
+ac_dummy="$PATH"
+for ac_dir in $ac_dummy; do
+  IFS=$ac_save_IFS
+  test -z "$ac_dir" && ac_dir=.
+  $as_executable_p "$ac_dir/$ac_word" || continue
+if test "$ac_dir/$ac_word" = "/usr/ucb/cc"; then
+  ac_prog_rejected=yes
+  continue
+fi
+ac_cv_prog_CC="cc"
+echo "$as_me:1542: found $ac_dir/$ac_word" >&5
+break
+done
+
+if test $ac_prog_rejected = yes; then
+  # We found a bogon in the path, so make sure we never use it.
+  set dummy $ac_cv_prog_CC
+  shift
+  if test $# != 0; then
+    # We chose a different compiler from the bogus one.
+    # However, it has the same basename, so the bogon will be chosen
+    # first if we set CC to just the basename; use the full file name.
+    shift
+    set dummy "$ac_dir/$ac_word" ${1+"$@"}
+    shift
+    ac_cv_prog_CC="$@"
+  fi
+fi
+fi
+fi
+CC=$ac_cv_prog_CC
+if test -n "$CC"; then
+  echo "$as_me:1564: result: $CC" >&5
+echo "${ECHO_T}$CC" >&6
+else
+  echo "$as_me:1567: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+fi
+if test -z "$CC"; then
+  if test -n "$ac_tool_prefix"; then
+  for ac_prog in cl
+  do
+    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
+set dummy $ac_tool_prefix$ac_prog; ac_word=$2
+echo "$as_me:1578: checking for $ac_word" >&5
+echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+if test "${ac_cv_prog_CC+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  if test -n "$CC"; then
+  ac_cv_prog_CC="$CC" # Let the user override the test.
+else
+  ac_save_IFS=$IFS; IFS=$ac_path_separator
+ac_dummy="$PATH"
+for ac_dir in $ac_dummy; do
+  IFS=$ac_save_IFS
+  test -z "$ac_dir" && ac_dir=.
+  $as_executable_p "$ac_dir/$ac_word" || continue
+ac_cv_prog_CC="$ac_tool_prefix$ac_prog"
+echo "$as_me:1593: found $ac_dir/$ac_word" >&5
+break
+done
+
+fi
+fi
+CC=$ac_cv_prog_CC
+if test -n "$CC"; then
+  echo "$as_me:1601: result: $CC" >&5
+echo "${ECHO_T}$CC" >&6
+else
+  echo "$as_me:1604: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+    test -n "$CC" && break
+  done
+fi
+if test -z "$CC"; then
+  ac_ct_CC=$CC
+  for ac_prog in cl
+do
+  # Extract the first word of "$ac_prog", so it can be a program name with args.
+set dummy $ac_prog; ac_word=$2
+echo "$as_me:1617: checking for $ac_word" >&5
+echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+if test "${ac_cv_prog_ac_ct_CC+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  if test -n "$ac_ct_CC"; then
+  ac_cv_prog_ac_ct_CC="$ac_ct_CC" # Let the user override the test.
+else
+  ac_save_IFS=$IFS; IFS=$ac_path_separator
+ac_dummy="$PATH"
+for ac_dir in $ac_dummy; do
+  IFS=$ac_save_IFS
+  test -z "$ac_dir" && ac_dir=.
+  $as_executable_p "$ac_dir/$ac_word" || continue
+ac_cv_prog_ac_ct_CC="$ac_prog"
+echo "$as_me:1632: found $ac_dir/$ac_word" >&5
+break
+done
+
+fi
+fi
+ac_ct_CC=$ac_cv_prog_ac_ct_CC
+if test -n "$ac_ct_CC"; then
+  echo "$as_me:1640: result: $ac_ct_CC" >&5
+echo "${ECHO_T}$ac_ct_CC" >&6
+else
+  echo "$as_me:1643: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+  test -n "$ac_ct_CC" && break
+done
+
+  CC=$ac_ct_CC
+fi
+
+fi
+
+test -z "$CC" && { { echo "$as_me:1655: error: no acceptable cc found in \$PATH" >&5
+echo "$as_me: error: no acceptable cc found in \$PATH" >&2;}
+   { (exit 1); exit 1; }; }
+
+cat >conftest.$ac_ext <<_ACEOF
+#line 1660 "configure"
+#include "confdefs.h"
+
+int
+main ()
+{
+
+  ;
+  return 0;
+}
+_ACEOF
+ac_clean_files_save=$ac_clean_files
+ac_clean_files="$ac_clean_files a.out a.exe"
+# Try to create an executable without -o first, disregard a.out.
+# It will help us diagnose broken compiler, and finding out an intuition
+# of exeext.
+echo "$as_me:1676: checking for C compiler default output" >&5
+echo $ECHO_N "checking for C compiler default output... $ECHO_C" >&6
+ac_link_default=`echo "$ac_link" | sed 's/ -o *conftest[^ ]*//'`
+if { (eval echo "$as_me:1679: \"$ac_link_default\"") >&5
+  (eval $ac_link_default) 2>&5
+  ac_status=$?
+  echo "$as_me:1682: \$? = $ac_status" >&5
+  (exit $ac_status); }; then
+  for ac_file in `ls a.exe conftest.exe a.* conftest conftest.* 2>/dev/null`; do
+  case $ac_file in
+    *.$ac_ext | *.o | *.obj | *.xcoff | *.tds | *.d | *.pdb ) ;;
+    a.out ) # We found the default executable, but exeext='' is most
+            # certainly right.
+            break;;
+    *.* ) ac_cv_exeext=`expr "$ac_file" : '[^.]*\(\..*\)'`
+          export ac_cv_exeext
+          break;;
+    * ) break;;
+  esac
+done
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+{ { echo "$as_me:1699: error: C compiler cannot create executables" >&5
+echo "$as_me: error: C compiler cannot create executables" >&2;}
+   { (exit 77); exit 77; }; }
+fi
+
+ac_exeext=$ac_cv_exeext
+echo "$as_me:1705: result: $ac_file" >&5
+echo "${ECHO_T}$ac_file" >&6
+
+# Check the compiler produces executables we can run.  If not, either
+# the compiler is broken, or we cross compile.
+echo "$as_me:1710: checking whether the C compiler works" >&5
+echo $ECHO_N "checking whether the C compiler works... $ECHO_C" >&6
+# FIXME: These cross compiler hacks should be removed for Autoconf 3.0
+# If not cross compiling, check that we can run a simple program.
+if test "$cross_compiling" != yes; then
+  if { ac_try='./$ac_file'
+  { (eval echo "$as_me:1716: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:1719: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+    cross_compiling=no
+  else
+    if test "$cross_compiling" = maybe; then
+	cross_compiling=yes
+    else
+	{ { echo "$as_me:1726: error: cannot run C compiled programs.
+If you meant to cross compile, use \`--host'." >&5
+echo "$as_me: error: cannot run C compiled programs.
+If you meant to cross compile, use \`--host'." >&2;}
+   { (exit 1); exit 1; }; }
+    fi
+  fi
+fi
+echo "$as_me:1734: result: yes" >&5
+echo "${ECHO_T}yes" >&6
+
+rm -f a.out a.exe conftest$ac_cv_exeext
+ac_clean_files=$ac_clean_files_save
+# Check the compiler produces executables we can run.  If not, either
+# the compiler is broken, or we cross compile.
+echo "$as_me:1741: checking whether we are cross compiling" >&5
+echo $ECHO_N "checking whether we are cross compiling... $ECHO_C" >&6
+echo "$as_me:1743: result: $cross_compiling" >&5
+echo "${ECHO_T}$cross_compiling" >&6
+
+echo "$as_me:1746: checking for executable suffix" >&5
+echo $ECHO_N "checking for executable suffix... $ECHO_C" >&6
+if { (eval echo "$as_me:1748: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:1751: \$? = $ac_status" >&5
+  (exit $ac_status); }; then
+  # If both `conftest.exe' and `conftest' are `present' (well, observable)
+# catch `conftest.exe'.  For instance with Cygwin, `ls conftest' will
+# work properly (i.e., refer to `conftest.exe'), while it won't with
+# `rm'.
+for ac_file in `(ls conftest.exe; ls conftest; ls conftest.*) 2>/dev/null`; do
+  case $ac_file in
+    *.$ac_ext | *.o | *.obj | *.xcoff | *.tds | *.d | *.pdb ) ;;
+    *.* ) ac_cv_exeext=`expr "$ac_file" : '[^.]*\(\..*\)'`
+          export ac_cv_exeext
+          break;;
+    * ) break;;
+  esac
+done
+else
+  { { echo "$as_me:1767: error: cannot compute EXEEXT: cannot compile and link" >&5
+echo "$as_me: error: cannot compute EXEEXT: cannot compile and link" >&2;}
+   { (exit 1); exit 1; }; }
+fi
+
+rm -f conftest$ac_cv_exeext
+echo "$as_me:1773: result: $ac_cv_exeext" >&5
+echo "${ECHO_T}$ac_cv_exeext" >&6
+
+rm -f conftest.$ac_ext
+EXEEXT=$ac_cv_exeext
+ac_exeext=$EXEEXT
+echo "$as_me:1779: checking for object suffix" >&5
+echo $ECHO_N "checking for object suffix... $ECHO_C" >&6
+if test "${ac_cv_objext+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 1785 "configure"
+#include "confdefs.h"
+
+int
+main ()
+{
+
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.o conftest.obj
+if { (eval echo "$as_me:1797: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:1800: \$? = $ac_status" >&5
+  (exit $ac_status); }; then
+  for ac_file in `(ls conftest.o conftest.obj; ls conftest.*) 2>/dev/null`; do
+  case $ac_file in
+    *.$ac_ext | *.xcoff | *.tds | *.d | *.pdb ) ;;
+    *) ac_cv_objext=`expr "$ac_file" : '.*\.\(.*\)'`
+       break;;
+  esac
+done
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+{ { echo "$as_me:1812: error: cannot compute OBJEXT: cannot compile" >&5
+echo "$as_me: error: cannot compute OBJEXT: cannot compile" >&2;}
+   { (exit 1); exit 1; }; }
+fi
+
+rm -f conftest.$ac_cv_objext conftest.$ac_ext
+fi
+echo "$as_me:1819: result: $ac_cv_objext" >&5
+echo "${ECHO_T}$ac_cv_objext" >&6
+OBJEXT=$ac_cv_objext
+ac_objext=$OBJEXT
+echo "$as_me:1823: checking whether we are using the GNU C compiler" >&5
+echo $ECHO_N "checking whether we are using the GNU C compiler... $ECHO_C" >&6
+if test "${ac_cv_c_compiler_gnu+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 1829 "configure"
+#include "confdefs.h"
+
+int
+main ()
+{
+#ifndef __GNUC__
+       choke me
+#endif
+
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext
+if { (eval echo "$as_me:1844: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:1847: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest.$ac_objext'
+  { (eval echo "$as_me:1850: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:1853: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_compiler_gnu=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_compiler_gnu=no
+fi
+rm -f conftest.$ac_objext conftest.$ac_ext
+ac_cv_c_compiler_gnu=$ac_compiler_gnu
+
+fi
+echo "$as_me:1865: result: $ac_cv_c_compiler_gnu" >&5
+echo "${ECHO_T}$ac_cv_c_compiler_gnu" >&6
+GCC=`test $ac_compiler_gnu = yes && echo yes`
+ac_test_CFLAGS=${CFLAGS+set}
+ac_save_CFLAGS=$CFLAGS
+CFLAGS="-g"
+echo "$as_me:1871: checking whether $CC accepts -g" >&5
+echo $ECHO_N "checking whether $CC accepts -g... $ECHO_C" >&6
+if test "${ac_cv_prog_cc_g+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 1877 "configure"
+#include "confdefs.h"
+
+int
+main ()
+{
+
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext
+if { (eval echo "$as_me:1889: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:1892: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest.$ac_objext'
+  { (eval echo "$as_me:1895: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:1898: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_prog_cc_g=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_prog_cc_g=no
+fi
+rm -f conftest.$ac_objext conftest.$ac_ext
+fi
+echo "$as_me:1908: result: $ac_cv_prog_cc_g" >&5
+echo "${ECHO_T}$ac_cv_prog_cc_g" >&6
+if test "$ac_test_CFLAGS" = set; then
+  CFLAGS=$ac_save_CFLAGS
+elif test $ac_cv_prog_cc_g = yes; then
+  if test "$GCC" = yes; then
+    CFLAGS="-g -O2"
+  else
+    CFLAGS="-g"
+  fi
+else
+  if test "$GCC" = yes; then
+    CFLAGS="-O2"
+  else
+    CFLAGS=
+  fi
+fi
+# Some people use a C++ compiler to compile C.  Since we use `exit',
+# in C++ we need to declare it.  In case someone uses the same compiler
+# for both compiling C and C++ we need to have the C++ compiler decide
+# the declaration of exit, since it's the most demanding environment.
+cat >conftest.$ac_ext <<_ACEOF
+#ifndef __cplusplus
+  choke me
+#endif
+_ACEOF
+rm -f conftest.$ac_objext
+if { (eval echo "$as_me:1935: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:1938: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest.$ac_objext'
+  { (eval echo "$as_me:1941: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:1944: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  for ac_declaration in \
+   ''\
+   '#include <stdlib.h>' \
+   'extern "C" void std::exit (int) throw (); using std::exit;' \
+   'extern "C" void std::exit (int); using std::exit;' \
+   'extern "C" void exit (int) throw ();' \
+   'extern "C" void exit (int);' \
+   'void exit (int);'
+do
+  cat >conftest.$ac_ext <<_ACEOF
+#line 1956 "configure"
+#include "confdefs.h"
+#include <stdlib.h>
+$ac_declaration
+int
+main ()
+{
+exit (42);
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext
+if { (eval echo "$as_me:1969: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:1972: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest.$ac_objext'
+  { (eval echo "$as_me:1975: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:1978: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  :
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+continue
+fi
+rm -f conftest.$ac_objext conftest.$ac_ext
+  cat >conftest.$ac_ext <<_ACEOF
+#line 1988 "configure"
+#include "confdefs.h"
+$ac_declaration
+int
+main ()
+{
+exit (42);
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext
+if { (eval echo "$as_me:2000: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:2003: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest.$ac_objext'
+  { (eval echo "$as_me:2006: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:2009: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  break
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+fi
+rm -f conftest.$ac_objext conftest.$ac_ext
+done
+echo '#ifdef __cplusplus' >>confdefs.h
+echo $ac_declaration      >>confdefs.h
+echo '#endif'             >>confdefs.h
+
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+fi
+rm -f conftest.$ac_objext conftest.$ac_ext
+ac_ext=c
+ac_cpp='$CPP $CPPFLAGS'
+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+
+        echo "$as_me:2033: checking for strerror in -lcposix" >&5
+echo $ECHO_N "checking for strerror in -lcposix... $ECHO_C" >&6
+if test "${ac_cv_lib_cposix_strerror+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  ac_check_lib_save_LIBS=$LIBS
+LIBS="-lcposix  $LIBS"
+cat >conftest.$ac_ext <<_ACEOF
+#line 2041 "configure"
+#include "confdefs.h"
+
+/* Override any gcc2 internal prototype to avoid an error.  */
+#ifdef __cplusplus
+extern "C"
+#endif
+/* We use char because int might match the return type of a gcc2
+   builtin and then its argument prototype would still apply.  */
+char strerror ();
+int
+main ()
+{
+strerror ();
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:2060: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:2063: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:2066: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:2069: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_lib_cposix_strerror=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_lib_cposix_strerror=no
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+LIBS=$ac_check_lib_save_LIBS
+fi
+echo "$as_me:2080: result: $ac_cv_lib_cposix_strerror" >&5
+echo "${ECHO_T}$ac_cv_lib_cposix_strerror" >&6
+if test $ac_cv_lib_cposix_strerror = yes; then
+  LIBS="$LIBS -lcposix"
+fi
+
+# Check whether --enable-shared or --disable-shared was given.
+if test "${enable_shared+set}" = set; then
+  enableval="$enable_shared"
+  p=${PACKAGE-default}
+case $enableval in
+yes) enable_shared=yes ;;
+no) enable_shared=no ;;
+*)
+  enable_shared=no
+  # Look at the argument we got.  We use all the common list separators.
+  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
+  for pkg in $enableval; do
+    if test "X$pkg" = "X$p"; then
+      enable_shared=yes
+    fi
+  done
+  IFS="$ac_save_ifs"
+  ;;
+esac
+else
+  enable_shared=yes
+fi;
+# Check whether --enable-static or --disable-static was given.
+if test "${enable_static+set}" = set; then
+  enableval="$enable_static"
+  p=${PACKAGE-default}
+case $enableval in
+yes) enable_static=yes ;;
+no) enable_static=no ;;
+*)
+  enable_static=no
+  # Look at the argument we got.  We use all the common list separators.
+  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
+  for pkg in $enableval; do
+    if test "X$pkg" = "X$p"; then
+      enable_static=yes
+    fi
+  done
+  IFS="$ac_save_ifs"
+  ;;
+esac
+else
+  enable_static=yes
+fi;
+# Check whether --enable-fast-install or --disable-fast-install was given.
+if test "${enable_fast_install+set}" = set; then
+  enableval="$enable_fast_install"
+  p=${PACKAGE-default}
+case $enableval in
+yes) enable_fast_install=yes ;;
+no) enable_fast_install=no ;;
+*)
+  enable_fast_install=no
+  # Look at the argument we got.  We use all the common list separators.
+  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
+  for pkg in $enableval; do
+    if test "X$pkg" = "X$p"; then
+      enable_fast_install=yes
+    fi
+  done
+  IFS="$ac_save_ifs"
+  ;;
+esac
+else
+  enable_fast_install=yes
+fi;
+# Make sure we can run config.sub.
+$ac_config_sub sun4 >/dev/null 2>&1 ||
+  { { echo "$as_me:2154: error: cannot run $ac_config_sub" >&5
+echo "$as_me: error: cannot run $ac_config_sub" >&2;}
+   { (exit 1); exit 1; }; }
+
+echo "$as_me:2158: checking build system type" >&5
+echo $ECHO_N "checking build system type... $ECHO_C" >&6
+if test "${ac_cv_build+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  ac_cv_build_alias=$build_alias
+test -z "$ac_cv_build_alias" &&
+  ac_cv_build_alias=`$ac_config_guess`
+test -z "$ac_cv_build_alias" &&
+  { { echo "$as_me:2167: error: cannot guess build type; you must specify one" >&5
+echo "$as_me: error: cannot guess build type; you must specify one" >&2;}
+   { (exit 1); exit 1; }; }
+ac_cv_build=`$ac_config_sub $ac_cv_build_alias` ||
+  { { echo "$as_me:2171: error: $ac_config_sub $ac_cv_build_alias failed." >&5
+echo "$as_me: error: $ac_config_sub $ac_cv_build_alias failed." >&2;}
+   { (exit 1); exit 1; }; }
+
+fi
+echo "$as_me:2176: result: $ac_cv_build" >&5
+echo "${ECHO_T}$ac_cv_build" >&6
+build=$ac_cv_build
+build_cpu=`echo $ac_cv_build | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
+build_vendor=`echo $ac_cv_build | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\2/'`
+build_os=`echo $ac_cv_build | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
+
+echo "$as_me:2183: checking host system type" >&5
+echo $ECHO_N "checking host system type... $ECHO_C" >&6
+if test "${ac_cv_host+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  ac_cv_host_alias=$host_alias
+test -z "$ac_cv_host_alias" &&
+  ac_cv_host_alias=$ac_cv_build_alias
+ac_cv_host=`$ac_config_sub $ac_cv_host_alias` ||
+  { { echo "$as_me:2192: error: $ac_config_sub $ac_cv_host_alias failed" >&5
+echo "$as_me: error: $ac_config_sub $ac_cv_host_alias failed" >&2;}
+   { (exit 1); exit 1; }; }
+
+fi
+echo "$as_me:2197: result: $ac_cv_host" >&5
+echo "${ECHO_T}$ac_cv_host" >&6
+host=$ac_cv_host
+host_cpu=`echo $ac_cv_host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
+host_vendor=`echo $ac_cv_host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\2/'`
+host_os=`echo $ac_cv_host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
+
+# Check whether --with-gnu-ld or --without-gnu-ld was given.
+if test "${with_gnu_ld+set}" = set; then
+  withval="$with_gnu_ld"
+  test "$withval" = no || with_gnu_ld=yes
+else
+  with_gnu_ld=no
+fi;
+ac_prog=ld
+if test "$GCC" = yes; then
+  # Check if gcc -print-prog-name=ld gives a path.
+  echo "$as_me:2214: checking for ld used by GCC" >&5
+echo $ECHO_N "checking for ld used by GCC... $ECHO_C" >&6
+  case $host in
+  *-*-mingw*)
+    # gcc leaves a trailing carriage return which upsets mingw
+    ac_prog=`($CC -print-prog-name=ld) 2>&5 | tr -d '\015'` ;;
+  *)
+    ac_prog=`($CC -print-prog-name=ld) 2>&5` ;;
+  esac
+  case $ac_prog in
+    # Accept absolute paths.
+    [\\/]* | [A-Za-z]:[\\/]*)
+      re_direlt='/[^/][^/]*/\.\./'
+      # Canonicalize the path of ld
+      ac_prog=`echo $ac_prog| sed 's%\\\\%/%g'`
+      while echo $ac_prog | grep "$re_direlt" > /dev/null 2>&1; do
+	ac_prog=`echo $ac_prog| sed "s%$re_direlt%/%"`
+      done
+      test -z "$LD" && LD="$ac_prog"
+      ;;
+  "")
+    # If it fails, then pretend we aren't using GCC.
+    ac_prog=ld
+    ;;
+  *)
+    # If it is relative, then search for the first ld in PATH.
+    with_gnu_ld=unknown
+    ;;
+  esac
+elif test "$with_gnu_ld" = yes; then
+  echo "$as_me:2244: checking for GNU ld" >&5
+echo $ECHO_N "checking for GNU ld... $ECHO_C" >&6
+else
+  echo "$as_me:2247: checking for non-GNU ld" >&5
+echo $ECHO_N "checking for non-GNU ld... $ECHO_C" >&6
+fi
+if test "${lt_cv_path_LD+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  if test -z "$LD"; then
+  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}${PATH_SEPARATOR-:}"
+  for ac_dir in $PATH; do
+    test -z "$ac_dir" && ac_dir=.
+    if test -f "$ac_dir/$ac_prog" || test -f "$ac_dir/$ac_prog$ac_exeext"; then
+      lt_cv_path_LD="$ac_dir/$ac_prog"
+      # Check to see if the program is GNU ld.  I'd rather use --version,
+      # but apparently some GNU ld's only accept -v.
+      # Break only if it was the GNU/non-GNU ld that we prefer.
+      if "$lt_cv_path_LD" -v 2>&1 < /dev/null | egrep '(GNU|with BFD)' > /dev/null; then
+	test "$with_gnu_ld" != no && break
+      else
+	test "$with_gnu_ld" != yes && break
+      fi
+    fi
+  done
+  IFS="$ac_save_ifs"
+else
+  lt_cv_path_LD="$LD" # Let the user override the test with a path.
+fi
+fi
+
+LD="$lt_cv_path_LD"
+if test -n "$LD"; then
+  echo "$as_me:2277: result: $LD" >&5
+echo "${ECHO_T}$LD" >&6
+else
+  echo "$as_me:2280: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+test -z "$LD" && { { echo "$as_me:2283: error: no acceptable ld found in \$PATH" >&5
+echo "$as_me: error: no acceptable ld found in \$PATH" >&2;}
+   { (exit 1); exit 1; }; }
+echo "$as_me:2286: checking if the linker ($LD) is GNU ld" >&5
+echo $ECHO_N "checking if the linker ($LD) is GNU ld... $ECHO_C" >&6
+if test "${lt_cv_prog_gnu_ld+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  # I'd rather use --version here, but apparently some GNU ld's only accept -v.
+if $LD -v 2>&1 </dev/null | egrep '(GNU|with BFD)' 1>&5; then
+  lt_cv_prog_gnu_ld=yes
+else
+  lt_cv_prog_gnu_ld=no
+fi
+fi
+echo "$as_me:2298: result: $lt_cv_prog_gnu_ld" >&5
+echo "${ECHO_T}$lt_cv_prog_gnu_ld" >&6
+with_gnu_ld=$lt_cv_prog_gnu_ld
+
+echo "$as_me:2302: checking for $LD option to reload object files" >&5
+echo $ECHO_N "checking for $LD option to reload object files... $ECHO_C" >&6
+if test "${lt_cv_ld_reload_flag+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  lt_cv_ld_reload_flag='-r'
+fi
+echo "$as_me:2309: result: $lt_cv_ld_reload_flag" >&5
+echo "${ECHO_T}$lt_cv_ld_reload_flag" >&6
+reload_flag=$lt_cv_ld_reload_flag
+test -n "$reload_flag" && reload_flag=" $reload_flag"
+
+echo "$as_me:2314: checking for BSD-compatible nm" >&5
+echo $ECHO_N "checking for BSD-compatible nm... $ECHO_C" >&6
+if test "${lt_cv_path_NM+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  if test -n "$NM"; then
+  # Let the user override the test.
+  lt_cv_path_NM="$NM"
+else
+  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}${PATH_SEPARATOR-:}"
+  for ac_dir in $PATH /usr/ccs/bin /usr/ucb /bin; do
+    test -z "$ac_dir" && ac_dir=.
+    tmp_nm=$ac_dir/${ac_tool_prefix}nm
+    if test -f $tmp_nm || test -f $tmp_nm$ac_exeext ; then
+      # Check to see if the nm accepts a BSD-compat flag.
+      # Adding the `sed 1q' prevents false positives on HP-UX, which says:
+      #   nm: unknown option "B" ignored
+      # Tru64's nm complains that /dev/null is an invalid object file
+      if ($tmp_nm -B /dev/null 2>&1 | sed '1q'; exit 0) | egrep '(/dev/null|Invalid file or object type)' >/dev/null; then
+	lt_cv_path_NM="$tmp_nm -B"
+	break
+      elif ($tmp_nm -p /dev/null 2>&1 | sed '1q'; exit 0) | egrep /dev/null >/dev/null; then
+	lt_cv_path_NM="$tmp_nm -p"
+	break
+      else
+	lt_cv_path_NM=${lt_cv_path_NM="$tmp_nm"} # keep the first match, but
+	continue # so that we can try to find one that supports BSD flags
+      fi
+    fi
+  done
+  IFS="$ac_save_ifs"
+  test -z "$lt_cv_path_NM" && lt_cv_path_NM=nm
+fi
+fi
+
+NM="$lt_cv_path_NM"
+echo "$as_me:2350: result: $NM" >&5
+echo "${ECHO_T}$NM" >&6
+
+echo "$as_me:2353: checking whether ln -s works" >&5
+echo $ECHO_N "checking whether ln -s works... $ECHO_C" >&6
+LN_S=$as_ln_s
+if test "$LN_S" = "ln -s"; then
+  echo "$as_me:2357: result: yes" >&5
+echo "${ECHO_T}yes" >&6
+else
+  echo "$as_me:2360: result: no, using $LN_S" >&5
+echo "${ECHO_T}no, using $LN_S" >&6
+fi
+
+echo "$as_me:2364: checking how to recognise dependant libraries" >&5
+echo $ECHO_N "checking how to recognise dependant libraries... $ECHO_C" >&6
+if test "${lt_cv_deplibs_check_method+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  lt_cv_file_magic_cmd='$MAGIC_CMD'
+lt_cv_file_magic_test_file=
+lt_cv_deplibs_check_method='unknown'
+# Need to set the preceding variable on all platforms that support
+# interlibrary dependencies.
+# 'none' -- dependencies not supported.
+# `unknown' -- same as none, but documents that we really don't know.
+# 'pass_all' -- all dependencies passed with no checks.
+# 'test_compile' -- check by making test program.
+# ['file_magic [regex]'] -- check by looking for files in library path
+# which responds to the $file_magic_cmd with a given egrep regex.
+# If you have `file' or equivalent on your system and you're not sure
+# whether `pass_all' will *always* work, you probably want this one.
+
+case $host_os in
+aix4* | aix5*)
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+beos*)
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+bsdi4*)
+  lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [ML]SB (shared object|dynamic lib)'
+  lt_cv_file_magic_cmd='/usr/bin/file -L'
+  lt_cv_file_magic_test_file=/shlib/libc.so
+  ;;
+
+cygwin* | mingw* | pw32*)
+  lt_cv_deplibs_check_method='file_magic file format pei*-i386(.*architecture: i386)?'
+  lt_cv_file_magic_cmd='$OBJDUMP -f'
+  ;;
+
+darwin* | rhapsody*)
+  lt_cv_deplibs_check_method='file_magic Mach-O dynamically linked shared library'
+  lt_cv_file_magic_cmd='/usr/bin/file -L'
+  case "$host_os" in
+  rhapsody* | darwin1.012)
+    lt_cv_file_magic_test_file=`echo /System/Library/Frameworks/System.framework/Versions/*/System | head -1`
+    ;;
+  *) # Darwin 1.3 on
+    lt_cv_file_magic_test_file='/usr/lib/libSystem.dylib'
+    ;;
+  esac
+  ;;
+
+freebsd*)
+  if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
+    case $host_cpu in
+    i*86 )
+      # Not sure whether the presence of OpenBSD here was a mistake.
+      # Let's accept both of them until this is cleared up.
+      lt_cv_deplibs_check_method='file_magic (FreeBSD|OpenBSD)/i[3-9]86 (compact )?demand paged shared library'
+      lt_cv_file_magic_cmd=/usr/bin/file
+      lt_cv_file_magic_test_file=`echo /usr/lib/libc.so.*`
+      ;;
+    esac
+  else
+    lt_cv_deplibs_check_method=pass_all
+  fi
+  ;;
+
+gnu*)
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+hpux10.20*|hpux11*)
+  lt_cv_deplibs_check_method='file_magic (s[0-9][0-9][0-9]|PA-RISC[0-9].[0-9]) shared library'
+  lt_cv_file_magic_cmd=/usr/bin/file
+  lt_cv_file_magic_test_file=/usr/lib/libc.sl
+  ;;
+
+irix5* | irix6*)
+  case $host_os in
+  irix5*)
+    # this will be overridden with pass_all, but let us keep it just in case
+    lt_cv_deplibs_check_method="file_magic ELF 32-bit MSB dynamic lib MIPS - version 1"
+    ;;
+  *)
+    case $LD in
+    *-32|*"-32 ") libmagic=32-bit;;
+    *-n32|*"-n32 ") libmagic=N32;;
+    *-64|*"-64 ") libmagic=64-bit;;
+    *) libmagic=never-match;;
+    esac
+    # this will be overridden with pass_all, but let us keep it just in case
+    lt_cv_deplibs_check_method="file_magic ELF ${libmagic} MSB mips-[1234] dynamic lib MIPS - version 1"
+    ;;
+  esac
+  lt_cv_file_magic_test_file=`echo /lib${libsuff}/libc.so*`
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+# This must be Linux ELF.
+linux-gnu*)
+  case $host_cpu in
+  alpha* | i*86 | powerpc* | sparc* | ia64* )
+    lt_cv_deplibs_check_method=pass_all ;;
+  *)
+    # glibc up to 2.1.1 does not perform some relocations on ARM
+    lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [LM]SB (shared object|dynamic lib )' ;;
+  esac
+  lt_cv_file_magic_test_file=`echo /lib/libc.so* /lib/libc-*.so`
+  ;;
+
+netbsd*)
+  if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
+    lt_cv_deplibs_check_method='match_pattern /lib[^/\.]+\.so\.[0-9]+\.[0-9]+$'
+  else
+    lt_cv_deplibs_check_method='match_pattern /lib[^/\.]+\.so$'
+  fi
+  ;;
+
+newos6*)
+  lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [ML]SB (executable|dynamic lib)'
+  lt_cv_file_magic_cmd=/usr/bin/file
+  lt_cv_file_magic_test_file=/usr/lib/libnls.so
+  ;;
+
+osf3* | osf4* | osf5*)
+  # this will be overridden with pass_all, but let us keep it just in case
+  lt_cv_deplibs_check_method='file_magic COFF format alpha shared library'
+  lt_cv_file_magic_test_file=/shlib/libc.so
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+sco3.2v5*)
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+solaris*)
+  lt_cv_deplibs_check_method=pass_all
+  lt_cv_file_magic_test_file=/lib/libc.so
+  ;;
+
+sysv5uw[78]* | sysv4*uw2*)
+  lt_cv_deplibs_check_method=pass_all
+  ;;
+
+sysv4 | sysv4.2uw2* | sysv4.3* | sysv5*)
+  case $host_vendor in
+  motorola)
+    lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [ML]SB (shared object|dynamic lib) M[0-9][0-9]* Version [0-9]'
+    lt_cv_file_magic_test_file=`echo /usr/lib/libc.so*`
+    ;;
+  ncr)
+    lt_cv_deplibs_check_method=pass_all
+    ;;
+  sequent)
+    lt_cv_file_magic_cmd='/bin/file'
+    lt_cv_deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [LM]SB (shared object|dynamic lib )'
+    ;;
+  sni)
+    lt_cv_file_magic_cmd='/bin/file'
+    lt_cv_deplibs_check_method="file_magic ELF [0-9][0-9]*-bit [LM]SB dynamic lib"
+    lt_cv_file_magic_test_file=/lib/libc.so
+    ;;
+  esac
+  ;;
+esac
+
+fi
+echo "$as_me:2532: result: $lt_cv_deplibs_check_method" >&5
+echo "${ECHO_T}$lt_cv_deplibs_check_method" >&6
+file_magic_cmd=$lt_cv_file_magic_cmd
+deplibs_check_method=$lt_cv_deplibs_check_method
+
+# Check for command to grab the raw symbol name followed by C symbol from nm.
+echo "$as_me:2538: checking command to parse $NM output" >&5
+echo $ECHO_N "checking command to parse $NM output... $ECHO_C" >&6
+if test "${lt_cv_sys_global_symbol_pipe+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+
+# These are sane defaults that work on at least a few old systems.
+# [They come from Ultrix.  What could be older than Ultrix?!! ;)]
+
+# Character class describing NM global symbol codes.
+symcode='[BCDEGRST]'
+
+# Regexp to match symbols that can be accessed directly from C.
+sympat='\([_A-Za-z][_A-Za-z0-9]*\)'
+
+# Transform the above into a raw symbol and a C symbol.
+symxfrm='\1 \2\3 \3'
+
+# Transform an extracted symbol line into a proper C declaration
+lt_cv_global_symbol_to_cdecl="sed -n -e 's/^. .* \(.*\)$/extern char \1;/p'"
+
+# Define system-specific variables.
+case $host_os in
+aix*)
+  symcode='[BCDT]'
+  ;;
+cygwin* | mingw* | pw32*)
+  symcode='[ABCDGISTW]'
+  ;;
+hpux*) # Its linker distinguishes data from code symbols
+  lt_cv_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern char \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
+  ;;
+irix*)
+  symcode='[BCDEGRST]'
+  ;;
+solaris* | sysv5*)
+  symcode='[BDT]'
+  ;;
+sysv4)
+  symcode='[DFNSTU]'
+  ;;
+esac
+
+# Handle CRLF in mingw tool chain
+opt_cr=
+case $host_os in
+mingw*)
+  opt_cr=`echo 'x\{0,1\}' | tr x '\015'` # option cr in regexp
+  ;;
+esac
+
+# If we're using GNU nm, then use its standard symbol codes.
+if $NM -V 2>&1 | egrep '(GNU|with BFD)' > /dev/null; then
+  symcode='[ABCDGISTW]'
+fi
+
+# Try without a prefix undercore, then with it.
+for ac_symprfx in "" "_"; do
+
+  # Write the raw and C identifiers.
+lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[ 	]\($symcode$symcode*\)[ 	][ 	]*\($ac_symprfx\)$sympat$opt_cr$/$symxfrm/p'"
+
+  # Check to see that the pipe works correctly.
+  pipe_works=no
+  rm -f conftest*
+  cat > conftest.$ac_ext <<EOF
+#ifdef __cplusplus
+extern "C" {
+#endif
+char nm_test_var;
+void nm_test_func(){}
+#ifdef __cplusplus
+}
+#endif
+int main(){nm_test_var='a';nm_test_func();return(0);}
+EOF
+
+  if { (eval echo "$as_me:2615: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:2618: \$? = $ac_status" >&5
+  (exit $ac_status); }; then
+    # Now try to grab the symbols.
+    nlist=conftest.nm
+    if { (eval echo "$as_me:2622: \"$NM conftest.$ac_objext \| $lt_cv_sys_global_symbol_pipe \> $nlist\"") >&5
+  (eval $NM conftest.$ac_objext \| $lt_cv_sys_global_symbol_pipe \> $nlist) 2>&5
+  ac_status=$?
+  echo "$as_me:2625: \$? = $ac_status" >&5
+  (exit $ac_status); } && test -s "$nlist"; then
+      # Try sorting and uniquifying the output.
+      if sort "$nlist" | uniq > "$nlist"T; then
+	mv -f "$nlist"T "$nlist"
+      else
+	rm -f "$nlist"T
+      fi
+
+      # Make sure that we snagged all the symbols we need.
+      if egrep ' nm_test_var$' "$nlist" >/dev/null; then
+	if egrep ' nm_test_func$' "$nlist" >/dev/null; then
+	  cat <<EOF > conftest.$ac_ext
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+EOF
+	  # Now generate the symbol file.
+	  eval "$lt_cv_global_symbol_to_cdecl"' < "$nlist" >> conftest.$ac_ext'
+
+	  cat <<EOF >> conftest.$ac_ext
+#if defined (__STDC__) && __STDC__
+# define lt_ptr_t void *
+#else
+# define lt_ptr_t char *
+# define const
+#endif
+
+/* The mapping between symbol names and symbols. */
+const struct {
+  const char *name;
+  lt_ptr_t address;
+}
+lt_preloaded_symbols[] =
+{
+EOF
+	  sed "s/^$symcode$symcode* \(.*\) \(.*\)$/  {\"\2\", (lt_ptr_t) \&\2},/" < "$nlist" >> conftest.$ac_ext
+	  cat <<\EOF >> conftest.$ac_ext
+  {0, (lt_ptr_t) 0}
+};
+
+#ifdef __cplusplus
+}
+#endif
+EOF
+	  # Now try linking the two files.
+	  mv conftest.$ac_objext conftstm.$ac_objext
+	  save_LIBS="$LIBS"
+	  save_CFLAGS="$CFLAGS"
+	  LIBS="conftstm.$ac_objext"
+	  CFLAGS="$CFLAGS$no_builtin_flag"
+	  if { (eval echo "$as_me:2677: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:2680: \$? = $ac_status" >&5
+  (exit $ac_status); } && test -s conftest; then
+	    pipe_works=yes
+	  fi
+	  LIBS="$save_LIBS"
+	  CFLAGS="$save_CFLAGS"
+	else
+	  echo "cannot find nm_test_func in $nlist" >&5
+	fi
+      else
+	echo "cannot find nm_test_var in $nlist" >&5
+      fi
+    else
+      echo "cannot run $lt_cv_sys_global_symbol_pipe" >&5
+    fi
+  else
+    echo "$progname: failed program was:" >&5
+    cat conftest.$ac_ext >&5
+  fi
+  rm -f conftest* conftst*
+
+  # Do not use the global_symbol_pipe unless it works.
+  if test "$pipe_works" = yes; then
+    break
+  else
+    lt_cv_sys_global_symbol_pipe=
+  fi
+done
+
+fi
+
+global_symbol_pipe="$lt_cv_sys_global_symbol_pipe"
+if test -z "$lt_cv_sys_global_symbol_pipe"; then
+  global_symbol_to_cdecl=
+else
+  global_symbol_to_cdecl="$lt_cv_global_symbol_to_cdecl"
+fi
+if test -z "$global_symbol_pipe$global_symbol_to_cdecl"; then
+  echo "$as_me:2718: result: failed" >&5
+echo "${ECHO_T}failed" >&6
+else
+  echo "$as_me:2721: result: ok" >&5
+echo "${ECHO_T}ok" >&6
+fi
+
+ac_ext=c
+ac_cpp='$CPP $CPPFLAGS'
+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+echo "$as_me:2730: checking how to run the C preprocessor" >&5
+echo $ECHO_N "checking how to run the C preprocessor... $ECHO_C" >&6
+# On Suns, sometimes $CPP names a directory.
+if test -n "$CPP" && test -d "$CPP"; then
+  CPP=
+fi
+if test -z "$CPP"; then
+  if test "${ac_cv_prog_CPP+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+      # Double quotes because CPP needs to be expanded
+    for CPP in "$CC -E" "$CC -E -traditional-cpp" "/lib/cpp"
+    do
+      # break 2 since there is a loop in there.
+      ac_preproc_ok=false
+for ac_c_preproc_warn_flag in '' yes
+do
+  # Use a header file that comes with gcc, so configuring glibc
+  # with a fresh cross-compiler works.
+  # On the NeXT, cc -E runs the code through the compiler's parser,
+  # not just through cpp. "Syntax error" is here to catch this case.
+  cat >conftest.$ac_ext <<_ACEOF
+#line 2752 "configure"
+#include "confdefs.h"
+#include <assert.h>
+                     Syntax error
+_ACEOF
+if { (eval echo "$as_me:2757: \"$ac_cpp conftest.$ac_ext\"") >&5
+  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+  ac_status=$?
+  egrep -v '^ *\+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  echo "$as_me:2763: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null; then
+  if test -s conftest.err; then
+    ac_cpp_err=$ac_c_preproc_warn_flag
+  else
+    ac_cpp_err=
+  fi
+else
+  ac_cpp_err=yes
+fi
+if test -z "$ac_cpp_err"; then
+  :
+else
+  echo "$as_me: failed program was:" >&5
+  cat conftest.$ac_ext >&5
+  # Broken: fails on valid input.
+continue
+fi
+rm -f conftest.err conftest.$ac_ext
+
+  # OK, works on sane cases.  Now check whether non-existent headers
+  # can be detected and how.
+  cat >conftest.$ac_ext <<_ACEOF
+#line 2786 "configure"
+#include "confdefs.h"
+#include <ac_nonexistent.h>
+_ACEOF
+if { (eval echo "$as_me:2790: \"$ac_cpp conftest.$ac_ext\"") >&5
+  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+  ac_status=$?
+  egrep -v '^ *\+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  echo "$as_me:2796: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null; then
+  if test -s conftest.err; then
+    ac_cpp_err=$ac_c_preproc_warn_flag
+  else
+    ac_cpp_err=
+  fi
+else
+  ac_cpp_err=yes
+fi
+if test -z "$ac_cpp_err"; then
+  # Broken: success on invalid input.
+continue
+else
+  echo "$as_me: failed program was:" >&5
+  cat conftest.$ac_ext >&5
+  # Passes both tests.
+ac_preproc_ok=:
+break
+fi
+rm -f conftest.err conftest.$ac_ext
+
+done
+# Because of `break', _AC_PREPROC_IFELSE's cleaning code was skipped.
+rm -f conftest.err conftest.$ac_ext
+if $ac_preproc_ok; then
+  break 2
+fi
+
+    done
+    ac_cv_prog_CPP=$CPP
+
+fi
+  CPP=$ac_cv_prog_CPP
+else
+  ac_cv_prog_CPP=$CPP
+fi
+echo "$as_me:2833: result: $CPP" >&5
+echo "${ECHO_T}$CPP" >&6
+ac_preproc_ok=false
+for ac_c_preproc_warn_flag in '' yes
+do
+  # Use a header file that comes with gcc, so configuring glibc
+  # with a fresh cross-compiler works.
+  # On the NeXT, cc -E runs the code through the compiler's parser,
+  # not just through cpp. "Syntax error" is here to catch this case.
+  cat >conftest.$ac_ext <<_ACEOF
+#line 2843 "configure"
+#include "confdefs.h"
+#include <assert.h>
+                     Syntax error
+_ACEOF
+if { (eval echo "$as_me:2848: \"$ac_cpp conftest.$ac_ext\"") >&5
+  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+  ac_status=$?
+  egrep -v '^ *\+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  echo "$as_me:2854: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null; then
+  if test -s conftest.err; then
+    ac_cpp_err=$ac_c_preproc_warn_flag
+  else
+    ac_cpp_err=
+  fi
+else
+  ac_cpp_err=yes
+fi
+if test -z "$ac_cpp_err"; then
+  :
+else
+  echo "$as_me: failed program was:" >&5
+  cat conftest.$ac_ext >&5
+  # Broken: fails on valid input.
+continue
+fi
+rm -f conftest.err conftest.$ac_ext
+
+  # OK, works on sane cases.  Now check whether non-existent headers
+  # can be detected and how.
+  cat >conftest.$ac_ext <<_ACEOF
+#line 2877 "configure"
+#include "confdefs.h"
+#include <ac_nonexistent.h>
+_ACEOF
+if { (eval echo "$as_me:2881: \"$ac_cpp conftest.$ac_ext\"") >&5
+  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+  ac_status=$?
+  egrep -v '^ *\+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  echo "$as_me:2887: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null; then
+  if test -s conftest.err; then
+    ac_cpp_err=$ac_c_preproc_warn_flag
+  else
+    ac_cpp_err=
+  fi
+else
+  ac_cpp_err=yes
+fi
+if test -z "$ac_cpp_err"; then
+  # Broken: success on invalid input.
+continue
+else
+  echo "$as_me: failed program was:" >&5
+  cat conftest.$ac_ext >&5
+  # Passes both tests.
+ac_preproc_ok=:
+break
+fi
+rm -f conftest.err conftest.$ac_ext
+
+done
+# Because of `break', _AC_PREPROC_IFELSE's cleaning code was skipped.
+rm -f conftest.err conftest.$ac_ext
+if $ac_preproc_ok; then
+  :
+else
+  { { echo "$as_me:2915: error: C preprocessor \"$CPP\" fails sanity check" >&5
+echo "$as_me: error: C preprocessor \"$CPP\" fails sanity check" >&2;}
+   { (exit 1); exit 1; }; }
+fi
+
+ac_ext=c
+ac_cpp='$CPP $CPPFLAGS'
+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+
+for ac_header in dlfcn.h
+do
+ac_ac_Header=`echo "ac_cv_header_$ac_header" | $ac_tr_sh`
+echo "$as_me:2929: checking for $ac_header" >&5
+echo $ECHO_N "checking for $ac_header... $ECHO_C" >&6
+if eval "test \"\${$ac_ac_Header+set}\" = set"; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 2935 "configure"
+#include "confdefs.h"
+#include <$ac_header>
+_ACEOF
+if { (eval echo "$as_me:2939: \"$ac_cpp conftest.$ac_ext\"") >&5
+  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+  ac_status=$?
+  egrep -v '^ *\+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  echo "$as_me:2945: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null; then
+  if test -s conftest.err; then
+    ac_cpp_err=$ac_c_preproc_warn_flag
+  else
+    ac_cpp_err=
+  fi
+else
+  ac_cpp_err=yes
+fi
+if test -z "$ac_cpp_err"; then
+  eval "$ac_ac_Header=yes"
+else
+  echo "$as_me: failed program was:" >&5
+  cat conftest.$ac_ext >&5
+  eval "$ac_ac_Header=no"
+fi
+rm -f conftest.err conftest.$ac_ext
+fi
+echo "$as_me:2964: result: `eval echo '${'$ac_ac_Header'}'`" >&5
+echo "${ECHO_T}`eval echo '${'$ac_ac_Header'}'`" >&6
+if test `eval echo '${'$ac_ac_Header'}'` = yes; then
+  cat >>confdefs.h <<EOF
+#define `echo "HAVE_$ac_header" | $ac_tr_cpp` 1
+EOF
+
+fi
+done
+
+# Only perform the check for file, if the check method requires it
+case $deplibs_check_method in
+file_magic*)
+  if test "$file_magic_cmd" = '$MAGIC_CMD'; then
+    echo "$as_me:2978: checking for ${ac_tool_prefix}file" >&5
+echo $ECHO_N "checking for ${ac_tool_prefix}file... $ECHO_C" >&6
+if test "${lt_cv_path_MAGIC_CMD+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  case $MAGIC_CMD in
+  /*)
+  lt_cv_path_MAGIC_CMD="$MAGIC_CMD" # Let the user override the test with a path.
+  ;;
+  ?:/*)
+  lt_cv_path_MAGIC_CMD="$MAGIC_CMD" # Let the user override the test with a dos path.
+  ;;
+  *)
+  ac_save_MAGIC_CMD="$MAGIC_CMD"
+  IFS="${IFS=   }"; ac_save_ifs="$IFS"; IFS=":"
+  ac_dummy="/usr/bin:$PATH"
+  for ac_dir in $ac_dummy; do
+    test -z "$ac_dir" && ac_dir=.
+    if test -f $ac_dir/${ac_tool_prefix}file; then
+      lt_cv_path_MAGIC_CMD="$ac_dir/${ac_tool_prefix}file"
+      if test -n "$file_magic_test_file"; then
+	case $deplibs_check_method in
+	"file_magic "*)
+	  file_magic_regex="`expr \"$deplibs_check_method\" : \"file_magic \(.*\)\"`"
+	  MAGIC_CMD="$lt_cv_path_MAGIC_CMD"
+	  if eval $file_magic_cmd \$file_magic_test_file 2> /dev/null |
+	    egrep "$file_magic_regex" > /dev/null; then
+	    :
+	  else
+	    cat <<EOF 1>&2
+
+*** Warning: the command libtool uses to detect shared libraries,
+*** $file_magic_cmd, produces output that libtool cannot recognize.
+*** The result is that libtool may fail to recognize shared libraries
+*** as such.  This will affect the creation of libtool libraries that
+*** depend on shared libraries, but programs linked with such libtool
+*** libraries will work regardless of this problem.  Nevertheless, you
+*** may want to report the problem to your system manager and/or to
+*** bug-libtool@gnu.org
+
+EOF
+	  fi ;;
+	esac
+      fi
+      break
+    fi
+  done
+  IFS="$ac_save_ifs"
+  MAGIC_CMD="$ac_save_MAGIC_CMD"
+  ;;
+esac
+fi
+
+MAGIC_CMD="$lt_cv_path_MAGIC_CMD"
+if test -n "$MAGIC_CMD"; then
+  echo "$as_me:3033: result: $MAGIC_CMD" >&5
+echo "${ECHO_T}$MAGIC_CMD" >&6
+else
+  echo "$as_me:3036: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+if test -z "$lt_cv_path_MAGIC_CMD"; then
+  if test -n "$ac_tool_prefix"; then
+    echo "$as_me:3042: checking for file" >&5
+echo $ECHO_N "checking for file... $ECHO_C" >&6
+if test "${lt_cv_path_MAGIC_CMD+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  case $MAGIC_CMD in
+  /*)
+  lt_cv_path_MAGIC_CMD="$MAGIC_CMD" # Let the user override the test with a path.
+  ;;
+  ?:/*)
+  lt_cv_path_MAGIC_CMD="$MAGIC_CMD" # Let the user override the test with a dos path.
+  ;;
+  *)
+  ac_save_MAGIC_CMD="$MAGIC_CMD"
+  IFS="${IFS=   }"; ac_save_ifs="$IFS"; IFS=":"
+  ac_dummy="/usr/bin:$PATH"
+  for ac_dir in $ac_dummy; do
+    test -z "$ac_dir" && ac_dir=.
+    if test -f $ac_dir/file; then
+      lt_cv_path_MAGIC_CMD="$ac_dir/file"
+      if test -n "$file_magic_test_file"; then
+	case $deplibs_check_method in
+	"file_magic "*)
+	  file_magic_regex="`expr \"$deplibs_check_method\" : \"file_magic \(.*\)\"`"
+	  MAGIC_CMD="$lt_cv_path_MAGIC_CMD"
+	  if eval $file_magic_cmd \$file_magic_test_file 2> /dev/null |
+	    egrep "$file_magic_regex" > /dev/null; then
+	    :
+	  else
+	    cat <<EOF 1>&2
+
+*** Warning: the command libtool uses to detect shared libraries,
+*** $file_magic_cmd, produces output that libtool cannot recognize.
+*** The result is that libtool may fail to recognize shared libraries
+*** as such.  This will affect the creation of libtool libraries that
+*** depend on shared libraries, but programs linked with such libtool
+*** libraries will work regardless of this problem.  Nevertheless, you
+*** may want to report the problem to your system manager and/or to
+*** bug-libtool@gnu.org
+
+EOF
+	  fi ;;
+	esac
+      fi
+      break
+    fi
+  done
+  IFS="$ac_save_ifs"
+  MAGIC_CMD="$ac_save_MAGIC_CMD"
+  ;;
+esac
+fi
+
+MAGIC_CMD="$lt_cv_path_MAGIC_CMD"
+if test -n "$MAGIC_CMD"; then
+  echo "$as_me:3097: result: $MAGIC_CMD" >&5
+echo "${ECHO_T}$MAGIC_CMD" >&6
+else
+  echo "$as_me:3100: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+  else
+    MAGIC_CMD=:
+  fi
+fi
+
+  fi
+  ;;
+esac
+
+if test -n "$ac_tool_prefix"; then
+  # Extract the first word of "${ac_tool_prefix}ranlib", so it can be a program name with args.
+set dummy ${ac_tool_prefix}ranlib; ac_word=$2
+echo "$as_me:3116: checking for $ac_word" >&5
+echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+if test "${ac_cv_prog_RANLIB+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  if test -n "$RANLIB"; then
+  ac_cv_prog_RANLIB="$RANLIB" # Let the user override the test.
+else
+  ac_save_IFS=$IFS; IFS=$ac_path_separator
+ac_dummy="$PATH"
+for ac_dir in $ac_dummy; do
+  IFS=$ac_save_IFS
+  test -z "$ac_dir" && ac_dir=.
+  $as_executable_p "$ac_dir/$ac_word" || continue
+ac_cv_prog_RANLIB="${ac_tool_prefix}ranlib"
+echo "$as_me:3131: found $ac_dir/$ac_word" >&5
+break
+done
+
+fi
+fi
+RANLIB=$ac_cv_prog_RANLIB
+if test -n "$RANLIB"; then
+  echo "$as_me:3139: result: $RANLIB" >&5
+echo "${ECHO_T}$RANLIB" >&6
+else
+  echo "$as_me:3142: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+fi
+if test -z "$ac_cv_prog_RANLIB"; then
+  ac_ct_RANLIB=$RANLIB
+  # Extract the first word of "ranlib", so it can be a program name with args.
+set dummy ranlib; ac_word=$2
+echo "$as_me:3151: checking for $ac_word" >&5
+echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+if test "${ac_cv_prog_ac_ct_RANLIB+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  if test -n "$ac_ct_RANLIB"; then
+  ac_cv_prog_ac_ct_RANLIB="$ac_ct_RANLIB" # Let the user override the test.
+else
+  ac_save_IFS=$IFS; IFS=$ac_path_separator
+ac_dummy="$PATH"
+for ac_dir in $ac_dummy; do
+  IFS=$ac_save_IFS
+  test -z "$ac_dir" && ac_dir=.
+  $as_executable_p "$ac_dir/$ac_word" || continue
+ac_cv_prog_ac_ct_RANLIB="ranlib"
+echo "$as_me:3166: found $ac_dir/$ac_word" >&5
+break
+done
+
+  test -z "$ac_cv_prog_ac_ct_RANLIB" && ac_cv_prog_ac_ct_RANLIB=":"
+fi
+fi
+ac_ct_RANLIB=$ac_cv_prog_ac_ct_RANLIB
+if test -n "$ac_ct_RANLIB"; then
+  echo "$as_me:3175: result: $ac_ct_RANLIB" >&5
+echo "${ECHO_T}$ac_ct_RANLIB" >&6
+else
+  echo "$as_me:3178: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+  RANLIB=$ac_ct_RANLIB
+else
+  RANLIB="$ac_cv_prog_RANLIB"
+fi
+
+if test -n "$ac_tool_prefix"; then
+  # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+set dummy ${ac_tool_prefix}strip; ac_word=$2
+echo "$as_me:3190: checking for $ac_word" >&5
+echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+if test "${ac_cv_prog_STRIP+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  if test -n "$STRIP"; then
+  ac_cv_prog_STRIP="$STRIP" # Let the user override the test.
+else
+  ac_save_IFS=$IFS; IFS=$ac_path_separator
+ac_dummy="$PATH"
+for ac_dir in $ac_dummy; do
+  IFS=$ac_save_IFS
+  test -z "$ac_dir" && ac_dir=.
+  $as_executable_p "$ac_dir/$ac_word" || continue
+ac_cv_prog_STRIP="${ac_tool_prefix}strip"
+echo "$as_me:3205: found $ac_dir/$ac_word" >&5
+break
+done
+
+fi
+fi
+STRIP=$ac_cv_prog_STRIP
+if test -n "$STRIP"; then
+  echo "$as_me:3213: result: $STRIP" >&5
+echo "${ECHO_T}$STRIP" >&6
+else
+  echo "$as_me:3216: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+fi
+if test -z "$ac_cv_prog_STRIP"; then
+  ac_ct_STRIP=$STRIP
+  # Extract the first word of "strip", so it can be a program name with args.
+set dummy strip; ac_word=$2
+echo "$as_me:3225: checking for $ac_word" >&5
+echo $ECHO_N "checking for $ac_word... $ECHO_C" >&6
+if test "${ac_cv_prog_ac_ct_STRIP+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  if test -n "$ac_ct_STRIP"; then
+  ac_cv_prog_ac_ct_STRIP="$ac_ct_STRIP" # Let the user override the test.
+else
+  ac_save_IFS=$IFS; IFS=$ac_path_separator
+ac_dummy="$PATH"
+for ac_dir in $ac_dummy; do
+  IFS=$ac_save_IFS
+  test -z "$ac_dir" && ac_dir=.
+  $as_executable_p "$ac_dir/$ac_word" || continue
+ac_cv_prog_ac_ct_STRIP="strip"
+echo "$as_me:3240: found $ac_dir/$ac_word" >&5
+break
+done
+
+  test -z "$ac_cv_prog_ac_ct_STRIP" && ac_cv_prog_ac_ct_STRIP=":"
+fi
+fi
+ac_ct_STRIP=$ac_cv_prog_ac_ct_STRIP
+if test -n "$ac_ct_STRIP"; then
+  echo "$as_me:3249: result: $ac_ct_STRIP" >&5
+echo "${ECHO_T}$ac_ct_STRIP" >&6
+else
+  echo "$as_me:3252: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+  STRIP=$ac_ct_STRIP
+else
+  STRIP="$ac_cv_prog_STRIP"
+fi
+
+enable_dlopen=no
+enable_win32_dll=no
+
+# Check whether --enable-libtool-lock or --disable-libtool-lock was given.
+if test "${enable_libtool_lock+set}" = set; then
+  enableval="$enable_libtool_lock"
+
+fi;
+test "x$enable_libtool_lock" != xno && enable_libtool_lock=yes
+
+# Some flags need to be propagated to the compiler or linker for good
+# libtool support.
+case $host in
+*-*-irix6*)
+  # Find out which ABI we are using.
+  echo '#line 3276 "configure"' > conftest.$ac_ext
+  if { (eval echo "$as_me:3277: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:3280: \$? = $ac_status" >&5
+  (exit $ac_status); }; then
+    case `/usr/bin/file conftest.$ac_objext` in
+    *32-bit*)
+      LD="${LD-ld} -32"
+      ;;
+    *N32*)
+      LD="${LD-ld} -n32"
+      ;;
+    *64-bit*)
+      LD="${LD-ld} -64"
+      ;;
+    esac
+  fi
+  rm -rf conftest*
+  ;;
+
+*-*-sco3.2v5*)
+  # On SCO OpenServer 5, we need -belf to get full-featured binaries.
+  SAVE_CFLAGS="$CFLAGS"
+  CFLAGS="$CFLAGS -belf"
+  echo "$as_me:3301: checking whether the C compiler needs -belf" >&5
+echo $ECHO_N "checking whether the C compiler needs -belf... $ECHO_C" >&6
+if test "${lt_cv_cc_needs_belf+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+
+     ac_ext=c
+ac_cpp='$CPP $CPPFLAGS'
+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+
+     cat >conftest.$ac_ext <<_ACEOF
+#line 3314 "configure"
+#include "confdefs.h"
+
+int
+main ()
+{
+
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:3326: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:3329: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:3332: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:3335: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  lt_cv_cc_needs_belf=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+lt_cv_cc_needs_belf=no
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+     ac_ext=c
+ac_cpp='$CPP $CPPFLAGS'
+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ac_compiler_gnu=$ac_cv_c_compiler_gnu
+
+fi
+echo "$as_me:3351: result: $lt_cv_cc_needs_belf" >&5
+echo "${ECHO_T}$lt_cv_cc_needs_belf" >&6
+  if test x"$lt_cv_cc_needs_belf" != x"yes"; then
+    # this is probably gcc 2.8.0, egcs 1.0 or newer; no need for -belf
+    CFLAGS="$SAVE_CFLAGS"
+  fi
+  ;;
+
+esac
+
+# Sed substitution that helps us do robust quoting.  It backslashifies
+# metacharacters that are still active within double-quoted strings.
+Xsed='sed -e s/^X//'
+sed_quote_subst='s/\([\\"\\`$\\\\]\)/\\\1/g'
+
+# Same as above, but do not quote variable references.
+double_quote_subst='s/\([\\"\\`\\\\]\)/\\\1/g'
+
+# Sed substitution to delay expansion of an escaped shell variable in a
+# double_quote_subst'ed string.
+delay_variable_subst='s/\\\\\\\\\\\$/\\\\\\$/g'
+
+# Constants:
+rm="rm -f"
+
+# Global variables:
+default_ofile=libtool
+can_build_shared=yes
+
+# All known linkers require a `.a' archive for static linking (except M$VC,
+# which needs '.lib').
+libext=a
+ltmain="$ac_aux_dir/ltmain.sh"
+ofile="$default_ofile"
+with_gnu_ld="$lt_cv_prog_gnu_ld"
+need_locks="$enable_libtool_lock"
+
+old_CC="$CC"
+old_CFLAGS="$CFLAGS"
+
+# Set sane defaults for various variables
+test -z "$AR" && AR=ar
+test -z "$AR_FLAGS" && AR_FLAGS=cru
+test -z "$AS" && AS=as
+test -z "$CC" && CC=cc
+test -z "$DLLTOOL" && DLLTOOL=dlltool
+test -z "$LD" && LD=ld
+test -z "$LN_S" && LN_S="ln -s"
+test -z "$MAGIC_CMD" && MAGIC_CMD=file
+test -z "$NM" && NM=nm
+test -z "$OBJDUMP" && OBJDUMP=objdump
+test -z "$RANLIB" && RANLIB=:
+test -z "$STRIP" && STRIP=:
+test -z "$ac_objext" && ac_objext=o
+
+if test x"$host" != x"$build"; then
+  ac_tool_prefix=${host_alias}-
+else
+  ac_tool_prefix=
+fi
+
+# Transform linux* to *-*-linux-gnu*, to support old configure scripts.
+case $host_os in
+linux-gnu*) ;;
+linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
+esac
+
+case $host_os in
+aix3*)
+  # AIX sometimes has problems with the GCC collect2 program.  For some
+  # reason, if we set the COLLECT_NAMES environment variable, the problems
+  # vanish in a puff of smoke.
+  if test "X${COLLECT_NAMES+set}" != Xset; then
+    COLLECT_NAMES=
+    export COLLECT_NAMES
+  fi
+  ;;
+esac
+
+# Determine commands to create old-style static archives.
+old_archive_cmds='$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs'
+old_postinstall_cmds='chmod 644 $oldlib'
+old_postuninstall_cmds=
+
+if test -n "$RANLIB"; then
+  old_archive_cmds="$old_archive_cmds~\$RANLIB \$oldlib"
+  old_postinstall_cmds="\$RANLIB \$oldlib~$old_postinstall_cmds"
+fi
+
+# Allow CC to be a program name with arguments.
+set dummy $CC
+compiler="$2"
+
+echo "$as_me:3444: checking for objdir" >&5
+echo $ECHO_N "checking for objdir... $ECHO_C" >&6
+rm -f .libs 2>/dev/null
+mkdir .libs 2>/dev/null
+if test -d .libs; then
+  objdir=.libs
+else
+  # MS-DOS does not allow filenames that begin with a dot.
+  objdir=_libs
+fi
+rmdir .libs 2>/dev/null
+echo "$as_me:3455: result: $objdir" >&5
+echo "${ECHO_T}$objdir" >&6
+
+# Check whether --with-pic or --without-pic was given.
+if test "${with_pic+set}" = set; then
+  withval="$with_pic"
+  pic_mode="$withval"
+else
+  pic_mode=default
+fi;
+test -z "$pic_mode" && pic_mode=default
+
+# We assume here that the value for lt_cv_prog_cc_pic will not be cached
+# in isolation, and that seeing it set (from the cache) indicates that
+# the associated values are set (in the cache) correctly too.
+echo "$as_me:3470: checking for $compiler option to produce PIC" >&5
+echo $ECHO_N "checking for $compiler option to produce PIC... $ECHO_C" >&6
+if test "${lt_cv_prog_cc_pic+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+   lt_cv_prog_cc_pic=
+  lt_cv_prog_cc_shlib=
+  lt_cv_prog_cc_wl=
+  lt_cv_prog_cc_static=
+  lt_cv_prog_cc_no_builtin=
+  lt_cv_prog_cc_can_build_shared=$can_build_shared
+
+  if test "$GCC" = yes; then
+    lt_cv_prog_cc_wl='-Wl,'
+    lt_cv_prog_cc_static='-static'
+
+    case $host_os in
+    aix*)
+      # Below there is a dirty hack to force normal static linking with -ldl
+      # The problem is because libdl dynamically linked with both libc and
+      # libC (AIX C++ library), which obviously doesn't included in libraries
+      # list by gcc. This cause undefined symbols with -static flags.
+      # This hack allows C programs to be linked with "-static -ldl", but
+      # we not sure about C++ programs.
+      lt_cv_prog_cc_static="$lt_cv_prog_cc_static ${lt_cv_prog_cc_wl}-lC"
+      ;;
+    amigaos*)
+      # FIXME: we need at least 68020 code to build shared libraries, but
+      # adding the `-m68020' flag to GCC prevents building anything better,
+      # like `-m68040'.
+      lt_cv_prog_cc_pic='-m68020 -resident32 -malways-restore-a4'
+      ;;
+    beos* | irix5* | irix6* | osf3* | osf4* | osf5*)
+      # PIC is the default for these OSes.
+      ;;
+    darwin* | rhapsody*)
+      # PIC is the default on this platform
+      # Common symbols not allowed in MH_DYLIB files
+      lt_cv_prog_cc_pic='-fno-common'
+      ;;
+    cygwin* | mingw* | pw32* | os2*)
+      # This hack is so that the source file can tell whether it is being
+      # built for inclusion in a dll (and should export symbols for example).
+      lt_cv_prog_cc_pic='-DDLL_EXPORT'
+      ;;
+    sysv4*MP*)
+      if test -d /usr/nec; then
+	 lt_cv_prog_cc_pic=-Kconform_pic
+      fi
+      ;;
+    *)
+      lt_cv_prog_cc_pic='-fPIC'
+      ;;
+    esac
+  else
+    # PORTME Check for PIC flags for the system compiler.
+    case $host_os in
+    aix3* | aix4* | aix5*)
+      # All AIX code is PIC.
+      if test "$host_cpu" = ia64; then
+        # AIX 5 now supports IA64 processor
+        lt_cv_prog_cc_static='-Bstatic'
+        lt_cv_prog_cc_wl='-Wl,'
+      else
+        lt_cv_prog_cc_static='-bnso -bI:/lib/syscalls.exp'
+      fi
+      ;;
+
+    hpux9* | hpux10* | hpux11*)
+      # Is there a better lt_cv_prog_cc_static that works with the bundled CC?
+      lt_cv_prog_cc_wl='-Wl,'
+      lt_cv_prog_cc_static="${lt_cv_prog_cc_wl}-a ${lt_cv_prog_cc_wl}archive"
+      lt_cv_prog_cc_pic='+Z'
+      ;;
+
+    irix5* | irix6*)
+      lt_cv_prog_cc_wl='-Wl,'
+      lt_cv_prog_cc_static='-non_shared'
+      # PIC (with -KPIC) is the default.
+      ;;
+
+    cygwin* | mingw* | pw32* | os2*)
+      # This hack is so that the source file can tell whether it is being
+      # built for inclusion in a dll (and should export symbols for example).
+      lt_cv_prog_cc_pic='-DDLL_EXPORT'
+      ;;
+
+    newsos6)
+      lt_cv_prog_cc_pic='-KPIC'
+      lt_cv_prog_cc_static='-Bstatic'
+      ;;
+
+    osf3* | osf4* | osf5*)
+      # All OSF/1 code is PIC.
+      lt_cv_prog_cc_wl='-Wl,'
+      lt_cv_prog_cc_static='-non_shared'
+      ;;
+
+    sco3.2v5*)
+      lt_cv_prog_cc_pic='-Kpic'
+      lt_cv_prog_cc_static='-dn'
+      lt_cv_prog_cc_shlib='-belf'
+      ;;
+
+    solaris*)
+      lt_cv_prog_cc_pic='-KPIC'
+      lt_cv_prog_cc_static='-Bstatic'
+      lt_cv_prog_cc_wl='-Wl,'
+      ;;
+
+    sunos4*)
+      lt_cv_prog_cc_pic='-PIC'
+      lt_cv_prog_cc_static='-Bstatic'
+      lt_cv_prog_cc_wl='-Qoption ld '
+      ;;
+
+    sysv4 | sysv4.2uw2* | sysv4.3* | sysv5*)
+      lt_cv_prog_cc_pic='-KPIC'
+      lt_cv_prog_cc_static='-Bstatic'
+      if test "x$host_vendor" = xsni; then
+        lt_cv_prog_cc_wl='-LD'
+      else
+        lt_cv_prog_cc_wl='-Wl,'
+      fi
+      ;;
+
+    uts4*)
+      lt_cv_prog_cc_pic='-pic'
+      lt_cv_prog_cc_static='-Bstatic'
+      ;;
+
+    sysv4*MP*)
+      if test -d /usr/nec ;then
+	lt_cv_prog_cc_pic='-Kconform_pic'
+	lt_cv_prog_cc_static='-Bstatic'
+      fi
+      ;;
+
+    *)
+      lt_cv_prog_cc_can_build_shared=no
+      ;;
+    esac
+  fi
+
+fi
+
+if test -z "$lt_cv_prog_cc_pic"; then
+  echo "$as_me:3617: result: none" >&5
+echo "${ECHO_T}none" >&6
+else
+  echo "$as_me:3620: result: $lt_cv_prog_cc_pic" >&5
+echo "${ECHO_T}$lt_cv_prog_cc_pic" >&6
+
+  # Check to make sure the pic_flag actually works.
+  echo "$as_me:3624: checking if $compiler PIC flag $lt_cv_prog_cc_pic works" >&5
+echo $ECHO_N "checking if $compiler PIC flag $lt_cv_prog_cc_pic works... $ECHO_C" >&6
+  if test "${lt_cv_prog_cc_pic_works+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+      save_CFLAGS="$CFLAGS"
+    CFLAGS="$CFLAGS $lt_cv_prog_cc_pic -DPIC"
+    cat >conftest.$ac_ext <<_ACEOF
+#line 3632 "configure"
+#include "confdefs.h"
+
+int
+main ()
+{
+
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext
+if { (eval echo "$as_me:3644: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:3647: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest.$ac_objext'
+  { (eval echo "$as_me:3650: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:3653: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+        case $host_os in
+      hpux9* | hpux10* | hpux11*)
+	# On HP-UX, both CC and GCC only warn that PIC is supported... then
+	# they create non-PIC objects.  So, if there were any warnings, we
+	# assume that PIC is not supported.
+	if test -s conftest.err; then
+	  lt_cv_prog_cc_pic_works=no
+	else
+	  lt_cv_prog_cc_pic_works=yes
+	fi
+	;;
+      *)
+	lt_cv_prog_cc_pic_works=yes
+	;;
+      esac
+
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+      lt_cv_prog_cc_pic_works=no
+
+fi
+rm -f conftest.$ac_objext conftest.$ac_ext
+    CFLAGS="$save_CFLAGS"
+
+fi
+
+  if test "X$lt_cv_prog_cc_pic_works" = Xno; then
+    lt_cv_prog_cc_pic=
+    lt_cv_prog_cc_can_build_shared=no
+  else
+    lt_cv_prog_cc_pic=" $lt_cv_prog_cc_pic"
+  fi
+
+  echo "$as_me:3689: result: $lt_cv_prog_cc_pic_works" >&5
+echo "${ECHO_T}$lt_cv_prog_cc_pic_works" >&6
+fi
+
+# Check for any special shared library compilation flags.
+if test -n "$lt_cv_prog_cc_shlib"; then
+  { echo "$as_me:3695: WARNING: \`$CC' requires \`$lt_cv_prog_cc_shlib' to build shared libraries" >&5
+echo "$as_me: WARNING: \`$CC' requires \`$lt_cv_prog_cc_shlib' to build shared libraries" >&2;}
+  if echo "$old_CC $old_CFLAGS " | egrep -e "[ 	]$lt_cv_prog_cc_shlib[ 	]" >/dev/null; then :
+  else
+   { echo "$as_me:3699: WARNING: add \`$lt_cv_prog_cc_shlib' to the CC or CFLAGS env variable and reconfigure" >&5
+echo "$as_me: WARNING: add \`$lt_cv_prog_cc_shlib' to the CC or CFLAGS env variable and reconfigure" >&2;}
+    lt_cv_prog_cc_can_build_shared=no
+  fi
+fi
+
+echo "$as_me:3705: checking if $compiler static flag $lt_cv_prog_cc_static works" >&5
+echo $ECHO_N "checking if $compiler static flag $lt_cv_prog_cc_static works... $ECHO_C" >&6
+if test "${lt_cv_prog_cc_static_works+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+    lt_cv_prog_cc_static_works=no
+  save_LDFLAGS="$LDFLAGS"
+  LDFLAGS="$LDFLAGS $lt_cv_prog_cc_static"
+  cat >conftest.$ac_ext <<_ACEOF
+#line 3714 "configure"
+#include "confdefs.h"
+
+int
+main ()
+{
+
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:3726: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:3729: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:3732: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:3735: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  lt_cv_prog_cc_static_works=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+  LDFLAGS="$save_LDFLAGS"
+
+fi
+
+# Belt *and* braces to stop my trousers falling down:
+test "X$lt_cv_prog_cc_static_works" = Xno && lt_cv_prog_cc_static=
+echo "$as_me:3749: result: $lt_cv_prog_cc_static_works" >&5
+echo "${ECHO_T}$lt_cv_prog_cc_static_works" >&6
+
+pic_flag="$lt_cv_prog_cc_pic"
+special_shlib_compile_flags="$lt_cv_prog_cc_shlib"
+wl="$lt_cv_prog_cc_wl"
+link_static_flag="$lt_cv_prog_cc_static"
+no_builtin_flag="$lt_cv_prog_cc_no_builtin"
+can_build_shared="$lt_cv_prog_cc_can_build_shared"
+
+# Check to see if options -o and -c are simultaneously supported by compiler
+echo "$as_me:3760: checking if $compiler supports -c -o file.$ac_objext" >&5
+echo $ECHO_N "checking if $compiler supports -c -o file.$ac_objext... $ECHO_C" >&6
+if test "${lt_cv_compiler_c_o+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+
+$rm -r conftest 2>/dev/null
+mkdir conftest
+cd conftest
+echo "int some_variable = 0;" > conftest.$ac_ext
+mkdir out
+# According to Tom Tromey, Ian Lance Taylor reported there are C compilers
+# that will create temporary files in the current directory regardless of
+# the output directory.  Thus, making CWD read-only will cause this test
+# to fail, enabling locking or at least warning the user not to do parallel
+# builds.
+chmod -w .
+save_CFLAGS="$CFLAGS"
+CFLAGS="$CFLAGS -o out/conftest2.$ac_objext"
+compiler_c_o=no
+if { (eval echo configure:3780: \"$ac_compile\") 1>&5; (eval $ac_compile) 2>out/conftest.err; } && test -s out/conftest2.$ac_objext; then
+  # The compiler can only warn and ignore the option if not recognized
+  # So say no if there are warnings
+  if test -s out/conftest.err; then
+    lt_cv_compiler_c_o=no
+  else
+    lt_cv_compiler_c_o=yes
+  fi
+else
+  # Append any errors to the config.log.
+  cat out/conftest.err 1>&5
+  lt_cv_compiler_c_o=no
+fi
+CFLAGS="$save_CFLAGS"
+chmod u+w .
+$rm conftest* out/*
+rmdir out
+cd ..
+rmdir conftest
+$rm -r conftest 2>/dev/null
+
+fi
+
+compiler_c_o=$lt_cv_compiler_c_o
+echo "$as_me:3804: result: $compiler_c_o" >&5
+echo "${ECHO_T}$compiler_c_o" >&6
+
+if test x"$compiler_c_o" = x"yes"; then
+  # Check to see if we can write to a .lo
+  echo "$as_me:3809: checking if $compiler supports -c -o file.lo" >&5
+echo $ECHO_N "checking if $compiler supports -c -o file.lo... $ECHO_C" >&6
+  if test "${lt_cv_compiler_o_lo+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+
+  lt_cv_compiler_o_lo=no
+  save_CFLAGS="$CFLAGS"
+  CFLAGS="$CFLAGS -c -o conftest.lo"
+  cat >conftest.$ac_ext <<_ACEOF
+#line 3819 "configure"
+#include "confdefs.h"
+
+int
+main ()
+{
+int some_variable = 0;
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext
+if { (eval echo "$as_me:3831: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:3834: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest.$ac_objext'
+  { (eval echo "$as_me:3837: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:3840: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+      # The compiler can only warn and ignore the option if not recognized
+    # So say no if there are warnings
+    if test -s conftest.err; then
+      lt_cv_compiler_o_lo=no
+    else
+      lt_cv_compiler_o_lo=yes
+    fi
+
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+fi
+rm -f conftest.$ac_objext conftest.$ac_ext
+  CFLAGS="$save_CFLAGS"
+
+fi
+
+  compiler_o_lo=$lt_cv_compiler_o_lo
+  echo "$as_me:3860: result: $compiler_c_lo" >&5
+echo "${ECHO_T}$compiler_c_lo" >&6
+else
+  compiler_o_lo=no
+fi
+
+# Check to see if we can do hard links to lock some files if needed
+hard_links="nottested"
+if test "$compiler_c_o" = no && test "$need_locks" != no; then
+  # do not overwrite the value of need_locks provided by the user
+  echo "$as_me:3870: checking if we can lock with hard links" >&5
+echo $ECHO_N "checking if we can lock with hard links... $ECHO_C" >&6
+  hard_links=yes
+  $rm conftest*
+  ln conftest.a conftest.b 2>/dev/null && hard_links=no
+  touch conftest.a
+  ln conftest.a conftest.b 2>&5 || hard_links=no
+  ln conftest.a conftest.b 2>/dev/null && hard_links=no
+  echo "$as_me:3878: result: $hard_links" >&5
+echo "${ECHO_T}$hard_links" >&6
+  if test "$hard_links" = no; then
+    { echo "$as_me:3881: WARNING: \`$CC' does not support \`-c -o', so \`make -j' may be unsafe" >&5
+echo "$as_me: WARNING: \`$CC' does not support \`-c -o', so \`make -j' may be unsafe" >&2;}
+    need_locks=warn
+  fi
+else
+  need_locks=no
+fi
+
+if test "$GCC" = yes; then
+  # Check to see if options -fno-rtti -fno-exceptions are supported by compiler
+  echo "$as_me:3891: checking if $compiler supports -fno-rtti -fno-exceptions" >&5
+echo $ECHO_N "checking if $compiler supports -fno-rtti -fno-exceptions... $ECHO_C" >&6
+  echo "int some_variable = 0;" > conftest.$ac_ext
+  save_CFLAGS="$CFLAGS"
+  CFLAGS="$CFLAGS -fno-rtti -fno-exceptions -c conftest.$ac_ext"
+  compiler_rtti_exceptions=no
+  cat >conftest.$ac_ext <<_ACEOF
+#line 3898 "configure"
+#include "confdefs.h"
+
+int
+main ()
+{
+int some_variable = 0;
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext
+if { (eval echo "$as_me:3910: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:3913: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest.$ac_objext'
+  { (eval echo "$as_me:3916: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:3919: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+      # The compiler can only warn and ignore the option if not recognized
+    # So say no if there are warnings
+    if test -s conftest.err; then
+      compiler_rtti_exceptions=no
+    else
+      compiler_rtti_exceptions=yes
+    fi
+
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+fi
+rm -f conftest.$ac_objext conftest.$ac_ext
+  CFLAGS="$save_CFLAGS"
+  echo "$as_me:3935: result: $compiler_rtti_exceptions" >&5
+echo "${ECHO_T}$compiler_rtti_exceptions" >&6
+
+  if test "$compiler_rtti_exceptions" = "yes"; then
+    no_builtin_flag=' -fno-builtin -fno-rtti -fno-exceptions'
+  else
+    no_builtin_flag=' -fno-builtin'
+  fi
+fi
+
+# See if the linker supports building shared libraries.
+echo "$as_me:3946: checking whether the linker ($LD) supports shared libraries" >&5
+echo $ECHO_N "checking whether the linker ($LD) supports shared libraries... $ECHO_C" >&6
+
+allow_undefined_flag=
+no_undefined_flag=
+need_lib_prefix=unknown
+need_version=unknown
+# when you set need_version to no, make sure it does not cause -set_version
+# flags to be left without arguments
+archive_cmds=
+archive_expsym_cmds=
+old_archive_from_new_cmds=
+old_archive_from_expsyms_cmds=
+export_dynamic_flag_spec=
+whole_archive_flag_spec=
+thread_safe_flag_spec=
+hardcode_into_libs=no
+hardcode_libdir_flag_spec=
+hardcode_libdir_separator=
+hardcode_direct=no
+hardcode_minus_L=no
+hardcode_shlibpath_var=unsupported
+runpath_var=
+link_all_deplibs=unknown
+always_export_symbols=no
+export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | sed '\''s/.* //'\'' | sort | uniq > $export_symbols'
+# include_expsyms should be a list of space-separated symbols to be *always*
+# included in the symbol list
+include_expsyms=
+# exclude_expsyms can be an egrep regular expression of symbols to exclude
+# it will be wrapped by ` (' and `)$', so one must not match beginning or
+# end of line.  Example: `a|bc|.*d.*' will exclude the symbols `a' and `bc',
+# as well as any symbol that contains `d'.
+exclude_expsyms="_GLOBAL_OFFSET_TABLE_"
+# Although _GLOBAL_OFFSET_TABLE_ is a valid symbol C name, most a.out
+# platforms (ab)use it in PIC code, but their linkers get confused if
+# the symbol is explicitly referenced.  Since portable code cannot
+# rely on this symbol name, it's probably fine to never include it in
+# preloaded symbol tables.
+extract_expsyms_cmds=
+
+case $host_os in
+cygwin* | mingw* | pw32* )
+  # FIXME: the MSVC++ port hasn't been tested in a loooong time
+  # When not using gcc, we currently assume that we are using
+  # Microsoft Visual C++.
+  if test "$GCC" != yes; then
+    with_gnu_ld=no
+  fi
+  ;;
+
+esac
+
+ld_shlibs=yes
+if test "$with_gnu_ld" = yes; then
+  # If archive_cmds runs LD, not CC, wlarc should be empty
+  wlarc='${wl}'
+
+  # See if GNU ld supports shared libraries.
+  case $host_os in
+  aix3* | aix4* | aix5*)
+    # On AIX, the GNU linker is very broken
+    # Note:Check GNU linker on AIX 5-IA64 when/if it becomes available.
+    ld_shlibs=no
+    cat <<EOF 1>&2
+
+*** Warning: the GNU linker, at least up to release 2.9.1, is reported
+*** to be unable to reliably create shared libraries on AIX.
+*** Therefore, libtool is disabling shared libraries support.  If you
+*** really care for shared libraries, you may want to modify your PATH
+*** so that a non-GNU linker is found, and then restart.
+
+EOF
+    ;;
+
+  amigaos*)
+    archive_cmds='$rm $output_objdir/a2ixlibrary.data~$echo "#define NAME $libname" > $output_objdir/a2ixlibrary.data~$echo "#define LIBRARY_ID 1" >> $output_objdir/a2ixlibrary.data~$echo "#define VERSION $major" >> $output_objdir/a2ixlibrary.data~$echo "#define REVISION $revision" >> $output_objdir/a2ixlibrary.data~$AR $AR_FLAGS $lib $libobjs~$RANLIB $lib~(cd $output_objdir && a2ixlibrary -32)'
+    hardcode_libdir_flag_spec='-L$libdir'
+    hardcode_minus_L=yes
+
+    # Samuel A. Falvo II <kc5tja@dolphin.openprojects.net> reports
+    # that the semantics of dynamic libraries on AmigaOS, at least up
+    # to version 4, is to share data among multiple programs linked
+    # with the same dynamic library.  Since this doesn't match the
+    # behavior of shared libraries on other platforms, we can use
+    # them.
+    ld_shlibs=no
+    ;;
+
+  beos*)
+    if $LD --help 2>&1 | egrep ': supported targets:.* elf' > /dev/null; then
+      allow_undefined_flag=unsupported
+      # Joseph Beckenbach <jrb3@best.com> says some releases of gcc
+      # support --undefined.  This deserves some investigation.  FIXME
+      archive_cmds='$CC -nostart $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+    else
+      ld_shlibs=no
+    fi
+    ;;
+
+  cygwin* | mingw* | pw32*)
+    # hardcode_libdir_flag_spec is actually meaningless, as there is
+    # no search path for DLLs.
+    hardcode_libdir_flag_spec='-L$libdir'
+    allow_undefined_flag=unsupported
+    always_export_symbols=yes
+
+    extract_expsyms_cmds='test -f $output_objdir/impgen.c || \
+      sed -e "/^# \/\* impgen\.c starts here \*\//,/^# \/\* impgen.c ends here \*\// { s/^# //;s/^# *$//; p; }" -e d < $''0 > $output_objdir/impgen.c~
+      test -f $output_objdir/impgen.exe || (cd $output_objdir && \
+      if test "x$HOST_CC" != "x" ; then $HOST_CC -o impgen impgen.c ; \
+      else $CC -o impgen impgen.c ; fi)~
+      $output_objdir/impgen $dir/$soroot > $output_objdir/$soname-def'
+
+    old_archive_from_expsyms_cmds='$DLLTOOL --as=$AS --dllname $soname --def $output_objdir/$soname-def --output-lib $output_objdir/$newlib'
+
+    # cygwin and mingw dlls have different entry points and sets of symbols
+    # to exclude.
+    # FIXME: what about values for MSVC?
+    dll_entry=__cygwin_dll_entry@12
+    dll_exclude_symbols=DllMain@12,_cygwin_dll_entry@12,_cygwin_noncygwin_dll_entry@12~
+    case $host_os in
+    mingw*)
+      # mingw values
+      dll_entry=_DllMainCRTStartup@12
+      dll_exclude_symbols=DllMain@12,DllMainCRTStartup@12,DllEntryPoint@12~
+      ;;
+    esac
+
+    # mingw and cygwin differ, and it's simplest to just exclude the union
+    # of the two symbol sets.
+    dll_exclude_symbols=DllMain@12,_cygwin_dll_entry@12,_cygwin_noncygwin_dll_entry@12,DllMainCRTStartup@12,DllEntryPoint@12
+
+    # recent cygwin and mingw systems supply a stub DllMain which the user
+    # can override, but on older systems we have to supply one (in ltdll.c)
+    if test "x$lt_cv_need_dllmain" = "xyes"; then
+      ltdll_obj='$output_objdir/$soname-ltdll.'"$ac_objext "
+      ltdll_cmds='test -f $output_objdir/$soname-ltdll.c || sed -e "/^# \/\* ltdll\.c starts here \*\//,/^# \/\* ltdll.c ends here \*\// { s/^# //; p; }" -e d < [$]0 > $output_objdir/$soname-ltdll.c~
+	test -f $output_objdir/$soname-ltdll.$ac_objext || (cd $output_objdir && $CC -c $soname-ltdll.c)~'
+    else
+      ltdll_obj=
+      ltdll_cmds=
+    fi
+
+    # Extract the symbol export list from an `--export-all' def file,
+    # then regenerate the def file from the symbol export list, so that
+    # the compiled dll only exports the symbol export list.
+    # Be careful not to strip the DATA tag left be newer dlltools.
+    export_symbols_cmds="$ltdll_cmds"'
+      $DLLTOOL --export-all --exclude-symbols '$dll_exclude_symbols' --output-def $output_objdir/$soname-def '$ltdll_obj'$libobjs $convenience~
+      sed -e "1,/EXPORTS/d" -e "s/ @ [0-9]*//" -e "s/ *;.*$//" < $output_objdir/$soname-def > $export_symbols'
+
+    # If the export-symbols file already is a .def file (1st line
+    # is EXPORTS), use it as is.
+    # If DATA tags from a recent dlltool are present, honour them!
+    archive_expsym_cmds='if test "x`head -1 $export_symbols`" = xEXPORTS; then
+        cp $export_symbols $output_objdir/$soname-def;
+      else
+        echo EXPORTS > $output_objdir/$soname-def;
+        _lt_hint=1;
+        cat $export_symbols | while read symbol; do
+         set dummy \$symbol;
+         case \$# in
+           2) echo "   \$2 @ \$_lt_hint ; " >> $output_objdir/$soname-def;;
+           *) echo "     \$2 @ \$_lt_hint \$3 ; " >> $output_objdir/$soname-def;;
+         esac;
+         _lt_hint=`expr 1 + \$_lt_hint`;
+        done;
+      fi~
+      '"$ltdll_cmds"'
+      $CC -Wl,--base-file,$output_objdir/$soname-base '$lt_cv_cc_dll_switch' -Wl,-e,'$dll_entry' -o $output_objdir/$soname '$ltdll_obj'$libobjs $deplibs $compiler_flags~
+      $DLLTOOL --as=$AS --dllname $soname --exclude-symbols '$dll_exclude_symbols' --def $output_objdir/$soname-def --base-file $output_objdir/$soname-base --output-exp $output_objdir/$soname-exp~
+      $CC -Wl,--base-file,$output_objdir/$soname-base $output_objdir/$soname-exp '$lt_cv_cc_dll_switch' -Wl,-e,'$dll_entry' -o $output_objdir/$soname '$ltdll_obj'$libobjs $deplibs $compiler_flags~
+      $DLLTOOL --as=$AS --dllname $soname --exclude-symbols '$dll_exclude_symbols' --def $output_objdir/$soname-def --base-file $output_objdir/$soname-base --output-exp $output_objdir/$soname-exp --output-lib $output_objdir/$libname.dll.a~
+      $CC $output_objdir/$soname-exp '$lt_cv_cc_dll_switch' -Wl,-e,'$dll_entry' -o $output_objdir/$soname '$ltdll_obj'$libobjs $deplibs $compiler_flags'
+    ;;
+
+  netbsd*)
+    if echo __ELF__ | $CC -E - | grep __ELF__ >/dev/null; then
+      archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
+      wlarc=
+    else
+      archive_cmds='$CC -shared -nodefaultlibs $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+      archive_expsym_cmds='$CC -shared -nodefaultlibs $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+    fi
+    ;;
+
+  solaris* | sysv5*)
+    if $LD -v 2>&1 | egrep 'BFD 2\.8' > /dev/null; then
+      ld_shlibs=no
+      cat <<EOF 1>&2
+
+*** Warning: The releases 2.8.* of the GNU linker cannot reliably
+*** create shared libraries on Solaris systems.  Therefore, libtool
+*** is disabling shared libraries support.  We urge you to upgrade GNU
+*** binutils to release 2.9.1 or newer.  Another option is to modify
+*** your PATH or compiler configuration so that the native linker is
+*** used, and then restart.
+
+EOF
+    elif $LD --help 2>&1 | egrep ': supported targets:.* elf' > /dev/null; then
+      archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+      archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+    else
+      ld_shlibs=no
+    fi
+    ;;
+
+  sunos4*)
+    archive_cmds='$LD -assert pure-text -Bshareable -o $lib $libobjs $deplibs $linker_flags'
+    wlarc=
+    hardcode_direct=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  *)
+    if $LD --help 2>&1 | egrep ': supported targets:.* elf' > /dev/null; then
+      archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+      archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+    else
+      ld_shlibs=no
+    fi
+    ;;
+  esac
+
+  if test "$ld_shlibs" = yes; then
+    runpath_var=LD_RUN_PATH
+    hardcode_libdir_flag_spec='${wl}--rpath ${wl}$libdir'
+    export_dynamic_flag_spec='${wl}--export-dynamic'
+    case $host_os in
+    cygwin* | mingw* | pw32*)
+      # dlltool doesn't understand --whole-archive et. al.
+      whole_archive_flag_spec=
+      ;;
+    *)
+      # ancient GNU ld didn't support --whole-archive et. al.
+      if $LD --help 2>&1 | egrep 'no-whole-archive' > /dev/null; then
+	whole_archive_flag_spec="$wlarc"'--whole-archive$convenience '"$wlarc"'--no-whole-archive'
+      else
+	whole_archive_flag_spec=
+      fi
+      ;;
+    esac
+  fi
+else
+  # PORTME fill in a description of your system's linker (not GNU ld)
+  case $host_os in
+  aix3*)
+    allow_undefined_flag=unsupported
+    always_export_symbols=yes
+    archive_expsym_cmds='$LD -o $output_objdir/$soname $libobjs $deplibs $linker_flags -bE:$export_symbols -T512 -H512 -bM:SRE~$AR $AR_FLAGS $lib $output_objdir/$soname'
+    # Note: this linker hardcodes the directories in LIBPATH if there
+    # are no directories specified by -L.
+    hardcode_minus_L=yes
+    if test "$GCC" = yes && test -z "$link_static_flag"; then
+      # Neither direct hardcoding nor static linking is supported with a
+      # broken collect2.
+      hardcode_direct=unsupported
+    fi
+    ;;
+
+  aix4* | aix5*)
+    # When large executables or shared objects are built, AIX ld can
+    # have problems creating the table of contents.  If linking a library
+    # or program results in "error TOC overflow" add -mminimal-toc to
+    # CXXFLAGS/CFLAGS for g++/gcc.  In the cases where that is not
+    # enough to fix the problem, add -Wl,-bbigtoc to LDFLAGS.
+
+    archive_cmds=''
+    hardcode_libdir_separator=':'
+    if test "$GCC" = yes; then
+      collect2name=`${CC} -print-prog-name=collect2`
+      if test -f "$collect2name" && \
+	 strings "$collect2name" | grep resolve_lib_name >/dev/null
+      then
+	# We have reworked collect2
+	hardcode_direct=yes
+      else
+        # We have old collect2
+        hardcode_direct=unsupported
+        # It fails to find uninstalled libraries when the uninstalled
+        # path is not listed in the libpath.  Setting hardcode_minus_L
+        # to unsupported forces relinking
+        hardcode_minus_L=yes
+        hardcode_libdir_flag_spec='-L$libdir'
+        hardcode_libdir_separator=
+      fi
+      shared_flag='-shared'
+    else
+      if test "$host_cpu" = ia64; then
+        shared_flag='-G'
+      else
+        shared_flag='${wl}-bM:SRE'
+      fi
+      hardcode_direct=yes
+    fi
+
+    if test "$host_cpu" = ia64; then
+      # On IA64, the linker does run time linking by default, so we don't
+      # have to do anything special.
+      aix_use_runtimelinking=no
+      exp_sym_flag='-Bexport'
+      no_entry_flag=""
+    else
+      # Test if we are trying to use run time linking, or normal AIX style linking.
+      # If -brtl is somewhere in LDFLAGS, we need to do run time linking.
+      aix_use_runtimelinking=no
+      for ld_flag in $LDFLAGS; do
+        if (test $ld_flag = "-brtl" || test $ld_flag = "-Wl,-brtl" ); then
+          aix_use_runtimelinking=yes
+          break
+        fi
+      done
+      exp_sym_flag='-bexport'
+      no_entry_flag='-bnoentry'
+    fi
+    # It seems that -bexpall can do strange things, so it is better to
+    # generate a list of symbols to export.
+    always_export_symbols=yes
+    if test "$aix_use_runtimelinking" = yes; then
+      hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:/usr/lib:/lib'
+      allow_undefined_flag=' -Wl,-G'
+      archive_expsym_cmds="\$CC $shared_flag"' -o $output_objdir/$soname $libobjs $deplibs $compiler_flags ${allow_undefined_flag} '"\${wl}$no_entry_flag \${wl}$exp_sym_flag:\$export_symbols"
+    else
+      if test "$host_cpu" = ia64; then
+        hardcode_libdir_flag_spec='${wl}-R $libdir:/usr/lib:/lib'
+       allow_undefined_flag="-znodefs"
+        archive_expsym_cmds="\$CC $shared_flag"' -o $output_objdir/$soname ${wl}-h$soname $libobjs $deplibs $compiler_flags ${wl}${allow_undefined_flag} '"\${wl}$no_entry_flag \${wl}$exp_sym_flag:\$export_symbols"
+      else
+        hardcode_libdir_flag_spec='${wl}-bnolibpath ${wl}-blibpath:$libdir:/usr/lib:/lib'
+        # Warning - without using the other run time loading flags, -berok will
+        #           link without error, but may produce a broken library.
+        allow_undefined_flag='${wl}-berok"
+        # This is a bit strange, but is similar to how AIX traditionally builds
+        # it's shared libraries.
+        archive_expsym_cmds="\$CC $shared_flag"' -o $output_objdir/$soname $libobjs $deplibs $compiler_flags ${allow_undefined_flag} '"\${wl}$no_entry_flag \${wl}$exp_sym_flag:\$export_symbols"' ~$AR -crlo $objdir/$libname$release.a $objdir/$soname'
+      fi
+    fi
+    ;;
+
+  amigaos*)
+    archive_cmds='$rm $output_objdir/a2ixlibrary.data~$echo "#define NAME $libname" > $output_objdir/a2ixlibrary.data~$echo "#define LIBRARY_ID 1" >> $output_objdir/a2ixlibrary.data~$echo "#define VERSION $major" >> $output_objdir/a2ixlibrary.data~$echo "#define REVISION $revision" >> $output_objdir/a2ixlibrary.data~$AR $AR_FLAGS $lib $libobjs~$RANLIB $lib~(cd $output_objdir && a2ixlibrary -32)'
+    hardcode_libdir_flag_spec='-L$libdir'
+    hardcode_minus_L=yes
+    # see comment about different semantics on the GNU ld section
+    ld_shlibs=no
+    ;;
+
+  cygwin* | mingw* | pw32*)
+    # When not using gcc, we currently assume that we are using
+    # Microsoft Visual C++.
+    # hardcode_libdir_flag_spec is actually meaningless, as there is
+    # no search path for DLLs.
+    hardcode_libdir_flag_spec=' '
+    allow_undefined_flag=unsupported
+    # Tell ltmain to make .lib files, not .a files.
+    libext=lib
+    # FIXME: Setting linknames here is a bad hack.
+    archive_cmds='$CC -o $lib $libobjs $compiler_flags `echo "$deplibs" | sed -e '\''s/ -lc$//'\''` -link -dll~linknames='
+    # The linker will automatically build a .lib file if we build a DLL.
+    old_archive_from_new_cmds='true'
+    # FIXME: Should let the user specify the lib program.
+    old_archive_cmds='lib /OUT:$oldlib$oldobjs$old_deplibs'
+    fix_srcfile_path='`cygpath -w "$srcfile"`'
+    ;;
+
+  darwin* | rhapsody*)
+    allow_undefined_flag='-undefined suppress'
+    # FIXME: Relying on posixy $() will cause problems for
+    #        cross-compilation, but unfortunately the echo tests do not
+    #        yet detect zsh echo's removal of \ escapes.
+    archive_cmds='$CC $(test .$module = .yes && echo -bundle || echo -dynamiclib) $allow_undefined_flag -o $lib $libobjs $deplibs$linkopts -install_name $rpath/$soname $(test -n "$verstring" -a x$verstring != x0.0 && echo $verstring)'
+    # We need to add '_' to the symbols in $export_symbols first
+    #archive_expsym_cmds="$archive_cmds"' && strip -s $export_symbols'
+    hardcode_direct=yes
+    hardcode_shlibpath_var=no
+    whole_archive_flag_spec='-all_load $convenience'
+    ;;
+
+  freebsd1*)
+    ld_shlibs=no
+    ;;
+
+  # FreeBSD 2.2.[012] allows us to include c++rt0.o to get C++ constructor
+  # support.  Future versions do this automatically, but an explicit c++rt0.o
+  # does not break anything, and helps significantly (at the cost of a little
+  # extra space).
+  freebsd2.2*)
+    archive_cmds='$LD -Bshareable -o $lib $libobjs $deplibs $linker_flags /usr/lib/c++rt0.o'
+    hardcode_libdir_flag_spec='-R$libdir'
+    hardcode_direct=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  # Unfortunately, older versions of FreeBSD 2 do not have this feature.
+  freebsd2*)
+    archive_cmds='$LD -Bshareable -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_direct=yes
+    hardcode_minus_L=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
+  freebsd*)
+    archive_cmds='$CC -shared -o $lib $libobjs $deplibs $compiler_flags'
+    hardcode_libdir_flag_spec='-R$libdir'
+    hardcode_direct=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  hpux9* | hpux10* | hpux11*)
+    case $host_os in
+    hpux9*) archive_cmds='$rm $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib' ;;
+    *) archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags' ;;
+    esac
+    hardcode_libdir_flag_spec='${wl}+b ${wl}$libdir'
+    hardcode_libdir_separator=:
+    hardcode_direct=yes
+    hardcode_minus_L=yes # Not in the search PATH, but as the default
+			 # location of the library.
+    export_dynamic_flag_spec='${wl}-E'
+    ;;
+
+  irix5* | irix6*)
+    if test "$GCC" = yes; then
+      archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && echo ${wl}-set_version ${wl}$verstring` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+    else
+      archive_cmds='$LD -shared $libobjs $deplibs $linker_flags -soname $soname `test -n "$verstring" && echo -set_version $verstring` -update_registry ${output_objdir}/so_locations -o $lib'
+    fi
+    hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+    hardcode_libdir_separator=:
+    link_all_deplibs=yes
+    ;;
+
+  netbsd*)
+    if echo __ELF__ | $CC -E - | grep __ELF__ >/dev/null; then
+      archive_cmds='$LD -Bshareable -o $lib $libobjs $deplibs $linker_flags'  # a.out
+    else
+      archive_cmds='$LD -shared -o $lib $libobjs $deplibs $linker_flags'      # ELF
+    fi
+    hardcode_libdir_flag_spec='-R$libdir'
+    hardcode_direct=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  newsos6)
+    archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linkopts'
+    hardcode_direct=yes
+    hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+    hardcode_libdir_separator=:
+    hardcode_shlibpath_var=no
+    ;;
+
+  openbsd*)
+    archive_cmds='$LD -Bshareable -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_libdir_flag_spec='-R$libdir'
+    hardcode_direct=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  os2*)
+    hardcode_libdir_flag_spec='-L$libdir'
+    hardcode_minus_L=yes
+    allow_undefined_flag=unsupported
+    archive_cmds='$echo "LIBRARY $libname INITINSTANCE" > $output_objdir/$libname.def~$echo "DESCRIPTION \"$libname\"" >> $output_objdir/$libname.def~$echo DATA >> $output_objdir/$libname.def~$echo " SINGLE NONSHARED" >> $output_objdir/$libname.def~$echo EXPORTS >> $output_objdir/$libname.def~emxexp $libobjs >> $output_objdir/$libname.def~$CC -Zdll -Zcrtdll -o $lib $libobjs $deplibs $compiler_flags $output_objdir/$libname.def'
+    old_archive_from_new_cmds='emximp -o $output_objdir/$libname.a $output_objdir/$libname.def'
+    ;;
+
+  osf3*)
+    if test "$GCC" = yes; then
+      allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
+      archive_cmds='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && echo ${wl}-set_version ${wl}$verstring` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+    else
+      allow_undefined_flag=' -expect_unresolved \*'
+      archive_cmds='$LD -shared${allow_undefined_flag} $libobjs $deplibs $linker_flags -soname $soname `test -n "$verstring" && echo -set_version $verstring` -update_registry ${output_objdir}/so_locations -o $lib'
+    fi
+    hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+    hardcode_libdir_separator=:
+    ;;
+
+  osf4* | osf5*)	# as osf3* with the addition of -msym flag
+    if test "$GCC" = yes; then
+      allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
+      archive_cmds='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && echo ${wl}-set_version ${wl}$verstring` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+      hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+    else
+      allow_undefined_flag=' -expect_unresolved \*'
+      archive_cmds='$LD -shared${allow_undefined_flag} $libobjs $deplibs $linker_flags -msym -soname $soname `test -n "$verstring" && echo -set_version $verstring` -update_registry ${output_objdir}/so_locations -o $lib'
+      archive_expsym_cmds='for i in `cat $export_symbols`; do printf "-exported_symbol " >> $lib.exp; echo "\$i" >> $lib.exp; done; echo "-hidden">> $lib.exp~
+      $LD -shared${allow_undefined_flag} -input $lib.exp $linker_flags $libobjs $deplibs -soname $soname `test -n "$verstring" && echo -set_version $verstring` -update_registry ${objdir}/so_locations -o $lib~$rm $lib.exp'
+
+      #Both c and cxx compiler support -rpath directly
+      hardcode_libdir_flag_spec='-rpath $libdir'
+    fi
+    hardcode_libdir_separator=:
+    ;;
+
+  sco3.2v5*)
+    archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_shlibpath_var=no
+    runpath_var=LD_RUN_PATH
+    hardcode_runpath_var=yes
+    ;;
+
+  solaris*)
+    no_undefined_flag=' -z defs'
+    # $CC -shared without GNU ld will not create a library from C++
+    # object files and a static libstdc++, better avoid it by now
+    archive_cmds='$LD -G${allow_undefined_flag} -h $soname -o $lib $libobjs $deplibs $linker_flags'
+    archive_expsym_cmds='$echo "{ global:" > $lib.exp~cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $lib.exp~$echo "local: *; };" >> $lib.exp~
+		$LD -G${allow_undefined_flag} -M $lib.exp -h $soname -o $lib $libobjs $deplibs $linker_flags~$rm $lib.exp'
+    hardcode_libdir_flag_spec='-R$libdir'
+    hardcode_shlibpath_var=no
+    case $host_os in
+    solaris2.[0-5] | solaris2.[0-5].*) ;;
+    *) # Supported since Solaris 2.6 (maybe 2.5.1?)
+      whole_archive_flag_spec='-z allextract$convenience -z defaultextract' ;;
+    esac
+    link_all_deplibs=yes
+    ;;
+
+  sunos4*)
+    if test "x$host_vendor" = xsequent; then
+      # Use $CC to link under sequent, because it throws in some extra .o
+      # files that make .init and .fini sections work.
+      archive_cmds='$CC -G ${wl}-h $soname -o $lib $libobjs $deplibs $compiler_flags'
+    else
+      archive_cmds='$LD -assert pure-text -Bstatic -o $lib $libobjs $deplibs $linker_flags'
+    fi
+    hardcode_libdir_flag_spec='-L$libdir'
+    hardcode_direct=yes
+    hardcode_minus_L=yes
+    hardcode_shlibpath_var=no
+    ;;
+
+  sysv4)
+    if test "x$host_vendor" = xsno; then
+      archive_cmds='$LD -G -Bsymbolic -h $soname -o $lib $libobjs $deplibs $linkopts'
+      hardcode_direct=yes # is this really true???
+    else
+      archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
+      hardcode_direct=no #Motorola manual says yes, but my tests say they lie
+    fi
+    runpath_var='LD_RUN_PATH'
+    hardcode_shlibpath_var=no
+    ;;
+
+  sysv4.3*)
+    archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_shlibpath_var=no
+    export_dynamic_flag_spec='-Bexport'
+    ;;
+
+  sysv5*)
+    no_undefined_flag=' -z text'
+    # $CC -shared without GNU ld will not create a library from C++
+    # object files and a static libstdc++, better avoid it by now
+    archive_cmds='$LD -G${allow_undefined_flag} -h $soname -o $lib $libobjs $deplibs $linker_flags'
+    archive_expsym_cmds='$echo "{ global:" > $lib.exp~cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $lib.exp~$echo "local: *; };" >> $lib.exp~
+		$LD -G${allow_undefined_flag} -M $lib.exp -h $soname -o $lib $libobjs $deplibs $linker_flags~$rm $lib.exp'
+    hardcode_libdir_flag_spec=
+    hardcode_shlibpath_var=no
+    runpath_var='LD_RUN_PATH'
+    ;;
+
+  uts4*)
+    archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_libdir_flag_spec='-L$libdir'
+    hardcode_shlibpath_var=no
+    ;;
+
+  dgux*)
+    archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_libdir_flag_spec='-L$libdir'
+    hardcode_shlibpath_var=no
+    ;;
+
+  sysv4*MP*)
+    if test -d /usr/nec; then
+      archive_cmds='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
+      hardcode_shlibpath_var=no
+      runpath_var=LD_RUN_PATH
+      hardcode_runpath_var=yes
+      ld_shlibs=yes
+    fi
+    ;;
+
+  sysv4.2uw2*)
+    archive_cmds='$LD -G -o $lib $libobjs $deplibs $linker_flags'
+    hardcode_direct=yes
+    hardcode_minus_L=no
+    hardcode_shlibpath_var=no
+    hardcode_runpath_var=yes
+    runpath_var=LD_RUN_PATH
+    ;;
+
+  sysv5uw7* | unixware7*)
+    no_undefined_flag='${wl}-z ${wl}text'
+    if test "$GCC" = yes; then
+      archive_cmds='$CC -shared ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+    else
+      archive_cmds='$CC -G ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+    fi
+    runpath_var='LD_RUN_PATH'
+    hardcode_shlibpath_var=no
+    ;;
+
+  *)
+    ld_shlibs=no
+    ;;
+  esac
+fi
+echo "$as_me:4558: result: $ld_shlibs" >&5
+echo "${ECHO_T}$ld_shlibs" >&6
+test "$ld_shlibs" = no && can_build_shared=no
+
+# Check hardcoding attributes.
+echo "$as_me:4563: checking how to hardcode library paths into programs" >&5
+echo $ECHO_N "checking how to hardcode library paths into programs... $ECHO_C" >&6
+hardcode_action=
+if test -n "$hardcode_libdir_flag_spec" || \
+   test -n "$runpath_var"; then
+
+  # We can hardcode non-existant directories.
+  if test "$hardcode_direct" != no &&
+     # If the only mechanism to avoid hardcoding is shlibpath_var, we
+     # have to relink, otherwise we might link with an installed library
+     # when we should be linking with a yet-to-be-installed one
+     ## test "$hardcode_shlibpath_var" != no &&
+     test "$hardcode_minus_L" != no; then
+    # Linking always hardcodes the temporary library directory.
+    hardcode_action=relink
+  else
+    # We can link without hardcoding, and we can hardcode nonexisting dirs.
+    hardcode_action=immediate
+  fi
+else
+  # We cannot hardcode anything, or else we can only hardcode existing
+  # directories.
+  hardcode_action=unsupported
+fi
+echo "$as_me:4587: result: $hardcode_action" >&5
+echo "${ECHO_T}$hardcode_action" >&6
+
+striplib=
+old_striplib=
+echo "$as_me:4592: checking whether stripping libraries is possible" >&5
+echo $ECHO_N "checking whether stripping libraries is possible... $ECHO_C" >&6
+if test -n "$STRIP" && $STRIP -V 2>&1 | grep "GNU strip" >/dev/null; then
+  test -z "$old_striplib" && old_striplib="$STRIP --strip-debug"
+  test -z "$striplib" && striplib="$STRIP --strip-unneeded"
+  echo "$as_me:4597: result: yes" >&5
+echo "${ECHO_T}yes" >&6
+else
+  echo "$as_me:4600: result: no" >&5
+echo "${ECHO_T}no" >&6
+fi
+
+reload_cmds='$LD$reload_flag -o $output$reload_objs'
+test -z "$deplibs_check_method" && deplibs_check_method=unknown
+
+# PORTME Fill in your ld.so characteristics
+echo "$as_me:4608: checking dynamic linker characteristics" >&5
+echo $ECHO_N "checking dynamic linker characteristics... $ECHO_C" >&6
+library_names_spec=
+libname_spec='lib$name'
+soname_spec=
+postinstall_cmds=
+postuninstall_cmds=
+finish_cmds=
+finish_eval=
+shlibpath_var=
+shlibpath_overrides_runpath=unknown
+version_type=none
+dynamic_linker="$host_os ld.so"
+sys_lib_dlsearch_path_spec="/lib /usr/lib"
+sys_lib_search_path_spec="/lib /usr/lib /usr/local/lib"
+
+case $host_os in
+aix3*)
+  version_type=linux
+  library_names_spec='${libname}${release}.so$versuffix $libname.a'
+  shlibpath_var=LIBPATH
+
+  # AIX has no versioning support, so we append a major version to the name.
+  soname_spec='${libname}${release}.so$major'
+  ;;
+
+aix4* | aix5*)
+  version_type=linux
+  if test "$host_cpu" = ia64; then
+    # AIX 5 supports IA64
+    library_names_spec='${libname}${release}.so$major ${libname}${release}.so$versuffix $libname.so'
+    shlibpath_var=LD_LIBRARY_PATH
+  else
+    # With GCC up to 2.95.x, collect2 would create an import file
+    # for dependence libraries.  The import file would start with
+    # the line `#! .'.  This would cause the generated library to
+    # depend on `.', always an invalid library.  This was fixed in
+    # development snapshots of GCC prior to 3.0.
+    case $host_os in
+       aix4 | aix4.[01] | aix4.[01].*)
+      if { echo '#if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ >= 97)'
+           echo ' yes '
+           echo '#endif'; } | ${CC} -E - | grep yes > /dev/null; then
+        :
+      else
+        can_build_shared=no
+      fi
+      ;;
+    esac
+    # AIX (on Power*) has no versioning support, so currently we can not hardcode correct
+    # soname into executable. Probably we can add versioning support to
+    # collect2, so additional links can be useful in future.
+    if test "$aix_use_runtimelinking" = yes; then
+      # If using run time linking (on AIX 4.2 or later) use lib<name>.so instead of
+      # lib<name>.a to let people know that these are not typical AIX shared libraries.
+      library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+    else
+      # We preserve .a as extension for shared libraries through AIX4.2
+      # and later when we are not doing run time linking.
+      library_names_spec='${libname}${release}.a $libname.a'
+      soname_spec='${libname}${release}.so$major'
+    fi
+    shlibpath_var=LIBPATH
+    deplibs_check_method=pass_all
+  fi
+  ;;
+
+amigaos*)
+  library_names_spec='$libname.ixlibrary $libname.a'
+  # Create ${libname}_ixlibrary.a entries in /sys/libs.
+  finish_eval='for lib in `ls $libdir/*.ixlibrary 2>/dev/null`; do libname=`$echo "X$lib" | $Xsed -e '\''s%^.*/\([^/]*\)\.ixlibrary$%\1%'\''`; test $rm /sys/libs/${libname}_ixlibrary.a; $show "(cd /sys/libs && $LN_S $lib ${libname}_ixlibrary.a)"; (cd /sys/libs && $LN_S $lib ${libname}_ixlibrary.a) || exit 1; done'
+  ;;
+
+beos*)
+  library_names_spec='${libname}.so'
+  dynamic_linker="$host_os ld.so"
+  shlibpath_var=LIBRARY_PATH
+  ;;
+
+bsdi4*)
+  version_type=linux
+  need_version=no
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  soname_spec='${libname}${release}.so$major'
+  finish_cmds='PATH="\$PATH:/sbin" ldconfig $libdir'
+  shlibpath_var=LD_LIBRARY_PATH
+  sys_lib_search_path_spec="/shlib /usr/lib /usr/X11/lib /usr/contrib/lib /lib /usr/local/lib"
+  sys_lib_dlsearch_path_spec="/shlib /usr/lib /usr/local/lib"
+  export_dynamic_flag_spec=-rdynamic
+  # the default ld.so.conf also contains /usr/contrib/lib and
+  # /usr/X11R6/lib (/usr/X11 is a link to /usr/X11R6), but let us allow
+  # libtool to hard-code these into programs
+  ;;
+
+cygwin* | mingw* | pw32*)
+  version_type=windows
+  need_version=no
+  need_lib_prefix=no
+  case $GCC,$host_os in
+  yes,cygwin*)
+    library_names_spec='$libname.dll.a'
+    soname_spec='`echo ${libname} | sed -e 's/^lib/cyg/'``echo ${release} | sed -e 's/[.]/-/g'`${versuffix}.dll'
+    postinstall_cmds='dlpath=`bash 2>&1 -c '\''. $dir/${file}i;echo \$dlname'\''`~
+      dldir=$destdir/`dirname \$dlpath`~
+      test -d \$dldir || mkdir -p \$dldir~
+      $install_prog .libs/$dlname \$dldir/$dlname'
+    postuninstall_cmds='dldll=`bash 2>&1 -c '\''. $file; echo \$dlname'\''`~
+      dlpath=$dir/\$dldll~
+       $rm \$dlpath'
+    ;;
+  yes,mingw*)
+    library_names_spec='${libname}`echo ${release} | sed -e 's/[.]/-/g'`${versuffix}.dll'
+    sys_lib_search_path_spec=`$CC -print-search-dirs | grep "^libraries:" | sed -e "s/^libraries://" -e "s/;/ /g"`
+    ;;
+  yes,pw32*)
+    library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | sed -e 's/./-/g'`${versuffix}.dll'
+    ;;
+  *)
+    library_names_spec='${libname}`echo ${release} | sed -e 's/[.]/-/g'`${versuffix}.dll $libname.lib'
+    ;;
+  esac
+  dynamic_linker='Win32 ld.exe'
+  # FIXME: first we should search . and the directory the executable is in
+  shlibpath_var=PATH
+  ;;
+
+darwin* | rhapsody*)
+  dynamic_linker="$host_os dyld"
+  version_type=darwin
+  need_lib_prefix=no
+  need_version=no
+  # FIXME: Relying on posixy $() will cause problems for
+  #        cross-compilation, but unfortunately the echo tests do not
+  #        yet detect zsh echo's removal of \ escapes.
+  library_names_spec='${libname}${release}${versuffix}.$(test .$module = .yes && echo so || echo dylib) ${libname}${release}${major}.$(test .$module = .yes && echo so || echo dylib) ${libname}.$(test .$module = .yes && echo so || echo dylib)'
+  soname_spec='${libname}${release}${major}.$(test .$module = .yes && echo so || echo dylib)'
+  shlibpath_overrides_runpath=yes
+  shlibpath_var=DYLD_LIBRARY_PATH
+  ;;
+
+freebsd1*)
+  dynamic_linker=no
+  ;;
+
+freebsd*)
+  objformat=`test -x /usr/bin/objformat && /usr/bin/objformat || echo aout`
+  version_type=freebsd-$objformat
+  case $version_type in
+    freebsd-elf*)
+      library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so $libname.so'
+      need_version=no
+      need_lib_prefix=no
+      ;;
+    freebsd-*)
+      library_names_spec='${libname}${release}.so$versuffix $libname.so$versuffix'
+      need_version=yes
+      ;;
+  esac
+  shlibpath_var=LD_LIBRARY_PATH
+  case $host_os in
+  freebsd2*)
+    shlibpath_overrides_runpath=yes
+    ;;
+  *)
+    shlibpath_overrides_runpath=no
+    hardcode_into_libs=yes
+    ;;
+  esac
+  ;;
+
+gnu*)
+  version_type=linux
+  need_lib_prefix=no
+  need_version=no
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so${major} ${libname}.so'
+  soname_spec='${libname}${release}.so$major'
+  shlibpath_var=LD_LIBRARY_PATH
+  hardcode_into_libs=yes
+  ;;
+
+hpux9* | hpux10* | hpux11*)
+  # Give a soname corresponding to the major version so that dld.sl refuses to
+  # link against other versions.
+  dynamic_linker="$host_os dld.sl"
+  version_type=sunos
+  need_lib_prefix=no
+  need_version=no
+  shlibpath_var=SHLIB_PATH
+  shlibpath_overrides_runpath=no # +s is required to enable SHLIB_PATH
+  library_names_spec='${libname}${release}.sl$versuffix ${libname}${release}.sl$major $libname.sl'
+  soname_spec='${libname}${release}.sl$major'
+  # HP-UX runs *really* slowly unless shared libraries are mode 555.
+  postinstall_cmds='chmod 555 $lib'
+  ;;
+
+irix5* | irix6*)
+  version_type=irix
+  need_lib_prefix=no
+  need_version=no
+  soname_spec='${libname}${release}.so$major'
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major ${libname}${release}.so $libname.so'
+  case $host_os in
+  irix5*)
+    libsuff= shlibsuff=
+    ;;
+  *)
+    case $LD in # libtool.m4 will add one of these switches to LD
+    *-32|*"-32 ") libsuff= shlibsuff= libmagic=32-bit;;
+    *-n32|*"-n32 ") libsuff=32 shlibsuff=N32 libmagic=N32;;
+    *-64|*"-64 ") libsuff=64 shlibsuff=64 libmagic=64-bit;;
+    *) libsuff= shlibsuff= libmagic=never-match;;
+    esac
+    ;;
+  esac
+  shlibpath_var=LD_LIBRARY${shlibsuff}_PATH
+  shlibpath_overrides_runpath=no
+  sys_lib_search_path_spec="/usr/lib${libsuff} /lib${libsuff} /usr/local/lib${libsuff}"
+  sys_lib_dlsearch_path_spec="/usr/lib${libsuff} /lib${libsuff}"
+  ;;
+
+# No shared lib support for Linux oldld, aout, or coff.
+linux-gnuoldld* | linux-gnuaout* | linux-gnucoff*)
+  dynamic_linker=no
+  ;;
+
+# This must be Linux ELF.
+linux-gnu*)
+  version_type=linux
+  need_lib_prefix=no
+  need_version=no
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  soname_spec='${libname}${release}.so$major'
+  finish_cmds='PATH="\$PATH:/sbin" ldconfig -n $libdir'
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=no
+  # This implies no fast_install, which is unacceptable.
+  # Some rework will be needed to allow for fast_install
+  # before this can be enabled.
+  hardcode_into_libs=yes
+
+  # We used to test for /lib/ld.so.1 and disable shared libraries on
+  # powerpc, because MkLinux only supported shared libraries with the
+  # GNU dynamic linker.  Since this was broken with cross compilers,
+  # most powerpc-linux boxes support dynamic linking these days and
+  # people can always --disable-shared, the test was removed, and we
+  # assume the GNU/Linux dynamic linker is in use.
+  dynamic_linker='GNU/Linux ld.so'
+  ;;
+
+netbsd*)
+  version_type=sunos
+  need_lib_prefix=no
+  need_version=no
+  if echo __ELF__ | $CC -E - | grep __ELF__ >/dev/null; then
+    library_names_spec='${libname}${release}.so$versuffix ${libname}.so$versuffix'
+    finish_cmds='PATH="\$PATH:/sbin" ldconfig -m $libdir'
+    dynamic_linker='NetBSD (a.out) ld.so'
+  else
+    library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major ${libname}${release}.so ${libname}.so'
+    soname_spec='${libname}${release}.so$major'
+    dynamic_linker='NetBSD ld.elf_so'
+  fi
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=yes
+  hardcode_into_libs=yes
+  ;;
+
+newsos6)
+  version_type=linux
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=yes
+  ;;
+
+openbsd*)
+  version_type=sunos
+  if test "$with_gnu_ld" = yes; then
+    need_lib_prefix=no
+    need_version=no
+  fi
+  library_names_spec='${libname}${release}.so$versuffix ${libname}.so$versuffix'
+  finish_cmds='PATH="\$PATH:/sbin" ldconfig -m $libdir'
+  shlibpath_var=LD_LIBRARY_PATH
+  ;;
+
+os2*)
+  libname_spec='$name'
+  need_lib_prefix=no
+  library_names_spec='$libname.dll $libname.a'
+  dynamic_linker='OS/2 ld.exe'
+  shlibpath_var=LIBPATH
+  ;;
+
+osf3* | osf4* | osf5*)
+  version_type=osf
+  need_version=no
+  soname_spec='${libname}${release}.so'
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so $libname.so'
+  shlibpath_var=LD_LIBRARY_PATH
+  sys_lib_search_path_spec="/usr/shlib /usr/ccs/lib /usr/lib/cmplrs/cc /usr/lib /usr/local/lib /var/shlib"
+  sys_lib_dlsearch_path_spec="$sys_lib_search_path_spec"
+  ;;
+
+sco3.2v5*)
+  version_type=osf
+  soname_spec='${libname}${release}.so$major'
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  shlibpath_var=LD_LIBRARY_PATH
+  ;;
+
+solaris*)
+  version_type=linux
+  need_lib_prefix=no
+  need_version=no
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  soname_spec='${libname}${release}.so$major'
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=yes
+  hardcode_into_libs=yes
+  # ldd complains unless libraries are executable
+  postinstall_cmds='chmod +x $lib'
+  ;;
+
+sunos4*)
+  version_type=sunos
+  library_names_spec='${libname}${release}.so$versuffix ${libname}.so$versuffix'
+  finish_cmds='PATH="\$PATH:/usr/etc" ldconfig $libdir'
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=yes
+  if test "$with_gnu_ld" = yes; then
+    need_lib_prefix=no
+  fi
+  need_version=yes
+  ;;
+
+sysv4 | sysv4.2uw2* | sysv4.3* | sysv5*)
+  version_type=linux
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  soname_spec='${libname}${release}.so$major'
+  shlibpath_var=LD_LIBRARY_PATH
+  case $host_vendor in
+    sni)
+      shlibpath_overrides_runpath=no
+      ;;
+    motorola)
+      need_lib_prefix=no
+      need_version=no
+      shlibpath_overrides_runpath=no
+      sys_lib_search_path_spec='/lib /usr/lib /usr/ccs/lib'
+      ;;
+  esac
+  ;;
+
+uts4*)
+  version_type=linux
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  soname_spec='${libname}${release}.so$major'
+  shlibpath_var=LD_LIBRARY_PATH
+  ;;
+
+dgux*)
+  version_type=linux
+  need_lib_prefix=no
+  need_version=no
+  library_names_spec='${libname}${release}.so$versuffix ${libname}${release}.so$major $libname.so'
+  soname_spec='${libname}${release}.so$major'
+  shlibpath_var=LD_LIBRARY_PATH
+  ;;
+
+sysv4*MP*)
+  if test -d /usr/nec ;then
+    version_type=linux
+    library_names_spec='$libname.so.$versuffix $libname.so.$major $libname.so'
+    soname_spec='$libname.so.$major'
+    shlibpath_var=LD_LIBRARY_PATH
+  fi
+  ;;
+
+*)
+  dynamic_linker=no
+  ;;
+esac
+echo "$as_me:4990: result: $dynamic_linker" >&5
+echo "${ECHO_T}$dynamic_linker" >&6
+test "$dynamic_linker" = no && can_build_shared=no
+
+# Report the final consequences.
+echo "$as_me:4995: checking if libtool supports shared libraries" >&5
+echo $ECHO_N "checking if libtool supports shared libraries... $ECHO_C" >&6
+echo "$as_me:4997: result: $can_build_shared" >&5
+echo "${ECHO_T}$can_build_shared" >&6
+
+if test "$hardcode_action" = relink; then
+  # Fast installation is not supported
+  enable_fast_install=no
+elif test "$shlibpath_overrides_runpath" = yes ||
+     test "$enable_shared" = no; then
+  # Fast installation is not necessary
+  enable_fast_install=needless
+fi
+
+variables_saved_for_relink="PATH $shlibpath_var $runpath_var"
+if test "$GCC" = yes; then
+  variables_saved_for_relink="$variables_saved_for_relink GCC_EXEC_PREFIX COMPILER_PATH LIBRARY_PATH"
+fi
+
+if test "x$enable_dlopen" != xyes; then
+  enable_dlopen=unknown
+  enable_dlopen_self=unknown
+  enable_dlopen_self_static=unknown
+else
+  lt_cv_dlopen=no
+  lt_cv_dlopen_libs=
+
+  case $host_os in
+  beos*)
+    lt_cv_dlopen="load_add_on"
+    lt_cv_dlopen_libs=
+    lt_cv_dlopen_self=yes
+    ;;
+
+  cygwin* | mingw* | pw32*)
+    lt_cv_dlopen="LoadLibrary"
+    lt_cv_dlopen_libs=
+   ;;
+
+  *)
+    echo "$as_me:5035: checking for dlopen in -ldl" >&5
+echo $ECHO_N "checking for dlopen in -ldl... $ECHO_C" >&6
+if test "${ac_cv_lib_dl_dlopen+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  ac_check_lib_save_LIBS=$LIBS
+LIBS="-ldl  $LIBS"
+cat >conftest.$ac_ext <<_ACEOF
+#line 5043 "configure"
+#include "confdefs.h"
+
+/* Override any gcc2 internal prototype to avoid an error.  */
+#ifdef __cplusplus
+extern "C"
+#endif
+/* We use char because int might match the return type of a gcc2
+   builtin and then its argument prototype would still apply.  */
+char dlopen ();
+int
+main ()
+{
+dlopen ();
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:5062: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:5065: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:5068: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:5071: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_lib_dl_dlopen=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_lib_dl_dlopen=no
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+LIBS=$ac_check_lib_save_LIBS
+fi
+echo "$as_me:5082: result: $ac_cv_lib_dl_dlopen" >&5
+echo "${ECHO_T}$ac_cv_lib_dl_dlopen" >&6
+if test $ac_cv_lib_dl_dlopen = yes; then
+  lt_cv_dlopen="dlopen" lt_cv_dlopen_libs="-ldl"
+else
+  echo "$as_me:5087: checking for dlopen" >&5
+echo $ECHO_N "checking for dlopen... $ECHO_C" >&6
+if test "${ac_cv_func_dlopen+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 5093 "configure"
+#include "confdefs.h"
+/* System header to define __stub macros and hopefully few prototypes,
+    which can conflict with char dlopen (); below.  */
+#include <assert.h>
+/* Override any gcc2 internal prototype to avoid an error.  */
+#ifdef __cplusplus
+extern "C"
+#endif
+/* We use char because int might match the return type of a gcc2
+   builtin and then its argument prototype would still apply.  */
+char dlopen ();
+char (*f) ();
+
+int
+main ()
+{
+/* The GNU C library defines this for functions which it implements
+    to always fail with ENOSYS.  Some functions are actually named
+    something starting with __ and the normal name is an alias.  */
+#if defined (__stub_dlopen) || defined (__stub___dlopen)
+choke me
+#else
+f = dlopen;
+#endif
+
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:5124: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:5127: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:5130: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:5133: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_func_dlopen=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_func_dlopen=no
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+fi
+echo "$as_me:5143: result: $ac_cv_func_dlopen" >&5
+echo "${ECHO_T}$ac_cv_func_dlopen" >&6
+if test $ac_cv_func_dlopen = yes; then
+  lt_cv_dlopen="dlopen"
+else
+  echo "$as_me:5148: checking for shl_load" >&5
+echo $ECHO_N "checking for shl_load... $ECHO_C" >&6
+if test "${ac_cv_func_shl_load+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 5154 "configure"
+#include "confdefs.h"
+/* System header to define __stub macros and hopefully few prototypes,
+    which can conflict with char shl_load (); below.  */
+#include <assert.h>
+/* Override any gcc2 internal prototype to avoid an error.  */
+#ifdef __cplusplus
+extern "C"
+#endif
+/* We use char because int might match the return type of a gcc2
+   builtin and then its argument prototype would still apply.  */
+char shl_load ();
+char (*f) ();
+
+int
+main ()
+{
+/* The GNU C library defines this for functions which it implements
+    to always fail with ENOSYS.  Some functions are actually named
+    something starting with __ and the normal name is an alias.  */
+#if defined (__stub_shl_load) || defined (__stub___shl_load)
+choke me
+#else
+f = shl_load;
+#endif
+
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:5185: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:5188: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:5191: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:5194: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_func_shl_load=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_func_shl_load=no
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+fi
+echo "$as_me:5204: result: $ac_cv_func_shl_load" >&5
+echo "${ECHO_T}$ac_cv_func_shl_load" >&6
+if test $ac_cv_func_shl_load = yes; then
+  lt_cv_dlopen="shl_load"
+else
+  echo "$as_me:5209: checking for dlopen in -lsvld" >&5
+echo $ECHO_N "checking for dlopen in -lsvld... $ECHO_C" >&6
+if test "${ac_cv_lib_svld_dlopen+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  ac_check_lib_save_LIBS=$LIBS
+LIBS="-lsvld  $LIBS"
+cat >conftest.$ac_ext <<_ACEOF
+#line 5217 "configure"
+#include "confdefs.h"
+
+/* Override any gcc2 internal prototype to avoid an error.  */
+#ifdef __cplusplus
+extern "C"
+#endif
+/* We use char because int might match the return type of a gcc2
+   builtin and then its argument prototype would still apply.  */
+char dlopen ();
+int
+main ()
+{
+dlopen ();
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:5236: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:5239: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:5242: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:5245: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_lib_svld_dlopen=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_lib_svld_dlopen=no
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+LIBS=$ac_check_lib_save_LIBS
+fi
+echo "$as_me:5256: result: $ac_cv_lib_svld_dlopen" >&5
+echo "${ECHO_T}$ac_cv_lib_svld_dlopen" >&6
+if test $ac_cv_lib_svld_dlopen = yes; then
+  lt_cv_dlopen="dlopen" lt_cv_dlopen_libs="-lsvld"
+else
+  echo "$as_me:5261: checking for shl_load in -ldld" >&5
+echo $ECHO_N "checking for shl_load in -ldld... $ECHO_C" >&6
+if test "${ac_cv_lib_dld_shl_load+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  ac_check_lib_save_LIBS=$LIBS
+LIBS="-ldld  $LIBS"
+cat >conftest.$ac_ext <<_ACEOF
+#line 5269 "configure"
+#include "confdefs.h"
+
+/* Override any gcc2 internal prototype to avoid an error.  */
+#ifdef __cplusplus
+extern "C"
+#endif
+/* We use char because int might match the return type of a gcc2
+   builtin and then its argument prototype would still apply.  */
+char shl_load ();
+int
+main ()
+{
+shl_load ();
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:5288: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:5291: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:5294: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:5297: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_lib_dld_shl_load=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_lib_dld_shl_load=no
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+LIBS=$ac_check_lib_save_LIBS
+fi
+echo "$as_me:5308: result: $ac_cv_lib_dld_shl_load" >&5
+echo "${ECHO_T}$ac_cv_lib_dld_shl_load" >&6
+if test $ac_cv_lib_dld_shl_load = yes; then
+  lt_cv_dlopen="dld_link" lt_cv_dlopen_libs="-dld"
+fi
+
+fi
+
+fi
+
+fi
+
+fi
+
+    ;;
+  esac
+
+  if test "x$lt_cv_dlopen" != xno; then
+    enable_dlopen=yes
+  else
+    enable_dlopen=no
+  fi
+
+  case $lt_cv_dlopen in
+  dlopen)
+    save_CPPFLAGS="$CPPFLAGS"
+        test "x$ac_cv_header_dlfcn_h" = xyes && CPPFLAGS="$CPPFLAGS -DHAVE_DLFCN_H"
+
+    save_LDFLAGS="$LDFLAGS"
+    eval LDFLAGS=\"\$LDFLAGS $export_dynamic_flag_spec\"
+
+    save_LIBS="$LIBS"
+    LIBS="$lt_cv_dlopen_libs $LIBS"
+
+    echo "$as_me:5342: checking whether a program can dlopen itself" >&5
+echo $ECHO_N "checking whether a program can dlopen itself... $ECHO_C" >&6
+if test "${lt_cv_dlopen_self+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  	  if test "$cross_compiling" = yes; then :
+  lt_cv_dlopen_self=cross
+else
+    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+  lt_status=$lt_dlunknown
+  cat > conftest.$ac_ext <<EOF
+#line 5353 "configure"
+#include "confdefs.h"
+
+#if HAVE_DLFCN_H
+#include <dlfcn.h>
+#endif
+
+#include <stdio.h>
+
+#ifdef RTLD_GLOBAL
+#  define LT_DLGLOBAL		RTLD_GLOBAL
+#else
+#  ifdef DL_GLOBAL
+#    define LT_DLGLOBAL		DL_GLOBAL
+#  else
+#    define LT_DLGLOBAL		0
+#  endif
+#endif
+
+/* We may have to define LT_DLLAZY_OR_NOW in the command line if we
+   find out it does not work in some platform. */
+#ifndef LT_DLLAZY_OR_NOW
+#  ifdef RTLD_LAZY
+#    define LT_DLLAZY_OR_NOW		RTLD_LAZY
+#  else
+#    ifdef DL_LAZY
+#      define LT_DLLAZY_OR_NOW		DL_LAZY
+#    else
+#      ifdef RTLD_NOW
+#        define LT_DLLAZY_OR_NOW	RTLD_NOW
+#      else
+#        ifdef DL_NOW
+#          define LT_DLLAZY_OR_NOW	DL_NOW
+#        else
+#          define LT_DLLAZY_OR_NOW	0
+#        endif
+#      endif
+#    endif
+#  endif
+#endif
+
+#ifdef __cplusplus
+extern "C" void exit (int);
+#endif
+
+void fnord() { int i=42;}
+int main ()
+{
+  void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
+  int status = $lt_dlunknown;
+
+  if (self)
+    {
+      if (dlsym (self,"fnord"))       status = $lt_dlno_uscore;
+      else if (dlsym( self,"_fnord")) status = $lt_dlneed_uscore;
+      /* dlclose (self); */
+    }
+
+    exit (status);
+}
+EOF
+  if { (eval echo "$as_me:5414: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:5417: \$? = $ac_status" >&5
+  (exit $ac_status); } && test -s conftest${ac_exeext} 2>/dev/null; then
+    (./conftest; exit; ) 2>/dev/null
+    lt_status=$?
+    case x$lt_status in
+      x$lt_dlno_uscore) lt_cv_dlopen_self=yes ;;
+      x$lt_dlneed_uscore) lt_cv_dlopen_self=yes ;;
+      x$lt_unknown|x*) lt_cv_dlopen_self=no ;;
+    esac
+  else :
+    # compilation failed
+    lt_cv_dlopen_self=no
+  fi
+fi
+rm -fr conftest*
+
+fi
+echo "$as_me:5434: result: $lt_cv_dlopen_self" >&5
+echo "${ECHO_T}$lt_cv_dlopen_self" >&6
+
+    if test "x$lt_cv_dlopen_self" = xyes; then
+      LDFLAGS="$LDFLAGS $link_static_flag"
+      echo "$as_me:5439: checking whether a statically linked program can dlopen itself" >&5
+echo $ECHO_N "checking whether a statically linked program can dlopen itself... $ECHO_C" >&6
+if test "${lt_cv_dlopen_self_static+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  	  if test "$cross_compiling" = yes; then :
+  lt_cv_dlopen_self_static=cross
+else
+    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+  lt_status=$lt_dlunknown
+  cat > conftest.$ac_ext <<EOF
+#line 5450 "configure"
+#include "confdefs.h"
+
+#if HAVE_DLFCN_H
+#include <dlfcn.h>
+#endif
+
+#include <stdio.h>
+
+#ifdef RTLD_GLOBAL
+#  define LT_DLGLOBAL		RTLD_GLOBAL
+#else
+#  ifdef DL_GLOBAL
+#    define LT_DLGLOBAL		DL_GLOBAL
+#  else
+#    define LT_DLGLOBAL		0
+#  endif
+#endif
+
+/* We may have to define LT_DLLAZY_OR_NOW in the command line if we
+   find out it does not work in some platform. */
+#ifndef LT_DLLAZY_OR_NOW
+#  ifdef RTLD_LAZY
+#    define LT_DLLAZY_OR_NOW		RTLD_LAZY
+#  else
+#    ifdef DL_LAZY
+#      define LT_DLLAZY_OR_NOW		DL_LAZY
+#    else
+#      ifdef RTLD_NOW
+#        define LT_DLLAZY_OR_NOW	RTLD_NOW
+#      else
+#        ifdef DL_NOW
+#          define LT_DLLAZY_OR_NOW	DL_NOW
+#        else
+#          define LT_DLLAZY_OR_NOW	0
+#        endif
+#      endif
+#    endif
+#  endif
+#endif
+
+#ifdef __cplusplus
+extern "C" void exit (int);
+#endif
+
+void fnord() { int i=42;}
+int main ()
+{
+  void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
+  int status = $lt_dlunknown;
+
+  if (self)
+    {
+      if (dlsym (self,"fnord"))       status = $lt_dlno_uscore;
+      else if (dlsym( self,"_fnord")) status = $lt_dlneed_uscore;
+      /* dlclose (self); */
+    }
+
+    exit (status);
+}
+EOF
+  if { (eval echo "$as_me:5511: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:5514: \$? = $ac_status" >&5
+  (exit $ac_status); } && test -s conftest${ac_exeext} 2>/dev/null; then
+    (./conftest; exit; ) 2>/dev/null
+    lt_status=$?
+    case x$lt_status in
+      x$lt_dlno_uscore) lt_cv_dlopen_self_static=yes ;;
+      x$lt_dlneed_uscore) lt_cv_dlopen_self_static=yes ;;
+      x$lt_unknown|x*) lt_cv_dlopen_self_static=no ;;
+    esac
+  else :
+    # compilation failed
+    lt_cv_dlopen_self_static=no
+  fi
+fi
+rm -fr conftest*
+
+fi
+echo "$as_me:5531: result: $lt_cv_dlopen_self_static" >&5
+echo "${ECHO_T}$lt_cv_dlopen_self_static" >&6
+    fi
+
+    CPPFLAGS="$save_CPPFLAGS"
+    LDFLAGS="$save_LDFLAGS"
+    LIBS="$save_LIBS"
+    ;;
+  esac
+
+  case $lt_cv_dlopen_self in
+  yes|no) enable_dlopen_self=$lt_cv_dlopen_self ;;
+  *) enable_dlopen_self=unknown ;;
+  esac
+
+  case $lt_cv_dlopen_self_static in
+  yes|no) enable_dlopen_self_static=$lt_cv_dlopen_self_static ;;
+  *) enable_dlopen_self_static=unknown ;;
+  esac
+fi
+
+if test "$enable_shared" = yes && test "$GCC" = yes; then
+  case $archive_cmds in
+  *'~'*)
+    # FIXME: we may have to deal with multi-command sequences.
+    ;;
+  '$CC '*)
+    # Test whether the compiler implicitly links with -lc since on some
+    # systems, -lgcc has to come before -lc. If gcc already passes -lc
+    # to ld, don't add -lc before -lgcc.
+    echo "$as_me:5561: checking whether -lc should be explicitly linked in" >&5
+echo $ECHO_N "checking whether -lc should be explicitly linked in... $ECHO_C" >&6
+    if test "${lt_cv_archive_cmds_need_lc+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  $rm conftest*
+    echo 'static int dummy;' > conftest.$ac_ext
+
+    if { (eval echo "$as_me:5569: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:5572: \$? = $ac_status" >&5
+  (exit $ac_status); }; then
+      soname=conftest
+      lib=conftest
+      libobjs=conftest.$ac_objext
+      deplibs=
+      wl=$lt_cv_prog_cc_wl
+      compiler_flags=-v
+      linker_flags=-v
+      verstring=
+      output_objdir=.
+      libname=conftest
+      save_allow_undefined_flag=$allow_undefined_flag
+      allow_undefined_flag=
+      if { (eval echo "$as_me:5586: \"$archive_cmds 2\>\&1 \| grep \" -lc \" \>/dev/null 2\>\&1\"") >&5
+  (eval $archive_cmds 2\>\&1 \| grep \" -lc \" \>/dev/null 2\>\&1) 2>&5
+  ac_status=$?
+  echo "$as_me:5589: \$? = $ac_status" >&5
+  (exit $ac_status); }
+      then
+	lt_cv_archive_cmds_need_lc=no
+      else
+	lt_cv_archive_cmds_need_lc=yes
+      fi
+      allow_undefined_flag=$save_allow_undefined_flag
+    else
+      cat conftest.err 1>&5
+    fi
+fi
+
+    echo "$as_me:5602: result: $lt_cv_archive_cmds_need_lc" >&5
+echo "${ECHO_T}$lt_cv_archive_cmds_need_lc" >&6
+    ;;
+  esac
+fi
+need_lc=${lt_cv_archive_cmds_need_lc-yes}
+
+# The second clause should only fire when bootstrapping the
+# libtool distribution, otherwise you forgot to ship ltmain.sh
+# with your package, and you will get complaints that there are
+# no rules to generate ltmain.sh.
+if test -f "$ltmain"; then
+  :
+else
+  # If there is no Makefile yet, we rely on a make rule to execute
+  # `config.status --recheck' to rerun these tests and create the
+  # libtool script then.
+  test -f Makefile && make "$ltmain"
+fi
+
+if test -f "$ltmain"; then
+  trap "$rm \"${ofile}T\"; exit 1" 1 2 15
+  $rm -f "${ofile}T"
+
+  echo creating $ofile
+
+  # Now quote all the things that may contain metacharacters while being
+  # careful not to overquote the AC_SUBSTed values.  We take copies of the
+  # variables and quote the copies for generation of the libtool script.
+  for var in echo old_CC old_CFLAGS \
+    AR AR_FLAGS CC LD LN_S NM SHELL \
+    reload_flag reload_cmds wl \
+    pic_flag link_static_flag no_builtin_flag export_dynamic_flag_spec \
+    thread_safe_flag_spec whole_archive_flag_spec libname_spec \
+    library_names_spec soname_spec \
+    RANLIB old_archive_cmds old_archive_from_new_cmds old_postinstall_cmds \
+    old_postuninstall_cmds archive_cmds archive_expsym_cmds postinstall_cmds \
+    postuninstall_cmds extract_expsyms_cmds old_archive_from_expsyms_cmds \
+    old_striplib striplib file_magic_cmd export_symbols_cmds \
+    deplibs_check_method allow_undefined_flag no_undefined_flag \
+    finish_cmds finish_eval global_symbol_pipe global_symbol_to_cdecl \
+    hardcode_libdir_flag_spec hardcode_libdir_separator  \
+    sys_lib_search_path_spec sys_lib_dlsearch_path_spec \
+    compiler_c_o compiler_o_lo need_locks exclude_expsyms include_expsyms; do
+
+    case $var in
+    reload_cmds | old_archive_cmds | old_archive_from_new_cmds | \
+    old_postinstall_cmds | old_postuninstall_cmds | \
+    export_symbols_cmds | archive_cmds | archive_expsym_cmds | \
+    extract_expsyms_cmds | old_archive_from_expsyms_cmds | \
+    postinstall_cmds | postuninstall_cmds | \
+    finish_cmds | sys_lib_search_path_spec | sys_lib_dlsearch_path_spec)
+      # Double-quote double-evaled strings.
+      eval "lt_$var=\\\"\`\$echo \"X\$$var\" | \$Xsed -e \"\$double_quote_subst\" -e \"\$sed_quote_subst\" -e \"\$delay_variable_subst\"\`\\\""
+      ;;
+    *)
+      eval "lt_$var=\\\"\`\$echo \"X\$$var\" | \$Xsed -e \"\$sed_quote_subst\"\`\\\""
+      ;;
+    esac
+  done
+
+  cat <<__EOF__ > "${ofile}T"
+#! $SHELL
+
+# `$echo "$ofile" | sed 's%^.*/%%'` - Provide generalized library-building support services.
+# Generated automatically by $PROGRAM (GNU $PACKAGE $VERSION$TIMESTAMP)
+# NOTE: Changes made to this file will be lost: look at ltmain.sh.
+#
+# Copyright (C) 1996-2000 Free Software Foundation, Inc.
+# Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+# As a special exception to the GNU General Public License, if you
+# distribute this file as part of a program that contains a
+# configuration script generated by Autoconf, you may include it under
+# the same distribution terms that you use for the rest of that program.
+
+# Sed that helps us avoid accidentally triggering echo(1) options like -n.
+Xsed="sed -e s/^X//"
+
+# The HP-UX ksh and POSIX shell print the target directory to stdout
+# if CDPATH is set.
+if test "X\${CDPATH+set}" = Xset; then CDPATH=:; export CDPATH; fi
+
+# ### BEGIN LIBTOOL CONFIG
+
+# Libtool was configured on host `(hostname || uname -n) 2>/dev/null | sed 1q`:
+
+# Shell to use when invoking shell scripts.
+SHELL=$lt_SHELL
+
+# Whether or not to build shared libraries.
+build_libtool_libs=$enable_shared
+
+# Whether or not to add -lc for building shared libraries.
+build_libtool_need_lc=$need_lc
+
+# Whether or not to build static libraries.
+build_old_libs=$enable_static
+
+# Whether or not to optimize for fast installation.
+fast_install=$enable_fast_install
+
+# The host system.
+host_alias=$host_alias
+host=$host
+
+# An echo program that does not interpret backslashes.
+echo=$lt_echo
+
+# The archiver.
+AR=$lt_AR
+AR_FLAGS=$lt_AR_FLAGS
+
+# The default C compiler.
+CC=$lt_CC
+
+# Is the compiler the GNU C compiler?
+with_gcc=$GCC
+
+# The linker used to build libraries.
+LD=$lt_LD
+
+# Whether we need hard or soft links.
+LN_S=$lt_LN_S
+
+# A BSD-compatible nm program.
+NM=$lt_NM
+
+# A symbol stripping program
+STRIP=$STRIP
+
+# Used to examine libraries when file_magic_cmd begins "file"
+MAGIC_CMD=$MAGIC_CMD
+
+# Used on cygwin: DLL creation program.
+DLLTOOL="$DLLTOOL"
+
+# Used on cygwin: object dumper.
+OBJDUMP="$OBJDUMP"
+
+# Used on cygwin: assembler.
+AS="$AS"
+
+# The name of the directory that contains temporary libtool files.
+objdir=$objdir
+
+# How to create reloadable object files.
+reload_flag=$lt_reload_flag
+reload_cmds=$lt_reload_cmds
+
+# How to pass a linker flag through the compiler.
+wl=$lt_wl
+
+# Object file suffix (normally "o").
+objext="$ac_objext"
+
+# Old archive suffix (normally "a").
+libext="$libext"
+
+# Executable file suffix (normally "").
+exeext="$exeext"
+
+# Additional compiler flags for building library objects.
+pic_flag=$lt_pic_flag
+pic_mode=$pic_mode
+
+# Does compiler simultaneously support -c and -o options?
+compiler_c_o=$lt_compiler_c_o
+
+# Can we write directly to a .lo ?
+compiler_o_lo=$lt_compiler_o_lo
+
+# Must we lock files when doing compilation ?
+need_locks=$lt_need_locks
+
+# Do we need the lib prefix for modules?
+need_lib_prefix=$need_lib_prefix
+
+# Do we need a version for libraries?
+need_version=$need_version
+
+# Whether dlopen is supported.
+dlopen_support=$enable_dlopen
+
+# Whether dlopen of programs is supported.
+dlopen_self=$enable_dlopen_self
+
+# Whether dlopen of statically linked programs is supported.
+dlopen_self_static=$enable_dlopen_self_static
+
+# Compiler flag to prevent dynamic linking.
+link_static_flag=$lt_link_static_flag
+
+# Compiler flag to turn off builtin functions.
+no_builtin_flag=$lt_no_builtin_flag
+
+# Compiler flag to allow reflexive dlopens.
+export_dynamic_flag_spec=$lt_export_dynamic_flag_spec
+
+# Compiler flag to generate shared objects directly from archives.
+whole_archive_flag_spec=$lt_whole_archive_flag_spec
+
+# Compiler flag to generate thread-safe objects.
+thread_safe_flag_spec=$lt_thread_safe_flag_spec
+
+# Library versioning type.
+version_type=$version_type
+
+# Format of library name prefix.
+libname_spec=$lt_libname_spec
+
+# List of archive names.  First name is the real one, the rest are links.
+# The last name is the one that the linker finds with -lNAME.
+library_names_spec=$lt_library_names_spec
+
+# The coded name of the library, if different from the real name.
+soname_spec=$lt_soname_spec
+
+# Commands used to build and install an old-style archive.
+RANLIB=$lt_RANLIB
+old_archive_cmds=$lt_old_archive_cmds
+old_postinstall_cmds=$lt_old_postinstall_cmds
+old_postuninstall_cmds=$lt_old_postuninstall_cmds
+
+# Create an old-style archive from a shared archive.
+old_archive_from_new_cmds=$lt_old_archive_from_new_cmds
+
+# Create a temporary old-style archive to link instead of a shared archive.
+old_archive_from_expsyms_cmds=$lt_old_archive_from_expsyms_cmds
+
+# Commands used to build and install a shared archive.
+archive_cmds=$lt_archive_cmds
+archive_expsym_cmds=$lt_archive_expsym_cmds
+postinstall_cmds=$lt_postinstall_cmds
+postuninstall_cmds=$lt_postuninstall_cmds
+
+# Commands to strip libraries.
+old_striplib=$lt_old_striplib
+striplib=$lt_striplib
+
+# Method to check whether dependent libraries are shared objects.
+deplibs_check_method=$lt_deplibs_check_method
+
+# Command to use when deplibs_check_method == file_magic.
+file_magic_cmd=$lt_file_magic_cmd
+
+# Flag that allows shared libraries with undefined symbols to be built.
+allow_undefined_flag=$lt_allow_undefined_flag
+
+# Flag that forces no undefined symbols.
+no_undefined_flag=$lt_no_undefined_flag
+
+# Commands used to finish a libtool library installation in a directory.
+finish_cmds=$lt_finish_cmds
+
+# Same as above, but a single script fragment to be evaled but not shown.
+finish_eval=$lt_finish_eval
+
+# Take the output of nm and produce a listing of raw symbols and C names.
+global_symbol_pipe=$lt_global_symbol_pipe
+
+# Transform the output of nm in a proper C declaration
+global_symbol_to_cdecl=$lt_global_symbol_to_cdecl
+
+# This is the shared library runtime path variable.
+runpath_var=$runpath_var
+
+# This is the shared library path variable.
+shlibpath_var=$shlibpath_var
+
+# Is shlibpath searched before the hard-coded library search path?
+shlibpath_overrides_runpath=$shlibpath_overrides_runpath
+
+# How to hardcode a shared library path into an executable.
+hardcode_action=$hardcode_action
+
+# Whether we should hardcode library paths into libraries.
+hardcode_into_libs=$hardcode_into_libs
+
+# Flag to hardcode \$libdir into a binary during linking.
+# This must work even if \$libdir does not exist.
+hardcode_libdir_flag_spec=$lt_hardcode_libdir_flag_spec
+
+# Whether we need a single -rpath flag with a separated argument.
+hardcode_libdir_separator=$lt_hardcode_libdir_separator
+
+# Set to yes if using DIR/libNAME.so during linking hardcodes DIR into the
+# resulting binary.
+hardcode_direct=$hardcode_direct
+
+# Set to yes if using the -LDIR flag during linking hardcodes DIR into the
+# resulting binary.
+hardcode_minus_L=$hardcode_minus_L
+
+# Set to yes if using SHLIBPATH_VAR=DIR during linking hardcodes DIR into
+# the resulting binary.
+hardcode_shlibpath_var=$hardcode_shlibpath_var
+
+# Variables whose values should be saved in libtool wrapper scripts and
+# restored at relink time.
+variables_saved_for_relink="$variables_saved_for_relink"
+
+# Whether libtool must link a program against all its dependency libraries.
+link_all_deplibs=$link_all_deplibs
+
+# Compile-time system search path for libraries
+sys_lib_search_path_spec=$lt_sys_lib_search_path_spec
+
+# Run-time system search path for libraries
+sys_lib_dlsearch_path_spec=$lt_sys_lib_dlsearch_path_spec
+
+# Fix the shell variable \$srcfile for the compiler.
+fix_srcfile_path="$fix_srcfile_path"
+
+# Set to yes if exported symbols are required.
+always_export_symbols=$always_export_symbols
+
+# The commands to list exported symbols.
+export_symbols_cmds=$lt_export_symbols_cmds
+
+# The commands to extract the exported symbol list from a shared archive.
+extract_expsyms_cmds=$lt_extract_expsyms_cmds
+
+# Symbols that should not be listed in the preloaded symbols.
+exclude_expsyms=$lt_exclude_expsyms
+
+# Symbols that must always be exported.
+include_expsyms=$lt_include_expsyms
+
+# ### END LIBTOOL CONFIG
+
+__EOF__
+
+  case $host_os in
+  aix3*)
+    cat <<\EOF >> "${ofile}T"
+
+# AIX sometimes has problems with the GCC collect2 program.  For some
+# reason, if we set the COLLECT_NAMES environment variable, the problems
+# vanish in a puff of smoke.
+if test "X${COLLECT_NAMES+set}" != Xset; then
+  COLLECT_NAMES=
+  export COLLECT_NAMES
+fi
+EOF
+    ;;
+  esac
+
+  case $host_os in
+  cygwin* | mingw* | pw32* | os2*)
+    cat <<'EOF' >> "${ofile}T"
+      # This is a source program that is used to create dlls on Windows
+      # Don't remove nor modify the starting and closing comments
+# /* ltdll.c starts here */
+# #define WIN32_LEAN_AND_MEAN
+# #include <windows.h>
+# #undef WIN32_LEAN_AND_MEAN
+# #include <stdio.h>
+#
+# #ifndef __CYGWIN__
+# #  ifdef __CYGWIN32__
+# #    define __CYGWIN__ __CYGWIN32__
+# #  endif
+# #endif
+#
+# #ifdef __cplusplus
+# extern "C" {
+# #endif
+# BOOL APIENTRY DllMain (HINSTANCE hInst, DWORD reason, LPVOID reserved);
+# #ifdef __cplusplus
+# }
+# #endif
+#
+# #ifdef __CYGWIN__
+# #include <cygwin/cygwin_dll.h>
+# DECLARE_CYGWIN_DLL( DllMain );
+# #endif
+# HINSTANCE __hDllInstance_base;
+#
+# BOOL APIENTRY
+# DllMain (HINSTANCE hInst, DWORD reason, LPVOID reserved)
+# {
+#   __hDllInstance_base = hInst;
+#   return TRUE;
+# }
+# /* ltdll.c ends here */
+        # This is a source program that is used to create import libraries
+        # on Windows for dlls which lack them. Don't remove nor modify the
+        # starting and closing comments
+# /* impgen.c starts here */
+# /*   Copyright (C) 1999-2000 Free Software Foundation, Inc.
+#
+#  This file is part of GNU libtool.
+#
+#  This program is free software; you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation; either version 2 of the License, or
+#  (at your option) any later version.
+#
+#  This program is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#  GNU General Public License for more details.
+#
+#  You should have received a copy of the GNU General Public License
+#  along with this program; if not, write to the Free Software
+#  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#  */
+#
+# #include <stdio.h>		/* for printf() */
+# #include <unistd.h>		/* for open(), lseek(), read() */
+# #include <fcntl.h>		/* for O_RDONLY, O_BINARY */
+# #include <string.h>		/* for strdup() */
+#
+# /* O_BINARY isn't required (or even defined sometimes) under Unix */
+# #ifndef O_BINARY
+# #define O_BINARY 0
+# #endif
+#
+# static unsigned int
+# pe_get16 (fd, offset)
+#      int fd;
+#      int offset;
+# {
+#   unsigned char b[2];
+#   lseek (fd, offset, SEEK_SET);
+#   read (fd, b, 2);
+#   return b[0] + (b[1]<<8);
+# }
+#
+# static unsigned int
+# pe_get32 (fd, offset)
+#     int fd;
+#     int offset;
+# {
+#   unsigned char b[4];
+#   lseek (fd, offset, SEEK_SET);
+#   read (fd, b, 4);
+#   return b[0] + (b[1]<<8) + (b[2]<<16) + (b[3]<<24);
+# }
+#
+# static unsigned int
+# pe_as32 (ptr)
+#      void *ptr;
+# {
+#   unsigned char *b = ptr;
+#   return b[0] + (b[1]<<8) + (b[2]<<16) + (b[3]<<24);
+# }
+#
+# int
+# main (argc, argv)
+#     int argc;
+#     char *argv[];
+# {
+#     int dll;
+#     unsigned long pe_header_offset, opthdr_ofs, num_entries, i;
+#     unsigned long export_rva, export_size, nsections, secptr, expptr;
+#     unsigned long name_rvas, nexp;
+#     unsigned char *expdata, *erva;
+#     char *filename, *dll_name;
+#
+#     filename = argv[1];
+#
+#     dll = open(filename, O_RDONLY|O_BINARY);
+#     if (dll < 1)
+# 	return 1;
+#
+#     dll_name = filename;
+#
+#     for (i=0; filename[i]; i++)
+# 	if (filename[i] == '/' || filename[i] == '\\'  || filename[i] == ':')
+# 	    dll_name = filename + i +1;
+#
+#     pe_header_offset = pe_get32 (dll, 0x3c);
+#     opthdr_ofs = pe_header_offset + 4 + 20;
+#     num_entries = pe_get32 (dll, opthdr_ofs + 92);
+#
+#     if (num_entries < 1) /* no exports */
+# 	return 1;
+#
+#     export_rva = pe_get32 (dll, opthdr_ofs + 96);
+#     export_size = pe_get32 (dll, opthdr_ofs + 100);
+#     nsections = pe_get16 (dll, pe_header_offset + 4 +2);
+#     secptr = (pe_header_offset + 4 + 20 +
+# 	      pe_get16 (dll, pe_header_offset + 4 + 16));
+#
+#     expptr = 0;
+#     for (i = 0; i < nsections; i++)
+#     {
+# 	char sname[8];
+# 	unsigned long secptr1 = secptr + 40 * i;
+# 	unsigned long vaddr = pe_get32 (dll, secptr1 + 12);
+# 	unsigned long vsize = pe_get32 (dll, secptr1 + 16);
+# 	unsigned long fptr = pe_get32 (dll, secptr1 + 20);
+# 	lseek(dll, secptr1, SEEK_SET);
+# 	read(dll, sname, 8);
+# 	if (vaddr <= export_rva && vaddr+vsize > export_rva)
+# 	{
+# 	    expptr = fptr + (export_rva - vaddr);
+# 	    if (export_rva + export_size > vaddr + vsize)
+# 		export_size = vsize - (export_rva - vaddr);
+# 	    break;
+# 	}
+#     }
+#
+#     expdata = (unsigned char*)malloc(export_size);
+#     lseek (dll, expptr, SEEK_SET);
+#     read (dll, expdata, export_size);
+#     erva = expdata - export_rva;
+#
+#     nexp = pe_as32 (expdata+24);
+#     name_rvas = pe_as32 (expdata+32);
+#
+#     printf ("EXPORTS\n");
+#     for (i = 0; i<nexp; i++)
+#     {
+# 	unsigned long name_rva = pe_as32 (erva+name_rvas+i*4);
+# 	printf ("\t%s @ %ld ;\n", erva+name_rva, 1+ i);
+#     }
+#
+#     return 0;
+# }
+# /* impgen.c ends here */
+
+EOF
+    ;;
+  esac
+
+  # We use sed instead of cat because bash on DJGPP gets confused if
+  # if finds mixed CR/LF and LF-only lines.  Since sed operates in
+  # text mode, it properly converts lines to CR/LF.  This bash problem
+  # is reportedly fixed, but why not run on old versions too?
+  sed '$q' "$ltmain" >> "${ofile}T" || (rm -f "${ofile}T"; exit 1)
+
+  mv -f "${ofile}T" "$ofile" || \
+    (rm -f "$ofile" && cp "${ofile}T" "$ofile" && rm -f "${ofile}T")
+  chmod +x "$ofile"
+fi
+
+# This can be used to rebuild libtool when needed
+LIBTOOL_DEPS="$ac_aux_dir/ltmain.sh"
+
+# Always use our own libtool.
+LIBTOOL='$(SHELL) $(top_builddir)/libtool'
+
+# Prevent multiple expansion
+
+# Find a good install program.  We prefer a C program (faster),
+# so one script is as good as another.  But avoid the broken or
+# incompatible versions:
+# SysV /etc/install, /usr/sbin/install
+# SunOS /usr/etc/install
+# IRIX /sbin/install
+# AIX /bin/install
+# AmigaOS /C/install, which installs bootblocks on floppy discs
+# AIX 4 /usr/bin/installbsd, which doesn't work without a -g flag
+# AFS /usr/afsws/bin/install, which mishandles nonexistent args
+# SVR4 /usr/ucb/install, which tries to use the nonexistent group "staff"
+# ./install, which can be erroneously created by make from ./install.sh.
+echo "$as_me:6175: checking for a BSD compatible install" >&5
+echo $ECHO_N "checking for a BSD compatible install... $ECHO_C" >&6
+if test -z "$INSTALL"; then
+if test "${ac_cv_path_install+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+    ac_save_IFS=$IFS; IFS=$ac_path_separator
+  for ac_dir in $PATH; do
+    IFS=$ac_save_IFS
+    # Account for people who put trailing slashes in PATH elements.
+    case $ac_dir/ in
+    / | ./ | .// | /cC/* \
+    | /etc/* | /usr/sbin/* | /usr/etc/* | /sbin/* | /usr/afsws/bin/* \
+    | /usr/ucb/* ) ;;
+    *)
+      # OSF1 and SCO ODT 3.0 have their own names for install.
+      # Don't use installbsd from OSF since it installs stuff as root
+      # by default.
+      for ac_prog in ginstall scoinst install; do
+        if $as_executable_p "$ac_dir/$ac_prog"; then
+	  if test $ac_prog = install &&
+            grep dspmsg "$ac_dir/$ac_prog" >/dev/null 2>&1; then
+	    # AIX install.  It has an incompatible calling convention.
+	    :
+	  elif test $ac_prog = install &&
+	    grep pwplus "$ac_dir/$ac_prog" >/dev/null 2>&1; then
+	    # program-specific install script used by HP pwplus--don't use.
+	    :
+	  else
+	    ac_cv_path_install="$ac_dir/$ac_prog -c"
+	    break 2
+	  fi
+	fi
+      done
+      ;;
+    esac
+  done
+
+fi
+  if test "${ac_cv_path_install+set}" = set; then
+    INSTALL=$ac_cv_path_install
+  else
+    # As a last resort, use the slow shell script.  We don't cache a
+    # path for INSTALL within a source directory, because that will
+    # break other packages using the cache if that directory is
+    # removed, or if the path is relative.
+    INSTALL=$ac_install_sh
+  fi
+fi
+echo "$as_me:6224: result: $INSTALL" >&5
+echo "${ECHO_T}$INSTALL" >&6
+
+# Use test -z because SunOS4 sh mishandles braces in ${var-val}.
+# It thinks the first close brace ends the variable substitution.
+test -z "$INSTALL_PROGRAM" && INSTALL_PROGRAM='${INSTALL}'
+
+test -z "$INSTALL_SCRIPT" && INSTALL_SCRIPT='${INSTALL}'
+
+test -z "$INSTALL_DATA" && INSTALL_DATA='${INSTALL} -m 644'
+
+echo "$as_me:6235: checking for X" >&5
+echo $ECHO_N "checking for X... $ECHO_C" >&6
+
+# Check whether --with-x or --without-x was given.
+if test "${with_x+set}" = set; then
+  withval="$with_x"
+
+fi;
+# $have_x is `yes', `no', `disabled', or empty when we do not yet know.
+if test "x$with_x" = xno; then
+  # The user explicitly disabled X.
+  have_x=disabled
+else
+  if test "x$x_includes" != xNONE && test "x$x_libraries" != xNONE; then
+    # Both variables are already set.
+    have_x=yes
+  else
+    if test "${ac_cv_have_x+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  # One or both of the vars are not set, and there is no cached value.
+ac_x_includes=no ac_x_libraries=no
+rm -fr conftest.dir
+if mkdir conftest.dir; then
+  cd conftest.dir
+  # Make sure to not put "make" in the Imakefile rules, since we grep it out.
+  cat >Imakefile <<'EOF'
+acfindx:
+	@echo 'ac_im_incroot="${INCROOT}"; ac_im_usrlibdir="${USRLIBDIR}"; ac_im_libdir="${LIBDIR}"'
+EOF
+  if (xmkmf) >/dev/null 2>/dev/null && test -f Makefile; then
+    # GNU make sometimes prints "make[1]: Entering...", which would confuse us.
+    eval `${MAKE-make} acfindx 2>/dev/null | grep -v make`
+    # Open Windows xmkmf reportedly sets LIBDIR instead of USRLIBDIR.
+    for ac_extension in a so sl; do
+      if test ! -f $ac_im_usrlibdir/libX11.$ac_extension &&
+         test -f $ac_im_libdir/libX11.$ac_extension; then
+        ac_im_usrlibdir=$ac_im_libdir; break
+      fi
+    done
+    # Screen out bogus values from the imake configuration.  They are
+    # bogus both because they are the default anyway, and because
+    # using them would break gcc on systems where it needs fixed includes.
+    case $ac_im_incroot in
+	/usr/include) ;;
+	*) test -f "$ac_im_incroot/X11/Xos.h" && ac_x_includes=$ac_im_incroot;;
+    esac
+    case $ac_im_usrlibdir in
+	/usr/lib | /lib) ;;
+	*) test -d "$ac_im_usrlibdir" && ac_x_libraries=$ac_im_usrlibdir ;;
+    esac
+  fi
+  cd ..
+  rm -fr conftest.dir
+fi
+
+# Standard set of common directories for X headers.
+# Check X11 before X11Rn because it is often a symlink to the current release.
+ac_x_header_dirs='
+/usr/X11/include
+/usr/X11R6/include
+/usr/X11R5/include
+/usr/X11R4/include
+
+/usr/include/X11
+/usr/include/X11R6
+/usr/include/X11R5
+/usr/include/X11R4
+
+/usr/local/X11/include
+/usr/local/X11R6/include
+/usr/local/X11R5/include
+/usr/local/X11R4/include
+
+/usr/local/include/X11
+/usr/local/include/X11R6
+/usr/local/include/X11R5
+/usr/local/include/X11R4
+
+/usr/X386/include
+/usr/x386/include
+/usr/XFree86/include/X11
+
+/usr/include
+/usr/local/include
+/usr/unsupported/include
+/usr/athena/include
+/usr/local/x11r5/include
+/usr/lpp/Xamples/include
+
+/usr/openwin/include
+/usr/openwin/share/include'
+
+if test "$ac_x_includes" = no; then
+  # Guess where to find include files, by looking for Intrinsic.h.
+  # First, try using that file with no special directory specified.
+  cat >conftest.$ac_ext <<_ACEOF
+#line 6332 "configure"
+#include "confdefs.h"
+#include <X11/Intrinsic.h>
+_ACEOF
+if { (eval echo "$as_me:6336: \"$ac_cpp conftest.$ac_ext\"") >&5
+  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+  ac_status=$?
+  egrep -v '^ *\+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  echo "$as_me:6342: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null; then
+  if test -s conftest.err; then
+    ac_cpp_err=$ac_c_preproc_warn_flag
+  else
+    ac_cpp_err=
+  fi
+else
+  ac_cpp_err=yes
+fi
+if test -z "$ac_cpp_err"; then
+  # We can compile using X headers with no special include directory.
+ac_x_includes=
+else
+  echo "$as_me: failed program was:" >&5
+  cat conftest.$ac_ext >&5
+  for ac_dir in $ac_x_header_dirs; do
+  if test -r "$ac_dir/X11/Intrinsic.h"; then
+    ac_x_includes=$ac_dir
+    break
+  fi
+done
+fi
+rm -f conftest.err conftest.$ac_ext
+fi # $ac_x_includes = no
+
+if test "$ac_x_libraries" = no; then
+  # Check for the libraries.
+  # See if we find them without any special options.
+  # Don't add to $LIBS permanently.
+  ac_save_LIBS=$LIBS
+  LIBS="-lXt $LIBS"
+  cat >conftest.$ac_ext <<_ACEOF
+#line 6375 "configure"
+#include "confdefs.h"
+#include <X11/Intrinsic.h>
+int
+main ()
+{
+XtMalloc (0)
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:6387: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:6390: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:6393: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:6396: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  LIBS=$ac_save_LIBS
+# We can link X programs with no special library path.
+ac_x_libraries=
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+LIBS=$ac_save_LIBS
+for ac_dir in `echo "$ac_x_includes $ac_x_header_dirs" | sed s/include/lib/g`
+do
+  # Don't even attempt the hair of trying to link an X program!
+  for ac_extension in a so sl; do
+    if test -r $ac_dir/libXt.$ac_extension; then
+      ac_x_libraries=$ac_dir
+      break 2
+    fi
+  done
+done
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+fi # $ac_x_libraries = no
+
+if test "$ac_x_includes" = no || test "$ac_x_libraries" = no; then
+  # Didn't find X anywhere.  Cache the known absence of X.
+  ac_cv_have_x="have_x=no"
+else
+  # Record where we found X for the cache.
+  ac_cv_have_x="have_x=yes \
+	        ac_x_includes=$ac_x_includes ac_x_libraries=$ac_x_libraries"
+fi
+fi
+
+  fi
+  eval "$ac_cv_have_x"
+fi # $with_x != no
+
+if test "$have_x" != yes; then
+  echo "$as_me:6434: result: $have_x" >&5
+echo "${ECHO_T}$have_x" >&6
+  no_x=yes
+else
+  # If each of the values was on the command line, it overrides each guess.
+  test "x$x_includes" = xNONE && x_includes=$ac_x_includes
+  test "x$x_libraries" = xNONE && x_libraries=$ac_x_libraries
+  # Update the cache value to reflect the command line values.
+  ac_cv_have_x="have_x=yes \
+		ac_x_includes=$x_includes ac_x_libraries=$x_libraries"
+  echo "$as_me:6444: result: libraries $x_libraries, headers $x_includes" >&5
+echo "${ECHO_T}libraries $x_libraries, headers $x_includes" >&6
+fi
+
+LDFLAGS="$LDFLAGS -L$libdir -L$x_libraries"
+CPPFLAGS="$CPPFLAGS -I/usr/X11R6/include/freetype2 -I/usr/include/freetype2 -I$includedir -I$x_includes"
+
+echo "$as_me:6451: checking for main in -lm" >&5
+echo $ECHO_N "checking for main in -lm... $ECHO_C" >&6
+if test "${ac_cv_lib_m_main+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  ac_check_lib_save_LIBS=$LIBS
+LIBS="-lm  $LIBS"
+cat >conftest.$ac_ext <<_ACEOF
+#line 6459 "configure"
+#include "confdefs.h"
+
+int
+main ()
+{
+main ();
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:6471: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:6474: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:6477: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:6480: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_lib_m_main=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_lib_m_main=no
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+LIBS=$ac_check_lib_save_LIBS
+fi
+echo "$as_me:6491: result: $ac_cv_lib_m_main" >&5
+echo "${ECHO_T}$ac_cv_lib_m_main" >&6
+if test $ac_cv_lib_m_main = yes; then
+  cat >>confdefs.h <<EOF
+#define HAVE_LIBM 1
+EOF
+
+  LIBS="-lm $LIBS"
+
+fi
+
+echo "$as_me:6502: checking for deflate in -lz" >&5
+echo $ECHO_N "checking for deflate in -lz... $ECHO_C" >&6
+if test "${ac_cv_lib_z_deflate+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  ac_check_lib_save_LIBS=$LIBS
+LIBS="-lz  $LIBS"
+cat >conftest.$ac_ext <<_ACEOF
+#line 6510 "configure"
+#include "confdefs.h"
+
+/* Override any gcc2 internal prototype to avoid an error.  */
+#ifdef __cplusplus
+extern "C"
+#endif
+/* We use char because int might match the return type of a gcc2
+   builtin and then its argument prototype would still apply.  */
+char deflate ();
+int
+main ()
+{
+deflate ();
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:6529: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:6532: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:6535: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:6538: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_lib_z_deflate=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_lib_z_deflate=no
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+LIBS=$ac_check_lib_save_LIBS
+fi
+echo "$as_me:6549: result: $ac_cv_lib_z_deflate" >&5
+echo "${ECHO_T}$ac_cv_lib_z_deflate" >&6
+if test $ac_cv_lib_z_deflate = yes; then
+  cat >>confdefs.h <<EOF
+#define HAVE_LIBZ 1
+EOF
+
+  LIBS="-lz $LIBS"
+
+else
+  { { echo "$as_me:6559: error: libz not found." >&5
+echo "$as_me: error: libz not found." >&2;}
+   { (exit 1); exit 1; }; }
+fi
+
+echo "$as_me:6564: checking for png_check_sig in -lpng" >&5
+echo $ECHO_N "checking for png_check_sig in -lpng... $ECHO_C" >&6
+if test "${ac_cv_lib_png_png_check_sig+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  ac_check_lib_save_LIBS=$LIBS
+LIBS="-lpng  $LIBS"
+cat >conftest.$ac_ext <<_ACEOF
+#line 6572 "configure"
+#include "confdefs.h"
+
+/* Override any gcc2 internal prototype to avoid an error.  */
+#ifdef __cplusplus
+extern "C"
+#endif
+/* We use char because int might match the return type of a gcc2
+   builtin and then its argument prototype would still apply.  */
+char png_check_sig ();
+int
+main ()
+{
+png_check_sig ();
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:6591: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:6594: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:6597: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:6600: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_lib_png_png_check_sig=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_lib_png_png_check_sig=no
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+LIBS=$ac_check_lib_save_LIBS
+fi
+echo "$as_me:6611: result: $ac_cv_lib_png_png_check_sig" >&5
+echo "${ECHO_T}$ac_cv_lib_png_png_check_sig" >&6
+if test $ac_cv_lib_png_png_check_sig = yes; then
+  cat >>confdefs.h <<EOF
+#define HAVE_LIBPNG 1
+EOF
+
+  LIBS="-lpng $LIBS"
+
+else
+  { { echo "$as_me:6621: error: libpng not found." >&5
+echo "$as_me: error: libpng not found." >&2;}
+   { (exit 1); exit 1; }; }
+fi
+
+# Check whether --enable-jpeg or --disable-jpeg was given.
+if test "${enable_jpeg+set}" = set; then
+  enableval="$enable_jpeg"
+
+for ac_header in jpeglib.h
+do
+ac_ac_Header=`echo "ac_cv_header_$ac_header" | $ac_tr_sh`
+echo "$as_me:6633: checking for $ac_header" >&5
+echo $ECHO_N "checking for $ac_header... $ECHO_C" >&6
+if eval "test \"\${$ac_ac_Header+set}\" = set"; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 6639 "configure"
+#include "confdefs.h"
+#include <$ac_header>
+_ACEOF
+if { (eval echo "$as_me:6643: \"$ac_cpp conftest.$ac_ext\"") >&5
+  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+  ac_status=$?
+  egrep -v '^ *\+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  echo "$as_me:6649: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null; then
+  if test -s conftest.err; then
+    ac_cpp_err=$ac_c_preproc_warn_flag
+  else
+    ac_cpp_err=
+  fi
+else
+  ac_cpp_err=yes
+fi
+if test -z "$ac_cpp_err"; then
+  eval "$ac_ac_Header=yes"
+else
+  echo "$as_me: failed program was:" >&5
+  cat conftest.$ac_ext >&5
+  eval "$ac_ac_Header=no"
+fi
+rm -f conftest.err conftest.$ac_ext
+fi
+echo "$as_me:6668: result: `eval echo '${'$ac_ac_Header'}'`" >&5
+echo "${ECHO_T}`eval echo '${'$ac_ac_Header'}'`" >&6
+if test `eval echo '${'$ac_ac_Header'}'` = yes; then
+  cat >>confdefs.h <<EOF
+#define `echo "HAVE_$ac_header" | $ac_tr_cpp` 1
+EOF
+
+else
+  { echo "$as_me:6676: WARNING: libgd will be built without support for JPEG." >&5
+echo "$as_me: WARNING: libgd will be built without support for JPEG." >&2;}
+fi
+done
+
+echo "$as_me:6681: checking for jpeg_start_compress in -ljpeg" >&5
+echo $ECHO_N "checking for jpeg_start_compress in -ljpeg... $ECHO_C" >&6
+if test "${ac_cv_lib_jpeg_jpeg_start_compress+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  ac_check_lib_save_LIBS=$LIBS
+LIBS="-ljpeg  $LIBS"
+cat >conftest.$ac_ext <<_ACEOF
+#line 6689 "configure"
+#include "confdefs.h"
+
+/* Override any gcc2 internal prototype to avoid an error.  */
+#ifdef __cplusplus
+extern "C"
+#endif
+/* We use char because int might match the return type of a gcc2
+   builtin and then its argument prototype would still apply.  */
+char jpeg_start_compress ();
+int
+main ()
+{
+jpeg_start_compress ();
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:6708: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:6711: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:6714: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:6717: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_lib_jpeg_jpeg_start_compress=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_lib_jpeg_jpeg_start_compress=no
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+LIBS=$ac_check_lib_save_LIBS
+fi
+echo "$as_me:6728: result: $ac_cv_lib_jpeg_jpeg_start_compress" >&5
+echo "${ECHO_T}$ac_cv_lib_jpeg_jpeg_start_compress" >&6
+if test $ac_cv_lib_jpeg_jpeg_start_compress = yes; then
+  cat >>confdefs.h <<EOF
+#define HAVE_LIBJPEG 1
+EOF
+
+  LIBS="-ljpeg $LIBS"
+
+else
+  { echo "$as_me:6738: WARNING: libgd will be built without support for JPEG." >&5
+echo "$as_me: WARNING: libgd will be built without support for JPEG." >&2;}
+fi
+
+fi;
+
+# Check whether --enable-freetype or --disable-freetype was given.
+if test "${enable_freetype+set}" = set; then
+  enableval="$enable_freetype"
+
+for ac_header in freetype/freetype.h
+do
+ac_ac_Header=`echo "ac_cv_header_$ac_header" | $ac_tr_sh`
+echo "$as_me:6751: checking for $ac_header" >&5
+echo $ECHO_N "checking for $ac_header... $ECHO_C" >&6
+if eval "test \"\${$ac_ac_Header+set}\" = set"; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 6757 "configure"
+#include "confdefs.h"
+#include <$ac_header>
+_ACEOF
+if { (eval echo "$as_me:6761: \"$ac_cpp conftest.$ac_ext\"") >&5
+  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+  ac_status=$?
+  egrep -v '^ *\+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  echo "$as_me:6767: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null; then
+  if test -s conftest.err; then
+    ac_cpp_err=$ac_c_preproc_warn_flag
+  else
+    ac_cpp_err=
+  fi
+else
+  ac_cpp_err=yes
+fi
+if test -z "$ac_cpp_err"; then
+  eval "$ac_ac_Header=yes"
+else
+  echo "$as_me: failed program was:" >&5
+  cat conftest.$ac_ext >&5
+  eval "$ac_ac_Header=no"
+fi
+rm -f conftest.err conftest.$ac_ext
+fi
+echo "$as_me:6786: result: `eval echo '${'$ac_ac_Header'}'`" >&5
+echo "${ECHO_T}`eval echo '${'$ac_ac_Header'}'`" >&6
+if test `eval echo '${'$ac_ac_Header'}'` = yes; then
+  cat >>confdefs.h <<EOF
+#define `echo "HAVE_$ac_header" | $ac_tr_cpp` 1
+EOF
+
+else
+  { echo "$as_me:6794: WARNING: libgd will be built without Freetype support." >&5
+echo "$as_me: WARNING: libgd will be built without Freetype support." >&2;}
+fi
+done
+
+echo "$as_me:6799: checking for FT_Init_FreeType in -lfreetype" >&5
+echo $ECHO_N "checking for FT_Init_FreeType in -lfreetype... $ECHO_C" >&6
+if test "${ac_cv_lib_freetype_FT_Init_FreeType+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  ac_check_lib_save_LIBS=$LIBS
+LIBS="-lfreetype  $LIBS"
+cat >conftest.$ac_ext <<_ACEOF
+#line 6807 "configure"
+#include "confdefs.h"
+
+/* Override any gcc2 internal prototype to avoid an error.  */
+#ifdef __cplusplus
+extern "C"
+#endif
+/* We use char because int might match the return type of a gcc2
+   builtin and then its argument prototype would still apply.  */
+char FT_Init_FreeType ();
+int
+main ()
+{
+FT_Init_FreeType ();
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:6826: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:6829: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:6832: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:6835: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_lib_freetype_FT_Init_FreeType=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_lib_freetype_FT_Init_FreeType=no
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+LIBS=$ac_check_lib_save_LIBS
+fi
+echo "$as_me:6846: result: $ac_cv_lib_freetype_FT_Init_FreeType" >&5
+echo "${ECHO_T}$ac_cv_lib_freetype_FT_Init_FreeType" >&6
+if test $ac_cv_lib_freetype_FT_Init_FreeType = yes; then
+  cat >>confdefs.h <<EOF
+#define HAVE_LIBFREETYPE 1
+EOF
+
+  LIBS="-lfreetype $LIBS"
+
+else
+  { echo "$as_me:6856: WARNING: libgd will be built without Freetype support." >&5
+echo "$as_me: WARNING: libgd will be built without Freetype support." >&2;}
+fi
+
+fi;
+
+# Check whether --enable-xpm or --disable-xpm was given.
+if test "${enable_xpm+set}" = set; then
+  enableval="$enable_xpm"
+
+for ac_header in X11/xpm.h
+do
+ac_ac_Header=`echo "ac_cv_header_$ac_header" | $ac_tr_sh`
+echo "$as_me:6869: checking for $ac_header" >&5
+echo $ECHO_N "checking for $ac_header... $ECHO_C" >&6
+if eval "test \"\${$ac_ac_Header+set}\" = set"; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 6875 "configure"
+#include "confdefs.h"
+#include <$ac_header>
+_ACEOF
+if { (eval echo "$as_me:6879: \"$ac_cpp conftest.$ac_ext\"") >&5
+  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+  ac_status=$?
+  egrep -v '^ *\+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  echo "$as_me:6885: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null; then
+  if test -s conftest.err; then
+    ac_cpp_err=$ac_c_preproc_warn_flag
+  else
+    ac_cpp_err=
+  fi
+else
+  ac_cpp_err=yes
+fi
+if test -z "$ac_cpp_err"; then
+  eval "$ac_ac_Header=yes"
+else
+  echo "$as_me: failed program was:" >&5
+  cat conftest.$ac_ext >&5
+  eval "$ac_ac_Header=no"
+fi
+rm -f conftest.err conftest.$ac_ext
+fi
+echo "$as_me:6904: result: `eval echo '${'$ac_ac_Header'}'`" >&5
+echo "${ECHO_T}`eval echo '${'$ac_ac_Header'}'`" >&6
+if test `eval echo '${'$ac_ac_Header'}'` = yes; then
+  cat >>confdefs.h <<EOF
+#define `echo "HAVE_$ac_header" | $ac_tr_cpp` 1
+EOF
+
+else
+  { echo "$as_me:6912: WARNING: libgd will be built without support for XPM images." >&5
+echo "$as_me: WARNING: libgd will be built without support for XPM images." >&2;}
+fi
+done
+
+	  echo "$as_me:6917: checking for XpmCreateImageFromData in -lXpm" >&5
+echo $ECHO_N "checking for XpmCreateImageFromData in -lXpm... $ECHO_C" >&6
+if test "${ac_cv_lib_Xpm_XpmCreateImageFromData+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  ac_check_lib_save_LIBS=$LIBS
+LIBS="-lXpm -lX11 $LIBS"
+cat >conftest.$ac_ext <<_ACEOF
+#line 6925 "configure"
+#include "confdefs.h"
+
+/* Override any gcc2 internal prototype to avoid an error.  */
+#ifdef __cplusplus
+extern "C"
+#endif
+/* We use char because int might match the return type of a gcc2
+   builtin and then its argument prototype would still apply.  */
+char XpmCreateImageFromData ();
+int
+main ()
+{
+XpmCreateImageFromData ();
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext conftest$ac_exeext
+if { (eval echo "$as_me:6944: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:6947: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest$ac_exeext'
+  { (eval echo "$as_me:6950: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:6953: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_lib_Xpm_XpmCreateImageFromData=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_lib_Xpm_XpmCreateImageFromData=no
+fi
+rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+LIBS=$ac_check_lib_save_LIBS
+fi
+echo "$as_me:6964: result: $ac_cv_lib_Xpm_XpmCreateImageFromData" >&5
+echo "${ECHO_T}$ac_cv_lib_Xpm_XpmCreateImageFromData" >&6
+if test $ac_cv_lib_Xpm_XpmCreateImageFromData = yes; then
+
+			       LIBS="$LIBS -lX11 -lXpm"
+			       cat >>confdefs.h <<\EOF
+#define HAVE_LIBXPM 1
+EOF
+
+else
+  { echo "$as_me:6974: WARNING: libgd will be built without support for XPM images." >&5
+echo "$as_me: WARNING: libgd will be built without support for XPM images." >&2;}
+fi
+
+fi;
+
+echo "$as_me:6980: checking for ANSI C header files" >&5
+echo $ECHO_N "checking for ANSI C header files... $ECHO_C" >&6
+if test "${ac_cv_header_stdc+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 6986 "configure"
+#include "confdefs.h"
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <float.h>
+
+_ACEOF
+if { (eval echo "$as_me:6994: \"$ac_cpp conftest.$ac_ext\"") >&5
+  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+  ac_status=$?
+  egrep -v '^ *\+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  echo "$as_me:7000: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null; then
+  if test -s conftest.err; then
+    ac_cpp_err=$ac_c_preproc_warn_flag
+  else
+    ac_cpp_err=
+  fi
+else
+  ac_cpp_err=yes
+fi
+if test -z "$ac_cpp_err"; then
+  ac_cv_header_stdc=yes
+else
+  echo "$as_me: failed program was:" >&5
+  cat conftest.$ac_ext >&5
+  ac_cv_header_stdc=no
+fi
+rm -f conftest.err conftest.$ac_ext
+
+if test $ac_cv_header_stdc = yes; then
+  # SunOS 4.x string.h does not declare mem*, contrary to ANSI.
+  cat >conftest.$ac_ext <<_ACEOF
+#line 7022 "configure"
+#include "confdefs.h"
+#include <string.h>
+
+_ACEOF
+if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+  egrep "memchr" >/dev/null 2>&1; then
+  :
+else
+  ac_cv_header_stdc=no
+fi
+rm -f conftest*
+
+fi
+
+if test $ac_cv_header_stdc = yes; then
+  # ISC 2.0.2 stdlib.h does not declare free, contrary to ANSI.
+  cat >conftest.$ac_ext <<_ACEOF
+#line 7040 "configure"
+#include "confdefs.h"
+#include <stdlib.h>
+
+_ACEOF
+if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+  egrep "free" >/dev/null 2>&1; then
+  :
+else
+  ac_cv_header_stdc=no
+fi
+rm -f conftest*
+
+fi
+
+if test $ac_cv_header_stdc = yes; then
+  # /bin/cc in Irix-4.0.5 gets non-ANSI ctype macros unless using -ansi.
+  if test "$cross_compiling" = yes; then
+  :
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 7061 "configure"
+#include "confdefs.h"
+#include <ctype.h>
+#if ((' ' & 0x0FF) == 0x020)
+# define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
+# define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
+#else
+# define ISLOWER(c) (('a' <= (c) && (c) <= 'i') \
+                     || ('j' <= (c) && (c) <= 'r') \
+                     || ('s' <= (c) && (c) <= 'z'))
+# define TOUPPER(c) (ISLOWER(c) ? ((c) | 0x40) : (c))
+#endif
+
+#define XOR(e, f) (((e) && !(f)) || (!(e) && (f)))
+int
+main ()
+{
+  int i;
+  for (i = 0; i < 256; i++)
+    if (XOR (islower (i), ISLOWER (i))
+        || toupper (i) != TOUPPER (i))
+      exit(2);
+  exit (0);
+}
+_ACEOF
+rm -f conftest$ac_exeext
+if { (eval echo "$as_me:7087: \"$ac_link\"") >&5
+  (eval $ac_link) 2>&5
+  ac_status=$?
+  echo "$as_me:7090: \$? = $ac_status" >&5
+  (exit $ac_status); } && { ac_try='./conftest$ac_exeext'
+  { (eval echo "$as_me:7092: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:7095: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  :
+else
+  echo "$as_me: program exited with status $ac_status" >&5
+echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_header_stdc=no
+fi
+rm -f core core.* *.core conftest$ac_exeext conftest.$ac_ext
+fi
+fi
+fi
+echo "$as_me:7108: result: $ac_cv_header_stdc" >&5
+echo "${ECHO_T}$ac_cv_header_stdc" >&6
+if test $ac_cv_header_stdc = yes; then
+
+cat >>confdefs.h <<\EOF
+#define STDC_HEADERS 1
+EOF
+
+fi
+
+for ac_header in malloc.h unistd.h
+do
+ac_ac_Header=`echo "ac_cv_header_$ac_header" | $ac_tr_sh`
+echo "$as_me:7121: checking for $ac_header" >&5
+echo $ECHO_N "checking for $ac_header... $ECHO_C" >&6
+if eval "test \"\${$ac_ac_Header+set}\" = set"; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 7127 "configure"
+#include "confdefs.h"
+#include <$ac_header>
+_ACEOF
+if { (eval echo "$as_me:7131: \"$ac_cpp conftest.$ac_ext\"") >&5
+  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+  ac_status=$?
+  egrep -v '^ *\+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  echo "$as_me:7137: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null; then
+  if test -s conftest.err; then
+    ac_cpp_err=$ac_c_preproc_warn_flag
+  else
+    ac_cpp_err=
+  fi
+else
+  ac_cpp_err=yes
+fi
+if test -z "$ac_cpp_err"; then
+  eval "$ac_ac_Header=yes"
+else
+  echo "$as_me: failed program was:" >&5
+  cat conftest.$ac_ext >&5
+  eval "$ac_ac_Header=no"
+fi
+rm -f conftest.err conftest.$ac_ext
+fi
+echo "$as_me:7156: result: `eval echo '${'$ac_ac_Header'}'`" >&5
+echo "${ECHO_T}`eval echo '${'$ac_ac_Header'}'`" >&6
+if test `eval echo '${'$ac_ac_Header'}'` = yes; then
+  cat >>confdefs.h <<EOF
+#define `echo "HAVE_$ac_header" | $ac_tr_cpp` 1
+EOF
+
+fi
+done
+
+for ac_header in zlib.h
+do
+ac_ac_Header=`echo "ac_cv_header_$ac_header" | $ac_tr_sh`
+echo "$as_me:7169: checking for $ac_header" >&5
+echo $ECHO_N "checking for $ac_header... $ECHO_C" >&6
+if eval "test \"\${$ac_ac_Header+set}\" = set"; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 7175 "configure"
+#include "confdefs.h"
+#include <$ac_header>
+_ACEOF
+if { (eval echo "$as_me:7179: \"$ac_cpp conftest.$ac_ext\"") >&5
+  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+  ac_status=$?
+  egrep -v '^ *\+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  echo "$as_me:7185: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null; then
+  if test -s conftest.err; then
+    ac_cpp_err=$ac_c_preproc_warn_flag
+  else
+    ac_cpp_err=
+  fi
+else
+  ac_cpp_err=yes
+fi
+if test -z "$ac_cpp_err"; then
+  eval "$ac_ac_Header=yes"
+else
+  echo "$as_me: failed program was:" >&5
+  cat conftest.$ac_ext >&5
+  eval "$ac_ac_Header=no"
+fi
+rm -f conftest.err conftest.$ac_ext
+fi
+echo "$as_me:7204: result: `eval echo '${'$ac_ac_Header'}'`" >&5
+echo "${ECHO_T}`eval echo '${'$ac_ac_Header'}'`" >&6
+if test `eval echo '${'$ac_ac_Header'}'` = yes; then
+  cat >>confdefs.h <<EOF
+#define `echo "HAVE_$ac_header" | $ac_tr_cpp` 1
+EOF
+
+else
+  { { echo "$as_me:7212: error: zlib.h not found." >&5
+echo "$as_me: error: zlib.h not found." >&2;}
+   { (exit 1); exit 1; }; }
+fi
+done
+
+for ac_header in png.h
+do
+ac_ac_Header=`echo "ac_cv_header_$ac_header" | $ac_tr_sh`
+echo "$as_me:7221: checking for $ac_header" >&5
+echo $ECHO_N "checking for $ac_header... $ECHO_C" >&6
+if eval "test \"\${$ac_ac_Header+set}\" = set"; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 7227 "configure"
+#include "confdefs.h"
+#include <$ac_header>
+_ACEOF
+if { (eval echo "$as_me:7231: \"$ac_cpp conftest.$ac_ext\"") >&5
+  (eval $ac_cpp conftest.$ac_ext) 2>conftest.er1
+  ac_status=$?
+  egrep -v '^ *\+' conftest.er1 >conftest.err
+  rm -f conftest.er1
+  cat conftest.err >&5
+  echo "$as_me:7237: \$? = $ac_status" >&5
+  (exit $ac_status); } >/dev/null; then
+  if test -s conftest.err; then
+    ac_cpp_err=$ac_c_preproc_warn_flag
+  else
+    ac_cpp_err=
+  fi
+else
+  ac_cpp_err=yes
+fi
+if test -z "$ac_cpp_err"; then
+  eval "$ac_ac_Header=yes"
+else
+  echo "$as_me: failed program was:" >&5
+  cat conftest.$ac_ext >&5
+  eval "$ac_ac_Header=no"
+fi
+rm -f conftest.err conftest.$ac_ext
+fi
+echo "$as_me:7256: result: `eval echo '${'$ac_ac_Header'}'`" >&5
+echo "${ECHO_T}`eval echo '${'$ac_ac_Header'}'`" >&6
+if test `eval echo '${'$ac_ac_Header'}'` = yes; then
+  cat >>confdefs.h <<EOF
+#define `echo "HAVE_$ac_header" | $ac_tr_cpp` 1
+EOF
+
+else
+  { { echo "$as_me:7264: error: png.h not found." >&5
+echo "$as_me: error: png.h not found." >&2;}
+   { (exit 1); exit 1; }; }
+fi
+done
+
+echo "$as_me:7270: checking for $CC option to accept ANSI C" >&5
+echo $ECHO_N "checking for $CC option to accept ANSI C... $ECHO_C" >&6
+if test "${ac_cv_prog_cc_stdc+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  ac_cv_prog_cc_stdc=no
+ac_save_CC=$CC
+cat >conftest.$ac_ext <<_ACEOF
+#line 7278 "configure"
+#include "confdefs.h"
+#include <stdarg.h>
+#include <stdio.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+/* Most of the following tests are stolen from RCS 5.7's src/conf.sh.  */
+struct buf { int x; };
+FILE * (*rcsopen) (struct buf *, struct stat *, int);
+static char *e (p, i)
+     char **p;
+     int i;
+{
+  return p[i];
+}
+static char *f (char * (*g) (char **, int), char **p, ...)
+{
+  char *s;
+  va_list v;
+  va_start (v,p);
+  s = g (p, va_arg (v,int));
+  va_end (v);
+  return s;
+}
+int test (int i, double x);
+struct s1 {int (*f) (int a);};
+struct s2 {int (*f) (double a);};
+int pairnames (int, char **, FILE *(*)(struct buf *, struct stat *, int), int, int);
+int argc;
+char **argv;
+int
+main ()
+{
+return f (e, argv, 0) != argv[0]  ||  f (e, argv, 1) != argv[1];
+  ;
+  return 0;
+}
+_ACEOF
+# Don't try gcc -ansi; that turns off useful extensions and
+# breaks some systems' header files.
+# AIX			-qlanglvl=ansi
+# Ultrix and OSF/1	-std1
+# HP-UX 10.20 and later	-Ae
+# HP-UX older versions	-Aa -D_HPUX_SOURCE
+# SVR4			-Xc -D__EXTENSIONS__
+for ac_arg in "" -qlanglvl=ansi -std1 -Ae "-Aa -D_HPUX_SOURCE" "-Xc -D__EXTENSIONS__"
+do
+  CC="$ac_save_CC $ac_arg"
+  rm -f conftest.$ac_objext
+if { (eval echo "$as_me:7327: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:7330: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest.$ac_objext'
+  { (eval echo "$as_me:7333: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:7336: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_prog_cc_stdc=$ac_arg
+break
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+fi
+rm -f conftest.$ac_objext
+done
+rm -f conftest.$ac_ext conftest.$ac_objext
+CC=$ac_save_CC
+
+fi
+
+case "x$ac_cv_prog_cc_stdc" in
+  x|xno)
+    echo "$as_me:7353: result: none needed" >&5
+echo "${ECHO_T}none needed" >&6 ;;
+  *)
+    echo "$as_me:7356: result: $ac_cv_prog_cc_stdc" >&5
+echo "${ECHO_T}$ac_cv_prog_cc_stdc" >&6
+    CC="$CC $ac_cv_prog_cc_stdc" ;;
+esac
+
+echo "$as_me:7361: checking for an ANSI C-conforming const" >&5
+echo $ECHO_N "checking for an ANSI C-conforming const... $ECHO_C" >&6
+if test "${ac_cv_c_const+set}" = set; then
+  echo $ECHO_N "(cached) $ECHO_C" >&6
+else
+  cat >conftest.$ac_ext <<_ACEOF
+#line 7367 "configure"
+#include "confdefs.h"
+
+int
+main ()
+{
+/* FIXME: Include the comments suggested by Paul. */
+#ifndef __cplusplus
+  /* Ultrix mips cc rejects this.  */
+  typedef int charset[2];
+  const charset x;
+  /* SunOS 4.1.1 cc rejects this.  */
+  char const *const *ccp;
+  char **p;
+  /* NEC SVR4.0.2 mips cc rejects this.  */
+  struct point {int x, y;};
+  static struct point const zero = {0,0};
+  /* AIX XL C 1.02.0.0 rejects this.
+     It does not let you subtract one const X* pointer from another in
+     an arm of an if-expression whose if-part is not a constant
+     expression */
+  const char *g = "string";
+  ccp = &g + (g ? g-g : 0);
+  /* HPUX 7.0 cc rejects these. */
+  ++ccp;
+  p = (char**) ccp;
+  ccp = (char const *const *) p;
+  { /* SCO 3.2v4 cc rejects this.  */
+    char *t;
+    char const *s = 0 ? (char *) 0 : (char const *) 0;
+
+    *t++ = 0;
+  }
+  { /* Someone thinks the Sun supposedly-ANSI compiler will reject this.  */
+    int x[] = {25, 17};
+    const int *foo = &x[0];
+    ++foo;
+  }
+  { /* Sun SC1.0 ANSI compiler rejects this -- but not the above. */
+    typedef const int *iptr;
+    iptr p = 0;
+    ++p;
+  }
+  { /* AIX XL C 1.02.0.0 rejects this saying
+       "k.c", line 2.27: 1506-025 (S) Operand must be a modifiable lvalue. */
+    struct s { int j; const int *ap[3]; };
+    struct s *b; b->j = 5;
+  }
+  { /* ULTRIX-32 V3.1 (Rev 9) vcc rejects this */
+    const int foo = 10;
+  }
+#endif
+
+  ;
+  return 0;
+}
+_ACEOF
+rm -f conftest.$ac_objext
+if { (eval echo "$as_me:7425: \"$ac_compile\"") >&5
+  (eval $ac_compile) 2>&5
+  ac_status=$?
+  echo "$as_me:7428: \$? = $ac_status" >&5
+  (exit $ac_status); } &&
+         { ac_try='test -s conftest.$ac_objext'
+  { (eval echo "$as_me:7431: \"$ac_try\"") >&5
+  (eval $ac_try) 2>&5
+  ac_status=$?
+  echo "$as_me:7434: \$? = $ac_status" >&5
+  (exit $ac_status); }; }; then
+  ac_cv_c_const=yes
+else
+  echo "$as_me: failed program was:" >&5
+cat conftest.$ac_ext >&5
+ac_cv_c_const=no
+fi
+rm -f conftest.$ac_objext conftest.$ac_ext
+fi
+echo "$as_me:7444: result: $ac_cv_c_const" >&5
+echo "${ECHO_T}$ac_cv_c_const" >&6
+if test $ac_cv_c_const = no; then
+
+cat >>confdefs.h <<\EOF
+#define const
+EOF
+
+fi
+
+ac_config_files="$ac_config_files Makefile"
+cat >confcache <<\_ACEOF
+# This file is a shell script that caches the results of configure
+# tests run on this system so they can be shared between configure
+# scripts and configure runs, see configure's option --config-cache.
+# It is not useful on other systems.  If it contains results you don't
+# want to keep, you may remove or edit it.
+#
+# config.status only pays attention to the cache file if you give it
+# the --recheck option to rerun configure.
+#
+# `ac_cv_env_foo' variables (set or unset) will be overriden when
+# loading this file, other *unset* `ac_cv_foo' will be assigned the
+# following values.
+
+_ACEOF
+
+# The following way of writing the cache mishandles newlines in values,
+# but we know of no workaround that is simple, portable, and efficient.
+# So, don't put newlines in cache variables' values.
+# Ultrix sh set writes to stderr and can't be redirected directly,
+# and sets the high bit in the cache file unless we assign to the vars.
+{
+  (set) 2>&1 |
+    case `(ac_space=' '; set | grep ac_space) 2>&1` in
+    *ac_space=\ *)
+      # `set' does not quote correctly, so add quotes (double-quote
+      # substitution turns \\\\ into \\, and sed turns \\ into \).
+      sed -n \
+        "s/'/'\\\\''/g;
+    	  s/^\\([_$ac_cr_alnum]*_cv_[_$ac_cr_alnum]*\\)=\\(.*\\)/\\1='\\2'/p"
+      ;;
+    *)
+      # `set' quotes correctly as required by POSIX, so do not add quotes.
+      sed -n \
+        "s/^\\([_$ac_cr_alnum]*_cv_[_$ac_cr_alnum]*\\)=\\(.*\\)/\\1=\\2/p"
+      ;;
+    esac;
+} |
+  sed '
+     t clear
+     : clear
+     s/^\([^=]*\)=\(.*[{}].*\)$/test "${\1+set}" = set || &/
+     t end
+     /^ac_cv_env/!s/^\([^=]*\)=\(.*\)$/\1=${\1=\2}/
+     : end' >>confcache
+if cmp -s $cache_file confcache; then :; else
+  if test -w $cache_file; then
+    test "x$cache_file" != "x/dev/null" && echo "updating cache $cache_file"
+    cat confcache >$cache_file
+  else
+    echo "not updating unwritable cache $cache_file"
+  fi
+fi
+rm -f confcache
+
+test "x$prefix" = xNONE && prefix=$ac_default_prefix
+# Let make expand exec_prefix.
+test "x$exec_prefix" = xNONE && exec_prefix='${prefix}'
+
+# VPATH may cause trouble with some makes, so we remove $(srcdir),
+# ${srcdir} and @srcdir@ from VPATH if srcdir is ".", strip leading and
+# trailing colons and then remove the whole line if VPATH becomes empty
+# (actually we leave an empty line to preserve line numbers).
+if test "x$srcdir" = x.; then
+  ac_vpsub='/^[ 	]*VPATH[ 	]*=/{
+s/:*\$(srcdir):*/:/;
+s/:*\${srcdir}:*/:/;
+s/:*@srcdir@:*/:/;
+s/^\([^=]*=[ 	]*\):*/\1/;
+s/:*$//;
+s/^[^=]*=[ 	]*$//;
+}'
+fi
+
+# Transform confdefs.h into DEFS.
+# Protect against shell expansion while executing Makefile rules.
+# Protect against Makefile macro expansion.
+#
+# If the first sed substitution is executed (which looks for macros that
+# take arguments), then we branch to the quote section.  Otherwise,
+# look for a macro that doesn't take arguments.
+cat >confdef2opt.sed <<\EOF
+t clear
+: clear
+s,^[ 	]*#[ 	]*define[ 	][ 	]*\([^ 	(][^ 	(]*([^)]*)\)[ 	]*\(.*\),-D\1=\2,g
+t quote
+s,^[ 	]*#[ 	]*define[ 	][ 	]*\([^ 	][^ 	]*\)[ 	]*\(.*\),-D\1=\2,g
+t quote
+d
+: quote
+s,[ 	`~#$^&*(){}\\|;'"<>?],\\&,g
+s,\[,\\&,g
+s,\],\\&,g
+s,\$,$$,g
+p
+EOF
+# We use echo to avoid assuming a particular line-breaking character.
+# The extra dot is to prevent the shell from consuming trailing
+# line-breaks from the sub-command output.  A line-break within
+# single-quotes doesn't work because, if this script is created in a
+# platform that uses two characters for line-breaks (e.g., DOS), tr
+# would break.
+ac_LF_and_DOT=`echo; echo .`
+DEFS=`sed -n -f confdef2opt.sed confdefs.h | tr "$ac_LF_and_DOT" ' .'`
+rm -f confdef2opt.sed
+
+: ${CONFIG_STATUS=./config.status}
+ac_clean_files_save=$ac_clean_files
+ac_clean_files="$ac_clean_files $CONFIG_STATUS"
+{ echo "$as_me:7564: creating $CONFIG_STATUS" >&5
+echo "$as_me: creating $CONFIG_STATUS" >&6;}
+cat >$CONFIG_STATUS <<_ACEOF
+#! $SHELL
+# Generated automatically by configure.
+# Run this file to recreate the current configuration.
+# Compiler output produced by configure, useful for debugging
+# configure, is in config.log if it exists.
+
+debug=false
+SHELL=\${CONFIG_SHELL-$SHELL}
+ac_cs_invocation="\$0 \$@"
+
+_ACEOF
+
+cat >>$CONFIG_STATUS <<\_ACEOF
+# Be Bourne compatible
+if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then
+  emulate sh
+  NULLCMD=:
+elif test -n "${BASH_VERSION+set}" && (set -o posix) >/dev/null 2>&1; then
+  set -o posix
+fi
+
+# Name of the executable.
+as_me=`echo "$0" |sed 's,.*[\\/],,'`
+
+if expr a : '\(a\)' >/dev/null 2>&1; then
+  as_expr=expr
+else
+  as_expr=false
+fi
+
+rm -f conf$$ conf$$.exe conf$$.file
+echo >conf$$.file
+if ln -s conf$$.file conf$$ 2>/dev/null; then
+  # We could just check for DJGPP; but this test a) works b) is more generic
+  # and c) will remain valid once DJGPP supports symlinks (DJGPP 2.04).
+  if test -f conf$$.exe; then
+    # Don't use ln at all; we don't have any links
+    as_ln_s='cp -p'
+  else
+    as_ln_s='ln -s'
+  fi
+elif ln conf$$.file conf$$ 2>/dev/null; then
+  as_ln_s=ln
+else
+  as_ln_s='cp -p'
+fi
+rm -f conf$$ conf$$.exe conf$$.file
+
+as_executable_p="test -f"
+
+# Support unset when possible.
+if (FOO=FOO; unset FOO) >/dev/null 2>&1; then
+  as_unset=unset
+else
+  as_unset=false
+fi
+
+# NLS nuisances.
+$as_unset LANG || test "${LANG+set}" != set || { LANG=C; export LANG; }
+$as_unset LC_ALL || test "${LC_ALL+set}" != set || { LC_ALL=C; export LC_ALL; }
+$as_unset LC_TIME || test "${LC_TIME+set}" != set || { LC_TIME=C; export LC_TIME; }
+$as_unset LC_CTYPE || test "${LC_CTYPE+set}" != set || { LC_CTYPE=C; export LC_CTYPE; }
+$as_unset LANGUAGE || test "${LANGUAGE+set}" != set || { LANGUAGE=C; export LANGUAGE; }
+$as_unset LC_COLLATE || test "${LC_COLLATE+set}" != set || { LC_COLLATE=C; export LC_COLLATE; }
+$as_unset LC_NUMERIC || test "${LC_NUMERIC+set}" != set || { LC_NUMERIC=C; export LC_NUMERIC; }
+$as_unset LC_MESSAGES || test "${LC_MESSAGES+set}" != set || { LC_MESSAGES=C; export LC_MESSAGES; }
+
+# IFS
+# We need space, tab and new line, in precisely that order.
+as_nl='
+'
+IFS=" 	$as_nl"
+
+# CDPATH.
+$as_unset CDPATH || test "${CDPATH+set}" != set || { CDPATH=:; export CDPATH; }
+
+exec 6>&1
+
+_ACEOF
+
+# Files that config.status was made for.
+if test -n "$ac_config_files"; then
+  echo "config_files=\"$ac_config_files\"" >>$CONFIG_STATUS
+fi
+
+if test -n "$ac_config_headers"; then
+  echo "config_headers=\"$ac_config_headers\"" >>$CONFIG_STATUS
+fi
+
+if test -n "$ac_config_links"; then
+  echo "config_links=\"$ac_config_links\"" >>$CONFIG_STATUS
+fi
+
+if test -n "$ac_config_commands"; then
+  echo "config_commands=\"$ac_config_commands\"" >>$CONFIG_STATUS
+fi
+
+cat >>$CONFIG_STATUS <<\EOF
+
+ac_cs_usage="\
+\`$as_me' instantiates files from templates according to the
+current configuration.
+
+Usage: $0 [OPTIONS] [FILE]...
+
+  -h, --help       print this help, then exit
+  -V, --version    print version number, then exit
+  -d, --debug      don't remove temporary files
+      --recheck    update $as_me by reconfiguring in the same conditions
+  --file=FILE[:TEMPLATE]
+                   instantiate the configuration file FILE
+
+Configuration files:
+$config_files
+
+Report bugs to <bug-autoconf@gnu.org>."
+EOF
+
+cat >>$CONFIG_STATUS <<EOF
+ac_cs_version="\\
+config.status
+configured by $0, generated by GNU Autoconf 2.50,
+  with options \\"`echo "$ac_configure_args" | sed 's/[\\""\`\$]/\\\\&/g'`\\"
+
+Copyright 1992, 1993, 1994, 1995, 1996, 1998, 1999, 2000, 2001
+Free Software Foundation, Inc.
+This config.status script is free software; the Free Software Foundation
+gives unlimited permission to copy, distribute and modify it."
+srcdir=$srcdir
+INSTALL="$INSTALL"
+EOF
+
+cat >>$CONFIG_STATUS <<\EOF
+# If no file are specified by the user, then we need to provide default
+# value.  By we need to know if files were specified by the user.
+ac_need_defaults=:
+while test $# != 0
+do
+  case $1 in
+  --*=*)
+    ac_option=`expr "x$1" : 'x\([^=]*\)='`
+    ac_optarg=`expr "x$1" : 'x[^=]*=\(.*\)'`
+    shift
+    set dummy "$ac_option" "$ac_optarg" ${1+"$@"}
+    shift
+    ;;
+  -*);;
+  *) # This is not an option, so the user has probably given explicit
+     # arguments.
+     ac_need_defaults=false;;
+  esac
+
+  case $1 in
+  # Handling of the options.
+EOF
+cat >>$CONFIG_STATUS <<EOF
+  -recheck | --recheck | --rechec | --reche | --rech | --rec | --re | --r)
+    echo "running $SHELL $0 " $ac_configure_args " --no-create --no-recursion"
+    exec $SHELL $0 $ac_configure_args --no-create --no-recursion ;;
+EOF
+cat >>$CONFIG_STATUS <<\EOF
+  --version | --vers* | -V )
+    echo "$ac_cs_version"; exit 0 ;;
+  --he | --h)
+    # Conflict between --help and --header
+    { { echo "$as_me:7732: error: ambiguous option: $1
+Try \`$0 --help' for more information." >&5
+echo "$as_me: error: ambiguous option: $1
+Try \`$0 --help' for more information." >&2;}
+   { (exit 1); exit 1; }; };;
+  --help | --hel | -h )
+    echo "$ac_cs_usage"; exit 0 ;;
+  --debug | --d* | -d )
+    debug=: ;;
+  --file | --fil | --fi | --f )
+    shift
+    CONFIG_FILES="$CONFIG_FILES $1"
+    ac_need_defaults=false;;
+  --header | --heade | --head | --hea )
+    shift
+    CONFIG_HEADERS="$CONFIG_HEADERS $1"
+    ac_need_defaults=false;;
+
+  # Handling of arguments.
+  'Makefile' ) CONFIG_FILES="$CONFIG_FILES Makefile" ;;
+
+  # This is an error.
+  -*) { { echo "$as_me:7754: error: unrecognized option: $1
+Try \`$0 --help' for more information." >&5
+echo "$as_me: error: unrecognized option: $1
+Try \`$0 --help' for more information." >&2;}
+   { (exit 1); exit 1; }; } ;;
+  *) { { echo "$as_me:7759: error: invalid argument: $1" >&5
+echo "$as_me: error: invalid argument: $1" >&2;}
+   { (exit 1); exit 1; }; };;
+  esac
+  shift
+done
+
+exec 5>>config.log
+cat >&5 << _ACEOF
+
+## ----------------------- ##
+## Running config.status.  ##
+## ----------------------- ##
+
+This file was extended by $as_me 2.50, executed with
+  > $ac_cs_invocation
+on `(hostname || uname -n) 2>/dev/null | sed 1q`
+
+_ACEOF
+EOF
+
+cat >>$CONFIG_STATUS <<\EOF
+# If the user did not use the arguments to specify the items to instantiate,
+# then the envvar interface is used.  Set only those that are not.
+# We use the long form for the default assignment because of an extremely
+# bizarre bug on SunOS 4.1.3.
+if $ac_need_defaults; then
+  test "${CONFIG_FILES+set}" = set || CONFIG_FILES=$config_files
+fi
+
+# Create a temporary directory, and hook for its removal unless debugging.
+$debug ||
+{
+  trap 'exit_status=$?; rm -rf $tmp && exit $exit_status' 0
+  trap '{ (exit $?); exit $?; }' 1 2 13 15
+}
+
+# Create a (secure) tmp directory for tmp files.
+: ${TMPDIR=/tmp}
+{
+  tmp=`(umask 077 && mktemp -d -q "$TMPDIR/csXXXXXX") 2>/dev/null` &&
+  test -n "$tmp" && test -d "$tmp"
+}  ||
+{
+  tmp=$TMPDIR/cs$$-$RANDOM
+  (umask 077 && mkdir $tmp)
+} ||
+{
+   echo "$me: cannot create a temporary directory in $TMPDIR" >&2
+   { (exit 1); exit 1; }
+}
+
+EOF
+
+cat >>$CONFIG_STATUS <<EOF
+
+#
+# CONFIG_FILES section.
+#
+
+# No need to generate the scripts if there are no CONFIG_FILES.
+# This happens for instance when ./config.status config.h
+if test -n "\$CONFIG_FILES"; then
+  # Protect against being on the right side of a sed subst in config.status.
+  sed 's/,@/@@/; s/@,/@@/; s/,;t t\$/@;t t/; /@;t t\$/s/[\\\\&,]/\\\\&/g;
+   s/@@/,@/; s/@@/@,/; s/@;t t\$/,;t t/' >\$tmp/subs.sed <<\\CEOF
+s,@SHELL@,$SHELL,;t t
+s,@exec_prefix@,$exec_prefix,;t t
+s,@prefix@,$prefix,;t t
+s,@program_transform_name@,$program_transform_name,;t t
+s,@bindir@,$bindir,;t t
+s,@sbindir@,$sbindir,;t t
+s,@libexecdir@,$libexecdir,;t t
+s,@datadir@,$datadir,;t t
+s,@sysconfdir@,$sysconfdir,;t t
+s,@sharedstatedir@,$sharedstatedir,;t t
+s,@localstatedir@,$localstatedir,;t t
+s,@libdir@,$libdir,;t t
+s,@includedir@,$includedir,;t t
+s,@oldincludedir@,$oldincludedir,;t t
+s,@infodir@,$infodir,;t t
+s,@mandir@,$mandir,;t t
+s,@PACKAGE_NAME@,$PACKAGE_NAME,;t t
+s,@PACKAGE_TARNAME@,$PACKAGE_TARNAME,;t t
+s,@PACKAGE_VERSION@,$PACKAGE_VERSION,;t t
+s,@PACKAGE_STRING@,$PACKAGE_STRING,;t t
+s,@PACKAGE_BUGREPORT@,$PACKAGE_BUGREPORT,;t t
+s,@ECHO_C@,$ECHO_C,;t t
+s,@ECHO_N@,$ECHO_N,;t t
+s,@ECHO_T@,$ECHO_T,;t t
+s,@PATH_SEPARATOR@,$PATH_SEPARATOR,;t t
+s,@DEFS@,$DEFS,;t t
+s,@LIBS@,$LIBS,;t t
+s,@INSTALL_PROGRAM@,$INSTALL_PROGRAM,;t t
+s,@INSTALL_SCRIPT@,$INSTALL_SCRIPT,;t t
+s,@INSTALL_DATA@,$INSTALL_DATA,;t t
+s,@PACKAGE@,$PACKAGE,;t t
+s,@VERSION@,$VERSION,;t t
+s,@ACLOCAL@,$ACLOCAL,;t t
+s,@AUTOCONF@,$AUTOCONF,;t t
+s,@AUTOMAKE@,$AUTOMAKE,;t t
+s,@AUTOHEADER@,$AUTOHEADER,;t t
+s,@MAKEINFO@,$MAKEINFO,;t t
+s,@SET_MAKE@,$SET_MAKE,;t t
+s,@CC@,$CC,;t t
+s,@CFLAGS@,$CFLAGS,;t t
+s,@LDFLAGS@,$LDFLAGS,;t t
+s,@CPPFLAGS@,$CPPFLAGS,;t t
+s,@ac_ct_CC@,$ac_ct_CC,;t t
+s,@EXEEXT@,$EXEEXT,;t t
+s,@OBJEXT@,$OBJEXT,;t t
+s,@build@,$build,;t t
+s,@build_cpu@,$build_cpu,;t t
+s,@build_vendor@,$build_vendor,;t t
+s,@build_os@,$build_os,;t t
+s,@host@,$host,;t t
+s,@host_cpu@,$host_cpu,;t t
+s,@host_vendor@,$host_vendor,;t t
+s,@host_os@,$host_os,;t t
+s,@LN_S@,$LN_S,;t t
+s,@ECHO@,$ECHO,;t t
+s,@RANLIB@,$RANLIB,;t t
+s,@ac_ct_RANLIB@,$ac_ct_RANLIB,;t t
+s,@STRIP@,$STRIP,;t t
+s,@ac_ct_STRIP@,$ac_ct_STRIP,;t t
+s,@CPP@,$CPP,;t t
+s,@LIBTOOL@,$LIBTOOL,;t t
+CEOF
+
+EOF
+
+  cat >>$CONFIG_STATUS <<\EOF
+  # Split the substitutions into bite-sized pieces for seds with
+  # small command number limits, like on Digital OSF/1 and HP-UX.
+  ac_max_sed_lines=48
+  ac_sed_frag=1 # Number of current file.
+  ac_beg=1 # First line for current file.
+  ac_end=$ac_max_sed_lines # Line after last line for current file.
+  ac_more_lines=:
+  ac_sed_cmds=
+  while $ac_more_lines; do
+    if test $ac_beg -gt 1; then
+      sed "1,${ac_beg}d; ${ac_end}q" $tmp/subs.sed >$tmp/subs.frag
+    else
+      sed "${ac_end}q" $tmp/subs.sed >$tmp/subs.frag
+    fi
+    if test ! -s $tmp/subs.frag; then
+      ac_more_lines=false
+    else
+      # The purpose of the label and of the branching condition is to
+      # speed up the sed processing (if there are no `@' at all, there
+      # is no need to browse any of the substitutions).
+      # These are the two extra sed commands mentioned above.
+      (echo ':t
+  /@[a-zA-Z_][a-zA-Z_0-9]*@/!b' && cat $tmp/subs.frag) >$tmp/subs-$ac_sed_frag.sed
+      if test -z "$ac_sed_cmds"; then
+  	ac_sed_cmds="sed -f $tmp/subs-$ac_sed_frag.sed"
+      else
+  	ac_sed_cmds="$ac_sed_cmds | sed -f $tmp/subs-$ac_sed_frag.sed"
+      fi
+      ac_sed_frag=`expr $ac_sed_frag + 1`
+      ac_beg=$ac_end
+      ac_end=`expr $ac_end + $ac_max_sed_lines`
+    fi
+  done
+  if test -z "$ac_sed_cmds"; then
+    ac_sed_cmds=cat
+  fi
+fi # test -n "$CONFIG_FILES"
+
+EOF
+cat >>$CONFIG_STATUS <<\EOF
+for ac_file in : $CONFIG_FILES; do test "x$ac_file" = x: && continue
+  # Support "outfile[:infile[:infile...]]", defaulting infile="outfile.in".
+  case $ac_file in
+  - | *:- | *:-:* ) # input from stdin
+        cat >$tmp/stdin
+        ac_file_in=`echo "$ac_file" | sed 's,[^:]*:,,'`
+        ac_file=`echo "$ac_file" | sed 's,:.*,,'` ;;
+  *:* ) ac_file_in=`echo "$ac_file" | sed 's,[^:]*:,,'`
+        ac_file=`echo "$ac_file" | sed 's,:.*,,'` ;;
+  * )   ac_file_in=$ac_file.in ;;
+  esac
+
+  # Compute @srcdir@, @top_srcdir@, and @INSTALL@ for subdirectories.
+  ac_dir=`$as_expr X"$ac_file" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
+         X"$ac_file" : 'X\(//\)[^/]' \| \
+         X"$ac_file" : 'X\(//\)$' \| \
+         X"$ac_file" : 'X\(/\)' \| \
+         .     : '\(.\)' 2>/dev/null ||
+echo X"$ac_file" |
+    sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{ s//\1/; q; }
+  	  /^X\(\/\/\)[^/].*/{ s//\1/; q; }
+  	  /^X\(\/\/\)$/{ s//\1/; q; }
+  	  /^X\(\/\).*/{ s//\1/; q; }
+  	  s/.*/./; q'`
+  if test "$ac_dir" != "$ac_file" && test "$ac_dir" != .; then
+    { case "$ac_dir" in
+  [\\/]* | ?:[\\/]* ) as_incr_dir=;;
+  *)                      as_incr_dir=.;;
+esac
+as_dummy="$ac_dir"
+for as_mkdir_dir in `IFS='/\\'; set X $as_dummy; shift; echo "$@"`; do
+  case $as_mkdir_dir in
+    # Skip DOS drivespec
+    ?:) as_incr_dir=$as_mkdir_dir ;;
+    *)
+      as_incr_dir=$as_incr_dir/$as_mkdir_dir
+      test -d "$as_incr_dir" || mkdir "$as_incr_dir"
+    ;;
+  esac
+done; }
+
+    ac_dir_suffix="/`echo $ac_dir|sed 's,^\./,,'`"
+    # A "../" for each directory in $ac_dir_suffix.
+    ac_dots=`echo "$ac_dir_suffix" | sed 's,/[^/]*,../,g'`
+  else
+    ac_dir_suffix= ac_dots=
+  fi
+
+  case $srcdir in
+  .)  ac_srcdir=.
+      if test -z "$ac_dots"; then
+         ac_top_srcdir=.
+      else
+         ac_top_srcdir=`echo $ac_dots | sed 's,/$,,'`
+      fi ;;
+  [\\/]* | ?:[\\/]* )
+      ac_srcdir=$srcdir$ac_dir_suffix;
+      ac_top_srcdir=$srcdir ;;
+  *) # Relative path.
+    ac_srcdir=$ac_dots$srcdir$ac_dir_suffix
+    ac_top_srcdir=$ac_dots$srcdir ;;
+  esac
+
+  case $INSTALL in
+  [\\/$]* | ?:[\\/]* ) ac_INSTALL=$INSTALL ;;
+  *) ac_INSTALL=$ac_dots$INSTALL ;;
+  esac
+
+  if test x"$ac_file" != x-; then
+    { echo "$as_me:8000: creating $ac_file" >&5
+echo "$as_me: creating $ac_file" >&6;}
+    rm -f "$ac_file"
+  fi
+  # Let's still pretend it is `configure' which instantiates (i.e., don't
+  # use $as_me), people would be surprised to read:
+  #    /* config.h.  Generated automatically by config.status.  */
+  configure_input="Generated automatically from `echo $ac_file_in |
+                                                 sed 's,.*/,,'` by configure."
+
+  # First look for the input files in the build tree, otherwise in the
+  # src tree.
+  ac_file_inputs=`IFS=:
+    for f in $ac_file_in; do
+      case $f in
+      -) echo $tmp/stdin ;;
+      [\\/$]*)
+         # Absolute (can't be DOS-style, as IFS=:)
+         test -f "$f" || { { echo "$as_me:8018: error: cannot find input file: $f" >&5
+echo "$as_me: error: cannot find input file: $f" >&2;}
+   { (exit 1); exit 1; }; }
+         echo $f;;
+      *) # Relative
+         if test -f "$f"; then
+           # Build tree
+           echo $f
+         elif test -f "$srcdir/$f"; then
+           # Source tree
+           echo $srcdir/$f
+         else
+           # /dev/null tree
+           { { echo "$as_me:8031: error: cannot find input file: $f" >&5
+echo "$as_me: error: cannot find input file: $f" >&2;}
+   { (exit 1); exit 1; }; }
+         fi;;
+      esac
+    done` || { (exit 1); exit 1; }
+EOF
+cat >>$CONFIG_STATUS <<EOF
+  sed "$ac_vpsub
+$extrasub
+EOF
+cat >>$CONFIG_STATUS <<\EOF
+:t
+/@[a-zA-Z_][a-zA-Z_0-9]*@/!b
+s,@configure_input@,$configure_input,;t t
+s,@srcdir@,$ac_srcdir,;t t
+s,@top_srcdir@,$ac_top_srcdir,;t t
+s,@INSTALL@,$ac_INSTALL,;t t
+" $ac_file_inputs | (eval "$ac_sed_cmds") >$tmp/out
+  rm -f $tmp/stdin
+  if test x"$ac_file" != x-; then
+    mv $tmp/out $ac_file
+  else
+    cat $tmp/out
+    rm -f $tmp/out
+  fi
+
+done
+EOF
+
+cat >>$CONFIG_STATUS <<\EOF
+
+{ (exit 0); exit 0; }
+EOF
+chmod +x $CONFIG_STATUS
+ac_clean_files=$ac_clean_files_save
+
+# configure is writing to config.log, and then calls config.status.
+# config.status does its own redirection, appending to config.log.
+# Unfortunately, on DOS this fails, as config.log is still kept open
+# by configure, so config.status won't be able to write to it; its
+# output is simply discarded.  So we exec the FD to /dev/null,
+# effectively closing config.log, so it can be properly (re)opened and
+# appended to by config.status.  When coming back to configure, we
+# need to make the FD available again.
+if test "$no_create" != yes; then
+  ac_cs_success=:
+  exec 5>/dev/null
+  $SHELL $CONFIG_STATUS || ac_cs_success=false
+  exec 5>>config.log
+  # Use ||, not &&, to avoid exiting from the if with $? = 1, which
+  # would make configure fail if this is the last instruction.
+  $ac_cs_success || { (exit 1); exit 1; }
+fi
+
diff -Naur gd-2.0.1/configure.ac gd-2.0.1.patched/configure.ac
--- gd-2.0.1/configure.ac	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/configure.ac	Tue Jul 30 05:28:14 2002
@@ -0,0 +1,62 @@
+dnl Process this file with autoconf to produce a configure script.
+AC_INIT(gd.c)
+AM_INIT_AUTOMAKE(gd, 1.8.4)
+
+dnl Checks for programs.
+AC_PROG_CC
+AC_ISC_POSIX
+AM_PROG_LIBTOOL
+AC_PROG_INSTALL
+AC_PATH_X
+
+dnl Set LDFLAGS and CPPFLAGS so that AC_CHECK_LIBS can find installed libs in --prefix dir
+LDFLAGS="$LDFLAGS -L$libdir -L$x_libraries"
+CPPFLAGS="$CPPFLAGS -I/usr/X11R6/include/freetype2 -I/usr/include/freetype2 -I$includedir -I$x_includes"
+
+dnl Sometimes math libs are in libc, so no warning if libm not found
+AC_CHECK_LIB(m,main)
+
+dnl The libraries libz and libpng are required.
+AC_CHECK_LIB(z,deflate,,AC_MSG_ERROR(libz not found.))
+AC_CHECK_LIB(png,png_check_sig,,AC_MSG_ERROR(libpng not found.))
+
+dnl User can select whether or not to support JPEG
+AC_ARG_ENABLE(jpeg,
+	[  --enable-jpeg           enable support for JPEG [default=no]],
+	[ 
+	  AC_CHECK_HEADERS(jpeglib.h,,AC_MSG_WARN(libgd will be built without support for JPEG.))
+	  AC_CHECK_LIB(jpeg,jpeg_start_compress,,AC_MSG_WARN(libgd will be built without support for JPEG.))
+	])
+
+dnl User can select whether or not to support FreeType
+AC_ARG_ENABLE(freetype,
+	[  --enable-freetype       enable support for FreeType [default=no]],
+	[ 
+	  AC_CHECK_HEADERS(freetype/freetype.h,,AC_MSG_WARN(libgd will be built without Freetype support.))
+	  AC_CHECK_LIB(freetype,FT_Init_FreeType,,AC_MSG_WARN(libgd will be built without Freetype support.))
+	])
+
+dnl User can select whether or not to support Xpm
+AC_ARG_ENABLE(xpm,
+	[  --enable-xpm            enable support for XPM [default=no]],
+	[ 
+	  AC_CHECK_HEADERS(X11/xpm.h,,AC_MSG_WARN(libgd will be built without support for XPM images.))
+	  AC_CHECK_LIB(Xpm,XpmCreateImageFromData,
+	      		   [
+			       LIBS="$LIBS -lX11 -lXpm"
+			       AC_DEFINE(HAVE_LIBXPM)
+			    ],
+	                    AC_MSG_WARN(libgd will be built without support for XPM images.),
+                            -lX11)
+	])
+
+dnl Check for required header files
+AC_HEADER_STDC
+AC_CHECK_HEADERS(malloc.h unistd.h)
+AC_CHECK_HEADERS(zlib.h,,AC_MSG_ERROR(zlib.h not found.))
+AC_CHECK_HEADERS(png.h,,AC_MSG_ERROR(png.h not found.))
+
+dnl Checks for typedefs, structures, and compiler characteristics.
+AC_C_CONST
+
+AC_OUTPUT(Makefile)
diff -Naur gd-2.0.1/gd.c gd-2.0.1.patched/gd.c
--- gd-2.0.1/gd.c	Tue Apr  3 16:44:41 2001
+++ gd-2.0.1.patched/gd.c	Tue Jul 30 05:24:30 2002
@@ -309,7 +309,7 @@
   v = 1 - b;
   if (h == HWB_UNDEFINED)
     RETURN_RGB (v, v, v);
-  i = floor (h);
+  i = (int) h;
   f = h - i;
   if (i & 1)
     f = 1 - f;			/* if i is odd */
@@ -748,6 +748,7 @@
     }
   else
     {
+      p = gdImageGetPixel (im->tile, srcx, srcy);
       /* Allow for transparency */
       if (p != gdImageGetTransparent (im->tile))
 	{
@@ -1125,13 +1126,6 @@
   *onP = on;
 }
 
-int
-gdImageBoundsSafe (gdImagePtr im, int x, int y)
-{
-  return (!(((y < 0) || (y >= im->sy)) ||
-	    ((x < 0) || (x >= im->sx))));
-}
-
 void
 gdImageChar (gdImagePtr im, gdFontPtr f, int x, int y,
 	     int c, int color)
@@ -1852,7 +1846,7 @@
     {
       int got;
       accum += (double) dstW / (double) srcW;
-      got = (int) floor (accum);
+      got = (int) accum;
       stx[i] = got;
       accum -= got;
     }
@@ -1861,7 +1855,7 @@
     {
       int got;
       accum += (double) dstH / (double) srcH;
-      got = (int) floor (accum);
+      got = (int) accum;
       sty[i] = got;
       accum -= got;
     }
@@ -1927,11 +1921,11 @@
 			  else
 			    {
 			      /* Find or create the best match */
-			      mapTo = gdImageColorResolveAlpha (dst,
-						      gdTrueColorGetRed (c),
-						    gdTrueColorGetGreen (c),
-						     gdTrueColorGetBlue (c),
-						   gdTrueColorGetAlpha (c));
+			      nc = gdImageColorResolveAlpha (dst,
+						      gdImageRed (src, c),
+						    gdImageGreen (src, c),
+						     gdImageBlue (src, c),
+						    gdImageAlpha (src, c));
 			    }
 			  colorMap[c] = nc;
 			}
@@ -1977,7 +1971,6 @@
     {
       for (x = dstX; (x < dstX + dstW); x++)
 	{
-	  int pd = gdImageGetPixel (dst, x, y);
 	  float sy1, sy2, sx1, sx2;
 	  float sx, sy;
 	  float spixels = 0;
@@ -1990,18 +1983,18 @@
 	  do
 	    {
 	      float yportion;
-	      if (floor (sy) == floor (sy1))
+	      if ((int) sy == (int) sy1)
 		{
-		  yportion = 1.0 - (sy - floor (sy));
+		  yportion = 1.0 - (sy - (int) sy);
 		  if (yportion > sy2 - sy1)
 		    {
 		      yportion = sy2 - sy1;
 		    }
-		  sy = floor (sy);
+		  sy = (int) sy;
 		}
-	      else if (sy == floor (sy2))
+	      else if (sy == (int) sy2)
 		{
-		  yportion = sy2 - floor (sy2);
+		  yportion = sy2 - (int) sy2;
 		}
 	      else
 		{
@@ -2017,33 +2010,44 @@
 		  float xportion;
 		  float pcontribution;
 		  int p;
-		  if (floor (sx) == floor (sx1))
+		  if ((int) sx == (int) sx1)
 		    {
-		      xportion = 1.0 - (sx - floor (sx));
+		      xportion = 1.0 - (sx - (int) sx);
 		      if (xportion > sx2 - sx1)
 			{
 			  xportion = sx2 - sx1;
 			}
-		      sx = floor (sx);
+		      sx = (int) sx;
 		    }
-		  else if (sx == floor (sx2))
+		  else if (sx == (int) sx2)
 		    {
-		      xportion = sx2 - floor (sx2);
+		      xportion = sx2 - (int) sx2;
 		    }
 		  else
 		    {
 		      xportion = 1.0;
 		    }
 		  pcontribution = xportion * yportion;
-		  p = gdImageGetTrueColorPixel (
-						 src,
-						 (int) sx,
-						 (int) sy);
-		  red += gdTrueColorGetRed (p) * pcontribution;
-		  green += gdTrueColorGetGreen (p) * pcontribution;
-		  blue += gdTrueColorGetBlue (p) * pcontribution;
-		  alpha += gdTrueColorGetAlpha (p) * pcontribution;
-		  spixels += xportion * yportion;
+		  if (gdImageBoundsSafe (src, (int) sx, (int) sy))
+		    {
+		      if (gdImageTrueColor(src))
+		        {
+			  p = gdImageTrueColorPixel(src, (int) sx, (int) sy);
+			  red   += gdTrueColorGetRed(p)   * pcontribution;
+			  green += gdTrueColorGetGreen(p) * pcontribution;
+			  blue  += gdTrueColorGetBlue(p)  * pcontribution;
+			  alpha += gdTrueColorGetAlpha(p) * pcontribution;
+		        }
+		      else
+			{
+			  p = gdImagePalettePixel(src, (int) sx, (int) sy);
+			  red   += src->red[p]   * pcontribution;
+			  green += src->green[p] * pcontribution;
+			  blue  += src->blue[p]  * pcontribution;
+			  alpha += src->alpha[p] * pcontribution;
+			}
+		      spixels += xportion * yportion;
+		    }
 		  sx += 1.0;
 		}
 	      while (sx < sx2);
@@ -2074,12 +2078,15 @@
 	    {
 	      alpha = gdAlphaMax;
 	    }
-	  gdImageSetPixel (dst,
-			   x, y,
-			   gdTrueColorAlpha ((int) red,
+	  if (gdImageBoundsSafe (dst, x, y))
+	    {
+	      gdImageTrueColorPixel (dst,
+			   x, y) =
+			   (gdTrueColorAlpha ((int) red,
 					     (int) green,
 					     (int) blue,
 					     (int) alpha));
+	    }
 	}
     }
 }
diff -Naur gd-2.0.1/gd.h gd-2.0.1.patched/gd.h
--- gd-2.0.1/gd.h	Tue Apr  3 16:44:41 2001
+++ gd-2.0.1.patched/gd.h	Tue Jul 30 11:34:45 2002
@@ -24,6 +24,18 @@
 #include <stdio.h>
 #include "gd_io.h"
 
+#if defined(HAVE_LIBJPEG) && defined(HAVE_JPEGLIB_H)
+#define HAVE_JPEG
+#endif 
+
+#if defined(HAVE_LIBFREETYPE) && defined(HAVE_FREETYPE_FREETYPE_H)
+#define HAVE_FREETYPE
+#endif 
+
+#if defined(HAVE_LIBXPM) && defined(HAVE_X11_XPM_H)
+#define HAVE_XPM
+#endif 
+
 /* The maximum number of palette entries in palette-based images.
 	In the wonderful new world of gd 2.0, you can of course have
 	many more colors when using truecolor mode. */
@@ -235,7 +247,6 @@
 void gdImageRectangle(gdImagePtr im, int x1, int y1, int x2, int y2, int color);
 /* Solid bar. Upper left corner first, lower right corner second. */
 void gdImageFilledRectangle(gdImagePtr im, int x1, int y1, int x2, int y2, int color);
-int gdImageBoundsSafe(gdImagePtr im, int x, int y);
 void gdImageChar(gdImagePtr im, gdFontPtr f, int x, int y, int c, int color);
 void gdImageCharUp(gdImagePtr im, gdFontPtr f, int x, int y, int c, int color);
 void gdImageString(gdImagePtr im, gdFontPtr f, int x, int y, unsigned char *s, int color);
@@ -283,17 +294,17 @@
 /* A simpler way to obtain an opaque truecolor value for drawing on a
 	truecolor image. Not for use with palette images! */
 
-#define gdTrueColor(r, g, b) (((r) << 16) + \
-	((g) << 8) + \
+#define gdTrueColor(r, g, b) (((r) << 16) | \
+	((g) << 8) | \
 	(b))
 
 /* Returns a truecolor value with an alpha channel component.
 	gdAlphaMax (127, **NOT 255**) is transparent, 0 is completely
 	opaque. */
 
-#define gdTrueColorAlpha(r, g, b, a) (((a) << 24) + \
-	((r) << 16) + \
-	((g) << 8) + \
+#define gdTrueColorAlpha(r, g, b, a) (((a) << 24) | \
+	((r) << 16) | \
+	((g) << 8) | \
 	(b))
 
 void gdImageColorDeallocate(gdImagePtr im, int color);
@@ -456,6 +467,10 @@
 	of image is also your responsibility. */
 #define gdImagePalettePixel(im, x, y) (im)->pixels[(y)][(x)]
 #define gdImageTrueColorPixel(im, x, y) (im)->tpixels[(y)][(x)]
+#define gdImageBoundsSafe(im, x, y) \
+		(((y) >= 0) && ((y) < (im)->sy) && \
+		 ((x) >= 0) && ((x) < (im)->sx))
+
 
 /* I/O Support routines. */
 
diff -Naur gd-2.0.1/gdcache.c gd-2.0.1.patched/gdcache.c
--- gd-2.0.1/gdcache.c	Tue Apr  3 16:44:42 2001
+++ gd-2.0.1.patched/gdcache.c	Tue Jul 30 11:35:06 2002
@@ -4,7 +4,7 @@
 #ifdef HAVE_LIBTTF
 #define NEED_CACHE 1
 #else
-#ifdef HAVE_LIBFREETYPE
+#ifdef HAVE_FREETYPE
 #define NEED_CACHE 1
 #endif
 #endif
diff -Naur gd-2.0.1/gdft.c gd-2.0.1.patched/gdft.c
--- gd-2.0.1/gdft.c	Tue Apr  3 16:44:42 2001
+++ gd-2.0.1.patched/gdft.c	Tue Jul 30 11:35:20 2002
@@ -29,7 +29,7 @@
 		   angle, x, y, string);
 }
 
-#ifndef HAVE_LIBFREETYPE
+#ifndef HAVE_FREETYPE
 char *
 gdImageStringFT (gdImage * im, int *brect, int fg, char *fontlist,
 		 double ptsize, double angle, int x, int y, char *string)
@@ -933,4 +933,4 @@
     : (v1 > 0 ? ((v1 + 63) >> 6) : v1 >> 6);
 }
 
-#endif /* HAVE_LIBFREETYPE */
+#endif /* HAVE_FREETYPE */
diff -Naur gd-2.0.1/gdtestft.c gd-2.0.1.patched/gdtestft.c
--- gd-2.0.1/gdtestft.c	Tue Apr  3 16:44:42 2001
+++ gd-2.0.1.patched/gdtestft.c	Tue Jul 30 11:35:38 2002
@@ -21,8 +21,8 @@
 int
 main (int argc, char *argv[])
 {
-#ifndef HAVE_LIBFREETYPE
-  fprintf (stderr, "gd was not compiled with HAVE_LIBFREETYPE defined.\n");
+#ifndef HAVE_FREETYPE
+  fprintf (stderr, "gd was not compiled with HAVE_FREETYPE defined.\n");
   fprintf (stderr, "Install the FreeType library, including the\n");
   fprintf (stderr, "header files. Then edit the gd Makefile, type\n");
   fprintf (stderr, "make clean, and type make again.\n");
diff -Naur gd-2.0.1/gdxpm.c gd-2.0.1.patched/gdxpm.c
--- gd-2.0.1/gdxpm.c	Tue Apr  3 16:44:42 2001
+++ gd-2.0.1.patched/gdxpm.c	Tue Jul 30 05:58:34 2002
@@ -20,7 +20,7 @@
 
 #else
 
-#include "xpm.h"
+#include "X11/xpm.h"
 
 gdImagePtr
 gdImageCreateFromXpm (char *filename)
diff -Naur gd-2.0.1/install-item gd-2.0.1.patched/install-item
--- gd-2.0.1/install-item	Tue Apr  3 16:44:42 2001
+++ gd-2.0.1.patched/install-item	Wed Dec 31 19:00:00 1969
@@ -1,5 +0,0 @@
-#!/bin/sh
-
-cp $2 $3
-chmod $1 $3
-
diff -Naur gd-2.0.1/install-sh gd-2.0.1.patched/install-sh
--- gd-2.0.1/install-sh	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/install-sh	Tue Jul 30 05:29:46 2002
@@ -0,0 +1,250 @@
+#!/bin/sh
+#
+# install - install a program, script, or datafile
+# This comes from X11R5 (mit/util/scripts/install.sh).
+#
+# Copyright 1991 by the Massachusetts Institute of Technology
+#
+# Permission to use, copy, modify, distribute, and sell this software and its
+# documentation for any purpose is hereby granted without fee, provided that
+# the above copyright notice appear in all copies and that both that
+# copyright notice and this permission notice appear in supporting
+# documentation, and that the name of M.I.T. not be used in advertising or
+# publicity pertaining to distribution of the software without specific,
+# written prior permission.  M.I.T. makes no representations about the
+# suitability of this software for any purpose.  It is provided "as is"
+# without express or implied warranty.
+#
+# Calling this script install-sh is preferred over install.sh, to prevent
+# `make' implicit rules from creating a file called install from it
+# when there is no Makefile.
+#
+# This script is compatible with the BSD install script, but was written
+# from scratch.  It can only install one file at a time, a restriction
+# shared with many OS's install programs.
+
+
+# set DOITPROG to echo to test this script
+
+# Don't use :- since 4.3BSD and earlier shells don't like it.
+doit="${DOITPROG-}"
+
+
+# put in absolute paths if you don't have them in your path; or use env. vars.
+
+mvprog="${MVPROG-mv}"
+cpprog="${CPPROG-cp}"
+chmodprog="${CHMODPROG-chmod}"
+chownprog="${CHOWNPROG-chown}"
+chgrpprog="${CHGRPPROG-chgrp}"
+stripprog="${STRIPPROG-strip}"
+rmprog="${RMPROG-rm}"
+mkdirprog="${MKDIRPROG-mkdir}"
+
+transformbasename=""
+transform_arg=""
+instcmd="$mvprog"
+chmodcmd="$chmodprog 0755"
+chowncmd=""
+chgrpcmd=""
+stripcmd=""
+rmcmd="$rmprog -f"
+mvcmd="$mvprog"
+src=""
+dst=""
+dir_arg=""
+
+while [ x"$1" != x ]; do
+    case $1 in
+	-c) instcmd="$cpprog"
+	    shift
+	    continue;;
+
+	-d) dir_arg=true
+	    shift
+	    continue;;
+
+	-m) chmodcmd="$chmodprog $2"
+	    shift
+	    shift
+	    continue;;
+
+	-o) chowncmd="$chownprog $2"
+	    shift
+	    shift
+	    continue;;
+
+	-g) chgrpcmd="$chgrpprog $2"
+	    shift
+	    shift
+	    continue;;
+
+	-s) stripcmd="$stripprog"
+	    shift
+	    continue;;
+
+	-t=*) transformarg=`echo $1 | sed 's/-t=//'`
+	    shift
+	    continue;;
+
+	-b=*) transformbasename=`echo $1 | sed 's/-b=//'`
+	    shift
+	    continue;;
+
+	*)  if [ x"$src" = x ]
+	    then
+		src=$1
+	    else
+		# this colon is to work around a 386BSD /bin/sh bug
+		:
+		dst=$1
+	    fi
+	    shift
+	    continue;;
+    esac
+done
+
+if [ x"$src" = x ]
+then
+	echo "install:	no input file specified"
+	exit 1
+else
+	true
+fi
+
+if [ x"$dir_arg" != x ]; then
+	dst=$src
+	src=""
+	
+	if [ -d $dst ]; then
+		instcmd=:
+	else
+		instcmd=mkdir
+	fi
+else
+
+# Waiting for this to be detected by the "$instcmd $src $dsttmp" command
+# might cause directories to be created, which would be especially bad 
+# if $src (and thus $dsttmp) contains '*'.
+
+	if [ -f $src -o -d $src ]
+	then
+		true
+	else
+		echo "install:  $src does not exist"
+		exit 1
+	fi
+	
+	if [ x"$dst" = x ]
+	then
+		echo "install:	no destination specified"
+		exit 1
+	else
+		true
+	fi
+
+# If destination is a directory, append the input filename; if your system
+# does not like double slashes in filenames, you may need to add some logic
+
+	if [ -d $dst ]
+	then
+		dst="$dst"/`basename $src`
+	else
+		true
+	fi
+fi
+
+## this sed command emulates the dirname command
+dstdir=`echo $dst | sed -e 's,[^/]*$,,;s,/$,,;s,^$,.,'`
+
+# Make sure that the destination directory exists.
+#  this part is taken from Noah Friedman's mkinstalldirs script
+
+# Skip lots of stat calls in the usual case.
+if [ ! -d "$dstdir" ]; then
+defaultIFS='	
+'
+IFS="${IFS-${defaultIFS}}"
+
+oIFS="${IFS}"
+# Some sh's can't handle IFS=/ for some reason.
+IFS='%'
+set - `echo ${dstdir} | sed -e 's@/@%@g' -e 's@^%@/@'`
+IFS="${oIFS}"
+
+pathcomp=''
+
+while [ $# -ne 0 ] ; do
+	pathcomp="${pathcomp}${1}"
+	shift
+
+	if [ ! -d "${pathcomp}" ] ;
+        then
+		$mkdirprog "${pathcomp}"
+	else
+		true
+	fi
+
+	pathcomp="${pathcomp}/"
+done
+fi
+
+if [ x"$dir_arg" != x ]
+then
+	$doit $instcmd $dst &&
+
+	if [ x"$chowncmd" != x ]; then $doit $chowncmd $dst; else true ; fi &&
+	if [ x"$chgrpcmd" != x ]; then $doit $chgrpcmd $dst; else true ; fi &&
+	if [ x"$stripcmd" != x ]; then $doit $stripcmd $dst; else true ; fi &&
+	if [ x"$chmodcmd" != x ]; then $doit $chmodcmd $dst; else true ; fi
+else
+
+# If we're going to rename the final executable, determine the name now.
+
+	if [ x"$transformarg" = x ] 
+	then
+		dstfile=`basename $dst`
+	else
+		dstfile=`basename $dst $transformbasename | 
+			sed $transformarg`$transformbasename
+	fi
+
+# don't allow the sed command to completely eliminate the filename
+
+	if [ x"$dstfile" = x ] 
+	then
+		dstfile=`basename $dst`
+	else
+		true
+	fi
+
+# Make a temp file name in the proper directory.
+
+	dsttmp=$dstdir/#inst.$$#
+
+# Move or copy the file name to the temp name
+
+	$doit $instcmd $src $dsttmp &&
+
+	trap "rm -f ${dsttmp}" 0 &&
+
+# and set any options; do chmod last to preserve setuid bits
+
+# If any of these fail, we abort the whole thing.  If we want to
+# ignore errors from any of these, just make sure not to ignore
+# errors from the above "$doit $instcmd $src $dsttmp" command.
+
+	if [ x"$chowncmd" != x ]; then $doit $chowncmd $dsttmp; else true;fi &&
+	if [ x"$chgrpcmd" != x ]; then $doit $chgrpcmd $dsttmp; else true;fi &&
+	if [ x"$stripcmd" != x ]; then $doit $stripcmd $dsttmp; else true;fi &&
+	if [ x"$chmodcmd" != x ]; then $doit $chmodcmd $dsttmp; else true;fi &&
+
+# Now rename the file to the real destination.
+
+	$doit $rmcmd -f $dstdir/$dstfile &&
+	$doit $mvcmd $dsttmp $dstdir/$dstfile 
+
+fi &&
+
+
+exit 0
diff -Naur gd-2.0.1/libtool gd-2.0.1.patched/libtool
--- gd-2.0.1/libtool	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/libtool	Tue Jul 30 11:36:01 2002
@@ -0,0 +1,5229 @@
+#! /bin/sh
+
+# libtool - Provide generalized library-building support services.
+# Generated automatically by  (GNU gd 1.8.4)
+# NOTE: Changes made to this file will be lost: look at ltmain.sh.
+#
+# Copyright (C) 1996-2000 Free Software Foundation, Inc.
+# Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+# As a special exception to the GNU General Public License, if you
+# distribute this file as part of a program that contains a
+# configuration script generated by Autoconf, you may include it under
+# the same distribution terms that you use for the rest of that program.
+
+# Sed that helps us avoid accidentally triggering echo(1) options like -n.
+Xsed="sed -e s/^X//"
+
+# The HP-UX ksh and POSIX shell print the target directory to stdout
+# if CDPATH is set.
+if test "X${CDPATH+set}" = Xset; then CDPATH=:; export CDPATH; fi
+
+# ### BEGIN LIBTOOL CONFIG
+
+# Libtool was configured on host pesto:
+
+# Shell to use when invoking shell scripts.
+SHELL="/bin/sh"
+
+# Whether or not to build shared libraries.
+build_libtool_libs=yes
+
+# Whether or not to add -lc for building shared libraries.
+build_libtool_need_lc=no
+
+# Whether or not to build static libraries.
+build_old_libs=yes
+
+# Whether or not to optimize for fast installation.
+fast_install=yes
+
+# The host system.
+host_alias=
+host=i686-pc-linux-gnu
+
+# An echo program that does not interpret backslashes.
+echo="echo"
+
+# The archiver.
+AR="ar"
+AR_FLAGS="cru"
+
+# The default C compiler.
+CC="gcc"
+
+# Is the compiler the GNU C compiler?
+with_gcc=yes
+
+# The linker used to build libraries.
+LD="/usr/i386-slackware-linux/bin/ld"
+
+# Whether we need hard or soft links.
+LN_S="ln -s"
+
+# A BSD-compatible nm program.
+NM="/usr/bin/nm -B"
+
+# A symbol stripping program
+STRIP=strip
+
+# Used to examine libraries when file_magic_cmd begins "file"
+MAGIC_CMD=file
+
+# Used on cygwin: DLL creation program.
+DLLTOOL="dlltool"
+
+# Used on cygwin: object dumper.
+OBJDUMP="objdump"
+
+# Used on cygwin: assembler.
+AS="as"
+
+# The name of the directory that contains temporary libtool files.
+objdir=.libs
+
+# How to create reloadable object files.
+reload_flag=" -r"
+reload_cmds="\$LD\$reload_flag -o \$output\$reload_objs"
+
+# How to pass a linker flag through the compiler.
+wl="-Wl,"
+
+# Object file suffix (normally "o").
+objext="o"
+
+# Old archive suffix (normally "a").
+libext="a"
+
+# Executable file suffix (normally "").
+exeext=""
+
+# Additional compiler flags for building library objects.
+pic_flag=" -fPIC"
+pic_mode=default
+
+# Does compiler simultaneously support -c and -o options?
+compiler_c_o="yes"
+
+# Can we write directly to a .lo ?
+compiler_o_lo="no"
+
+# Must we lock files when doing compilation ?
+need_locks="no"
+
+# Do we need the lib prefix for modules?
+need_lib_prefix=no
+
+# Do we need a version for libraries?
+need_version=no
+
+# Whether dlopen is supported.
+dlopen_support=unknown
+
+# Whether dlopen of programs is supported.
+dlopen_self=unknown
+
+# Whether dlopen of statically linked programs is supported.
+dlopen_self_static=unknown
+
+# Compiler flag to prevent dynamic linking.
+link_static_flag="-static"
+
+# Compiler flag to turn off builtin functions.
+no_builtin_flag=" -fno-builtin -fno-rtti -fno-exceptions"
+
+# Compiler flag to allow reflexive dlopens.
+export_dynamic_flag_spec="\${wl}--export-dynamic"
+
+# Compiler flag to generate shared objects directly from archives.
+whole_archive_flag_spec="\${wl}--whole-archive\$convenience \${wl}--no-whole-archive"
+
+# Compiler flag to generate thread-safe objects.
+thread_safe_flag_spec=""
+
+# Library versioning type.
+version_type=linux
+
+# Format of library name prefix.
+libname_spec="lib\$name"
+
+# List of archive names.  First name is the real one, the rest are links.
+# The last name is the one that the linker finds with -lNAME.
+library_names_spec="\${libname}\${release}.so\$versuffix \${libname}\${release}.so\$major \$libname.so"
+
+# The coded name of the library, if different from the real name.
+soname_spec="\${libname}\${release}.so\$major"
+
+# Commands used to build and install an old-style archive.
+RANLIB="ranlib"
+old_archive_cmds="\$AR \$AR_FLAGS \$oldlib\$oldobjs\$old_deplibs~\$RANLIB \$oldlib"
+old_postinstall_cmds="\$RANLIB \$oldlib~chmod 644 \$oldlib"
+old_postuninstall_cmds=""
+
+# Create an old-style archive from a shared archive.
+old_archive_from_new_cmds=""
+
+# Create a temporary old-style archive to link instead of a shared archive.
+old_archive_from_expsyms_cmds=""
+
+# Commands used to build and install a shared archive.
+archive_cmds="\$CC -shared \$libobjs \$deplibs \$compiler_flags \${wl}-soname \$wl\$soname -o \$lib"
+archive_expsym_cmds="\$CC -shared \$libobjs \$deplibs \$compiler_flags \${wl}-soname \$wl\$soname \${wl}-retain-symbols-file \$wl\$export_symbols -o \$lib"
+postinstall_cmds=""
+postuninstall_cmds=""
+
+# Commands to strip libraries.
+old_striplib="strip --strip-debug"
+striplib="strip --strip-unneeded"
+
+# Method to check whether dependent libraries are shared objects.
+deplibs_check_method="pass_all"
+
+# Command to use when deplibs_check_method == file_magic.
+file_magic_cmd="\$MAGIC_CMD"
+
+# Flag that allows shared libraries with undefined symbols to be built.
+allow_undefined_flag=""
+
+# Flag that forces no undefined symbols.
+no_undefined_flag=""
+
+# Commands used to finish a libtool library installation in a directory.
+finish_cmds="PATH=\\\"\\\$PATH:/sbin\\\" ldconfig -n \$libdir"
+
+# Same as above, but a single script fragment to be evaled but not shown.
+finish_eval=""
+
+# Take the output of nm and produce a listing of raw symbols and C names.
+global_symbol_pipe="sed -n -e 's/^.*[ 	]\\([ABCDGISTW][ABCDGISTW]*\\)[ 	][ 	]*\\(\\)\\([_A-Za-z][_A-Za-z0-9]*\\)\$/\\1 \\2\\3 \\3/p'"
+
+# Transform the output of nm in a proper C declaration
+global_symbol_to_cdecl="sed -n -e 's/^. .* \\(.*\\)\$/extern char \\1;/p'"
+
+# This is the shared library runtime path variable.
+runpath_var=LD_RUN_PATH
+
+# This is the shared library path variable.
+shlibpath_var=LD_LIBRARY_PATH
+
+# Is shlibpath searched before the hard-coded library search path?
+shlibpath_overrides_runpath=no
+
+# How to hardcode a shared library path into an executable.
+hardcode_action=immediate
+
+# Whether we should hardcode library paths into libraries.
+hardcode_into_libs=yes
+
+# Flag to hardcode $libdir into a binary during linking.
+# This must work even if $libdir does not exist.
+hardcode_libdir_flag_spec="\${wl}--rpath \${wl}\$libdir"
+
+# Whether we need a single -rpath flag with a separated argument.
+hardcode_libdir_separator=""
+
+# Set to yes if using DIR/libNAME.so during linking hardcodes DIR into the
+# resulting binary.
+hardcode_direct=no
+
+# Set to yes if using the -LDIR flag during linking hardcodes DIR into the
+# resulting binary.
+hardcode_minus_L=no
+
+# Set to yes if using SHLIBPATH_VAR=DIR during linking hardcodes DIR into
+# the resulting binary.
+hardcode_shlibpath_var=unsupported
+
+# Variables whose values should be saved in libtool wrapper scripts and
+# restored at relink time.
+variables_saved_for_relink="PATH LD_LIBRARY_PATH LD_RUN_PATH GCC_EXEC_PREFIX COMPILER_PATH LIBRARY_PATH"
+
+# Whether libtool must link a program against all its dependency libraries.
+link_all_deplibs=unknown
+
+# Compile-time system search path for libraries
+sys_lib_search_path_spec="/lib /usr/lib /usr/local/lib"
+
+# Run-time system search path for libraries
+sys_lib_dlsearch_path_spec="/lib /usr/lib"
+
+# Fix the shell variable $srcfile for the compiler.
+fix_srcfile_path=""
+
+# Set to yes if exported symbols are required.
+always_export_symbols=no
+
+# The commands to list exported symbols.
+export_symbols_cmds="\$NM \$libobjs \$convenience | \$global_symbol_pipe | sed 's/.* //' | sort | uniq > \$export_symbols"
+
+# The commands to extract the exported symbol list from a shared archive.
+extract_expsyms_cmds=""
+
+# Symbols that should not be listed in the preloaded symbols.
+exclude_expsyms="_GLOBAL_OFFSET_TABLE_"
+
+# Symbols that must always be exported.
+include_expsyms=""
+
+# ### END LIBTOOL CONFIG
+
+# ltmain.sh - Provide generalized library-building support services.
+# NOTE: Changing this file will not affect anything until you rerun configure.
+#
+# Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001
+# Free Software Foundation, Inc.
+# Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+# As a special exception to the GNU General Public License, if you
+# distribute this file as part of a program that contains a
+# configuration script generated by Autoconf, you may include it under
+# the same distribution terms that you use for the rest of that program.
+
+# Check that we have a working $echo.
+if test "X$1" = X--no-reexec; then
+  # Discard the --no-reexec flag, and continue.
+  shift
+elif test "X$1" = X--fallback-echo; then
+  # Avoid inline document here, it may be left over
+  :
+elif test "X`($echo '\t') 2>/dev/null`" = 'X\t'; then
+  # Yippee, $echo works!
+  :
+else
+  # Restart under the correct shell, and then maybe $echo will work.
+  exec $SHELL "$0" --no-reexec ${1+"$@"}
+fi
+
+if test "X$1" = X--fallback-echo; then
+  # used as fallback echo
+  shift
+  cat <<EOF
+$*
+EOF
+  exit 0
+fi
+
+# The name of this program.
+progname=`$echo "$0" | sed 's%^.*/%%'`
+modename="$progname"
+
+# Constants.
+PROGRAM=ltmain.sh
+PACKAGE=libtool
+VERSION=1.4
+TIMESTAMP=" (1.920 2001/04/24 23:26:18)"
+
+default_mode=
+help="Try \`$progname --help' for more information."
+magic="%%%MAGIC variable%%%"
+mkdir="mkdir"
+mv="mv -f"
+rm="rm -f"
+
+# Sed substitution that helps us do robust quoting.  It backslashifies
+# metacharacters that are still active within double-quoted strings.
+Xsed='sed -e 1s/^X//'
+sed_quote_subst='s/\([\\`\\"$\\\\]\)/\\\1/g'
+SP2NL='tr \040 \012'
+NL2SP='tr \015\012 \040\040'
+
+# NLS nuisances.
+# Only set LANG and LC_ALL to C if already set.
+# These must not be set unconditionally because not all systems understand
+# e.g. LANG=C (notably SCO).
+# We save the old values to restore during execute mode.
+if test "${LC_ALL+set}" = set; then
+  save_LC_ALL="$LC_ALL"; LC_ALL=C; export LC_ALL
+fi
+if test "${LANG+set}" = set; then
+  save_LANG="$LANG"; LANG=C; export LANG
+fi
+
+if test "$build_libtool_libs" != yes && test "$build_old_libs" != yes; then
+  echo "$modename: not configured to build any kind of library" 1>&2
+  echo "Fatal configuration error.  See the $PACKAGE docs for more information." 1>&2
+  exit 1
+fi
+
+# Global variables.
+mode=$default_mode
+nonopt=
+prev=
+prevopt=
+run=
+show="$echo"
+show_help=
+execute_dlfiles=
+lo2o="s/\\.lo\$/.${objext}/"
+o2lo="s/\\.${objext}\$/.lo/"
+
+# Parse our command line options once, thoroughly.
+while test $# -gt 0
+do
+  arg="$1"
+  shift
+
+  case $arg in
+  -*=*) optarg=`$echo "X$arg" | $Xsed -e 's/[-_a-zA-Z0-9]*=//'` ;;
+  *) optarg= ;;
+  esac
+
+  # If the previous option needs an argument, assign it.
+  if test -n "$prev"; then
+    case $prev in
+    execute_dlfiles)
+      execute_dlfiles="$execute_dlfiles $arg"
+      ;;
+    *)
+      eval "$prev=\$arg"
+      ;;
+    esac
+
+    prev=
+    prevopt=
+    continue
+  fi
+
+  # Have we seen a non-optional argument yet?
+  case $arg in
+  --help)
+    show_help=yes
+    ;;
+
+  --version)
+    echo "$PROGRAM (GNU $PACKAGE) $VERSION$TIMESTAMP"
+    exit 0
+    ;;
+
+  --config)
+    sed -e '1,/^# ### BEGIN LIBTOOL CONFIG/d' -e '/^# ### END LIBTOOL CONFIG/,$d' $0
+    exit 0
+    ;;
+
+  --debug)
+    echo "$progname: enabling shell trace mode"
+    set -x
+    ;;
+
+  --dry-run | -n)
+    run=:
+    ;;
+
+  --features)
+    echo "host: $host"
+    if test "$build_libtool_libs" = yes; then
+      echo "enable shared libraries"
+    else
+      echo "disable shared libraries"
+    fi
+    if test "$build_old_libs" = yes; then
+      echo "enable static libraries"
+    else
+      echo "disable static libraries"
+    fi
+    exit 0
+    ;;
+
+  --finish) mode="finish" ;;
+
+  --mode) prevopt="--mode" prev=mode ;;
+  --mode=*) mode="$optarg" ;;
+
+  --quiet | --silent)
+    show=:
+    ;;
+
+  -dlopen)
+    prevopt="-dlopen"
+    prev=execute_dlfiles
+    ;;
+
+  -*)
+    $echo "$modename: unrecognized option \`$arg'" 1>&2
+    $echo "$help" 1>&2
+    exit 1
+    ;;
+
+  *)
+    nonopt="$arg"
+    break
+    ;;
+  esac
+done
+
+if test -n "$prevopt"; then
+  $echo "$modename: option \`$prevopt' requires an argument" 1>&2
+  $echo "$help" 1>&2
+  exit 1
+fi
+
+if test -z "$show_help"; then
+
+  # Infer the operation mode.
+  if test -z "$mode"; then
+    case $nonopt in
+    *cc | *++ | gcc* | *-gcc*)
+      mode=link
+      for arg
+      do
+	case $arg in
+	-c)
+	   mode=compile
+	   break
+	   ;;
+	esac
+      done
+      ;;
+    *db | *dbx | *strace | *truss)
+      mode=execute
+      ;;
+    *install*|cp|mv)
+      mode=install
+      ;;
+    *rm)
+      mode=uninstall
+      ;;
+    *)
+      # If we have no mode, but dlfiles were specified, then do execute mode.
+      test -n "$execute_dlfiles" && mode=execute
+
+      # Just use the default operation mode.
+      if test -z "$mode"; then
+	if test -n "$nonopt"; then
+	  $echo "$modename: warning: cannot infer operation mode from \`$nonopt'" 1>&2
+	else
+	  $echo "$modename: warning: cannot infer operation mode without MODE-ARGS" 1>&2
+	fi
+      fi
+      ;;
+    esac
+  fi
+
+  # Only execute mode is allowed to have -dlopen flags.
+  if test -n "$execute_dlfiles" && test "$mode" != execute; then
+    $echo "$modename: unrecognized option \`-dlopen'" 1>&2
+    $echo "$help" 1>&2
+    exit 1
+  fi
+
+  # Change the help message to a mode-specific one.
+  generic_help="$help"
+  help="Try \`$modename --help --mode=$mode' for more information."
+
+  # These modes are in order of execution frequency so that they run quickly.
+  case $mode in
+  # libtool compile mode
+  compile)
+    modename="$modename: compile"
+    # Get the compilation command and the source file.
+    base_compile=
+    prev=
+    lastarg=
+    srcfile="$nonopt"
+    suppress_output=
+
+    user_target=no
+    for arg
+    do
+      case $prev in
+      "") ;;
+      xcompiler)
+	# Aesthetically quote the previous argument.
+	prev=
+	lastarg=`$echo "X$arg" | $Xsed -e "$sed_quote_subst"`
+
+	case $arg in
+	# Double-quote args containing other shell metacharacters.
+	# Many Bourne shells cannot handle close brackets correctly
+	# in scan sets, so we specify it separately.
+	*[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	  arg="\"$arg\""
+	  ;;
+	esac
+
+	# Add the previous argument to base_compile.
+	if test -z "$base_compile"; then
+	  base_compile="$lastarg"
+	else
+	  base_compile="$base_compile $lastarg"
+	fi
+	continue
+	;;
+      esac
+
+      # Accept any command-line options.
+      case $arg in
+      -o)
+	if test "$user_target" != "no"; then
+	  $echo "$modename: you cannot specify \`-o' more than once" 1>&2
+	  exit 1
+	fi
+	user_target=next
+	;;
+
+      -static)
+	build_old_libs=yes
+	continue
+	;;
+
+      -prefer-pic)
+	pic_mode=yes
+	continue
+	;;
+
+      -prefer-non-pic)
+	pic_mode=no
+	continue
+	;;
+
+      -Xcompiler)
+	prev=xcompiler
+	continue
+	;;
+
+      -Wc,*)
+	args=`$echo "X$arg" | $Xsed -e "s/^-Wc,//"`
+	lastarg=
+	IFS="${IFS= 	}"; save_ifs="$IFS"; IFS=','
+	for arg in $args; do
+	  IFS="$save_ifs"
+
+	  # Double-quote args containing other shell metacharacters.
+	  # Many Bourne shells cannot handle close brackets correctly
+	  # in scan sets, so we specify it separately.
+	  case $arg in
+	    *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	    arg="\"$arg\""
+	    ;;
+	  esac
+	  lastarg="$lastarg $arg"
+	done
+	IFS="$save_ifs"
+	lastarg=`$echo "X$lastarg" | $Xsed -e "s/^ //"`
+
+	# Add the arguments to base_compile.
+	if test -z "$base_compile"; then
+	  base_compile="$lastarg"
+	else
+	  base_compile="$base_compile $lastarg"
+	fi
+	continue
+	;;
+      esac
+
+      case $user_target in
+      next)
+	# The next one is the -o target name
+	user_target=yes
+	continue
+	;;
+      yes)
+	# We got the output file
+	user_target=set
+	libobj="$arg"
+	continue
+	;;
+      esac
+
+      # Accept the current argument as the source file.
+      lastarg="$srcfile"
+      srcfile="$arg"
+
+      # Aesthetically quote the previous argument.
+
+      # Backslashify any backslashes, double quotes, and dollar signs.
+      # These are the only characters that are still specially
+      # interpreted inside of double-quoted scrings.
+      lastarg=`$echo "X$lastarg" | $Xsed -e "$sed_quote_subst"`
+
+      # Double-quote args containing other shell metacharacters.
+      # Many Bourne shells cannot handle close brackets correctly
+      # in scan sets, so we specify it separately.
+      case $lastarg in
+      *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	lastarg="\"$lastarg\""
+	;;
+      esac
+
+      # Add the previous argument to base_compile.
+      if test -z "$base_compile"; then
+	base_compile="$lastarg"
+      else
+	base_compile="$base_compile $lastarg"
+      fi
+    done
+
+    case $user_target in
+    set)
+      ;;
+    no)
+      # Get the name of the library object.
+      libobj=`$echo "X$srcfile" | $Xsed -e 's%^.*/%%'`
+      ;;
+    *)
+      $echo "$modename: you must specify a target with \`-o'" 1>&2
+      exit 1
+      ;;
+    esac
+
+    # Recognize several different file suffixes.
+    # If the user specifies -o file.o, it is replaced with file.lo
+    xform='[cCFSfmso]'
+    case $libobj in
+    *.ada) xform=ada ;;
+    *.adb) xform=adb ;;
+    *.ads) xform=ads ;;
+    *.asm) xform=asm ;;
+    *.c++) xform=c++ ;;
+    *.cc) xform=cc ;;
+    *.cpp) xform=cpp ;;
+    *.cxx) xform=cxx ;;
+    *.f90) xform=f90 ;;
+    *.for) xform=for ;;
+    esac
+
+    libobj=`$echo "X$libobj" | $Xsed -e "s/\.$xform$/.lo/"`
+
+    case $libobj in
+    *.lo) obj=`$echo "X$libobj" | $Xsed -e "$lo2o"` ;;
+    *)
+      $echo "$modename: cannot determine name of library object from \`$libobj'" 1>&2
+      exit 1
+      ;;
+    esac
+
+    if test -z "$base_compile"; then
+      $echo "$modename: you must specify a compilation command" 1>&2
+      $echo "$help" 1>&2
+      exit 1
+    fi
+
+    # Delete any leftover library objects.
+    if test "$build_old_libs" = yes; then
+      removelist="$obj $libobj"
+    else
+      removelist="$libobj"
+    fi
+
+    $run $rm $removelist
+    trap "$run $rm $removelist; exit 1" 1 2 15
+
+    # On Cygwin there's no "real" PIC flag so we must build both object types
+    case $host_os in
+    cygwin* | mingw* | pw32* | os2*)
+      pic_mode=default
+      ;;
+    esac
+    if test $pic_mode = no && test "$deplibs_check_method" != pass_all; then
+      # non-PIC code in shared libraries is not supported
+      pic_mode=default
+    fi
+
+    # Calculate the filename of the output object if compiler does
+    # not support -o with -c
+    if test "$compiler_c_o" = no; then
+      output_obj=`$echo "X$srcfile" | $Xsed -e 's%^.*/%%' -e 's%\.[^.]*$%%'`.${objext}
+      lockfile="$output_obj.lock"
+      removelist="$removelist $output_obj $lockfile"
+      trap "$run $rm $removelist; exit 1" 1 2 15
+    else
+      need_locks=no
+      lockfile=
+    fi
+
+    # Lock this critical section if it is needed
+    # We use this script file to make the link, it avoids creating a new file
+    if test "$need_locks" = yes; then
+      until $run ln "$0" "$lockfile" 2>/dev/null; do
+	$show "Waiting for $lockfile to be removed"
+	sleep 2
+      done
+    elif test "$need_locks" = warn; then
+      if test -f "$lockfile"; then
+	echo "\
+*** ERROR, $lockfile exists and contains:
+`cat $lockfile 2>/dev/null`
+
+This indicates that another process is trying to use the same
+temporary object file, and libtool could not work around it because
+your compiler does not support \`-c' and \`-o' together.  If you
+repeat this compilation, it may succeed, by chance, but you had better
+avoid parallel builds (make -j) in this platform, or get a better
+compiler."
+
+	$run $rm $removelist
+	exit 1
+      fi
+      echo $srcfile > "$lockfile"
+    fi
+
+    if test -n "$fix_srcfile_path"; then
+      eval srcfile=\"$fix_srcfile_path\"
+    fi
+
+    # Only build a PIC object if we are building libtool libraries.
+    if test "$build_libtool_libs" = yes; then
+      # Without this assignment, base_compile gets emptied.
+      fbsd_hideous_sh_bug=$base_compile
+
+      if test "$pic_mode" != no; then
+	# All platforms use -DPIC, to notify preprocessed assembler code.
+	command="$base_compile $srcfile $pic_flag -DPIC"
+      else
+	# Don't build PIC code
+	command="$base_compile $srcfile"
+      fi
+      if test "$build_old_libs" = yes; then
+	lo_libobj="$libobj"
+	dir=`$echo "X$libobj" | $Xsed -e 's%/[^/]*$%%'`
+	if test "X$dir" = "X$libobj"; then
+	  dir="$objdir"
+	else
+	  dir="$dir/$objdir"
+	fi
+	libobj="$dir/"`$echo "X$libobj" | $Xsed -e 's%^.*/%%'`
+
+	if test -d "$dir"; then
+	  $show "$rm $libobj"
+	  $run $rm $libobj
+	else
+	  $show "$mkdir $dir"
+	  $run $mkdir $dir
+	  status=$?
+	  if test $status -ne 0 && test ! -d $dir; then
+	    exit $status
+	  fi
+	fi
+      fi
+      if test "$compiler_o_lo" = yes; then
+	output_obj="$libobj"
+	command="$command -o $output_obj"
+      elif test "$compiler_c_o" = yes; then
+	output_obj="$obj"
+	command="$command -o $output_obj"
+      fi
+
+      $run $rm "$output_obj"
+      $show "$command"
+      if $run eval "$command"; then :
+      else
+	test -n "$output_obj" && $run $rm $removelist
+	exit 1
+      fi
+
+      if test "$need_locks" = warn &&
+	 test x"`cat $lockfile 2>/dev/null`" != x"$srcfile"; then
+	echo "\
+*** ERROR, $lockfile contains:
+`cat $lockfile 2>/dev/null`
+
+but it should contain:
+$srcfile
+
+This indicates that another process is trying to use the same
+temporary object file, and libtool could not work around it because
+your compiler does not support \`-c' and \`-o' together.  If you
+repeat this compilation, it may succeed, by chance, but you had better
+avoid parallel builds (make -j) in this platform, or get a better
+compiler."
+
+	$run $rm $removelist
+	exit 1
+      fi
+
+      # Just move the object if needed, then go on to compile the next one
+      if test x"$output_obj" != x"$libobj"; then
+	$show "$mv $output_obj $libobj"
+	if $run $mv $output_obj $libobj; then :
+	else
+	  error=$?
+	  $run $rm $removelist
+	  exit $error
+	fi
+      fi
+
+      # If we have no pic_flag, then copy the object into place and finish.
+      if (test -z "$pic_flag" || test "$pic_mode" != default) &&
+	 test "$build_old_libs" = yes; then
+	# Rename the .lo from within objdir to obj
+	if test -f $obj; then
+	  $show $rm $obj
+	  $run $rm $obj
+	fi
+
+	$show "$mv $libobj $obj"
+	if $run $mv $libobj $obj; then :
+	else
+	  error=$?
+	  $run $rm $removelist
+	  exit $error
+	fi
+
+	xdir=`$echo "X$obj" | $Xsed -e 's%/[^/]*$%%'`
+	if test "X$xdir" = "X$obj"; then
+	  xdir="."
+	else
+	  xdir="$xdir"
+	fi
+	baseobj=`$echo "X$obj" | $Xsed -e "s%.*/%%"`
+	libobj=`$echo "X$baseobj" | $Xsed -e "$o2lo"`
+	# Now arrange that obj and lo_libobj become the same file
+	$show "(cd $xdir && $LN_S $baseobj $libobj)"
+	if $run eval '(cd $xdir && $LN_S $baseobj $libobj)'; then
+	  exit 0
+	else
+	  error=$?
+	  $run $rm $removelist
+	  exit $error
+	fi
+      fi
+
+      # Allow error messages only from the first compilation.
+      suppress_output=' >/dev/null 2>&1'
+    fi
+
+    # Only build a position-dependent object if we build old libraries.
+    if test "$build_old_libs" = yes; then
+      if test "$pic_mode" != yes; then
+	# Don't build PIC code
+	command="$base_compile $srcfile"
+      else
+	# All platforms use -DPIC, to notify preprocessed assembler code.
+	command="$base_compile $srcfile $pic_flag -DPIC"
+      fi
+      if test "$compiler_c_o" = yes; then
+	command="$command -o $obj"
+	output_obj="$obj"
+      fi
+
+      # Suppress compiler output if we already did a PIC compilation.
+      command="$command$suppress_output"
+      $run $rm "$output_obj"
+      $show "$command"
+      if $run eval "$command"; then :
+      else
+	$run $rm $removelist
+	exit 1
+      fi
+
+      if test "$need_locks" = warn &&
+	 test x"`cat $lockfile 2>/dev/null`" != x"$srcfile"; then
+	echo "\
+*** ERROR, $lockfile contains:
+`cat $lockfile 2>/dev/null`
+
+but it should contain:
+$srcfile
+
+This indicates that another process is trying to use the same
+temporary object file, and libtool could not work around it because
+your compiler does not support \`-c' and \`-o' together.  If you
+repeat this compilation, it may succeed, by chance, but you had better
+avoid parallel builds (make -j) in this platform, or get a better
+compiler."
+
+	$run $rm $removelist
+	exit 1
+      fi
+
+      # Just move the object if needed
+      if test x"$output_obj" != x"$obj"; then
+	$show "$mv $output_obj $obj"
+	if $run $mv $output_obj $obj; then :
+	else
+	  error=$?
+	  $run $rm $removelist
+	  exit $error
+	fi
+      fi
+
+      # Create an invalid libtool object if no PIC, so that we do not
+      # accidentally link it into a program.
+      if test "$build_libtool_libs" != yes; then
+	$show "echo timestamp > $libobj"
+	$run eval "echo timestamp > \$libobj" || exit $?
+      else
+	# Move the .lo from within objdir
+	$show "$mv $libobj $lo_libobj"
+	if $run $mv $libobj $lo_libobj; then :
+	else
+	  error=$?
+	  $run $rm $removelist
+	  exit $error
+	fi
+      fi
+    fi
+
+    # Unlock the critical section if it was locked
+    if test "$need_locks" != no; then
+      $run $rm "$lockfile"
+    fi
+
+    exit 0
+    ;;
+
+  # libtool link mode
+  link | relink)
+    modename="$modename: link"
+    case $host in
+    *-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-os2*)
+      # It is impossible to link a dll without this setting, and
+      # we shouldn't force the makefile maintainer to figure out
+      # which system we are compiling for in order to pass an extra
+      # flag for every libtool invokation.
+      # allow_undefined=no
+
+      # FIXME: Unfortunately, there are problems with the above when trying
+      # to make a dll which has undefined symbols, in which case not
+      # even a static library is built.  For now, we need to specify
+      # -no-undefined on the libtool link line when we can be certain
+      # that all symbols are satisfied, otherwise we get a static library.
+      allow_undefined=yes
+      ;;
+    *)
+      allow_undefined=yes
+      ;;
+    esac
+    libtool_args="$nonopt"
+    compile_command="$nonopt"
+    finalize_command="$nonopt"
+
+    compile_rpath=
+    finalize_rpath=
+    compile_shlibpath=
+    finalize_shlibpath=
+    convenience=
+    old_convenience=
+    deplibs=
+    old_deplibs=
+    compiler_flags=
+    linker_flags=
+    dllsearchpath=
+    lib_search_path=`pwd`
+
+    avoid_version=no
+    dlfiles=
+    dlprefiles=
+    dlself=no
+    export_dynamic=no
+    export_symbols=
+    export_symbols_regex=
+    generated=
+    libobjs=
+    ltlibs=
+    module=no
+    no_install=no
+    objs=
+    prefer_static_libs=no
+    preload=no
+    prev=
+    prevarg=
+    release=
+    rpath=
+    xrpath=
+    perm_rpath=
+    temp_rpath=
+    thread_safe=no
+    vinfo=
+
+    # We need to know -static, to get the right output filenames.
+    for arg
+    do
+      case $arg in
+      -all-static | -static)
+	if test "X$arg" = "X-all-static"; then
+	  if test "$build_libtool_libs" = yes && test -z "$link_static_flag"; then
+	    $echo "$modename: warning: complete static linking is impossible in this configuration" 1>&2
+	  fi
+	  if test -n "$link_static_flag"; then
+	    dlopen_self=$dlopen_self_static
+	  fi
+	else
+	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+	    dlopen_self=$dlopen_self_static
+	  fi
+	fi
+	build_libtool_libs=no
+	build_old_libs=yes
+	prefer_static_libs=yes
+	break
+	;;
+      esac
+    done
+
+    # See if our shared archives depend on static archives.
+    test -n "$old_archive_from_new_cmds" && build_old_libs=yes
+
+    # Go through the arguments, transforming them on the way.
+    while test $# -gt 0; do
+      arg="$1"
+      shift
+      case $arg in
+      *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	qarg=\"`$echo "X$arg" | $Xsed -e "$sed_quote_subst"`\" ### testsuite: skip nested quoting test
+	;;
+      *) qarg=$arg ;;
+      esac
+      libtool_args="$libtool_args $qarg"
+
+      # If the previous option needs an argument, assign it.
+      if test -n "$prev"; then
+	case $prev in
+	output)
+	  compile_command="$compile_command @OUTPUT@"
+	  finalize_command="$finalize_command @OUTPUT@"
+	  ;;
+	esac
+
+	case $prev in
+	dlfiles|dlprefiles)
+	  if test "$preload" = no; then
+	    # Add the symbol object into the linking commands.
+	    compile_command="$compile_command @SYMFILE@"
+	    finalize_command="$finalize_command @SYMFILE@"
+	    preload=yes
+	  fi
+	  case $arg in
+	  *.la | *.lo) ;;  # We handle these cases below.
+	  force)
+	    if test "$dlself" = no; then
+	      dlself=needless
+	      export_dynamic=yes
+	    fi
+	    prev=
+	    continue
+	    ;;
+	  self)
+	    if test "$prev" = dlprefiles; then
+	      dlself=yes
+	    elif test "$prev" = dlfiles && test "$dlopen_self" != yes; then
+	      dlself=yes
+	    else
+	      dlself=needless
+	      export_dynamic=yes
+	    fi
+	    prev=
+	    continue
+	    ;;
+	  *)
+	    if test "$prev" = dlfiles; then
+	      dlfiles="$dlfiles $arg"
+	    else
+	      dlprefiles="$dlprefiles $arg"
+	    fi
+	    prev=
+	    continue
+	    ;;
+	  esac
+	  ;;
+	expsyms)
+	  export_symbols="$arg"
+	  if test ! -f "$arg"; then
+	    $echo "$modename: symbol file \`$arg' does not exist"
+	    exit 1
+	  fi
+	  prev=
+	  continue
+	  ;;
+	expsyms_regex)
+	  export_symbols_regex="$arg"
+	  prev=
+	  continue
+	  ;;
+	release)
+	  release="-$arg"
+	  prev=
+	  continue
+	  ;;
+	rpath | xrpath)
+	  # We need an absolute path.
+	  case $arg in
+	  [\\/]* | [A-Za-z]:[\\/]*) ;;
+	  *)
+	    $echo "$modename: only absolute run-paths are allowed" 1>&2
+	    exit 1
+	    ;;
+	  esac
+	  if test "$prev" = rpath; then
+	    case "$rpath " in
+	    *" $arg "*) ;;
+	    *) rpath="$rpath $arg" ;;
+	    esac
+	  else
+	    case "$xrpath " in
+	    *" $arg "*) ;;
+	    *) xrpath="$xrpath $arg" ;;
+	    esac
+	  fi
+	  prev=
+	  continue
+	  ;;
+	xcompiler)
+	  compiler_flags="$compiler_flags $qarg"
+	  prev=
+	  compile_command="$compile_command $qarg"
+	  finalize_command="$finalize_command $qarg"
+	  continue
+	  ;;
+	xlinker)
+	  linker_flags="$linker_flags $qarg"
+	  compiler_flags="$compiler_flags $wl$qarg"
+	  prev=
+	  compile_command="$compile_command $wl$qarg"
+	  finalize_command="$finalize_command $wl$qarg"
+	  continue
+	  ;;
+	*)
+	  eval "$prev=\"\$arg\""
+	  prev=
+	  continue
+	  ;;
+	esac
+      fi # test -n $prev
+
+      prevarg="$arg"
+
+      case $arg in
+      -all-static)
+	if test -n "$link_static_flag"; then
+	  compile_command="$compile_command $link_static_flag"
+	  finalize_command="$finalize_command $link_static_flag"
+	fi
+	continue
+	;;
+
+      -allow-undefined)
+	# FIXME: remove this flag sometime in the future.
+	$echo "$modename: \`-allow-undefined' is deprecated because it is the default" 1>&2
+	continue
+	;;
+
+      -avoid-version)
+	avoid_version=yes
+	continue
+	;;
+
+      -dlopen)
+	prev=dlfiles
+	continue
+	;;
+
+      -dlpreopen)
+	prev=dlprefiles
+	continue
+	;;
+
+      -export-dynamic)
+	export_dynamic=yes
+	continue
+	;;
+
+      -export-symbols | -export-symbols-regex)
+	if test -n "$export_symbols" || test -n "$export_symbols_regex"; then
+	  $echo "$modename: more than one -exported-symbols argument is not allowed"
+	  exit 1
+	fi
+	if test "X$arg" = "X-export-symbols"; then
+	  prev=expsyms
+	else
+	  prev=expsyms_regex
+	fi
+	continue
+	;;
+
+      # The native IRIX linker understands -LANG:*, -LIST:* and -LNO:*
+      # so, if we see these flags be careful not to treat them like -L
+      -L[A-Z][A-Z]*:*)
+	case $with_gcc/$host in
+	no/*-*-irix*)
+	  compile_command="$compile_command $arg"
+	  finalize_command="$finalize_command $arg"
+	  ;;
+	esac
+	continue
+	;;
+
+      -L*)
+	dir=`$echo "X$arg" | $Xsed -e 's/^-L//'`
+	# We need an absolute path.
+	case $dir in
+	[\\/]* | [A-Za-z]:[\\/]*) ;;
+	*)
+	  absdir=`cd "$dir" && pwd`
+	  if test -z "$absdir"; then
+	    $echo "$modename: cannot determine absolute directory name of \`$dir'" 1>&2
+	    exit 1
+	  fi
+	  dir="$absdir"
+	  ;;
+	esac
+	case "$deplibs " in
+	*" -L$dir "*) ;;
+	*)
+	  deplibs="$deplibs -L$dir"
+	  lib_search_path="$lib_search_path $dir"
+	  ;;
+	esac
+	case $host in
+	*-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-os2*)
+	  case :$dllsearchpath: in
+	  *":$dir:"*) ;;
+	  *) dllsearchpath="$dllsearchpath:$dir";;
+	  esac
+	  ;;
+	esac
+	continue
+	;;
+
+      -l*)
+	if test "X$arg" = "X-lc" || test "X$arg" = "X-lm"; then
+	  case $host in
+	  *-*-cygwin* | *-*-pw32* | *-*-beos*)
+	    # These systems don't actually have a C or math library (as such)
+	    continue
+	    ;;
+	  *-*-mingw* | *-*-os2*)
+	    # These systems don't actually have a C library (as such)
+	    test "X$arg" = "X-lc" && continue
+	    ;;
+	  esac
+	fi
+	deplibs="$deplibs $arg"
+	continue
+	;;
+
+      -module)
+	module=yes
+	continue
+	;;
+
+      -no-fast-install)
+	fast_install=no
+	continue
+	;;
+
+      -no-install)
+	case $host in
+	*-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-os2*)
+	  # The PATH hackery in wrapper scripts is required on Windows
+	  # in order for the loader to find any dlls it needs.
+	  $echo "$modename: warning: \`-no-install' is ignored for $host" 1>&2
+	  $echo "$modename: warning: assuming \`-no-fast-install' instead" 1>&2
+	  fast_install=no
+	  ;;
+	*) no_install=yes ;;
+	esac
+	continue
+	;;
+
+      -no-undefined)
+	allow_undefined=no
+	continue
+	;;
+
+      -o) prev=output ;;
+
+      -release)
+	prev=release
+	continue
+	;;
+
+      -rpath)
+	prev=rpath
+	continue
+	;;
+
+      -R)
+	prev=xrpath
+	continue
+	;;
+
+      -R*)
+	dir=`$echo "X$arg" | $Xsed -e 's/^-R//'`
+	# We need an absolute path.
+	case $dir in
+	[\\/]* | [A-Za-z]:[\\/]*) ;;
+	*)
+	  $echo "$modename: only absolute run-paths are allowed" 1>&2
+	  exit 1
+	  ;;
+	esac
+	case "$xrpath " in
+	*" $dir "*) ;;
+	*) xrpath="$xrpath $dir" ;;
+	esac
+	continue
+	;;
+
+      -static)
+	# The effects of -static are defined in a previous loop.
+	# We used to do the same as -all-static on platforms that
+	# didn't have a PIC flag, but the assumption that the effects
+	# would be equivalent was wrong.  It would break on at least
+	# Digital Unix and AIX.
+	continue
+	;;
+
+      -thread-safe)
+	thread_safe=yes
+	continue
+	;;
+
+      -version-info)
+	prev=vinfo
+	continue
+	;;
+
+      -Wc,*)
+	args=`$echo "X$arg" | $Xsed -e "$sed_quote_subst" -e 's/^-Wc,//'`
+	arg=
+	IFS="${IFS= 	}"; save_ifs="$IFS"; IFS=','
+	for flag in $args; do
+	  IFS="$save_ifs"
+	  case $flag in
+	    *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	    flag="\"$flag\""
+	    ;;
+	  esac
+	  arg="$arg $wl$flag"
+	  compiler_flags="$compiler_flags $flag"
+	done
+	IFS="$save_ifs"
+	arg=`$echo "X$arg" | $Xsed -e "s/^ //"`
+	;;
+
+      -Wl,*)
+	args=`$echo "X$arg" | $Xsed -e "$sed_quote_subst" -e 's/^-Wl,//'`
+	arg=
+	IFS="${IFS= 	}"; save_ifs="$IFS"; IFS=','
+	for flag in $args; do
+	  IFS="$save_ifs"
+	  case $flag in
+	    *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	    flag="\"$flag\""
+	    ;;
+	  esac
+	  arg="$arg $wl$flag"
+	  compiler_flags="$compiler_flags $wl$flag"
+	  linker_flags="$linker_flags $flag"
+	done
+	IFS="$save_ifs"
+	arg=`$echo "X$arg" | $Xsed -e "s/^ //"`
+	;;
+
+      -Xcompiler)
+	prev=xcompiler
+	continue
+	;;
+
+      -Xlinker)
+	prev=xlinker
+	continue
+	;;
+
+      # Some other compiler flag.
+      -* | +*)
+	# Unknown arguments in both finalize_command and compile_command need
+	# to be aesthetically quoted because they are evaled later.
+	arg=`$echo "X$arg" | $Xsed -e "$sed_quote_subst"`
+	case $arg in
+	*[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	  arg="\"$arg\""
+	  ;;
+	esac
+	;;
+
+      *.lo | *.$objext)
+	# A library or standard object.
+	if test "$prev" = dlfiles; then
+	  # This file was specified with -dlopen.
+	  if test "$build_libtool_libs" = yes && test "$dlopen_support" = yes; then
+	    dlfiles="$dlfiles $arg"
+	    prev=
+	    continue
+	  else
+	    # If libtool objects are unsupported, then we need to preload.
+	    prev=dlprefiles
+	  fi
+	fi
+
+	if test "$prev" = dlprefiles; then
+	  # Preload the old-style object.
+	  dlprefiles="$dlprefiles "`$echo "X$arg" | $Xsed -e "$lo2o"`
+	  prev=
+	else
+	  case $arg in
+	  *.lo) libobjs="$libobjs $arg" ;;
+	  *) objs="$objs $arg" ;;
+	  esac
+	fi
+	;;
+
+      *.$libext)
+	# An archive.
+	deplibs="$deplibs $arg"
+	old_deplibs="$old_deplibs $arg"
+	continue
+	;;
+
+      *.la)
+	# A libtool-controlled library.
+
+	if test "$prev" = dlfiles; then
+	  # This library was specified with -dlopen.
+	  dlfiles="$dlfiles $arg"
+	  prev=
+	elif test "$prev" = dlprefiles; then
+	  # The library was specified with -dlpreopen.
+	  dlprefiles="$dlprefiles $arg"
+	  prev=
+	else
+	  deplibs="$deplibs $arg"
+	fi
+	continue
+	;;
+
+      # Some other compiler argument.
+      *)
+	# Unknown arguments in both finalize_command and compile_command need
+	# to be aesthetically quoted because they are evaled later.
+	arg=`$echo "X$arg" | $Xsed -e "$sed_quote_subst"`
+	case $arg in
+	*[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	  arg="\"$arg\""
+	  ;;
+	esac
+	;;
+      esac # arg
+
+      # Now actually substitute the argument into the commands.
+      if test -n "$arg"; then
+	compile_command="$compile_command $arg"
+	finalize_command="$finalize_command $arg"
+      fi
+    done # argument parsing loop
+
+    if test -n "$prev"; then
+      $echo "$modename: the \`$prevarg' option requires an argument" 1>&2
+      $echo "$help" 1>&2
+      exit 1
+    fi
+
+    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then
+      eval arg=\"$export_dynamic_flag_spec\"
+      compile_command="$compile_command $arg"
+      finalize_command="$finalize_command $arg"
+    fi
+
+    # calculate the name of the file, without its directory
+    outputname=`$echo "X$output" | $Xsed -e 's%^.*/%%'`
+    libobjs_save="$libobjs"
+
+    if test -n "$shlibpath_var"; then
+      # get the directories listed in $shlibpath_var
+      eval shlib_search_path=\`\$echo \"X\${$shlibpath_var}\" \| \$Xsed -e \'s/:/ /g\'\`
+    else
+      shlib_search_path=
+    fi
+    eval sys_lib_search_path=\"$sys_lib_search_path_spec\"
+    eval sys_lib_dlsearch_path=\"$sys_lib_dlsearch_path_spec\"
+
+    output_objdir=`$echo "X$output" | $Xsed -e 's%/[^/]*$%%'`
+    if test "X$output_objdir" = "X$output"; then
+      output_objdir="$objdir"
+    else
+      output_objdir="$output_objdir/$objdir"
+    fi
+    # Create the object directory.
+    if test ! -d $output_objdir; then
+      $show "$mkdir $output_objdir"
+      $run $mkdir $output_objdir
+      status=$?
+      if test $status -ne 0 && test ! -d $output_objdir; then
+	exit $status
+      fi
+    fi
+
+    # Determine the type of output
+    case $output in
+    "")
+      $echo "$modename: you must specify an output file" 1>&2
+      $echo "$help" 1>&2
+      exit 1
+      ;;
+    *.$libext) linkmode=oldlib ;;
+    *.lo | *.$objext) linkmode=obj ;;
+    *.la) linkmode=lib ;;
+    *) linkmode=prog ;; # Anything else should be a program.
+    esac
+
+    specialdeplibs=
+    libs=
+    # Find all interdependent deplibs by searching for libraries
+    # that are linked more than once (e.g. -la -lb -la)
+    for deplib in $deplibs; do
+      case "$libs " in
+      *" $deplib "*) specialdeplibs="$specialdeplibs $deplib" ;;
+      esac
+      libs="$libs $deplib"
+    done
+    deplibs=
+    newdependency_libs=
+    newlib_search_path=
+    need_relink=no # whether we're linking any uninstalled libtool libraries
+    notinst_deplibs= # not-installed libtool libraries
+    notinst_path= # paths that contain not-installed libtool libraries
+    case $linkmode in
+    lib)
+	passes="conv link"
+	for file in $dlfiles $dlprefiles; do
+	  case $file in
+	  *.la) ;;
+	  *)
+	    $echo "$modename: libraries can \`-dlopen' only libtool libraries: $file" 1>&2
+	    exit 1
+	    ;;
+	  esac
+	done
+	;;
+    prog)
+	compile_deplibs=
+	finalize_deplibs=
+	alldeplibs=no
+	newdlfiles=
+	newdlprefiles=
+	passes="conv scan dlopen dlpreopen link"
+	;;
+    *)  passes="conv"
+	;;
+    esac
+    for pass in $passes; do
+      if test $linkmode = prog; then
+	# Determine which files to process
+	case $pass in
+	dlopen)
+	  libs="$dlfiles"
+	  save_deplibs="$deplibs" # Collect dlpreopened libraries
+	  deplibs=
+	  ;;
+	dlpreopen) libs="$dlprefiles" ;;
+	link) libs="$deplibs %DEPLIBS% $dependency_libs" ;;
+	esac
+      fi
+      for deplib in $libs; do
+	lib=
+	found=no
+	case $deplib in
+	-l*)
+	  if test $linkmode = oldlib && test $linkmode = obj; then
+	    $echo "$modename: warning: \`-l' is ignored for archives/objects: $deplib" 1>&2
+	    continue
+	  fi
+	  if test $pass = conv; then
+	    deplibs="$deplib $deplibs"
+	    continue
+	  fi
+	  name=`$echo "X$deplib" | $Xsed -e 's/^-l//'`
+	  for searchdir in $newlib_search_path $lib_search_path $sys_lib_search_path $shlib_search_path; do
+	    # Search the libtool library
+	    lib="$searchdir/lib${name}.la"
+	    if test -f "$lib"; then
+	      found=yes
+	      break
+	    fi
+	  done
+	  if test "$found" != yes; then
+	    # deplib doesn't seem to be a libtool library
+	    if test "$linkmode,$pass" = "prog,link"; then
+	      compile_deplibs="$deplib $compile_deplibs"
+	      finalize_deplibs="$deplib $finalize_deplibs"
+	    else
+	      deplibs="$deplib $deplibs"
+	      test $linkmode = lib && newdependency_libs="$deplib $newdependency_libs"
+	    fi
+	    continue
+	  fi
+	  ;; # -l
+	-L*)
+	  case $linkmode in
+	  lib)
+	    deplibs="$deplib $deplibs"
+	    test $pass = conv && continue
+	    newdependency_libs="$deplib $newdependency_libs"
+	    newlib_search_path="$newlib_search_path "`$echo "X$deplib" | $Xsed -e 's/^-L//'`
+	    ;;
+	  prog)
+	    if test $pass = conv; then
+	      deplibs="$deplib $deplibs"
+	      continue
+	    fi
+	    if test $pass = scan; then
+	      deplibs="$deplib $deplibs"
+	      newlib_search_path="$newlib_search_path "`$echo "X$deplib" | $Xsed -e 's/^-L//'`
+	    else
+	      compile_deplibs="$deplib $compile_deplibs"
+	      finalize_deplibs="$deplib $finalize_deplibs"
+	    fi
+	    ;;
+	  *)
+	    $echo "$modename: warning: \`-L' is ignored for archives/objects: $deplib" 1>&2
+	    ;;
+	  esac # linkmode
+	  continue
+	  ;; # -L
+	-R*)
+	  if test $pass = link; then
+	    dir=`$echo "X$deplib" | $Xsed -e 's/^-R//'`
+	    # Make sure the xrpath contains only unique directories.
+	    case "$xrpath " in
+	    *" $dir "*) ;;
+	    *) xrpath="$xrpath $dir" ;;
+	    esac
+	  fi
+	  deplibs="$deplib $deplibs"
+	  continue
+	  ;;
+	*.la) lib="$deplib" ;;
+	*.$libext)
+	  if test $pass = conv; then
+	    deplibs="$deplib $deplibs"
+	    continue
+	  fi
+	  case $linkmode in
+	  lib)
+	    if test "$deplibs_check_method" != pass_all; then
+	      echo
+	      echo "*** Warning: This library needs some functionality provided by $deplib."
+	      echo "*** I have the capability to make that library automatically link in when"
+	      echo "*** you link to this library.  But I can only do this if you have a"
+	      echo "*** shared version of the library, which you do not appear to have."
+	    else
+	      echo
+	      echo "*** Warning: Linking the shared library $output against the"
+	      echo "*** static library $deplib is not portable!"
+	      deplibs="$deplib $deplibs"
+	    fi
+	    continue
+	    ;;
+	  prog)
+	    if test $pass != link; then
+	      deplibs="$deplib $deplibs"
+	    else
+	      compile_deplibs="$deplib $compile_deplibs"
+	      finalize_deplibs="$deplib $finalize_deplibs"
+	    fi
+	    continue
+	    ;;
+	  esac # linkmode
+	  ;; # *.$libext
+	*.lo | *.$objext)
+	  if test $pass = dlpreopen || test "$dlopen_support" != yes || test "$build_libtool_libs" = no; then
+	    # If there is no dlopen support or we're linking statically,
+	    # we need to preload.
+	    newdlprefiles="$newdlprefiles $deplib"
+	    compile_deplibs="$deplib $compile_deplibs"
+	    finalize_deplibs="$deplib $finalize_deplibs"
+	  else
+	    newdlfiles="$newdlfiles $deplib"
+	  fi
+	  continue
+	  ;;
+	%DEPLIBS%)
+	  alldeplibs=yes
+	  continue
+	  ;;
+	esac # case $deplib
+	if test $found = yes || test -f "$lib"; then :
+	else
+	  $echo "$modename: cannot find the library \`$lib'" 1>&2
+	  exit 1
+	fi
+
+	# Check to see that this really is a libtool archive.
+	if (sed -e '2q' $lib | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then :
+	else
+	  $echo "$modename: \`$lib' is not a valid libtool archive" 1>&2
+	  exit 1
+	fi
+
+	ladir=`$echo "X$lib" | $Xsed -e 's%/[^/]*$%%'`
+	test "X$ladir" = "X$lib" && ladir="."
+
+	dlname=
+	dlopen=
+	dlpreopen=
+	libdir=
+	library_names=
+	old_library=
+	# If the library was installed with an old release of libtool,
+	# it will not redefine variable installed.
+	installed=yes
+
+	# Read the .la file
+	case $lib in
+	*/* | *\\*) . $lib ;;
+	*) . ./$lib ;;
+	esac
+
+	if test "$linkmode,$pass" = "lib,link" ||
+	   test "$linkmode,$pass" = "prog,scan" ||
+	   { test $linkmode = oldlib && test $linkmode = obj; }; then
+	   # Add dl[pre]opened files of deplib
+	  test -n "$dlopen" && dlfiles="$dlfiles $dlopen"
+	  test -n "$dlpreopen" && dlprefiles="$dlprefiles $dlpreopen"
+	fi
+
+	if test $pass = conv; then
+	  # Only check for convenience libraries
+	  deplibs="$lib $deplibs"
+	  if test -z "$libdir"; then
+	    if test -z "$old_library"; then
+	      $echo "$modename: cannot find name of link library for \`$lib'" 1>&2
+	      exit 1
+	    fi
+	    # It is a libtool convenience library, so add in its objects.
+	    convenience="$convenience $ladir/$objdir/$old_library"
+	    old_convenience="$old_convenience $ladir/$objdir/$old_library"
+	    tmp_libs=
+	    for deplib in $dependency_libs; do
+	      deplibs="$deplib $deplibs"
+	      case "$tmp_libs " in
+	      *" $deplib "*) specialdeplibs="$specialdeplibs $deplib" ;;
+	      esac
+	      tmp_libs="$tmp_libs $deplib"
+	    done
+	  elif test $linkmode != prog && test $linkmode != lib; then
+	    $echo "$modename: \`$lib' is not a convenience library" 1>&2
+	    exit 1
+	  fi
+	  continue
+	fi # $pass = conv
+
+	# Get the name of the library we link against.
+	linklib=
+	for l in $old_library $library_names; do
+	  linklib="$l"
+	done
+	if test -z "$linklib"; then
+	  $echo "$modename: cannot find name of link library for \`$lib'" 1>&2
+	  exit 1
+	fi
+
+	# This library was specified with -dlopen.
+	if test $pass = dlopen; then
+	  if test -z "$libdir"; then
+	    $echo "$modename: cannot -dlopen a convenience library: \`$lib'" 1>&2
+	    exit 1
+	  fi
+	  if test -z "$dlname" || test "$dlopen_support" != yes || test "$build_libtool_libs" = no; then
+	    # If there is no dlname, no dlopen support or we're linking
+	    # statically, we need to preload.
+	    dlprefiles="$dlprefiles $lib"
+	  else
+	    newdlfiles="$newdlfiles $lib"
+	  fi
+	  continue
+	fi # $pass = dlopen
+
+	# We need an absolute path.
+	case $ladir in
+	[\\/]* | [A-Za-z]:[\\/]*) abs_ladir="$ladir" ;;
+	*)
+	  abs_ladir=`cd "$ladir" && pwd`
+	  if test -z "$abs_ladir"; then
+	    $echo "$modename: warning: cannot determine absolute directory name of \`$ladir'" 1>&2
+	    $echo "$modename: passing it literally to the linker, although it might fail" 1>&2
+	    abs_ladir="$ladir"
+	  fi
+	  ;;
+	esac
+	laname=`$echo "X$lib" | $Xsed -e 's%^.*/%%'`
+
+	# Find the relevant object directory and library name.
+	if test "X$installed" = Xyes; then
+	  if test ! -f "$libdir/$linklib" && test -f "$abs_ladir/$linklib"; then
+	    $echo "$modename: warning: library \`$lib' was moved." 1>&2
+	    dir="$ladir"
+	    absdir="$abs_ladir"
+	    libdir="$abs_ladir"
+	  else
+	    dir="$libdir"
+	    absdir="$libdir"
+	  fi
+	else
+	  dir="$ladir/$objdir"
+	  absdir="$abs_ladir/$objdir"
+	  # Remove this search path later
+	  notinst_path="$notinst_path $abs_ladir"
+	fi # $installed = yes
+	name=`$echo "X$laname" | $Xsed -e 's/\.la$//' -e 's/^lib//'`
+
+	# This library was specified with -dlpreopen.
+	if test $pass = dlpreopen; then
+	  if test -z "$libdir"; then
+	    $echo "$modename: cannot -dlpreopen a convenience library: \`$lib'" 1>&2
+	    exit 1
+	  fi
+	  # Prefer using a static library (so that no silly _DYNAMIC symbols
+	  # are required to link).
+	  if test -n "$old_library"; then
+	    newdlprefiles="$newdlprefiles $dir/$old_library"
+	  # Otherwise, use the dlname, so that lt_dlopen finds it.
+	  elif test -n "$dlname"; then
+	    newdlprefiles="$newdlprefiles $dir/$dlname"
+	  else
+	    newdlprefiles="$newdlprefiles $dir/$linklib"
+	  fi
+	fi # $pass = dlpreopen
+
+	if test -z "$libdir"; then
+	  # Link the convenience library
+	  if test $linkmode = lib; then
+	    deplibs="$dir/$old_library $deplibs"
+	  elif test "$linkmode,$pass" = "prog,link"; then
+	    compile_deplibs="$dir/$old_library $compile_deplibs"
+	    finalize_deplibs="$dir/$old_library $finalize_deplibs"
+	  else
+	    deplibs="$lib $deplibs"
+	  fi
+	  continue
+	fi
+
+	if test $linkmode = prog && test $pass != link; then
+	  newlib_search_path="$newlib_search_path $ladir"
+	  deplibs="$lib $deplibs"
+
+	  linkalldeplibs=no
+	  if test "$link_all_deplibs" != no || test -z "$library_names" ||
+	     test "$build_libtool_libs" = no; then
+	    linkalldeplibs=yes
+	  fi
+
+	  tmp_libs=
+	  for deplib in $dependency_libs; do
+	    case $deplib in
+	    -L*) newlib_search_path="$newlib_search_path "`$echo "X$deplib" | $Xsed -e 's/^-L//'`;; ### testsuite: skip nested quoting test
+	    esac
+	    # Need to link against all dependency_libs?
+	    if test $linkalldeplibs = yes; then
+	      deplibs="$deplib $deplibs"
+	    else
+	      # Need to hardcode shared library paths
+	      # or/and link against static libraries
+	      newdependency_libs="$deplib $newdependency_libs"
+	    fi
+	    case "$tmp_libs " in
+	    *" $deplib "*) specialdeplibs="$specialdeplibs $deplib" ;;
+	    esac
+	    tmp_libs="$tmp_libs $deplib"
+	  done # for deplib
+	  continue
+	fi # $linkmode = prog...
+
+	link_static=no # Whether the deplib will be linked statically
+	if test -n "$library_names" &&
+	   { test "$prefer_static_libs" = no || test -z "$old_library"; }; then
+	  # Link against this shared library
+
+	  if test "$linkmode,$pass" = "prog,link" ||
+	   { test $linkmode = lib && test $hardcode_into_libs = yes; }; then
+	    # Hardcode the library path.
+	    # Skip directories that are in the system default run-time
+	    # search path.
+	    case " $sys_lib_dlsearch_path " in
+	    *" $absdir "*) ;;
+	    *)
+	      case "$compile_rpath " in
+	      *" $absdir "*) ;;
+	      *) compile_rpath="$compile_rpath $absdir"
+	      esac
+	      ;;
+	    esac
+	    case " $sys_lib_dlsearch_path " in
+	    *" $libdir "*) ;;
+	    *)
+	      case "$finalize_rpath " in
+	      *" $libdir "*) ;;
+	      *) finalize_rpath="$finalize_rpath $libdir"
+	      esac
+	      ;;
+	    esac
+	    if test $linkmode = prog; then
+	      # We need to hardcode the library path
+	      if test -n "$shlibpath_var"; then
+		# Make sure the rpath contains only unique directories.
+		case "$temp_rpath " in
+		*" $dir "*) ;;
+		*" $absdir "*) ;;
+		*) temp_rpath="$temp_rpath $dir" ;;
+		esac
+	      fi
+	    fi
+	  fi # $linkmode,$pass = prog,link...
+
+	  if test "$alldeplibs" = yes &&
+	     { test "$deplibs_check_method" = pass_all ||
+	       { test "$build_libtool_libs" = yes &&
+		 test -n "$library_names"; }; }; then
+	    # We only need to search for static libraries
+	    continue
+	  fi
+
+	  if test "$installed" = no; then
+	    notinst_deplibs="$notinst_deplibs $lib"
+	    need_relink=yes
+	  fi
+
+	  if test -n "$old_archive_from_expsyms_cmds"; then
+	    # figure out the soname
+	    set dummy $library_names
+	    realname="$2"
+	    shift; shift
+	    libname=`eval \\$echo \"$libname_spec\"`
+	    # use dlname if we got it. it's perfectly good, no?
+	    if test -n "$dlname"; then
+	      soname="$dlname"
+	    elif test -n "$soname_spec"; then
+	      # bleh windows
+	      case $host in
+	      *cygwin*)
+		major=`expr $current - $age`
+		versuffix="-$major"
+		;;
+	      esac
+	      eval soname=\"$soname_spec\"
+	    else
+	      soname="$realname"
+	    fi
+
+	    # Make a new name for the extract_expsyms_cmds to use
+	    soroot="$soname"
+	    soname=`echo $soroot | sed -e 's/^.*\///'`
+	    newlib="libimp-`echo $soname | sed 's/^lib//;s/\.dll$//'`.a"
+
+	    # If the library has no export list, then create one now
+	    if test -f "$output_objdir/$soname-def"; then :
+	    else
+	      $show "extracting exported symbol list from \`$soname'"
+	      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	      eval cmds=\"$extract_expsyms_cmds\"
+	      for cmd in $cmds; do
+		IFS="$save_ifs"
+		$show "$cmd"
+		$run eval "$cmd" || exit $?
+	      done
+	      IFS="$save_ifs"
+	    fi
+
+	    # Create $newlib
+	    if test -f "$output_objdir/$newlib"; then :; else
+	      $show "generating import library for \`$soname'"
+	      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	      eval cmds=\"$old_archive_from_expsyms_cmds\"
+	      for cmd in $cmds; do
+		IFS="$save_ifs"
+		$show "$cmd"
+		$run eval "$cmd" || exit $?
+	      done
+	      IFS="$save_ifs"
+	    fi
+	    # make sure the library variables are pointing to the new library
+	    dir=$output_objdir
+	    linklib=$newlib
+	  fi # test -n $old_archive_from_expsyms_cmds
+
+	  if test $linkmode = prog || test "$mode" != relink; then
+	    add_shlibpath=
+	    add_dir=
+	    add=
+	    lib_linked=yes
+	    case $hardcode_action in
+	    immediate | unsupported)
+	      if test "$hardcode_direct" = no; then
+		add="$dir/$linklib"
+	      elif test "$hardcode_minus_L" = no; then
+		case $host in
+		*-*-sunos*) add_shlibpath="$dir" ;;
+		esac
+		add_dir="-L$dir"
+		add="-l$name"
+	      elif test "$hardcode_shlibpath_var" = no; then
+		add_shlibpath="$dir"
+		add="-l$name"
+	      else
+		lib_linked=no
+	      fi
+	      ;;
+	    relink)
+	      if test "$hardcode_direct" = yes; then
+		add="$dir/$linklib"
+	      elif test "$hardcode_minus_L" = yes; then
+		add_dir="-L$dir"
+		add="-l$name"
+	      elif test "$hardcode_shlibpath_var" = yes; then
+		add_shlibpath="$dir"
+		add="-l$name"
+	      else
+		lib_linked=no
+	      fi
+	      ;;
+	    *) lib_linked=no ;;
+	    esac
+
+	    if test "$lib_linked" != yes; then
+	      $echo "$modename: configuration error: unsupported hardcode properties"
+	      exit 1
+	    fi
+
+	    if test -n "$add_shlibpath"; then
+	      case :$compile_shlibpath: in
+	      *":$add_shlibpath:"*) ;;
+	      *) compile_shlibpath="$compile_shlibpath$add_shlibpath:" ;;
+	      esac
+	    fi
+	    if test $linkmode = prog; then
+	      test -n "$add_dir" && compile_deplibs="$add_dir $compile_deplibs"
+	      test -n "$add" && compile_deplibs="$add $compile_deplibs"
+	    else
+	      test -n "$add_dir" && deplibs="$add_dir $deplibs"
+	      test -n "$add" && deplibs="$add $deplibs"
+	      if test "$hardcode_direct" != yes && \
+		 test "$hardcode_minus_L" != yes && \
+		 test "$hardcode_shlibpath_var" = yes; then
+		case :$finalize_shlibpath: in
+		*":$libdir:"*) ;;
+		*) finalize_shlibpath="$finalize_shlibpath$libdir:" ;;
+		esac
+	      fi
+	    fi
+	  fi
+
+	  if test $linkmode = prog || test "$mode" = relink; then
+	    add_shlibpath=
+	    add_dir=
+	    add=
+	    # Finalize command for both is simple: just hardcode it.
+	    if test "$hardcode_direct" = yes; then
+	      add="$libdir/$linklib"
+	    elif test "$hardcode_minus_L" = yes; then
+	      add_dir="-L$libdir"
+	      add="-l$name"
+	    elif test "$hardcode_shlibpath_var" = yes; then
+	      case :$finalize_shlibpath: in
+	      *":$libdir:"*) ;;
+	      *) finalize_shlibpath="$finalize_shlibpath$libdir:" ;;
+	      esac
+	      add="-l$name"
+	    else
+	      # We cannot seem to hardcode it, guess we'll fake it.
+	      add_dir="-L$libdir"
+	      add="-l$name"
+	    fi
+
+	    if test $linkmode = prog; then
+	      test -n "$add_dir" && finalize_deplibs="$add_dir $finalize_deplibs"
+	      test -n "$add" && finalize_deplibs="$add $finalize_deplibs"
+	    else
+	      test -n "$add_dir" && deplibs="$add_dir $deplibs"
+	      test -n "$add" && deplibs="$add $deplibs"
+	    fi
+	  fi
+	elif test $linkmode = prog; then
+	  if test "$alldeplibs" = yes &&
+	     { test "$deplibs_check_method" = pass_all ||
+	       { test "$build_libtool_libs" = yes &&
+		 test -n "$library_names"; }; }; then
+	    # We only need to search for static libraries
+	    continue
+	  fi
+
+	  # Try to link the static library
+	  # Here we assume that one of hardcode_direct or hardcode_minus_L
+	  # is not unsupported.  This is valid on all known static and
+	  # shared platforms.
+	  if test "$hardcode_direct" != unsupported; then
+	    test -n "$old_library" && linklib="$old_library"
+	    compile_deplibs="$dir/$linklib $compile_deplibs"
+	    finalize_deplibs="$dir/$linklib $finalize_deplibs"
+	  else
+	    compile_deplibs="-l$name -L$dir $compile_deplibs"
+	    finalize_deplibs="-l$name -L$dir $finalize_deplibs"
+	  fi
+	elif test "$build_libtool_libs" = yes; then
+	  # Not a shared library
+	  if test "$deplibs_check_method" != pass_all; then
+	    # We're trying link a shared library against a static one
+	    # but the system doesn't support it.
+
+	    # Just print a warning and add the library to dependency_libs so
+	    # that the program can be linked against the static library.
+	    echo
+	    echo "*** Warning: This library needs some functionality provided by $lib."
+	    echo "*** I have the capability to make that library automatically link in when"
+	    echo "*** you link to this library.  But I can only do this if you have a"
+	    echo "*** shared version of the library, which you do not appear to have."
+	    if test "$module" = yes; then
+	      echo "*** Therefore, libtool will create a static module, that should work "
+	      echo "*** as long as the dlopening application is linked with the -dlopen flag."
+	      if test -z "$global_symbol_pipe"; then
+	        echo
+	        echo "*** However, this would only work if libtool was able to extract symbol"
+	        echo "*** lists from a program, using \`nm' or equivalent, but libtool could"
+	        echo "*** not find such a program.  So, this module is probably useless."
+	        echo "*** \`nm' from GNU binutils and a full rebuild may help."
+	      fi
+	      if test "$build_old_libs" = no; then
+	        build_libtool_libs=module
+	        build_old_libs=yes
+	      else
+	        build_libtool_libs=no
+	      fi
+	    fi
+	  else
+	    convenience="$convenience $dir/$old_library"
+	    old_convenience="$old_convenience $dir/$old_library"
+	    deplibs="$dir/$old_library $deplibs"
+	    link_static=yes
+	  fi
+	fi # link shared/static library?
+
+	if test $linkmode = lib; then
+	  if test -n "$dependency_libs" &&
+	     { test $hardcode_into_libs != yes || test $build_old_libs = yes ||
+	       test $link_static = yes; }; then
+	    # Extract -R from dependency_libs
+	    temp_deplibs=
+	    for libdir in $dependency_libs; do
+	      case $libdir in
+	      -R*) temp_xrpath=`$echo "X$libdir" | $Xsed -e 's/^-R//'`
+		   case " $xrpath " in
+		   *" $temp_xrpath "*) ;;
+		   *) xrpath="$xrpath $temp_xrpath";;
+		   esac;;
+	      *) temp_deplibs="$temp_deplibs $libdir";;
+	      esac
+	    done
+	    dependency_libs="$temp_deplibs"
+	  fi
+
+	  newlib_search_path="$newlib_search_path $absdir"
+	  # Link against this library
+	  test "$link_static" = no && newdependency_libs="$abs_ladir/$laname $newdependency_libs"
+	  # ... and its dependency_libs
+	  tmp_libs=
+	  for deplib in $dependency_libs; do
+	    newdependency_libs="$deplib $newdependency_libs"
+	    case "$tmp_libs " in
+	    *" $deplib "*) specialdeplibs="$specialdeplibs $deplib" ;;
+	    esac
+	    tmp_libs="$tmp_libs $deplib"
+	  done
+
+	  if test $link_all_deplibs != no; then
+	    # Add the search paths of all dependency libraries
+	    for deplib in $dependency_libs; do
+	      case $deplib in
+	      -L*) path="$deplib" ;;
+	      *.la)
+		dir=`$echo "X$deplib" | $Xsed -e 's%/[^/]*$%%'`
+		test "X$dir" = "X$deplib" && dir="."
+		# We need an absolute path.
+		case $dir in
+		[\\/]* | [A-Za-z]:[\\/]*) absdir="$dir" ;;
+		*)
+		  absdir=`cd "$dir" && pwd`
+		  if test -z "$absdir"; then
+		    $echo "$modename: warning: cannot determine absolute directory name of \`$dir'" 1>&2
+		    absdir="$dir"
+		  fi
+		  ;;
+		esac
+		if grep "^installed=no" $deplib > /dev/null; then
+		  path="-L$absdir/$objdir"
+		else
+		  eval libdir=`sed -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
+		  if test -z "$libdir"; then
+		    $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
+		    exit 1
+		  fi
+		  if test "$absdir" != "$libdir"; then
+		    $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
+		  fi
+		  path="-L$absdir"
+		fi
+		;;
+	      *) continue ;;
+	      esac
+	      case " $deplibs " in
+	      *" $path "*) ;;
+	      *) deplibs="$deplibs $path" ;;
+	      esac
+	    done
+	  fi # link_all_deplibs != no
+	fi # linkmode = lib
+      done # for deplib in $libs
+      if test $pass = dlpreopen; then
+	# Link the dlpreopened libraries before other libraries
+	for deplib in $save_deplibs; do
+	  deplibs="$deplib $deplibs"
+	done
+      fi
+      if test $pass != dlopen; then
+	test $pass != scan && dependency_libs="$newdependency_libs"
+	if test $pass != conv; then
+	  # Make sure lib_search_path contains only unique directories.
+	  lib_search_path=
+	  for dir in $newlib_search_path; do
+	    case "$lib_search_path " in
+	    *" $dir "*) ;;
+	    *) lib_search_path="$lib_search_path $dir" ;;
+	    esac
+	  done
+	  newlib_search_path=
+	fi
+
+	if test "$linkmode,$pass" != "prog,link"; then
+	  vars="deplibs"
+	else
+	  vars="compile_deplibs finalize_deplibs"
+	fi
+	for var in $vars dependency_libs; do
+	  # Add libraries to $var in reverse order
+	  eval tmp_libs=\"\$$var\"
+	  new_libs=
+	  for deplib in $tmp_libs; do
+	    case $deplib in
+	    -L*) new_libs="$deplib $new_libs" ;;
+	    *)
+	      case " $specialdeplibs " in
+	      *" $deplib "*) new_libs="$deplib $new_libs" ;;
+	      *)
+		case " $new_libs " in
+		*" $deplib "*) ;;
+		*) new_libs="$deplib $new_libs" ;;
+		esac
+		;;
+	      esac
+	      ;;
+	    esac
+	  done
+	  tmp_libs=
+	  for deplib in $new_libs; do
+	    case $deplib in
+	    -L*)
+	      case " $tmp_libs " in
+	      *" $deplib "*) ;;
+	      *) tmp_libs="$tmp_libs $deplib" ;;
+	      esac
+	      ;;
+	    *) tmp_libs="$tmp_libs $deplib" ;;
+	    esac
+	  done
+	  eval $var=\"$tmp_libs\"
+	done # for var
+      fi
+      if test "$pass" = "conv" &&
+       { test "$linkmode" = "lib" || test "$linkmode" = "prog"; }; then
+	libs="$deplibs" # reset libs
+	deplibs=
+      fi
+    done # for pass
+    if test $linkmode = prog; then
+      dlfiles="$newdlfiles"
+      dlprefiles="$newdlprefiles"
+    fi
+
+    case $linkmode in
+    oldlib)
+      if test -n "$dlfiles$dlprefiles" || test "$dlself" != no; then
+	$echo "$modename: warning: \`-dlopen' is ignored for archives" 1>&2
+      fi
+
+      if test -n "$rpath"; then
+	$echo "$modename: warning: \`-rpath' is ignored for archives" 1>&2
+      fi
+
+      if test -n "$xrpath"; then
+	$echo "$modename: warning: \`-R' is ignored for archives" 1>&2
+      fi
+
+      if test -n "$vinfo"; then
+	$echo "$modename: warning: \`-version-info' is ignored for archives" 1>&2
+      fi
+
+      if test -n "$release"; then
+	$echo "$modename: warning: \`-release' is ignored for archives" 1>&2
+      fi
+
+      if test -n "$export_symbols" || test -n "$export_symbols_regex"; then
+	$echo "$modename: warning: \`-export-symbols' is ignored for archives" 1>&2
+      fi
+
+      # Now set the variables for building old libraries.
+      build_libtool_libs=no
+      oldlibs="$output"
+      objs="$objs$old_deplibs"
+      ;;
+
+    lib)
+      # Make sure we only generate libraries of the form `libNAME.la'.
+      case $outputname in
+      lib*)
+	name=`$echo "X$outputname" | $Xsed -e 's/\.la$//' -e 's/^lib//'`
+	eval libname=\"$libname_spec\"
+	;;
+      *)
+	if test "$module" = no; then
+	  $echo "$modename: libtool library \`$output' must begin with \`lib'" 1>&2
+	  $echo "$help" 1>&2
+	  exit 1
+	fi
+	if test "$need_lib_prefix" != no; then
+	  # Add the "lib" prefix for modules if required
+	  name=`$echo "X$outputname" | $Xsed -e 's/\.la$//'`
+	  eval libname=\"$libname_spec\"
+	else
+	  libname=`$echo "X$outputname" | $Xsed -e 's/\.la$//'`
+	fi
+	;;
+      esac
+
+      if test -n "$objs"; then
+	if test "$deplibs_check_method" != pass_all; then
+	  $echo "$modename: cannot build libtool library \`$output' from non-libtool objects on this host:$objs" 2>&1
+	  exit 1
+	else
+	  echo
+	  echo "*** Warning: Linking the shared library $output against the non-libtool"
+	  echo "*** objects $objs is not portable!"
+	  libobjs="$libobjs $objs"
+	fi
+      fi
+
+      if test "$dlself" != no; then
+	$echo "$modename: warning: \`-dlopen self' is ignored for libtool libraries" 1>&2
+      fi
+
+      set dummy $rpath
+      if test $# -gt 2; then
+	$echo "$modename: warning: ignoring multiple \`-rpath's for a libtool library" 1>&2
+      fi
+      install_libdir="$2"
+
+      oldlibs=
+      if test -z "$rpath"; then
+	if test "$build_libtool_libs" = yes; then
+	  # Building a libtool convenience library.
+	  libext=al
+	  oldlibs="$output_objdir/$libname.$libext $oldlibs"
+	  build_libtool_libs=convenience
+	  build_old_libs=yes
+	fi
+
+	if test -n "$vinfo"; then
+	  $echo "$modename: warning: \`-version-info' is ignored for convenience libraries" 1>&2
+	fi
+
+	if test -n "$release"; then
+	  $echo "$modename: warning: \`-release' is ignored for convenience libraries" 1>&2
+	fi
+      else
+
+	# Parse the version information argument.
+	IFS="${IFS= 	}"; save_ifs="$IFS"; IFS=':'
+	set dummy $vinfo 0 0 0
+	IFS="$save_ifs"
+
+	if test -n "$8"; then
+	  $echo "$modename: too many parameters to \`-version-info'" 1>&2
+	  $echo "$help" 1>&2
+	  exit 1
+	fi
+
+	current="$2"
+	revision="$3"
+	age="$4"
+
+	# Check that each of the things are valid numbers.
+	case $current in
+	0 | [1-9] | [1-9][0-9] | [1-9][0-9][0-9]) ;;
+	*)
+	  $echo "$modename: CURRENT \`$current' is not a nonnegative integer" 1>&2
+	  $echo "$modename: \`$vinfo' is not valid version information" 1>&2
+	  exit 1
+	  ;;
+	esac
+
+	case $revision in
+	0 | [1-9] | [1-9][0-9] | [1-9][0-9][0-9]) ;;
+	*)
+	  $echo "$modename: REVISION \`$revision' is not a nonnegative integer" 1>&2
+	  $echo "$modename: \`$vinfo' is not valid version information" 1>&2
+	  exit 1
+	  ;;
+	esac
+
+	case $age in
+	0 | [1-9] | [1-9][0-9] | [1-9][0-9][0-9]) ;;
+	*)
+	  $echo "$modename: AGE \`$age' is not a nonnegative integer" 1>&2
+	  $echo "$modename: \`$vinfo' is not valid version information" 1>&2
+	  exit 1
+	  ;;
+	esac
+
+	if test $age -gt $current; then
+	  $echo "$modename: AGE \`$age' is greater than the current interface number \`$current'" 1>&2
+	  $echo "$modename: \`$vinfo' is not valid version information" 1>&2
+	  exit 1
+	fi
+
+	# Calculate the version variables.
+	major=
+	versuffix=
+	verstring=
+	case $version_type in
+	none) ;;
+
+	darwin)
+	  # Like Linux, but with the current version available in
+	  # verstring for coding it into the library header
+	  major=.`expr $current - $age`
+	  versuffix="$major.$age.$revision"
+	  # Darwin ld doesn't like 0 for these options...
+	  minor_current=`expr $current + 1`
+	  verstring="-compatibility_version $minor_current -current_version $minor_current.$revision"
+	  ;;
+
+	freebsd-aout)
+	  major=".$current"
+	  versuffix=".$current.$revision";
+	  ;;
+
+	freebsd-elf)
+	  major=".$current"
+	  versuffix=".$current";
+	  ;;
+
+	irix)
+	  major=`expr $current - $age + 1`
+	  verstring="sgi$major.$revision"
+
+	  # Add in all the interfaces that we are compatible with.
+	  loop=$revision
+	  while test $loop != 0; do
+	    iface=`expr $revision - $loop`
+	    loop=`expr $loop - 1`
+	    verstring="sgi$major.$iface:$verstring"
+	  done
+
+	  # Before this point, $major must not contain `.'.
+	  major=.$major
+	  versuffix="$major.$revision"
+	  ;;
+
+	linux)
+	  major=.`expr $current - $age`
+	  versuffix="$major.$age.$revision"
+	  ;;
+
+	osf)
+	  major=`expr $current - $age`
+	  versuffix=".$current.$age.$revision"
+	  verstring="$current.$age.$revision"
+
+	  # Add in all the interfaces that we are compatible with.
+	  loop=$age
+	  while test $loop != 0; do
+	    iface=`expr $current - $loop`
+	    loop=`expr $loop - 1`
+	    verstring="$verstring:${iface}.0"
+	  done
+
+	  # Make executables depend on our current version.
+	  verstring="$verstring:${current}.0"
+	  ;;
+
+	sunos)
+	  major=".$current"
+	  versuffix=".$current.$revision"
+	  ;;
+
+	windows)
+	  # Use '-' rather than '.', since we only want one
+	  # extension on DOS 8.3 filesystems.
+	  major=`expr $current - $age`
+	  versuffix="-$major"
+	  ;;
+
+	*)
+	  $echo "$modename: unknown library version type \`$version_type'" 1>&2
+	  echo "Fatal configuration error.  See the $PACKAGE docs for more information." 1>&2
+	  exit 1
+	  ;;
+	esac
+
+	# Clear the version info if we defaulted, and they specified a release.
+	if test -z "$vinfo" && test -n "$release"; then
+	  major=
+	  verstring="0.0"
+	  if test "$need_version" = no; then
+	    versuffix=
+	  else
+	    versuffix=".0.0"
+	  fi
+	fi
+
+	# Remove version info from name if versioning should be avoided
+	if test "$avoid_version" = yes && test "$need_version" = no; then
+	  major=
+	  versuffix=
+	  verstring=""
+	fi
+
+	# Check to see if the archive will have undefined symbols.
+	if test "$allow_undefined" = yes; then
+	  if test "$allow_undefined_flag" = unsupported; then
+	    $echo "$modename: warning: undefined symbols not allowed in $host shared libraries" 1>&2
+	    build_libtool_libs=no
+	    build_old_libs=yes
+	  fi
+	else
+	  # Don't allow undefined symbols.
+	  allow_undefined_flag="$no_undefined_flag"
+	fi
+      fi
+
+      if test "$mode" != relink; then
+	# Remove our outputs.
+	$show "${rm}r $output_objdir/$outputname $output_objdir/$libname.* $output_objdir/${libname}${release}.*"
+	$run ${rm}r $output_objdir/$outputname $output_objdir/$libname.* $output_objdir/${libname}${release}.*
+      fi
+
+      # Now set the variables for building old libraries.
+      if test "$build_old_libs" = yes && test "$build_libtool_libs" != convenience ; then
+	oldlibs="$oldlibs $output_objdir/$libname.$libext"
+
+	# Transform .lo files to .o files.
+	oldobjs="$objs "`$echo "X$libobjs" | $SP2NL | $Xsed -e '/\.'${libext}'$/d' -e "$lo2o" | $NL2SP`
+      fi
+
+      # Eliminate all temporary directories.
+      for path in $notinst_path; do
+	lib_search_path=`echo "$lib_search_path " | sed -e 's% $path % %g'`
+	deplibs=`echo "$deplibs " | sed -e 's% -L$path % %g'`
+	dependency_libs=`echo "$dependency_libs " | sed -e 's% -L$path % %g'`
+      done
+
+      if test -n "$xrpath"; then
+	# If the user specified any rpath flags, then add them.
+	temp_xrpath=
+	for libdir in $xrpath; do
+	  temp_xrpath="$temp_xrpath -R$libdir"
+	  case "$finalize_rpath " in
+	  *" $libdir "*) ;;
+	  *) finalize_rpath="$finalize_rpath $libdir" ;;
+	  esac
+	done
+	if test $hardcode_into_libs != yes || test $build_old_libs = yes; then
+	  dependency_libs="$temp_xrpath $dependency_libs"
+	fi
+      fi
+
+      # Make sure dlfiles contains only unique files that won't be dlpreopened
+      old_dlfiles="$dlfiles"
+      dlfiles=
+      for lib in $old_dlfiles; do
+	case " $dlprefiles $dlfiles " in
+	*" $lib "*) ;;
+	*) dlfiles="$dlfiles $lib" ;;
+	esac
+      done
+
+      # Make sure dlprefiles contains only unique files
+      old_dlprefiles="$dlprefiles"
+      dlprefiles=
+      for lib in $old_dlprefiles; do
+	case "$dlprefiles " in
+	*" $lib "*) ;;
+	*) dlprefiles="$dlprefiles $lib" ;;
+	esac
+      done
+
+      if test "$build_libtool_libs" = yes; then
+	if test -n "$rpath"; then
+	  case $host in
+	  *-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-os2* | *-*-beos*)
+	    # these systems don't actually have a c library (as such)!
+	    ;;
+	  *-*-rhapsody* | *-*-darwin1.[012])
+	    # Rhapsody C library is in the System framework
+	    deplibs="$deplibs -framework System"
+	    ;;
+	  *-*-netbsd*)
+	    # Don't link with libc until the a.out ld.so is fixed.
+	    ;;
+	  *)
+	    # Add libc to deplibs on all other systems if necessary.
+	    if test $build_libtool_need_lc = "yes"; then
+	      deplibs="$deplibs -lc"
+	    fi
+	    ;;
+	  esac
+	fi
+
+	# Transform deplibs into only deplibs that can be linked in shared.
+	name_save=$name
+	libname_save=$libname
+	release_save=$release
+	versuffix_save=$versuffix
+	major_save=$major
+	# I'm not sure if I'm treating the release correctly.  I think
+	# release should show up in the -l (ie -lgmp5) so we don't want to
+	# add it in twice.  Is that correct?
+	release=""
+	versuffix=""
+	major=""
+	newdeplibs=
+	droppeddeps=no
+	case $deplibs_check_method in
+	pass_all)
+	  # Don't check for shared/static.  Everything works.
+	  # This might be a little naive.  We might want to check
+	  # whether the library exists or not.  But this is on
+	  # osf3 & osf4 and I'm not really sure... Just
+	  # implementing what was already the behaviour.
+	  newdeplibs=$deplibs
+	  ;;
+	test_compile)
+	  # This code stresses the "libraries are programs" paradigm to its
+	  # limits. Maybe even breaks it.  We compile a program, linking it
+	  # against the deplibs as a proxy for the library.  Then we can check
+	  # whether they linked in statically or dynamically with ldd.
+	  $rm conftest.c
+	  cat > conftest.c <<EOF
+	  int main() { return 0; }
+EOF
+	  $rm conftest
+	  $CC -o conftest conftest.c $deplibs
+	  if test $? -eq 0 ; then
+	    ldd_output=`ldd conftest`
+	    for i in $deplibs; do
+	      name="`expr $i : '-l\(.*\)'`"
+	      # If $name is empty we are operating on a -L argument.
+	      if test -n "$name" && test "$name" != "0"; then
+		libname=`eval \\$echo \"$libname_spec\"`
+		deplib_matches=`eval \\$echo \"$library_names_spec\"`
+		set dummy $deplib_matches
+		deplib_match=$2
+		if test `expr "$ldd_output" : ".*$deplib_match"` -ne 0 ; then
+		  newdeplibs="$newdeplibs $i"
+		else
+		  droppeddeps=yes
+		  echo
+		  echo "*** Warning: This library needs some functionality provided by $i."
+		  echo "*** I have the capability to make that library automatically link in when"
+		  echo "*** you link to this library.  But I can only do this if you have a"
+		  echo "*** shared version of the library, which you do not appear to have."
+		fi
+	      else
+		newdeplibs="$newdeplibs $i"
+	      fi
+	    done
+	  else
+	    # Error occured in the first compile.  Let's try to salvage the situation:
+	    # Compile a seperate program for each library.
+	    for i in $deplibs; do
+	      name="`expr $i : '-l\(.*\)'`"
+	     # If $name is empty we are operating on a -L argument.
+	      if test -n "$name" && test "$name" != "0"; then
+		$rm conftest
+		$CC -o conftest conftest.c $i
+		# Did it work?
+		if test $? -eq 0 ; then
+		  ldd_output=`ldd conftest`
+		  libname=`eval \\$echo \"$libname_spec\"`
+		  deplib_matches=`eval \\$echo \"$library_names_spec\"`
+		  set dummy $deplib_matches
+		  deplib_match=$2
+		  if test `expr "$ldd_output" : ".*$deplib_match"` -ne 0 ; then
+		    newdeplibs="$newdeplibs $i"
+		  else
+		    droppeddeps=yes
+		    echo
+		    echo "*** Warning: This library needs some functionality provided by $i."
+		    echo "*** I have the capability to make that library automatically link in when"
+		    echo "*** you link to this library.  But I can only do this if you have a"
+		    echo "*** shared version of the library, which you do not appear to have."
+		  fi
+		else
+		  droppeddeps=yes
+		  echo
+		  echo "*** Warning!  Library $i is needed by this library but I was not able to"
+		  echo "***  make it link in!  You will probably need to install it or some"
+		  echo "*** library that it depends on before this library will be fully"
+		  echo "*** functional.  Installing it before continuing would be even better."
+		fi
+	      else
+		newdeplibs="$newdeplibs $i"
+	      fi
+	    done
+	  fi
+	  ;;
+	file_magic*)
+	  set dummy $deplibs_check_method
+	  file_magic_regex=`expr "$deplibs_check_method" : "$2 \(.*\)"`
+	  for a_deplib in $deplibs; do
+	    name="`expr $a_deplib : '-l\(.*\)'`"
+	    # If $name is empty we are operating on a -L argument.
+	    if test -n "$name" && test "$name" != "0"; then
+	      libname=`eval \\$echo \"$libname_spec\"`
+	      for i in $lib_search_path $sys_lib_search_path $shlib_search_path; do
+		    potential_libs=`ls $i/$libname[.-]* 2>/dev/null`
+		    for potent_lib in $potential_libs; do
+		      # Follow soft links.
+		      if ls -lLd "$potent_lib" 2>/dev/null \
+			 | grep " -> " >/dev/null; then
+			continue
+		      fi
+		      # The statement above tries to avoid entering an
+		      # endless loop below, in case of cyclic links.
+		      # We might still enter an endless loop, since a link
+		      # loop can be closed while we follow links,
+		      # but so what?
+		      potlib="$potent_lib"
+		      while test -h "$potlib" 2>/dev/null; do
+			potliblink=`ls -ld $potlib | sed 's/.* -> //'`
+			case $potliblink in
+			[\\/]* | [A-Za-z]:[\\/]*) potlib="$potliblink";;
+			*) potlib=`$echo "X$potlib" | $Xsed -e 's,[^/]*$,,'`"$potliblink";;
+			esac
+		      done
+		      if eval $file_magic_cmd \"\$potlib\" 2>/dev/null \
+			 | sed 10q \
+			 | egrep "$file_magic_regex" > /dev/null; then
+			newdeplibs="$newdeplibs $a_deplib"
+			a_deplib=""
+			break 2
+		      fi
+		    done
+	      done
+	      if test -n "$a_deplib" ; then
+		droppeddeps=yes
+		echo
+		echo "*** Warning: This library needs some functionality provided by $a_deplib."
+		echo "*** I have the capability to make that library automatically link in when"
+		echo "*** you link to this library.  But I can only do this if you have a"
+		echo "*** shared version of the library, which you do not appear to have."
+	      fi
+	    else
+	      # Add a -L argument.
+	      newdeplibs="$newdeplibs $a_deplib"
+	    fi
+	  done # Gone through all deplibs.
+	  ;;
+	match_pattern*)
+	  set dummy $deplibs_check_method
+	  match_pattern_regex=`expr "$deplibs_check_method" : "$2 \(.*\)"`
+	  for a_deplib in $deplibs; do
+	    name="`expr $a_deplib : '-l\(.*\)'`"
+	    # If $name is empty we are operating on a -L argument.
+	    if test -n "$name" && test "$name" != "0"; then
+	      libname=`eval \\$echo \"$libname_spec\"`
+	      for i in $lib_search_path $sys_lib_search_path $shlib_search_path; do
+		potential_libs=`ls $i/$libname[.-]* 2>/dev/null`
+		for potent_lib in $potential_libs; do
+		  if eval echo \"$potent_lib\" 2>/dev/null \
+		      | sed 10q \
+		      | egrep "$match_pattern_regex" > /dev/null; then
+		    newdeplibs="$newdeplibs $a_deplib"
+		    a_deplib=""
+		    break 2
+		  fi
+		done
+	      done
+	      if test -n "$a_deplib" ; then
+		droppeddeps=yes
+		echo
+		echo "*** Warning: This library needs some functionality provided by $a_deplib."
+		echo "*** I have the capability to make that library automatically link in when"
+		echo "*** you link to this library.  But I can only do this if you have a"
+		echo "*** shared version of the library, which you do not appear to have."
+	      fi
+	    else
+	      # Add a -L argument.
+	      newdeplibs="$newdeplibs $a_deplib"
+	    fi
+	  done # Gone through all deplibs.
+	  ;;
+	none | unknown | *)
+	  newdeplibs=""
+	  if $echo "X $deplibs" | $Xsed -e 's/ -lc$//' \
+	       -e 's/ -[LR][^ ]*//g' -e 's/[ 	]//g' |
+	     grep . >/dev/null; then
+	    echo
+	    if test "X$deplibs_check_method" = "Xnone"; then
+	      echo "*** Warning: inter-library dependencies are not supported in this platform."
+	    else
+	      echo "*** Warning: inter-library dependencies are not known to be supported."
+	    fi
+	    echo "*** All declared inter-library dependencies are being dropped."
+	    droppeddeps=yes
+	  fi
+	  ;;
+	esac
+	versuffix=$versuffix_save
+	major=$major_save
+	release=$release_save
+	libname=$libname_save
+	name=$name_save
+
+	case $host in
+	*-*-rhapsody* | *-*-darwin1.[012])
+	  # On Rhapsody replace the C library is the System framework
+	  newdeplibs=`$echo "X $newdeplibs" | $Xsed -e 's/ -lc / -framework System /'`
+	  ;;
+	esac
+
+	if test "$droppeddeps" = yes; then
+	  if test "$module" = yes; then
+	    echo
+	    echo "*** Warning: libtool could not satisfy all declared inter-library"
+	    echo "*** dependencies of module $libname.  Therefore, libtool will create"
+	    echo "*** a static module, that should work as long as the dlopening"
+	    echo "*** application is linked with the -dlopen flag."
+	    if test -z "$global_symbol_pipe"; then
+	      echo
+	      echo "*** However, this would only work if libtool was able to extract symbol"
+	      echo "*** lists from a program, using \`nm' or equivalent, but libtool could"
+	      echo "*** not find such a program.  So, this module is probably useless."
+	      echo "*** \`nm' from GNU binutils and a full rebuild may help."
+	    fi
+	    if test "$build_old_libs" = no; then
+	      oldlibs="$output_objdir/$libname.$libext"
+	      build_libtool_libs=module
+	      build_old_libs=yes
+	    else
+	      build_libtool_libs=no
+	    fi
+	  else
+	    echo "*** The inter-library dependencies that have been dropped here will be"
+	    echo "*** automatically added whenever a program is linked with this library"
+	    echo "*** or is declared to -dlopen it."
+
+	    if test $allow_undefined = no; then
+	      echo
+	      echo "*** Since this library must not contain undefined symbols,"
+	      echo "*** because either the platform does not support them or"
+	      echo "*** it was explicitly requested with -no-undefined,"
+	      echo "*** libtool will only create a static version of it."
+	      if test "$build_old_libs" = no; then
+		oldlibs="$output_objdir/$libname.$libext"
+		build_libtool_libs=module
+		build_old_libs=yes
+	      else
+		build_libtool_libs=no
+	      fi
+	    fi
+	  fi
+	fi
+	# Done checking deplibs!
+	deplibs=$newdeplibs
+      fi
+
+      # All the library-specific variables (install_libdir is set above).
+      library_names=
+      old_library=
+      dlname=
+
+      # Test again, we may have decided not to build it any more
+      if test "$build_libtool_libs" = yes; then
+	if test $hardcode_into_libs = yes; then
+	  # Hardcode the library paths
+	  hardcode_libdirs=
+	  dep_rpath=
+	  rpath="$finalize_rpath"
+	  test "$mode" != relink && rpath="$compile_rpath$rpath"
+	  for libdir in $rpath; do
+	    if test -n "$hardcode_libdir_flag_spec"; then
+	      if test -n "$hardcode_libdir_separator"; then
+		if test -z "$hardcode_libdirs"; then
+		  hardcode_libdirs="$libdir"
+		else
+		  # Just accumulate the unique libdirs.
+		  case $hardcode_libdir_separator$hardcode_libdirs$hardcode_libdir_separator in
+		  *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
+		    ;;
+		  *)
+		    hardcode_libdirs="$hardcode_libdirs$hardcode_libdir_separator$libdir"
+		    ;;
+		  esac
+		fi
+	      else
+		eval flag=\"$hardcode_libdir_flag_spec\"
+		dep_rpath="$dep_rpath $flag"
+	      fi
+	    elif test -n "$runpath_var"; then
+	      case "$perm_rpath " in
+	      *" $libdir "*) ;;
+	      *) perm_rpath="$perm_rpath $libdir" ;;
+	      esac
+	    fi
+	  done
+	  # Substitute the hardcoded libdirs into the rpath.
+	  if test -n "$hardcode_libdir_separator" &&
+	     test -n "$hardcode_libdirs"; then
+	    libdir="$hardcode_libdirs"
+	    eval dep_rpath=\"$hardcode_libdir_flag_spec\"
+	  fi
+	  if test -n "$runpath_var" && test -n "$perm_rpath"; then
+	    # We should set the runpath_var.
+	    rpath=
+	    for dir in $perm_rpath; do
+	      rpath="$rpath$dir:"
+	    done
+	    eval "$runpath_var='$rpath\$$runpath_var'; export $runpath_var"
+	  fi
+	  test -n "$dep_rpath" && deplibs="$dep_rpath $deplibs"
+	fi
+
+	shlibpath="$finalize_shlibpath"
+	test "$mode" != relink && shlibpath="$compile_shlibpath$shlibpath"
+	if test -n "$shlibpath"; then
+	  eval "$shlibpath_var='$shlibpath\$$shlibpath_var'; export $shlibpath_var"
+	fi
+
+	# Get the real and link names of the library.
+	eval library_names=\"$library_names_spec\"
+	set dummy $library_names
+	realname="$2"
+	shift; shift
+
+	if test -n "$soname_spec"; then
+	  eval soname=\"$soname_spec\"
+	else
+	  soname="$realname"
+	fi
+	test -z "$dlname" && dlname=$soname
+
+	lib="$output_objdir/$realname"
+	for link
+	do
+	  linknames="$linknames $link"
+	done
+
+	# Ensure that we have .o objects for linkers which dislike .lo
+	# (e.g. aix) in case we are running --disable-static
+	for obj in $libobjs; do
+	  xdir=`$echo "X$obj" | $Xsed -e 's%/[^/]*$%%'`
+	  if test "X$xdir" = "X$obj"; then
+	    xdir="."
+	  else
+	    xdir="$xdir"
+	  fi
+	  baseobj=`$echo "X$obj" | $Xsed -e 's%^.*/%%'`
+	  oldobj=`$echo "X$baseobj" | $Xsed -e "$lo2o"`
+	  if test ! -f $xdir/$oldobj; then
+	    $show "(cd $xdir && ${LN_S} $baseobj $oldobj)"
+	    $run eval '(cd $xdir && ${LN_S} $baseobj $oldobj)' || exit $?
+	  fi
+	done
+
+	# Use standard objects if they are pic
+	test -z "$pic_flag" && libobjs=`$echo "X$libobjs" | $SP2NL | $Xsed -e "$lo2o" | $NL2SP`
+
+	# Prepare the list of exported symbols
+	if test -z "$export_symbols"; then
+	  if test "$always_export_symbols" = yes || test -n "$export_symbols_regex"; then
+	    $show "generating symbol list for \`$libname.la'"
+	    export_symbols="$output_objdir/$libname.exp"
+	    $run $rm $export_symbols
+	    eval cmds=\"$export_symbols_cmds\"
+	    IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	    for cmd in $cmds; do
+	      IFS="$save_ifs"
+	      $show "$cmd"
+	      $run eval "$cmd" || exit $?
+	    done
+	    IFS="$save_ifs"
+	    if test -n "$export_symbols_regex"; then
+	      $show "egrep -e \"$export_symbols_regex\" \"$export_symbols\" > \"${export_symbols}T\""
+	      $run eval 'egrep -e "$export_symbols_regex" "$export_symbols" > "${export_symbols}T"'
+	      $show "$mv \"${export_symbols}T\" \"$export_symbols\""
+	      $run eval '$mv "${export_symbols}T" "$export_symbols"'
+	    fi
+	  fi
+	fi
+
+	if test -n "$export_symbols" && test -n "$include_expsyms"; then
+	  $run eval '$echo "X$include_expsyms" | $SP2NL >> "$export_symbols"'
+	fi
+
+	if test -n "$convenience"; then
+	  if test -n "$whole_archive_flag_spec"; then
+	    eval libobjs=\"\$libobjs $whole_archive_flag_spec\"
+	  else
+	    gentop="$output_objdir/${outputname}x"
+	    $show "${rm}r $gentop"
+	    $run ${rm}r "$gentop"
+	    $show "mkdir $gentop"
+	    $run mkdir "$gentop"
+	    status=$?
+	    if test $status -ne 0 && test ! -d "$gentop"; then
+	      exit $status
+	    fi
+	    generated="$generated $gentop"
+
+	    for xlib in $convenience; do
+	      # Extract the objects.
+	      case $xlib in
+	      [\\/]* | [A-Za-z]:[\\/]*) xabs="$xlib" ;;
+	      *) xabs=`pwd`"/$xlib" ;;
+	      esac
+	      xlib=`$echo "X$xlib" | $Xsed -e 's%^.*/%%'`
+	      xdir="$gentop/$xlib"
+
+	      $show "${rm}r $xdir"
+	      $run ${rm}r "$xdir"
+	      $show "mkdir $xdir"
+	      $run mkdir "$xdir"
+	      status=$?
+	      if test $status -ne 0 && test ! -d "$xdir"; then
+		exit $status
+	      fi
+	      $show "(cd $xdir && $AR x $xabs)"
+	      $run eval "(cd \$xdir && $AR x \$xabs)" || exit $?
+
+	      libobjs="$libobjs "`find $xdir -name \*.o -print -o -name \*.lo -print | $NL2SP`
+	    done
+	  fi
+	fi
+
+	if test "$thread_safe" = yes && test -n "$thread_safe_flag_spec"; then
+	  eval flag=\"$thread_safe_flag_spec\"
+	  linker_flags="$linker_flags $flag"
+	fi
+
+	# Make a backup of the uninstalled library when relinking
+	if test "$mode" = relink; then
+	  $run eval '(cd $output_objdir && $rm ${realname}U && $mv $realname ${realname}U)' || exit $?
+	fi
+
+	# Do each of the archive commands.
+	if test -n "$export_symbols" && test -n "$archive_expsym_cmds"; then
+	  eval cmds=\"$archive_expsym_cmds\"
+	else
+	  eval cmds=\"$archive_cmds\"
+	fi
+	IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	for cmd in $cmds; do
+	  IFS="$save_ifs"
+	  $show "$cmd"
+	  $run eval "$cmd" || exit $?
+	done
+	IFS="$save_ifs"
+
+	# Restore the uninstalled library and exit
+	if test "$mode" = relink; then
+	  $run eval '(cd $output_objdir && $rm ${realname}T && $mv $realname ${realname}T && $mv "$realname"U $realname)' || exit $?
+	  exit 0
+	fi
+
+	# Create links to the real library.
+	for linkname in $linknames; do
+	  if test "$realname" != "$linkname"; then
+	    $show "(cd $output_objdir && $rm $linkname && $LN_S $realname $linkname)"
+	    $run eval '(cd $output_objdir && $rm $linkname && $LN_S $realname $linkname)' || exit $?
+	  fi
+	done
+
+	# If -module or -export-dynamic was specified, set the dlname.
+	if test "$module" = yes || test "$export_dynamic" = yes; then
+	  # On all known operating systems, these are identical.
+	  dlname="$soname"
+	fi
+      fi
+      ;;
+
+    obj)
+      if test -n "$deplibs"; then
+	$echo "$modename: warning: \`-l' and \`-L' are ignored for objects" 1>&2
+      fi
+
+      if test -n "$dlfiles$dlprefiles" || test "$dlself" != no; then
+	$echo "$modename: warning: \`-dlopen' is ignored for objects" 1>&2
+      fi
+
+      if test -n "$rpath"; then
+	$echo "$modename: warning: \`-rpath' is ignored for objects" 1>&2
+      fi
+
+      if test -n "$xrpath"; then
+	$echo "$modename: warning: \`-R' is ignored for objects" 1>&2
+      fi
+
+      if test -n "$vinfo"; then
+	$echo "$modename: warning: \`-version-info' is ignored for objects" 1>&2
+      fi
+
+      if test -n "$release"; then
+	$echo "$modename: warning: \`-release' is ignored for objects" 1>&2
+      fi
+
+      case $output in
+      *.lo)
+	if test -n "$objs$old_deplibs"; then
+	  $echo "$modename: cannot build library object \`$output' from non-libtool objects" 1>&2
+	  exit 1
+	fi
+	libobj="$output"
+	obj=`$echo "X$output" | $Xsed -e "$lo2o"`
+	;;
+      *)
+	libobj=
+	obj="$output"
+	;;
+      esac
+
+      # Delete the old objects.
+      $run $rm $obj $libobj
+
+      # Objects from convenience libraries.  This assumes
+      # single-version convenience libraries.  Whenever we create
+      # different ones for PIC/non-PIC, this we'll have to duplicate
+      # the extraction.
+      reload_conv_objs=
+      gentop=
+      # reload_cmds runs $LD directly, so let us get rid of
+      # -Wl from whole_archive_flag_spec
+      wl=
+
+      if test -n "$convenience"; then
+	if test -n "$whole_archive_flag_spec"; then
+	  eval reload_conv_objs=\"\$reload_objs $whole_archive_flag_spec\"
+	else
+	  gentop="$output_objdir/${obj}x"
+	  $show "${rm}r $gentop"
+	  $run ${rm}r "$gentop"
+	  $show "mkdir $gentop"
+	  $run mkdir "$gentop"
+	  status=$?
+	  if test $status -ne 0 && test ! -d "$gentop"; then
+	    exit $status
+	  fi
+	  generated="$generated $gentop"
+
+	  for xlib in $convenience; do
+	    # Extract the objects.
+	    case $xlib in
+	    [\\/]* | [A-Za-z]:[\\/]*) xabs="$xlib" ;;
+	    *) xabs=`pwd`"/$xlib" ;;
+	    esac
+	    xlib=`$echo "X$xlib" | $Xsed -e 's%^.*/%%'`
+	    xdir="$gentop/$xlib"
+
+	    $show "${rm}r $xdir"
+	    $run ${rm}r "$xdir"
+	    $show "mkdir $xdir"
+	    $run mkdir "$xdir"
+	    status=$?
+	    if test $status -ne 0 && test ! -d "$xdir"; then
+	      exit $status
+	    fi
+	    $show "(cd $xdir && $AR x $xabs)"
+	    $run eval "(cd \$xdir && $AR x \$xabs)" || exit $?
+
+	    reload_conv_objs="$reload_objs "`find $xdir -name \*.o -print -o -name \*.lo -print | $NL2SP`
+	  done
+	fi
+      fi
+
+      # Create the old-style object.
+      reload_objs="$objs$old_deplibs "`$echo "X$libobjs" | $SP2NL | $Xsed -e '/\.'${libext}$'/d' -e '/\.lib$/d' -e "$lo2o" | $NL2SP`" $reload_conv_objs" ### testsuite: skip nested quoting test
+
+      output="$obj"
+      eval cmds=\"$reload_cmds\"
+      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+      for cmd in $cmds; do
+	IFS="$save_ifs"
+	$show "$cmd"
+	$run eval "$cmd" || exit $?
+      done
+      IFS="$save_ifs"
+
+      # Exit if we aren't doing a library object file.
+      if test -z "$libobj"; then
+	if test -n "$gentop"; then
+	  $show "${rm}r $gentop"
+	  $run ${rm}r $gentop
+	fi
+
+	exit 0
+      fi
+
+      if test "$build_libtool_libs" != yes; then
+	if test -n "$gentop"; then
+	  $show "${rm}r $gentop"
+	  $run ${rm}r $gentop
+	fi
+
+	# Create an invalid libtool object if no PIC, so that we don't
+	# accidentally link it into a program.
+	$show "echo timestamp > $libobj"
+	$run eval "echo timestamp > $libobj" || exit $?
+	exit 0
+      fi
+
+      if test -n "$pic_flag" || test "$pic_mode" != default; then
+	# Only do commands if we really have different PIC objects.
+	reload_objs="$libobjs $reload_conv_objs"
+	output="$libobj"
+	eval cmds=\"$reload_cmds\"
+	IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	for cmd in $cmds; do
+	  IFS="$save_ifs"
+	  $show "$cmd"
+	  $run eval "$cmd" || exit $?
+	done
+	IFS="$save_ifs"
+      else
+	# Just create a symlink.
+	$show $rm $libobj
+	$run $rm $libobj
+	xdir=`$echo "X$libobj" | $Xsed -e 's%/[^/]*$%%'`
+	if test "X$xdir" = "X$libobj"; then
+	  xdir="."
+	else
+	  xdir="$xdir"
+	fi
+	baseobj=`$echo "X$libobj" | $Xsed -e 's%^.*/%%'`
+	oldobj=`$echo "X$baseobj" | $Xsed -e "$lo2o"`
+	$show "(cd $xdir && $LN_S $oldobj $baseobj)"
+	$run eval '(cd $xdir && $LN_S $oldobj $baseobj)' || exit $?
+      fi
+
+      if test -n "$gentop"; then
+	$show "${rm}r $gentop"
+	$run ${rm}r $gentop
+      fi
+
+      exit 0
+      ;;
+
+    prog)
+      case $host in
+	*cygwin*) output=`echo $output | sed -e 's,.exe$,,;s,$,.exe,'` ;;
+      esac
+      if test -n "$vinfo"; then
+	$echo "$modename: warning: \`-version-info' is ignored for programs" 1>&2
+      fi
+
+      if test -n "$release"; then
+	$echo "$modename: warning: \`-release' is ignored for programs" 1>&2
+      fi
+
+      if test "$preload" = yes; then
+	if test "$dlopen_support" = unknown && test "$dlopen_self" = unknown &&
+	   test "$dlopen_self_static" = unknown; then
+	  $echo "$modename: warning: \`AC_LIBTOOL_DLOPEN' not used. Assuming no dlopen support."
+	fi
+      fi
+
+      case $host in
+      *-*-rhapsody* | *-*-darwin1.[012])
+	# On Rhapsody replace the C library is the System framework
+	compile_deplibs=`$echo "X $compile_deplibs" | $Xsed -e 's/ -lc / -framework System /'`
+	finalize_deplibs=`$echo "X $finalize_deplibs" | $Xsed -e 's/ -lc / -framework System /'`
+	;;
+      esac
+
+      compile_command="$compile_command $compile_deplibs"
+      finalize_command="$finalize_command $finalize_deplibs"
+
+      if test -n "$rpath$xrpath"; then
+	# If the user specified any rpath flags, then add them.
+	for libdir in $rpath $xrpath; do
+	  # This is the magic to use -rpath.
+	  case "$finalize_rpath " in
+	  *" $libdir "*) ;;
+	  *) finalize_rpath="$finalize_rpath $libdir" ;;
+	  esac
+	done
+      fi
+
+      # Now hardcode the library paths
+      rpath=
+      hardcode_libdirs=
+      for libdir in $compile_rpath $finalize_rpath; do
+	if test -n "$hardcode_libdir_flag_spec"; then
+	  if test -n "$hardcode_libdir_separator"; then
+	    if test -z "$hardcode_libdirs"; then
+	      hardcode_libdirs="$libdir"
+	    else
+	      # Just accumulate the unique libdirs.
+	      case $hardcode_libdir_separator$hardcode_libdirs$hardcode_libdir_separator in
+	      *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
+		;;
+	      *)
+		hardcode_libdirs="$hardcode_libdirs$hardcode_libdir_separator$libdir"
+		;;
+	      esac
+	    fi
+	  else
+	    eval flag=\"$hardcode_libdir_flag_spec\"
+	    rpath="$rpath $flag"
+	  fi
+	elif test -n "$runpath_var"; then
+	  case "$perm_rpath " in
+	  *" $libdir "*) ;;
+	  *) perm_rpath="$perm_rpath $libdir" ;;
+	  esac
+	fi
+	case $host in
+	*-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-os2*)
+	  case :$dllsearchpath: in
+	  *":$libdir:"*) ;;
+	  *) dllsearchpath="$dllsearchpath:$libdir";;
+	  esac
+	  ;;
+	esac
+      done
+      # Substitute the hardcoded libdirs into the rpath.
+      if test -n "$hardcode_libdir_separator" &&
+	 test -n "$hardcode_libdirs"; then
+	libdir="$hardcode_libdirs"
+	eval rpath=\" $hardcode_libdir_flag_spec\"
+      fi
+      compile_rpath="$rpath"
+
+      rpath=
+      hardcode_libdirs=
+      for libdir in $finalize_rpath; do
+	if test -n "$hardcode_libdir_flag_spec"; then
+	  if test -n "$hardcode_libdir_separator"; then
+	    if test -z "$hardcode_libdirs"; then
+	      hardcode_libdirs="$libdir"
+	    else
+	      # Just accumulate the unique libdirs.
+	      case $hardcode_libdir_separator$hardcode_libdirs$hardcode_libdir_separator in
+	      *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
+		;;
+	      *)
+		hardcode_libdirs="$hardcode_libdirs$hardcode_libdir_separator$libdir"
+		;;
+	      esac
+	    fi
+	  else
+	    eval flag=\"$hardcode_libdir_flag_spec\"
+	    rpath="$rpath $flag"
+	  fi
+	elif test -n "$runpath_var"; then
+	  case "$finalize_perm_rpath " in
+	  *" $libdir "*) ;;
+	  *) finalize_perm_rpath="$finalize_perm_rpath $libdir" ;;
+	  esac
+	fi
+      done
+      # Substitute the hardcoded libdirs into the rpath.
+      if test -n "$hardcode_libdir_separator" &&
+	 test -n "$hardcode_libdirs"; then
+	libdir="$hardcode_libdirs"
+	eval rpath=\" $hardcode_libdir_flag_spec\"
+      fi
+      finalize_rpath="$rpath"
+
+      if test -n "$libobjs" && test "$build_old_libs" = yes; then
+	# Transform all the library objects into standard objects.
+	compile_command=`$echo "X$compile_command" | $SP2NL | $Xsed -e "$lo2o" | $NL2SP`
+	finalize_command=`$echo "X$finalize_command" | $SP2NL | $Xsed -e "$lo2o" | $NL2SP`
+      fi
+
+      dlsyms=
+      if test -n "$dlfiles$dlprefiles" || test "$dlself" != no; then
+	if test -n "$NM" && test -n "$global_symbol_pipe"; then
+	  dlsyms="${outputname}S.c"
+	else
+	  $echo "$modename: not configured to extract global symbols from dlpreopened files" 1>&2
+	fi
+      fi
+
+      if test -n "$dlsyms"; then
+	case $dlsyms in
+	"") ;;
+	*.c)
+	  # Discover the nlist of each of the dlfiles.
+	  nlist="$output_objdir/${outputname}.nm"
+
+	  $show "$rm $nlist ${nlist}S ${nlist}T"
+	  $run $rm "$nlist" "${nlist}S" "${nlist}T"
+
+	  # Parse the name list into a source file.
+	  $show "creating $output_objdir/$dlsyms"
+
+	  test -z "$run" && $echo > "$output_objdir/$dlsyms" "\
+/* $dlsyms - symbol resolution table for \`$outputname' dlsym emulation. */
+/* Generated by $PROGRAM - GNU $PACKAGE $VERSION$TIMESTAMP */
+
+#ifdef __cplusplus
+extern \"C\" {
+#endif
+
+/* Prevent the only kind of declaration conflicts we can make. */
+#define lt_preloaded_symbols some_other_symbol
+
+/* External symbol declarations for the compiler. */\
+"
+
+	  if test "$dlself" = yes; then
+	    $show "generating symbol list for \`$output'"
+
+	    test -z "$run" && $echo ': @PROGRAM@ ' > "$nlist"
+
+	    # Add our own program objects to the symbol list.
+	    progfiles=`$echo "X$objs$old_deplibs" | $SP2NL | $Xsed -e "$lo2o" | $NL2SP`
+	    for arg in $progfiles; do
+	      $show "extracting global C symbols from \`$arg'"
+	      $run eval "$NM $arg | $global_symbol_pipe >> '$nlist'"
+	    done
+
+	    if test -n "$exclude_expsyms"; then
+	      $run eval 'egrep -v " ($exclude_expsyms)$" "$nlist" > "$nlist"T'
+	      $run eval '$mv "$nlist"T "$nlist"'
+	    fi
+
+	    if test -n "$export_symbols_regex"; then
+	      $run eval 'egrep -e "$export_symbols_regex" "$nlist" > "$nlist"T'
+	      $run eval '$mv "$nlist"T "$nlist"'
+	    fi
+
+	    # Prepare the list of exported symbols
+	    if test -z "$export_symbols"; then
+	      export_symbols="$output_objdir/$output.exp"
+	      $run $rm $export_symbols
+	      $run eval "sed -n -e '/^: @PROGRAM@$/d' -e 's/^.* \(.*\)$/\1/p' "'< "$nlist" > "$export_symbols"'
+	    else
+	      $run eval "sed -e 's/\([][.*^$]\)/\\\1/g' -e 's/^/ /' -e 's/$/$/'"' < "$export_symbols" > "$output_objdir/$output.exp"'
+	      $run eval 'grep -f "$output_objdir/$output.exp" < "$nlist" > "$nlist"T'
+	      $run eval 'mv "$nlist"T "$nlist"'
+	    fi
+	  fi
+
+	  for arg in $dlprefiles; do
+	    $show "extracting global C symbols from \`$arg'"
+	    name=`echo "$arg" | sed -e 's%^.*/%%'`
+	    $run eval 'echo ": $name " >> "$nlist"'
+	    $run eval "$NM $arg | $global_symbol_pipe >> '$nlist'"
+	  done
+
+	  if test -z "$run"; then
+	    # Make sure we have at least an empty file.
+	    test -f "$nlist" || : > "$nlist"
+
+	    if test -n "$exclude_expsyms"; then
+	      egrep -v " ($exclude_expsyms)$" "$nlist" > "$nlist"T
+	      $mv "$nlist"T "$nlist"
+	    fi
+
+	    # Try sorting and uniquifying the output.
+	    if grep -v "^: " < "$nlist" | sort +2 | uniq > "$nlist"S; then
+	      :
+	    else
+	      grep -v "^: " < "$nlist" > "$nlist"S
+	    fi
+
+	    if test -f "$nlist"S; then
+	      eval "$global_symbol_to_cdecl"' < "$nlist"S >> "$output_objdir/$dlsyms"'
+	    else
+	      echo '/* NONE */' >> "$output_objdir/$dlsyms"
+	    fi
+
+	    $echo >> "$output_objdir/$dlsyms" "\
+
+#undef lt_preloaded_symbols
+
+#if defined (__STDC__) && __STDC__
+# define lt_ptr_t void *
+#else
+# define lt_ptr_t char *
+# define const
+#endif
+
+/* The mapping between symbol names and symbols. */
+const struct {
+  const char *name;
+  lt_ptr_t address;
+}
+lt_preloaded_symbols[] =
+{\
+"
+
+	    sed -n -e 's/^: \([^ ]*\) $/  {\"\1\", (lt_ptr_t) 0},/p' \
+		-e 's/^. \([^ ]*\) \([^ ]*\)$/  {"\2", (lt_ptr_t) \&\2},/p' \
+		  < "$nlist" >> "$output_objdir/$dlsyms"
+
+	    $echo >> "$output_objdir/$dlsyms" "\
+  {0, (lt_ptr_t) 0}
+};
+
+/* This works around a problem in FreeBSD linker */
+#ifdef FREEBSD_WORKAROUND
+static const void *lt_preloaded_setup() {
+  return lt_preloaded_symbols;
+}
+#endif
+
+#ifdef __cplusplus
+}
+#endif\
+"
+	  fi
+
+	  pic_flag_for_symtable=
+	  case $host in
+	  # compiling the symbol table file with pic_flag works around
+	  # a FreeBSD bug that causes programs to crash when -lm is
+	  # linked before any other PIC object.  But we must not use
+	  # pic_flag when linking with -static.  The problem exists in
+	  # FreeBSD 2.2.6 and is fixed in FreeBSD 3.1.
+	  *-*-freebsd2*|*-*-freebsd3.0*|*-*-freebsdelf3.0*)
+	    case "$compile_command " in
+	    *" -static "*) ;;
+	    *) pic_flag_for_symtable=" $pic_flag -DPIC -DFREEBSD_WORKAROUND";;
+	    esac;;
+	  *-*-hpux*)
+	    case "$compile_command " in
+	    *" -static "*) ;;
+	    *) pic_flag_for_symtable=" $pic_flag -DPIC";;
+	    esac
+	  esac
+
+	  # Now compile the dynamic symbol file.
+	  $show "(cd $output_objdir && $CC -c$no_builtin_flag$pic_flag_for_symtable \"$dlsyms\")"
+	  $run eval '(cd $output_objdir && $CC -c$no_builtin_flag$pic_flag_for_symtable "$dlsyms")' || exit $?
+
+	  # Clean up the generated files.
+	  $show "$rm $output_objdir/$dlsyms $nlist ${nlist}S ${nlist}T"
+	  $run $rm "$output_objdir/$dlsyms" "$nlist" "${nlist}S" "${nlist}T"
+
+	  # Transform the symbol file into the correct name.
+	  compile_command=`$echo "X$compile_command" | $Xsed -e "s%@SYMFILE@%$output_objdir/${outputname}S.${objext}%"`
+	  finalize_command=`$echo "X$finalize_command" | $Xsed -e "s%@SYMFILE@%$output_objdir/${outputname}S.${objext}%"`
+	  ;;
+	*)
+	  $echo "$modename: unknown suffix for \`$dlsyms'" 1>&2
+	  exit 1
+	  ;;
+	esac
+      else
+	# We keep going just in case the user didn't refer to
+	# lt_preloaded_symbols.  The linker will fail if global_symbol_pipe
+	# really was required.
+
+	# Nullify the symbol file.
+	compile_command=`$echo "X$compile_command" | $Xsed -e "s% @SYMFILE@%%"`
+	finalize_command=`$echo "X$finalize_command" | $Xsed -e "s% @SYMFILE@%%"`
+      fi
+
+      if test $need_relink = no || test "$build_libtool_libs" != yes; then
+	# Replace the output file specification.
+	compile_command=`$echo "X$compile_command" | $Xsed -e 's%@OUTPUT@%'"$output"'%g'`
+	link_command="$compile_command$compile_rpath"
+
+	# We have no uninstalled library dependencies, so finalize right now.
+	$show "$link_command"
+	$run eval "$link_command"
+	status=$?
+
+	# Delete the generated files.
+	if test -n "$dlsyms"; then
+	  $show "$rm $output_objdir/${outputname}S.${objext}"
+	  $run $rm "$output_objdir/${outputname}S.${objext}"
+	fi
+
+	exit $status
+      fi
+
+      if test -n "$shlibpath_var"; then
+	# We should set the shlibpath_var
+	rpath=
+	for dir in $temp_rpath; do
+	  case $dir in
+	  [\\/]* | [A-Za-z]:[\\/]*)
+	    # Absolute path.
+	    rpath="$rpath$dir:"
+	    ;;
+	  *)
+	    # Relative path: add a thisdir entry.
+	    rpath="$rpath\$thisdir/$dir:"
+	    ;;
+	  esac
+	done
+	temp_rpath="$rpath"
+      fi
+
+      if test -n "$compile_shlibpath$finalize_shlibpath"; then
+	compile_command="$shlibpath_var=\"$compile_shlibpath$finalize_shlibpath\$$shlibpath_var\" $compile_command"
+      fi
+      if test -n "$finalize_shlibpath"; then
+	finalize_command="$shlibpath_var=\"$finalize_shlibpath\$$shlibpath_var\" $finalize_command"
+      fi
+
+      compile_var=
+      finalize_var=
+      if test -n "$runpath_var"; then
+	if test -n "$perm_rpath"; then
+	  # We should set the runpath_var.
+	  rpath=
+	  for dir in $perm_rpath; do
+	    rpath="$rpath$dir:"
+	  done
+	  compile_var="$runpath_var=\"$rpath\$$runpath_var\" "
+	fi
+	if test -n "$finalize_perm_rpath"; then
+	  # We should set the runpath_var.
+	  rpath=
+	  for dir in $finalize_perm_rpath; do
+	    rpath="$rpath$dir:"
+	  done
+	  finalize_var="$runpath_var=\"$rpath\$$runpath_var\" "
+	fi
+      fi
+
+      if test "$no_install" = yes; then
+	# We don't need to create a wrapper script.
+	link_command="$compile_var$compile_command$compile_rpath"
+	# Replace the output file specification.
+	link_command=`$echo "X$link_command" | $Xsed -e 's%@OUTPUT@%'"$output"'%g'`
+	# Delete the old output file.
+	$run $rm $output
+	# Link the executable and exit
+	$show "$link_command"
+	$run eval "$link_command" || exit $?
+	exit 0
+      fi
+
+      if test "$hardcode_action" = relink; then
+	# Fast installation is not supported
+	link_command="$compile_var$compile_command$compile_rpath"
+	relink_command="$finalize_var$finalize_command$finalize_rpath"
+
+	$echo "$modename: warning: this platform does not like uninstalled shared libraries" 1>&2
+	$echo "$modename: \`$output' will be relinked during installation" 1>&2
+      else
+	if test "$fast_install" != no; then
+	  link_command="$finalize_var$compile_command$finalize_rpath"
+	  if test "$fast_install" = yes; then
+	    relink_command=`$echo "X$compile_var$compile_command$compile_rpath" | $Xsed -e 's%@OUTPUT@%\$progdir/\$file%g'`
+	  else
+	    # fast_install is set to needless
+	    relink_command=
+	  fi
+	else
+	  link_command="$compile_var$compile_command$compile_rpath"
+	  relink_command="$finalize_var$finalize_command$finalize_rpath"
+	fi
+      fi
+
+      # Replace the output file specification.
+      link_command=`$echo "X$link_command" | $Xsed -e 's%@OUTPUT@%'"$output_objdir/$outputname"'%g'`
+
+      # Delete the old output files.
+      $run $rm $output $output_objdir/$outputname $output_objdir/lt-$outputname
+
+      $show "$link_command"
+      $run eval "$link_command" || exit $?
+
+      # Now create the wrapper script.
+      $show "creating $output"
+
+      # Quote the relink command for shipping.
+      if test -n "$relink_command"; then
+	# Preserve any variables that may affect compiler behavior
+	for var in $variables_saved_for_relink; do
+	  if eval test -z \"\${$var+set}\"; then
+	    relink_command="{ test -z \"\${$var+set}\" || unset $var || { $var=; export $var; }; }; $relink_command"
+	  elif eval var_value=\$$var; test -z "$var_value"; then
+	    relink_command="$var=; export $var; $relink_command"
+	  else
+	    var_value=`$echo "X$var_value" | $Xsed -e "$sed_quote_subst"`
+	    relink_command="$var=\"$var_value\"; export $var; $relink_command"
+	  fi
+	done
+	relink_command="cd `pwd`; $relink_command"
+	relink_command=`$echo "X$relink_command" | $Xsed -e "$sed_quote_subst"`
+      fi
+
+      # Quote $echo for shipping.
+      if test "X$echo" = "X$SHELL $0 --fallback-echo"; then
+	case $0 in
+	[\\/]* | [A-Za-z]:[\\/]*) qecho="$SHELL $0 --fallback-echo";;
+	*) qecho="$SHELL `pwd`/$0 --fallback-echo";;
+	esac
+	qecho=`$echo "X$qecho" | $Xsed -e "$sed_quote_subst"`
+      else
+	qecho=`$echo "X$echo" | $Xsed -e "$sed_quote_subst"`
+      fi
+
+      # Only actually do things if our run command is non-null.
+      if test -z "$run"; then
+	# win32 will think the script is a binary if it has
+	# a .exe suffix, so we strip it off here.
+	case $output in
+	  *.exe) output=`echo $output|sed 's,.exe$,,'` ;;
+	esac
+	# test for cygwin because mv fails w/o .exe extensions
+	case $host in
+	  *cygwin*) exeext=.exe ;;
+	  *) exeext= ;;
+	esac
+	$rm $output
+	trap "$rm $output; exit 1" 1 2 15
+
+	$echo > $output "\
+#! $SHELL
+
+# $output - temporary wrapper script for $objdir/$outputname
+# Generated by $PROGRAM - GNU $PACKAGE $VERSION$TIMESTAMP
+#
+# The $output program cannot be directly executed until all the libtool
+# libraries that it depends on are installed.
+#
+# This wrapper script should never be moved out of the build directory.
+# If it is, it will not operate correctly.
+
+# Sed substitution that helps us do robust quoting.  It backslashifies
+# metacharacters that are still active within double-quoted strings.
+Xsed='sed -e 1s/^X//'
+sed_quote_subst='$sed_quote_subst'
+
+# The HP-UX ksh and POSIX shell print the target directory to stdout
+# if CDPATH is set.
+if test \"\${CDPATH+set}\" = set; then CDPATH=:; export CDPATH; fi
+
+relink_command=\"$relink_command\"
+
+# This environment variable determines our operation mode.
+if test \"\$libtool_install_magic\" = \"$magic\"; then
+  # install mode needs the following variable:
+  notinst_deplibs='$notinst_deplibs'
+else
+  # When we are sourced in execute mode, \$file and \$echo are already set.
+  if test \"\$libtool_execute_magic\" != \"$magic\"; then
+    echo=\"$qecho\"
+    file=\"\$0\"
+    # Make sure echo works.
+    if test \"X\$1\" = X--no-reexec; then
+      # Discard the --no-reexec flag, and continue.
+      shift
+    elif test \"X\`(\$echo '\t') 2>/dev/null\`\" = 'X\t'; then
+      # Yippee, \$echo works!
+      :
+    else
+      # Restart under the correct shell, and then maybe \$echo will work.
+      exec $SHELL \"\$0\" --no-reexec \${1+\"\$@\"}
+    fi
+  fi\
+"
+	$echo >> $output "\
+
+  # Find the directory that this script lives in.
+  thisdir=\`\$echo \"X\$file\" | \$Xsed -e 's%/[^/]*$%%'\`
+  test \"x\$thisdir\" = \"x\$file\" && thisdir=.
+
+  # Follow symbolic links until we get to the real thisdir.
+  file=\`ls -ld \"\$file\" | sed -n 's/.*-> //p'\`
+  while test -n \"\$file\"; do
+    destdir=\`\$echo \"X\$file\" | \$Xsed -e 's%/[^/]*\$%%'\`
+
+    # If there was a directory component, then change thisdir.
+    if test \"x\$destdir\" != \"x\$file\"; then
+      case \"\$destdir\" in
+      [\\\\/]* | [A-Za-z]:[\\\\/]*) thisdir=\"\$destdir\" ;;
+      *) thisdir=\"\$thisdir/\$destdir\" ;;
+      esac
+    fi
+
+    file=\`\$echo \"X\$file\" | \$Xsed -e 's%^.*/%%'\`
+    file=\`ls -ld \"\$thisdir/\$file\" | sed -n 's/.*-> //p'\`
+  done
+
+  # Try to get the absolute directory name.
+  absdir=\`cd \"\$thisdir\" && pwd\`
+  test -n \"\$absdir\" && thisdir=\"\$absdir\"
+"
+
+	if test "$fast_install" = yes; then
+	  echo >> $output "\
+  program=lt-'$outputname'$exeext
+  progdir=\"\$thisdir/$objdir\"
+
+  if test ! -f \"\$progdir/\$program\" || \\
+     { file=\`ls -1dt \"\$progdir/\$program\" \"\$progdir/../\$program\" 2>/dev/null | sed 1q\`; \\
+       test \"X\$file\" != \"X\$progdir/\$program\"; }; then
+
+    file=\"\$\$-\$program\"
+
+    if test ! -d \"\$progdir\"; then
+      $mkdir \"\$progdir\"
+    else
+      $rm \"\$progdir/\$file\"
+    fi"
+
+	  echo >> $output "\
+
+    # relink executable if necessary
+    if test -n \"\$relink_command\"; then
+      if (eval \$relink_command); then :
+      else
+	$rm \"\$progdir/\$file\"
+	exit 1
+      fi
+    fi
+
+    $mv \"\$progdir/\$file\" \"\$progdir/\$program\" 2>/dev/null ||
+    { $rm \"\$progdir/\$program\";
+      $mv \"\$progdir/\$file\" \"\$progdir/\$program\"; }
+    $rm \"\$progdir/\$file\"
+  fi"
+	else
+	  echo >> $output "\
+  program='$outputname'
+  progdir=\"\$thisdir/$objdir\"
+"
+	fi
+
+	echo >> $output "\
+
+  if test -f \"\$progdir/\$program\"; then"
+
+	# Export our shlibpath_var if we have one.
+	if test "$shlibpath_overrides_runpath" = yes && test -n "$shlibpath_var" && test -n "$temp_rpath"; then
+	  $echo >> $output "\
+    # Add our own library path to $shlibpath_var
+    $shlibpath_var=\"$temp_rpath\$$shlibpath_var\"
+
+    # Some systems cannot cope with colon-terminated $shlibpath_var
+    # The second colon is a workaround for a bug in BeOS R4 sed
+    $shlibpath_var=\`\$echo \"X\$$shlibpath_var\" | \$Xsed -e 's/::*\$//'\`
+
+    export $shlibpath_var
+"
+	fi
+
+	# fixup the dll searchpath if we need to.
+	if test -n "$dllsearchpath"; then
+	  $echo >> $output "\
+    # Add the dll search path components to the executable PATH
+    PATH=$dllsearchpath:\$PATH
+"
+	fi
+
+	$echo >> $output "\
+    if test \"\$libtool_execute_magic\" != \"$magic\"; then
+      # Run the actual program with our arguments.
+"
+	case $host in
+	# win32 systems need to use the prog path for dll
+	# lookup to work
+	*-*-cygwin* | *-*-pw32*)
+	  $echo >> $output "\
+      exec \$progdir/\$program \${1+\"\$@\"}
+"
+	  ;;
+
+	# Backslashes separate directories on plain windows
+	*-*-mingw | *-*-os2*)
+	  $echo >> $output "\
+      exec \$progdir\\\\\$program \${1+\"\$@\"}
+"
+	  ;;
+
+	*)
+	  $echo >> $output "\
+      # Export the path to the program.
+      PATH=\"\$progdir:\$PATH\"
+      export PATH
+
+      exec \$program \${1+\"\$@\"}
+"
+	  ;;
+	esac
+	$echo >> $output "\
+      \$echo \"\$0: cannot exec \$program \${1+\"\$@\"}\"
+      exit 1
+    fi
+  else
+    # The program doesn't exist.
+    \$echo \"\$0: error: \$progdir/\$program does not exist\" 1>&2
+    \$echo \"This script is just a wrapper for \$program.\" 1>&2
+    echo \"See the $PACKAGE documentation for more information.\" 1>&2
+    exit 1
+  fi
+fi\
+"
+	chmod +x $output
+      fi
+      exit 0
+      ;;
+    esac
+
+    # See if we need to build an old-fashioned archive.
+    for oldlib in $oldlibs; do
+
+      if test "$build_libtool_libs" = convenience; then
+	oldobjs="$libobjs_save"
+	addlibs="$convenience"
+	build_libtool_libs=no
+      else
+	if test "$build_libtool_libs" = module; then
+	  oldobjs="$libobjs_save"
+	  build_libtool_libs=no
+	else
+	  oldobjs="$objs$old_deplibs "`$echo "X$libobjs_save" | $SP2NL | $Xsed -e '/\.'${libext}'$/d' -e '/\.lib$/d' -e "$lo2o" | $NL2SP`
+	fi
+	addlibs="$old_convenience"
+      fi
+
+      if test -n "$addlibs"; then
+	gentop="$output_objdir/${outputname}x"
+	$show "${rm}r $gentop"
+	$run ${rm}r "$gentop"
+	$show "mkdir $gentop"
+	$run mkdir "$gentop"
+	status=$?
+	if test $status -ne 0 && test ! -d "$gentop"; then
+	  exit $status
+	fi
+	generated="$generated $gentop"
+
+	# Add in members from convenience archives.
+	for xlib in $addlibs; do
+	  # Extract the objects.
+	  case $xlib in
+	  [\\/]* | [A-Za-z]:[\\/]*) xabs="$xlib" ;;
+	  *) xabs=`pwd`"/$xlib" ;;
+	  esac
+	  xlib=`$echo "X$xlib" | $Xsed -e 's%^.*/%%'`
+	  xdir="$gentop/$xlib"
+
+	  $show "${rm}r $xdir"
+	  $run ${rm}r "$xdir"
+	  $show "mkdir $xdir"
+	  $run mkdir "$xdir"
+	  status=$?
+	  if test $status -ne 0 && test ! -d "$xdir"; then
+	    exit $status
+	  fi
+	  $show "(cd $xdir && $AR x $xabs)"
+	  $run eval "(cd \$xdir && $AR x \$xabs)" || exit $?
+
+	  oldobjs="$oldobjs "`find $xdir -name \*.${objext} -print -o -name \*.lo -print | $NL2SP`
+	done
+      fi
+
+      # Do each command in the archive commands.
+      if test -n "$old_archive_from_new_cmds" && test "$build_libtool_libs" = yes; then
+	eval cmds=\"$old_archive_from_new_cmds\"
+      else
+	# Ensure that we have .o objects in place in case we decided
+	# not to build a shared library, and have fallen back to building
+	# static libs even though --disable-static was passed!
+	for oldobj in $oldobjs; do
+	  if test ! -f $oldobj; then
+	    xdir=`$echo "X$oldobj" | $Xsed -e 's%/[^/]*$%%'`
+	    if test "X$xdir" = "X$oldobj"; then
+	      xdir="."
+	    else
+	      xdir="$xdir"
+	    fi
+	    baseobj=`$echo "X$oldobj" | $Xsed -e 's%^.*/%%'`
+	    obj=`$echo "X$baseobj" | $Xsed -e "$o2lo"`
+	    $show "(cd $xdir && ${LN_S} $obj $baseobj)"
+	    $run eval '(cd $xdir && ${LN_S} $obj $baseobj)' || exit $?
+	  fi
+	done
+
+	eval cmds=\"$old_archive_cmds\"
+      fi
+      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+      for cmd in $cmds; do
+	IFS="$save_ifs"
+	$show "$cmd"
+	$run eval "$cmd" || exit $?
+      done
+      IFS="$save_ifs"
+    done
+
+    if test -n "$generated"; then
+      $show "${rm}r$generated"
+      $run ${rm}r$generated
+    fi
+
+    # Now create the libtool archive.
+    case $output in
+    *.la)
+      old_library=
+      test "$build_old_libs" = yes && old_library="$libname.$libext"
+      $show "creating $output"
+
+      # Preserve any variables that may affect compiler behavior
+      for var in $variables_saved_for_relink; do
+	if eval test -z \"\${$var+set}\"; then
+	  relink_command="{ test -z \"\${$var+set}\" || unset $var || { $var=; export $var; }; }; $relink_command"
+	elif eval var_value=\$$var; test -z "$var_value"; then
+	  relink_command="$var=; export $var; $relink_command"
+	else
+	  var_value=`$echo "X$var_value" | $Xsed -e "$sed_quote_subst"`
+	  relink_command="$var=\"$var_value\"; export $var; $relink_command"
+	fi
+      done
+      # Quote the link command for shipping.
+      relink_command="cd `pwd`; $SHELL $0 --mode=relink $libtool_args"
+      relink_command=`$echo "X$relink_command" | $Xsed -e "$sed_quote_subst"`
+
+      # Only create the output if not a dry run.
+      if test -z "$run"; then
+	for installed in no yes; do
+	  if test "$installed" = yes; then
+	    if test -z "$install_libdir"; then
+	      break
+	    fi
+	    output="$output_objdir/$outputname"i
+	    # Replace all uninstalled libtool libraries with the installed ones
+	    newdependency_libs=
+	    for deplib in $dependency_libs; do
+	      case $deplib in
+	      *.la)
+		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
+		eval libdir=`sed -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
+		if test -z "$libdir"; then
+		  $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
+		  exit 1
+		fi
+		newdependency_libs="$newdependency_libs $libdir/$name"
+		;;
+	      *) newdependency_libs="$newdependency_libs $deplib" ;;
+	      esac
+	    done
+	    dependency_libs="$newdependency_libs"
+	    newdlfiles=
+	    for lib in $dlfiles; do
+	      name=`$echo "X$lib" | $Xsed -e 's%^.*/%%'`
+	      eval libdir=`sed -n -e 's/^libdir=\(.*\)$/\1/p' $lib`
+	      if test -z "$libdir"; then
+		$echo "$modename: \`$lib' is not a valid libtool archive" 1>&2
+		exit 1
+	      fi
+	      newdlfiles="$newdlfiles $libdir/$name"
+	    done
+	    dlfiles="$newdlfiles"
+	    newdlprefiles=
+	    for lib in $dlprefiles; do
+	      name=`$echo "X$lib" | $Xsed -e 's%^.*/%%'`
+	      eval libdir=`sed -n -e 's/^libdir=\(.*\)$/\1/p' $lib`
+	      if test -z "$libdir"; then
+		$echo "$modename: \`$lib' is not a valid libtool archive" 1>&2
+		exit 1
+	      fi
+	      newdlprefiles="$newdlprefiles $libdir/$name"
+	    done
+	    dlprefiles="$newdlprefiles"
+	  fi
+	  $rm $output
+	  # place dlname in correct position for cygwin
+	  tdlname=$dlname
+	  case $host,$output,$installed,$module,$dlname in
+	    *cygwin*,*lai,yes,no,*.dll) tdlname=../bin/$dlname ;;
+	  esac
+	  $echo > $output "\
+# $outputname - a libtool library file
+# Generated by $PROGRAM - GNU $PACKAGE $VERSION$TIMESTAMP
+#
+# Please DO NOT delete this file!
+# It is necessary for linking the library.
+
+# The name that we can dlopen(3).
+dlname='$tdlname'
+
+# Names of this library.
+library_names='$library_names'
+
+# The name of the static archive.
+old_library='$old_library'
+
+# Libraries that this one depends upon.
+dependency_libs='$dependency_libs'
+
+# Version information for $libname.
+current=$current
+age=$age
+revision=$revision
+
+# Is this an already installed library?
+installed=$installed
+
+# Files to dlopen/dlpreopen
+dlopen='$dlfiles'
+dlpreopen='$dlprefiles'
+
+# Directory that this library needs to be installed in:
+libdir='$install_libdir'"
+	  if test "$installed" = no && test $need_relink = yes; then
+	    $echo >> $output "\
+relink_command=\"$relink_command\""
+	  fi
+	done
+      fi
+
+      # Do a symbolic link so that the libtool archive can be found in
+      # LD_LIBRARY_PATH before the program is installed.
+      $show "(cd $output_objdir && $rm $outputname && $LN_S ../$outputname $outputname)"
+      $run eval '(cd $output_objdir && $rm $outputname && $LN_S ../$outputname $outputname)' || exit $?
+      ;;
+    esac
+    exit 0
+    ;;
+
+  # libtool install mode
+  install)
+    modename="$modename: install"
+
+    # There may be an optional sh(1) argument at the beginning of
+    # install_prog (especially on Windows NT).
+    if test "$nonopt" = "$SHELL" || test "$nonopt" = /bin/sh ||
+       # Allow the use of GNU shtool's install command.
+       $echo "X$nonopt" | $Xsed | grep shtool > /dev/null; then
+      # Aesthetically quote it.
+      arg=`$echo "X$nonopt" | $Xsed -e "$sed_quote_subst"`
+      case $arg in
+      *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*)
+	arg="\"$arg\""
+	;;
+      esac
+      install_prog="$arg "
+      arg="$1"
+      shift
+    else
+      install_prog=
+      arg="$nonopt"
+    fi
+
+    # The real first argument should be the name of the installation program.
+    # Aesthetically quote it.
+    arg=`$echo "X$arg" | $Xsed -e "$sed_quote_subst"`
+    case $arg in
+    *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*)
+      arg="\"$arg\""
+      ;;
+    esac
+    install_prog="$install_prog$arg"
+
+    # We need to accept at least all the BSD install flags.
+    dest=
+    files=
+    opts=
+    prev=
+    install_type=
+    isdir=no
+    stripme=
+    for arg
+    do
+      if test -n "$dest"; then
+	files="$files $dest"
+	dest="$arg"
+	continue
+      fi
+
+      case $arg in
+      -d) isdir=yes ;;
+      -f) prev="-f" ;;
+      -g) prev="-g" ;;
+      -m) prev="-m" ;;
+      -o) prev="-o" ;;
+      -s)
+	stripme=" -s"
+	continue
+	;;
+      -*) ;;
+
+      *)
+	# If the previous option needed an argument, then skip it.
+	if test -n "$prev"; then
+	  prev=
+	else
+	  dest="$arg"
+	  continue
+	fi
+	;;
+      esac
+
+      # Aesthetically quote the argument.
+      arg=`$echo "X$arg" | $Xsed -e "$sed_quote_subst"`
+      case $arg in
+      *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*)
+	arg="\"$arg\""
+	;;
+      esac
+      install_prog="$install_prog $arg"
+    done
+
+    if test -z "$install_prog"; then
+      $echo "$modename: you must specify an install program" 1>&2
+      $echo "$help" 1>&2
+      exit 1
+    fi
+
+    if test -n "$prev"; then
+      $echo "$modename: the \`$prev' option requires an argument" 1>&2
+      $echo "$help" 1>&2
+      exit 1
+    fi
+
+    if test -z "$files"; then
+      if test -z "$dest"; then
+	$echo "$modename: no file or destination specified" 1>&2
+      else
+	$echo "$modename: you must specify a destination" 1>&2
+      fi
+      $echo "$help" 1>&2
+      exit 1
+    fi
+
+    # Strip any trailing slash from the destination.
+    dest=`$echo "X$dest" | $Xsed -e 's%/$%%'`
+
+    # Check to see that the destination is a directory.
+    test -d "$dest" && isdir=yes
+    if test "$isdir" = yes; then
+      destdir="$dest"
+      destname=
+    else
+      destdir=`$echo "X$dest" | $Xsed -e 's%/[^/]*$%%'`
+      test "X$destdir" = "X$dest" && destdir=.
+      destname=`$echo "X$dest" | $Xsed -e 's%^.*/%%'`
+
+      # Not a directory, so check to see that there is only one file specified.
+      set dummy $files
+      if test $# -gt 2; then
+	$echo "$modename: \`$dest' is not a directory" 1>&2
+	$echo "$help" 1>&2
+	exit 1
+      fi
+    fi
+    case $destdir in
+    [\\/]* | [A-Za-z]:[\\/]*) ;;
+    *)
+      for file in $files; do
+	case $file in
+	*.lo) ;;
+	*)
+	  $echo "$modename: \`$destdir' must be an absolute directory name" 1>&2
+	  $echo "$help" 1>&2
+	  exit 1
+	  ;;
+	esac
+      done
+      ;;
+    esac
+
+    # This variable tells wrapper scripts just to set variables rather
+    # than running their programs.
+    libtool_install_magic="$magic"
+
+    staticlibs=
+    future_libdirs=
+    current_libdirs=
+    for file in $files; do
+
+      # Do each installation.
+      case $file in
+      *.$libext)
+	# Do the static libraries later.
+	staticlibs="$staticlibs $file"
+	;;
+
+      *.la)
+	# Check to see that this really is a libtool archive.
+	if (sed -e '2q' $file | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then :
+	else
+	  $echo "$modename: \`$file' is not a valid libtool archive" 1>&2
+	  $echo "$help" 1>&2
+	  exit 1
+	fi
+
+	library_names=
+	old_library=
+	relink_command=
+	# If there is no directory component, then add one.
+	case $file in
+	*/* | *\\*) . $file ;;
+	*) . ./$file ;;
+	esac
+
+	# Add the libdir to current_libdirs if it is the destination.
+	if test "X$destdir" = "X$libdir"; then
+	  case "$current_libdirs " in
+	  *" $libdir "*) ;;
+	  *) current_libdirs="$current_libdirs $libdir" ;;
+	  esac
+	else
+	  # Note the libdir as a future libdir.
+	  case "$future_libdirs " in
+	  *" $libdir "*) ;;
+	  *) future_libdirs="$future_libdirs $libdir" ;;
+	  esac
+	fi
+
+	dir=`$echo "X$file" | $Xsed -e 's%/[^/]*$%%'`/
+	test "X$dir" = "X$file/" && dir=
+	dir="$dir$objdir"
+
+	if test -n "$relink_command"; then
+	  $echo "$modename: warning: relinking \`$file'" 1>&2
+	  $show "$relink_command"
+	  if $run eval "$relink_command"; then :
+	  else
+	    $echo "$modename: error: relink \`$file' with the above command before installing it" 1>&2
+	    continue
+	  fi
+	fi
+
+	# See the names of the shared library.
+	set dummy $library_names
+	if test -n "$2"; then
+	  realname="$2"
+	  shift
+	  shift
+
+	  srcname="$realname"
+	  test -n "$relink_command" && srcname="$realname"T
+
+	  # Install the shared library and build the symlinks.
+	  $show "$install_prog $dir/$srcname $destdir/$realname"
+	  $run eval "$install_prog $dir/$srcname $destdir/$realname" || exit $?
+	  if test -n "$stripme" && test -n "$striplib"; then
+	    $show "$striplib $destdir/$realname"
+	    $run eval "$striplib $destdir/$realname" || exit $?
+	  fi
+
+	  if test $# -gt 0; then
+	    # Delete the old symlinks, and create new ones.
+	    for linkname
+	    do
+	      if test "$linkname" != "$realname"; then
+		$show "(cd $destdir && $rm $linkname && $LN_S $realname $linkname)"
+		$run eval "(cd $destdir && $rm $linkname && $LN_S $realname $linkname)"
+	      fi
+	    done
+	  fi
+
+	  # Do each command in the postinstall commands.
+	  lib="$destdir/$realname"
+	  eval cmds=\"$postinstall_cmds\"
+	  IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	  for cmd in $cmds; do
+	    IFS="$save_ifs"
+	    $show "$cmd"
+	    $run eval "$cmd" || exit $?
+	  done
+	  IFS="$save_ifs"
+	fi
+
+	# Install the pseudo-library for information purposes.
+	name=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
+	instname="$dir/$name"i
+	$show "$install_prog $instname $destdir/$name"
+	$run eval "$install_prog $instname $destdir/$name" || exit $?
+
+	# Maybe install the static library, too.
+	test -n "$old_library" && staticlibs="$staticlibs $dir/$old_library"
+	;;
+
+      *.lo)
+	# Install (i.e. copy) a libtool object.
+
+	# Figure out destination file name, if it wasn't already specified.
+	if test -n "$destname"; then
+	  destfile="$destdir/$destname"
+	else
+	  destfile=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
+	  destfile="$destdir/$destfile"
+	fi
+
+	# Deduce the name of the destination old-style object file.
+	case $destfile in
+	*.lo)
+	  staticdest=`$echo "X$destfile" | $Xsed -e "$lo2o"`
+	  ;;
+	*.$objext)
+	  staticdest="$destfile"
+	  destfile=
+	  ;;
+	*)
+	  $echo "$modename: cannot copy a libtool object to \`$destfile'" 1>&2
+	  $echo "$help" 1>&2
+	  exit 1
+	  ;;
+	esac
+
+	# Install the libtool object if requested.
+	if test -n "$destfile"; then
+	  $show "$install_prog $file $destfile"
+	  $run eval "$install_prog $file $destfile" || exit $?
+	fi
+
+	# Install the old object if enabled.
+	if test "$build_old_libs" = yes; then
+	  # Deduce the name of the old-style object file.
+	  staticobj=`$echo "X$file" | $Xsed -e "$lo2o"`
+
+	  $show "$install_prog $staticobj $staticdest"
+	  $run eval "$install_prog \$staticobj \$staticdest" || exit $?
+	fi
+	exit 0
+	;;
+
+      *)
+	# Figure out destination file name, if it wasn't already specified.
+	if test -n "$destname"; then
+	  destfile="$destdir/$destname"
+	else
+	  destfile=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
+	  destfile="$destdir/$destfile"
+	fi
+
+	# Do a test to see if this is really a libtool program.
+	if (sed -e '4q' $file | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then
+	  notinst_deplibs=
+	  relink_command=
+
+	  # If there is no directory component, then add one.
+	  case $file in
+	  */* | *\\*) . $file ;;
+	  *) . ./$file ;;
+	  esac
+
+	  # Check the variables that should have been set.
+	  if test -z "$notinst_deplibs"; then
+	    $echo "$modename: invalid libtool wrapper script \`$file'" 1>&2
+	    exit 1
+	  fi
+
+	  finalize=yes
+	  for lib in $notinst_deplibs; do
+	    # Check to see that each library is installed.
+	    libdir=
+	    if test -f "$lib"; then
+	      # If there is no directory component, then add one.
+	      case $lib in
+	      */* | *\\*) . $lib ;;
+	      *) . ./$lib ;;
+	      esac
+	    fi
+	    libfile="$libdir/"`$echo "X$lib" | $Xsed -e 's%^.*/%%g'` ### testsuite: skip nested quoting test
+	    if test -n "$libdir" && test ! -f "$libfile"; then
+	      $echo "$modename: warning: \`$lib' has not been installed in \`$libdir'" 1>&2
+	      finalize=no
+	    fi
+	  done
+
+	  relink_command=
+	  # If there is no directory component, then add one.
+	  case $file in
+	  */* | *\\*) . $file ;;
+	  *) . ./$file ;;
+	  esac
+
+	  outputname=
+	  if test "$fast_install" = no && test -n "$relink_command"; then
+	    if test "$finalize" = yes && test -z "$run"; then
+	      tmpdir="/tmp"
+	      test -n "$TMPDIR" && tmpdir="$TMPDIR"
+	      tmpdir="$tmpdir/libtool-$$"
+	      if $mkdir -p "$tmpdir" && chmod 700 "$tmpdir"; then :
+	      else
+		$echo "$modename: error: cannot create temporary directory \`$tmpdir'" 1>&2
+		continue
+	      fi
+	      file=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
+	      outputname="$tmpdir/$file"
+	      # Replace the output file specification.
+	      relink_command=`$echo "X$relink_command" | $Xsed -e 's%@OUTPUT@%'"$outputname"'%g'`
+
+	      $show "$relink_command"
+	      if $run eval "$relink_command"; then :
+	      else
+		$echo "$modename: error: relink \`$file' with the above command before installing it" 1>&2
+		${rm}r "$tmpdir"
+		continue
+	      fi
+	      file="$outputname"
+	    else
+	      $echo "$modename: warning: cannot relink \`$file'" 1>&2
+	    fi
+	  else
+	    # Install the binary that we compiled earlier.
+	    file=`$echo "X$file" | $Xsed -e "s%\([^/]*\)$%$objdir/\1%"`
+	  fi
+	fi
+
+	# remove .exe since cygwin /usr/bin/install will append another
+	# one anyways
+	case $install_prog,$host in
+	/usr/bin/install*,*cygwin*)
+	  case $file:$destfile in
+	  *.exe:*.exe)
+	    # this is ok
+	    ;;
+	  *.exe:*)
+	    destfile=$destfile.exe
+	    ;;
+	  *:*.exe)
+	    destfile=`echo $destfile | sed -e 's,.exe$,,'`
+	    ;;
+	  esac
+	  ;;
+	esac
+	$show "$install_prog$stripme $file $destfile"
+	$run eval "$install_prog\$stripme \$file \$destfile" || exit $?
+	test -n "$outputname" && ${rm}r "$tmpdir"
+	;;
+      esac
+    done
+
+    for file in $staticlibs; do
+      name=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
+
+      # Set up the ranlib parameters.
+      oldlib="$destdir/$name"
+
+      $show "$install_prog $file $oldlib"
+      $run eval "$install_prog \$file \$oldlib" || exit $?
+
+      if test -n "$stripme" && test -n "$striplib"; then
+	$show "$old_striplib $oldlib"
+	$run eval "$old_striplib $oldlib" || exit $?
+      fi
+
+      # Do each command in the postinstall commands.
+      eval cmds=\"$old_postinstall_cmds\"
+      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+      for cmd in $cmds; do
+	IFS="$save_ifs"
+	$show "$cmd"
+	$run eval "$cmd" || exit $?
+      done
+      IFS="$save_ifs"
+    done
+
+    if test -n "$future_libdirs"; then
+      $echo "$modename: warning: remember to run \`$progname --finish$future_libdirs'" 1>&2
+    fi
+
+    if test -n "$current_libdirs"; then
+      # Maybe just do a dry run.
+      test -n "$run" && current_libdirs=" -n$current_libdirs"
+      exec $SHELL $0 --finish$current_libdirs
+      exit 1
+    fi
+
+    exit 0
+    ;;
+
+  # libtool finish mode
+  finish)
+    modename="$modename: finish"
+    libdirs="$nonopt"
+    admincmds=
+
+    if test -n "$finish_cmds$finish_eval" && test -n "$libdirs"; then
+      for dir
+      do
+	libdirs="$libdirs $dir"
+      done
+
+      for libdir in $libdirs; do
+	if test -n "$finish_cmds"; then
+	  # Do each command in the finish commands.
+	  eval cmds=\"$finish_cmds\"
+	  IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	  for cmd in $cmds; do
+	    IFS="$save_ifs"
+	    $show "$cmd"
+	    $run eval "$cmd" || admincmds="$admincmds
+       $cmd"
+	  done
+	  IFS="$save_ifs"
+	fi
+	if test -n "$finish_eval"; then
+	  # Do the single finish_eval.
+	  eval cmds=\"$finish_eval\"
+	  $run eval "$cmds" || admincmds="$admincmds
+       $cmds"
+	fi
+      done
+    fi
+
+    # Exit here if they wanted silent mode.
+    test "$show" = ":" && exit 0
+
+    echo "----------------------------------------------------------------------"
+    echo "Libraries have been installed in:"
+    for libdir in $libdirs; do
+      echo "   $libdir"
+    done
+    echo
+    echo "If you ever happen to want to link against installed libraries"
+    echo "in a given directory, LIBDIR, you must either use libtool, and"
+    echo "specify the full pathname of the library, or use the \`-LLIBDIR'"
+    echo "flag during linking and do at least one of the following:"
+    if test -n "$shlibpath_var"; then
+      echo "   - add LIBDIR to the \`$shlibpath_var' environment variable"
+      echo "     during execution"
+    fi
+    if test -n "$runpath_var"; then
+      echo "   - add LIBDIR to the \`$runpath_var' environment variable"
+      echo "     during linking"
+    fi
+    if test -n "$hardcode_libdir_flag_spec"; then
+      libdir=LIBDIR
+      eval flag=\"$hardcode_libdir_flag_spec\"
+
+      echo "   - use the \`$flag' linker flag"
+    fi
+    if test -n "$admincmds"; then
+      echo "   - have your system administrator run these commands:$admincmds"
+    fi
+    if test -f /etc/ld.so.conf; then
+      echo "   - have your system administrator add LIBDIR to \`/etc/ld.so.conf'"
+    fi
+    echo
+    echo "See any operating system documentation about shared libraries for"
+    echo "more information, such as the ld(1) and ld.so(8) manual pages."
+    echo "----------------------------------------------------------------------"
+    exit 0
+    ;;
+
+  # libtool execute mode
+  execute)
+    modename="$modename: execute"
+
+    # The first argument is the command name.
+    cmd="$nonopt"
+    if test -z "$cmd"; then
+      $echo "$modename: you must specify a COMMAND" 1>&2
+      $echo "$help"
+      exit 1
+    fi
+
+    # Handle -dlopen flags immediately.
+    for file in $execute_dlfiles; do
+      if test ! -f "$file"; then
+	$echo "$modename: \`$file' is not a file" 1>&2
+	$echo "$help" 1>&2
+	exit 1
+      fi
+
+      dir=
+      case $file in
+      *.la)
+	# Check to see that this really is a libtool archive.
+	if (sed -e '2q' $file | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then :
+	else
+	  $echo "$modename: \`$lib' is not a valid libtool archive" 1>&2
+	  $echo "$help" 1>&2
+	  exit 1
+	fi
+
+	# Read the libtool library.
+	dlname=
+	library_names=
+
+	# If there is no directory component, then add one.
+	case $file in
+	*/* | *\\*) . $file ;;
+	*) . ./$file ;;
+	esac
+
+	# Skip this library if it cannot be dlopened.
+	if test -z "$dlname"; then
+	  # Warn if it was a shared library.
+	  test -n "$library_names" && $echo "$modename: warning: \`$file' was not linked with \`-export-dynamic'"
+	  continue
+	fi
+
+	dir=`$echo "X$file" | $Xsed -e 's%/[^/]*$%%'`
+	test "X$dir" = "X$file" && dir=.
+
+	if test -f "$dir/$objdir/$dlname"; then
+	  dir="$dir/$objdir"
+	else
+	  $echo "$modename: cannot find \`$dlname' in \`$dir' or \`$dir/$objdir'" 1>&2
+	  exit 1
+	fi
+	;;
+
+      *.lo)
+	# Just add the directory containing the .lo file.
+	dir=`$echo "X$file" | $Xsed -e 's%/[^/]*$%%'`
+	test "X$dir" = "X$file" && dir=.
+	;;
+
+      *)
+	$echo "$modename: warning \`-dlopen' is ignored for non-libtool libraries and objects" 1>&2
+	continue
+	;;
+      esac
+
+      # Get the absolute pathname.
+      absdir=`cd "$dir" && pwd`
+      test -n "$absdir" && dir="$absdir"
+
+      # Now add the directory to shlibpath_var.
+      if eval "test -z \"\$$shlibpath_var\""; then
+	eval "$shlibpath_var=\"\$dir\""
+      else
+	eval "$shlibpath_var=\"\$dir:\$$shlibpath_var\""
+      fi
+    done
+
+    # This variable tells wrapper scripts just to set shlibpath_var
+    # rather than running their programs.
+    libtool_execute_magic="$magic"
+
+    # Check if any of the arguments is a wrapper script.
+    args=
+    for file
+    do
+      case $file in
+      -*) ;;
+      *)
+	# Do a test to see if this is really a libtool program.
+	if (sed -e '4q' $file | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then
+	  # If there is no directory component, then add one.
+	  case $file in
+	  */* | *\\*) . $file ;;
+	  *) . ./$file ;;
+	  esac
+
+	  # Transform arg to wrapped name.
+	  file="$progdir/$program"
+	fi
+	;;
+      esac
+      # Quote arguments (to preserve shell metacharacters).
+      file=`$echo "X$file" | $Xsed -e "$sed_quote_subst"`
+      args="$args \"$file\""
+    done
+
+    if test -z "$run"; then
+      if test -n "$shlibpath_var"; then
+	# Export the shlibpath_var.
+	eval "export $shlibpath_var"
+      fi
+
+      # Restore saved enviroment variables
+      if test "${save_LC_ALL+set}" = set; then
+	LC_ALL="$save_LC_ALL"; export LC_ALL
+      fi
+      if test "${save_LANG+set}" = set; then
+	LANG="$save_LANG"; export LANG
+      fi
+
+      # Now actually exec the command.
+      eval "exec \$cmd$args"
+
+      $echo "$modename: cannot exec \$cmd$args"
+      exit 1
+    else
+      # Display what would be done.
+      if test -n "$shlibpath_var"; then
+	eval "\$echo \"\$shlibpath_var=\$$shlibpath_var\""
+	$echo "export $shlibpath_var"
+      fi
+      $echo "$cmd$args"
+      exit 0
+    fi
+    ;;
+
+  # libtool clean and uninstall mode
+  clean | uninstall)
+    modename="$modename: $mode"
+    rm="$nonopt"
+    files=
+    rmforce=
+    exit_status=0
+
+    # This variable tells wrapper scripts just to set variables rather
+    # than running their programs.
+    libtool_install_magic="$magic"
+
+    for arg
+    do
+      case $arg in
+      -f) rm="$rm $arg"; rmforce=yes ;;
+      -*) rm="$rm $arg" ;;
+      *) files="$files $arg" ;;
+      esac
+    done
+
+    if test -z "$rm"; then
+      $echo "$modename: you must specify an RM program" 1>&2
+      $echo "$help" 1>&2
+      exit 1
+    fi
+
+    rmdirs=
+
+    for file in $files; do
+      dir=`$echo "X$file" | $Xsed -e 's%/[^/]*$%%'`
+      if test "X$dir" = "X$file"; then
+	dir=.
+	objdir="$objdir"
+      else
+	objdir="$dir/$objdir"
+      fi
+      name=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
+      test $mode = uninstall && objdir="$dir"
+
+      # Remember objdir for removal later, being careful to avoid duplicates
+      if test $mode = clean; then
+	case " $rmdirs " in
+	  *" $objdir "*) ;;
+	  *) rmdirs="$rmdirs $objdir" ;;
+	esac
+      fi
+
+      # Don't error if the file doesn't exist and rm -f was used.
+      if (test -L "$file") >/dev/null 2>&1 \
+        || (test -h "$file") >/dev/null 2>&1 \
+	|| test -f "$file"; then
+        :
+      elif test -d "$file"; then
+        exit_status=1
+	continue
+      elif test "$rmforce" = yes; then
+        continue
+      fi
+
+      rmfiles="$file"
+
+      case $name in
+      *.la)
+	# Possibly a libtool archive, so verify it.
+	if (sed -e '2q' $file | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then
+	  . $dir/$name
+
+	  # Delete the libtool libraries and symlinks.
+	  for n in $library_names; do
+	    rmfiles="$rmfiles $objdir/$n"
+	  done
+	  test -n "$old_library" && rmfiles="$rmfiles $objdir/$old_library"
+	  test $mode = clean && rmfiles="$rmfiles $objdir/$name $objdir/${name}i"
+
+	  if test $mode = uninstall; then
+	    if test -n "$library_names"; then
+	      # Do each command in the postuninstall commands.
+	      eval cmds=\"$postuninstall_cmds\"
+	      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	      for cmd in $cmds; do
+		IFS="$save_ifs"
+		$show "$cmd"
+		$run eval "$cmd"
+		if test $? != 0 && test "$rmforce" != yes; then
+		  exit_status=1
+		fi
+	      done
+	      IFS="$save_ifs"
+	    fi
+
+	    if test -n "$old_library"; then
+	      # Do each command in the old_postuninstall commands.
+	      eval cmds=\"$old_postuninstall_cmds\"
+	      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	      for cmd in $cmds; do
+		IFS="$save_ifs"
+		$show "$cmd"
+		$run eval "$cmd"
+		if test $? != 0 && test "$rmforce" != yes; then
+		  exit_status=1
+		fi
+	      done
+	      IFS="$save_ifs"
+	    fi
+	    # FIXME: should reinstall the best remaining shared library.
+	  fi
+	fi
+	;;
+
+      *.lo)
+	if test "$build_old_libs" = yes; then
+	  oldobj=`$echo "X$name" | $Xsed -e "$lo2o"`
+	  rmfiles="$rmfiles $dir/$oldobj"
+	fi
+	;;
+
+      *)
+	# Do a test to see if this is a libtool program.
+	if test $mode = clean &&
+	   (sed -e '4q' $file | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then
+	  relink_command=
+	  . $dir/$file
+
+	  rmfiles="$rmfiles $objdir/$name $objdir/${name}S.${objext}"
+	  if test "$fast_install" = yes && test -n "$relink_command"; then
+	    rmfiles="$rmfiles $objdir/lt-$name"
+	  fi
+	fi
+	;;
+      esac
+      $show "$rm $rmfiles"
+      $run $rm $rmfiles || exit_status=1
+    done
+
+    # Try to remove the ${objdir}s in the directories where we deleted files
+    for dir in $rmdirs; do
+      if test -d "$dir"; then
+	$show "rmdir $dir"
+	$run rmdir $dir >/dev/null 2>&1
+      fi
+    done
+
+    exit $exit_status
+    ;;
+
+  "")
+    $echo "$modename: you must specify a MODE" 1>&2
+    $echo "$generic_help" 1>&2
+    exit 1
+    ;;
+  esac
+
+  $echo "$modename: invalid operation mode \`$mode'" 1>&2
+  $echo "$generic_help" 1>&2
+  exit 1
+fi # test -z "$show_help"
+
+# We need to display help for each of the modes.
+case $mode in
+"") $echo \
+"Usage: $modename [OPTION]... [MODE-ARG]...
+
+Provide generalized library-building support services.
+
+    --config          show all configuration variables
+    --debug           enable verbose shell tracing
+-n, --dry-run         display commands without modifying any files
+    --features        display basic configuration information and exit
+    --finish          same as \`--mode=finish'
+    --help            display this help message and exit
+    --mode=MODE       use operation mode MODE [default=inferred from MODE-ARGS]
+    --quiet           same as \`--silent'
+    --silent          don't print informational messages
+    --version         print version information
+
+MODE must be one of the following:
+
+      clean           remove files from the build directory
+      compile         compile a source file into a libtool object
+      execute         automatically set library path, then run a program
+      finish          complete the installation of libtool libraries
+      install         install libraries or executables
+      link            create a library or an executable
+      uninstall       remove libraries from an installed directory
+
+MODE-ARGS vary depending on the MODE.  Try \`$modename --help --mode=MODE' for
+a more detailed description of MODE."
+  exit 0
+  ;;
+
+clean)
+  $echo \
+"Usage: $modename [OPTION]... --mode=clean RM [RM-OPTION]... FILE...
+
+Remove files from the build directory.
+
+RM is the name of the program to use to delete files associated with each FILE
+(typically \`/bin/rm').  RM-OPTIONS are options (such as \`-f') to be passed
+to RM.
+
+If FILE is a libtool library, object or program, all the files associated
+with it are deleted. Otherwise, only FILE itself is deleted using RM."
+  ;;
+
+compile)
+  $echo \
+"Usage: $modename [OPTION]... --mode=compile COMPILE-COMMAND... SOURCEFILE
+
+Compile a source file into a libtool library object.
+
+This mode accepts the following additional options:
+
+  -o OUTPUT-FILE    set the output file name to OUTPUT-FILE
+  -prefer-pic       try to building PIC objects only
+  -prefer-non-pic   try to building non-PIC objects only
+  -static           always build a \`.o' file suitable for static linking
+
+COMPILE-COMMAND is a command to be used in creating a \`standard' object file
+from the given SOURCEFILE.
+
+The output file name is determined by removing the directory component from
+SOURCEFILE, then substituting the C source code suffix \`.c' with the
+library object suffix, \`.lo'."
+  ;;
+
+execute)
+  $echo \
+"Usage: $modename [OPTION]... --mode=execute COMMAND [ARGS]...
+
+Automatically set library path, then run a program.
+
+This mode accepts the following additional options:
+
+  -dlopen FILE      add the directory containing FILE to the library path
+
+This mode sets the library path environment variable according to \`-dlopen'
+flags.
+
+If any of the ARGS are libtool executable wrappers, then they are translated
+into their corresponding uninstalled binary, and any of their required library
+directories are added to the library path.
+
+Then, COMMAND is executed, with ARGS as arguments."
+  ;;
+
+finish)
+  $echo \
+"Usage: $modename [OPTION]... --mode=finish [LIBDIR]...
+
+Complete the installation of libtool libraries.
+
+Each LIBDIR is a directory that contains libtool libraries.
+
+The commands that this mode executes may require superuser privileges.  Use
+the \`--dry-run' option if you just want to see what would be executed."
+  ;;
+
+install)
+  $echo \
+"Usage: $modename [OPTION]... --mode=install INSTALL-COMMAND...
+
+Install executables or libraries.
+
+INSTALL-COMMAND is the installation command.  The first component should be
+either the \`install' or \`cp' program.
+
+The rest of the components are interpreted as arguments to that command (only
+BSD-compatible install options are recognized)."
+  ;;
+
+link)
+  $echo \
+"Usage: $modename [OPTION]... --mode=link LINK-COMMAND...
+
+Link object files or libraries together to form another library, or to
+create an executable program.
+
+LINK-COMMAND is a command using the C compiler that you would use to create
+a program from several object files.
+
+The following components of LINK-COMMAND are treated specially:
+
+  -all-static       do not do any dynamic linking at all
+  -avoid-version    do not add a version suffix if possible
+  -dlopen FILE      \`-dlpreopen' FILE if it cannot be dlopened at runtime
+  -dlpreopen FILE   link in FILE and add its symbols to lt_preloaded_symbols
+  -export-dynamic   allow symbols from OUTPUT-FILE to be resolved with dlsym(3)
+  -export-symbols SYMFILE
+		    try to export only the symbols listed in SYMFILE
+  -export-symbols-regex REGEX
+		    try to export only the symbols matching REGEX
+  -LLIBDIR          search LIBDIR for required installed libraries
+  -lNAME            OUTPUT-FILE requires the installed library libNAME
+  -module           build a library that can dlopened
+  -no-fast-install  disable the fast-install mode
+  -no-install       link a not-installable executable
+  -no-undefined     declare that a library does not refer to external symbols
+  -o OUTPUT-FILE    create OUTPUT-FILE from the specified objects
+  -release RELEASE  specify package release information
+  -rpath LIBDIR     the created library will eventually be installed in LIBDIR
+  -R[ ]LIBDIR       add LIBDIR to the runtime path of programs and libraries
+  -static           do not do any dynamic linking of libtool libraries
+  -version-info CURRENT[:REVISION[:AGE]]
+		    specify library version info [each variable defaults to 0]
+
+All other options (arguments beginning with \`-') are ignored.
+
+Every other argument is treated as a filename.  Files ending in \`.la' are
+treated as uninstalled libtool libraries, other files are standard or library
+object files.
+
+If the OUTPUT-FILE ends in \`.la', then a libtool library is created,
+only library objects (\`.lo' files) may be specified, and \`-rpath' is
+required, except when creating a convenience library.
+
+If OUTPUT-FILE ends in \`.a' or \`.lib', then a standard library is created
+using \`ar' and \`ranlib', or on Windows using \`lib'.
+
+If OUTPUT-FILE ends in \`.lo' or \`.${objext}', then a reloadable object file
+is created, otherwise an executable program is created."
+  ;;
+
+uninstall)
+  $echo \
+"Usage: $modename [OPTION]... --mode=uninstall RM [RM-OPTION]... FILE...
+
+Remove libraries from an installation directory.
+
+RM is the name of the program to use to delete files associated with each FILE
+(typically \`/bin/rm').  RM-OPTIONS are options (such as \`-f') to be passed
+to RM.
+
+If FILE is a libtool library, all the files associated with it are deleted.
+Otherwise, only FILE itself is deleted using RM."
+  ;;
+
+*)
+  $echo "$modename: invalid operation mode \`$mode'" 1>&2
+  $echo "$help" 1>&2
+  exit 1
+  ;;
+esac
+
+echo
+$echo "Try \`$modename --help' for more information about other modes."
+
+exit 0
+
+# Local Variables:
+# mode:shell-script
+# sh-indentation:2
+# End:
diff -Naur gd-2.0.1/ltmain.sh gd-2.0.1.patched/ltmain.sh
--- gd-2.0.1/ltmain.sh	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/ltmain.sh	Tue Jul 30 05:38:52 2002
@@ -0,0 +1,4946 @@
+# ltmain.sh - Provide generalized library-building support services.
+# NOTE: Changing this file will not affect anything until you rerun configure.
+#
+# Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001
+# Free Software Foundation, Inc.
+# Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+# As a special exception to the GNU General Public License, if you
+# distribute this file as part of a program that contains a
+# configuration script generated by Autoconf, you may include it under
+# the same distribution terms that you use for the rest of that program.
+
+# Check that we have a working $echo.
+if test "X$1" = X--no-reexec; then
+  # Discard the --no-reexec flag, and continue.
+  shift
+elif test "X$1" = X--fallback-echo; then
+  # Avoid inline document here, it may be left over
+  :
+elif test "X`($echo '\t') 2>/dev/null`" = 'X\t'; then
+  # Yippee, $echo works!
+  :
+else
+  # Restart under the correct shell, and then maybe $echo will work.
+  exec $SHELL "$0" --no-reexec ${1+"$@"}
+fi
+
+if test "X$1" = X--fallback-echo; then
+  # used as fallback echo
+  shift
+  cat <<EOF
+$*
+EOF
+  exit 0
+fi
+
+# The name of this program.
+progname=`$echo "$0" | sed 's%^.*/%%'`
+modename="$progname"
+
+# Constants.
+PROGRAM=ltmain.sh
+PACKAGE=libtool
+VERSION=1.4
+TIMESTAMP=" (1.920 2001/04/24 23:26:18)"
+
+default_mode=
+help="Try \`$progname --help' for more information."
+magic="%%%MAGIC variable%%%"
+mkdir="mkdir"
+mv="mv -f"
+rm="rm -f"
+
+# Sed substitution that helps us do robust quoting.  It backslashifies
+# metacharacters that are still active within double-quoted strings.
+Xsed='sed -e 1s/^X//'
+sed_quote_subst='s/\([\\`\\"$\\\\]\)/\\\1/g'
+SP2NL='tr \040 \012'
+NL2SP='tr \015\012 \040\040'
+
+# NLS nuisances.
+# Only set LANG and LC_ALL to C if already set.
+# These must not be set unconditionally because not all systems understand
+# e.g. LANG=C (notably SCO).
+# We save the old values to restore during execute mode.
+if test "${LC_ALL+set}" = set; then
+  save_LC_ALL="$LC_ALL"; LC_ALL=C; export LC_ALL
+fi
+if test "${LANG+set}" = set; then
+  save_LANG="$LANG"; LANG=C; export LANG
+fi
+
+if test "$build_libtool_libs" != yes && test "$build_old_libs" != yes; then
+  echo "$modename: not configured to build any kind of library" 1>&2
+  echo "Fatal configuration error.  See the $PACKAGE docs for more information." 1>&2
+  exit 1
+fi
+
+# Global variables.
+mode=$default_mode
+nonopt=
+prev=
+prevopt=
+run=
+show="$echo"
+show_help=
+execute_dlfiles=
+lo2o="s/\\.lo\$/.${objext}/"
+o2lo="s/\\.${objext}\$/.lo/"
+
+# Parse our command line options once, thoroughly.
+while test $# -gt 0
+do
+  arg="$1"
+  shift
+
+  case $arg in
+  -*=*) optarg=`$echo "X$arg" | $Xsed -e 's/[-_a-zA-Z0-9]*=//'` ;;
+  *) optarg= ;;
+  esac
+
+  # If the previous option needs an argument, assign it.
+  if test -n "$prev"; then
+    case $prev in
+    execute_dlfiles)
+      execute_dlfiles="$execute_dlfiles $arg"
+      ;;
+    *)
+      eval "$prev=\$arg"
+      ;;
+    esac
+
+    prev=
+    prevopt=
+    continue
+  fi
+
+  # Have we seen a non-optional argument yet?
+  case $arg in
+  --help)
+    show_help=yes
+    ;;
+
+  --version)
+    echo "$PROGRAM (GNU $PACKAGE) $VERSION$TIMESTAMP"
+    exit 0
+    ;;
+
+  --config)
+    sed -e '1,/^# ### BEGIN LIBTOOL CONFIG/d' -e '/^# ### END LIBTOOL CONFIG/,$d' $0
+    exit 0
+    ;;
+
+  --debug)
+    echo "$progname: enabling shell trace mode"
+    set -x
+    ;;
+
+  --dry-run | -n)
+    run=:
+    ;;
+
+  --features)
+    echo "host: $host"
+    if test "$build_libtool_libs" = yes; then
+      echo "enable shared libraries"
+    else
+      echo "disable shared libraries"
+    fi
+    if test "$build_old_libs" = yes; then
+      echo "enable static libraries"
+    else
+      echo "disable static libraries"
+    fi
+    exit 0
+    ;;
+
+  --finish) mode="finish" ;;
+
+  --mode) prevopt="--mode" prev=mode ;;
+  --mode=*) mode="$optarg" ;;
+
+  --quiet | --silent)
+    show=:
+    ;;
+
+  -dlopen)
+    prevopt="-dlopen"
+    prev=execute_dlfiles
+    ;;
+
+  -*)
+    $echo "$modename: unrecognized option \`$arg'" 1>&2
+    $echo "$help" 1>&2
+    exit 1
+    ;;
+
+  *)
+    nonopt="$arg"
+    break
+    ;;
+  esac
+done
+
+if test -n "$prevopt"; then
+  $echo "$modename: option \`$prevopt' requires an argument" 1>&2
+  $echo "$help" 1>&2
+  exit 1
+fi
+
+if test -z "$show_help"; then
+
+  # Infer the operation mode.
+  if test -z "$mode"; then
+    case $nonopt in
+    *cc | *++ | gcc* | *-gcc*)
+      mode=link
+      for arg
+      do
+	case $arg in
+	-c)
+	   mode=compile
+	   break
+	   ;;
+	esac
+      done
+      ;;
+    *db | *dbx | *strace | *truss)
+      mode=execute
+      ;;
+    *install*|cp|mv)
+      mode=install
+      ;;
+    *rm)
+      mode=uninstall
+      ;;
+    *)
+      # If we have no mode, but dlfiles were specified, then do execute mode.
+      test -n "$execute_dlfiles" && mode=execute
+
+      # Just use the default operation mode.
+      if test -z "$mode"; then
+	if test -n "$nonopt"; then
+	  $echo "$modename: warning: cannot infer operation mode from \`$nonopt'" 1>&2
+	else
+	  $echo "$modename: warning: cannot infer operation mode without MODE-ARGS" 1>&2
+	fi
+      fi
+      ;;
+    esac
+  fi
+
+  # Only execute mode is allowed to have -dlopen flags.
+  if test -n "$execute_dlfiles" && test "$mode" != execute; then
+    $echo "$modename: unrecognized option \`-dlopen'" 1>&2
+    $echo "$help" 1>&2
+    exit 1
+  fi
+
+  # Change the help message to a mode-specific one.
+  generic_help="$help"
+  help="Try \`$modename --help --mode=$mode' for more information."
+
+  # These modes are in order of execution frequency so that they run quickly.
+  case $mode in
+  # libtool compile mode
+  compile)
+    modename="$modename: compile"
+    # Get the compilation command and the source file.
+    base_compile=
+    prev=
+    lastarg=
+    srcfile="$nonopt"
+    suppress_output=
+
+    user_target=no
+    for arg
+    do
+      case $prev in
+      "") ;;
+      xcompiler)
+	# Aesthetically quote the previous argument.
+	prev=
+	lastarg=`$echo "X$arg" | $Xsed -e "$sed_quote_subst"`
+
+	case $arg in
+	# Double-quote args containing other shell metacharacters.
+	# Many Bourne shells cannot handle close brackets correctly
+	# in scan sets, so we specify it separately.
+	*[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	  arg="\"$arg\""
+	  ;;
+	esac
+
+	# Add the previous argument to base_compile.
+	if test -z "$base_compile"; then
+	  base_compile="$lastarg"
+	else
+	  base_compile="$base_compile $lastarg"
+	fi
+	continue
+	;;
+      esac
+
+      # Accept any command-line options.
+      case $arg in
+      -o)
+	if test "$user_target" != "no"; then
+	  $echo "$modename: you cannot specify \`-o' more than once" 1>&2
+	  exit 1
+	fi
+	user_target=next
+	;;
+
+      -static)
+	build_old_libs=yes
+	continue
+	;;
+
+      -prefer-pic)
+	pic_mode=yes
+	continue
+	;;
+
+      -prefer-non-pic)
+	pic_mode=no
+	continue
+	;;
+
+      -Xcompiler)
+	prev=xcompiler
+	continue
+	;;
+
+      -Wc,*)
+	args=`$echo "X$arg" | $Xsed -e "s/^-Wc,//"`
+	lastarg=
+	IFS="${IFS= 	}"; save_ifs="$IFS"; IFS=','
+	for arg in $args; do
+	  IFS="$save_ifs"
+
+	  # Double-quote args containing other shell metacharacters.
+	  # Many Bourne shells cannot handle close brackets correctly
+	  # in scan sets, so we specify it separately.
+	  case $arg in
+	    *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	    arg="\"$arg\""
+	    ;;
+	  esac
+	  lastarg="$lastarg $arg"
+	done
+	IFS="$save_ifs"
+	lastarg=`$echo "X$lastarg" | $Xsed -e "s/^ //"`
+
+	# Add the arguments to base_compile.
+	if test -z "$base_compile"; then
+	  base_compile="$lastarg"
+	else
+	  base_compile="$base_compile $lastarg"
+	fi
+	continue
+	;;
+      esac
+
+      case $user_target in
+      next)
+	# The next one is the -o target name
+	user_target=yes
+	continue
+	;;
+      yes)
+	# We got the output file
+	user_target=set
+	libobj="$arg"
+	continue
+	;;
+      esac
+
+      # Accept the current argument as the source file.
+      lastarg="$srcfile"
+      srcfile="$arg"
+
+      # Aesthetically quote the previous argument.
+
+      # Backslashify any backslashes, double quotes, and dollar signs.
+      # These are the only characters that are still specially
+      # interpreted inside of double-quoted scrings.
+      lastarg=`$echo "X$lastarg" | $Xsed -e "$sed_quote_subst"`
+
+      # Double-quote args containing other shell metacharacters.
+      # Many Bourne shells cannot handle close brackets correctly
+      # in scan sets, so we specify it separately.
+      case $lastarg in
+      *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	lastarg="\"$lastarg\""
+	;;
+      esac
+
+      # Add the previous argument to base_compile.
+      if test -z "$base_compile"; then
+	base_compile="$lastarg"
+      else
+	base_compile="$base_compile $lastarg"
+      fi
+    done
+
+    case $user_target in
+    set)
+      ;;
+    no)
+      # Get the name of the library object.
+      libobj=`$echo "X$srcfile" | $Xsed -e 's%^.*/%%'`
+      ;;
+    *)
+      $echo "$modename: you must specify a target with \`-o'" 1>&2
+      exit 1
+      ;;
+    esac
+
+    # Recognize several different file suffixes.
+    # If the user specifies -o file.o, it is replaced with file.lo
+    xform='[cCFSfmso]'
+    case $libobj in
+    *.ada) xform=ada ;;
+    *.adb) xform=adb ;;
+    *.ads) xform=ads ;;
+    *.asm) xform=asm ;;
+    *.c++) xform=c++ ;;
+    *.cc) xform=cc ;;
+    *.cpp) xform=cpp ;;
+    *.cxx) xform=cxx ;;
+    *.f90) xform=f90 ;;
+    *.for) xform=for ;;
+    esac
+
+    libobj=`$echo "X$libobj" | $Xsed -e "s/\.$xform$/.lo/"`
+
+    case $libobj in
+    *.lo) obj=`$echo "X$libobj" | $Xsed -e "$lo2o"` ;;
+    *)
+      $echo "$modename: cannot determine name of library object from \`$libobj'" 1>&2
+      exit 1
+      ;;
+    esac
+
+    if test -z "$base_compile"; then
+      $echo "$modename: you must specify a compilation command" 1>&2
+      $echo "$help" 1>&2
+      exit 1
+    fi
+
+    # Delete any leftover library objects.
+    if test "$build_old_libs" = yes; then
+      removelist="$obj $libobj"
+    else
+      removelist="$libobj"
+    fi
+
+    $run $rm $removelist
+    trap "$run $rm $removelist; exit 1" 1 2 15
+
+    # On Cygwin there's no "real" PIC flag so we must build both object types
+    case $host_os in
+    cygwin* | mingw* | pw32* | os2*)
+      pic_mode=default
+      ;;
+    esac
+    if test $pic_mode = no && test "$deplibs_check_method" != pass_all; then
+      # non-PIC code in shared libraries is not supported
+      pic_mode=default
+    fi
+
+    # Calculate the filename of the output object if compiler does
+    # not support -o with -c
+    if test "$compiler_c_o" = no; then
+      output_obj=`$echo "X$srcfile" | $Xsed -e 's%^.*/%%' -e 's%\.[^.]*$%%'`.${objext}
+      lockfile="$output_obj.lock"
+      removelist="$removelist $output_obj $lockfile"
+      trap "$run $rm $removelist; exit 1" 1 2 15
+    else
+      need_locks=no
+      lockfile=
+    fi
+
+    # Lock this critical section if it is needed
+    # We use this script file to make the link, it avoids creating a new file
+    if test "$need_locks" = yes; then
+      until $run ln "$0" "$lockfile" 2>/dev/null; do
+	$show "Waiting for $lockfile to be removed"
+	sleep 2
+      done
+    elif test "$need_locks" = warn; then
+      if test -f "$lockfile"; then
+	echo "\
+*** ERROR, $lockfile exists and contains:
+`cat $lockfile 2>/dev/null`
+
+This indicates that another process is trying to use the same
+temporary object file, and libtool could not work around it because
+your compiler does not support \`-c' and \`-o' together.  If you
+repeat this compilation, it may succeed, by chance, but you had better
+avoid parallel builds (make -j) in this platform, or get a better
+compiler."
+
+	$run $rm $removelist
+	exit 1
+      fi
+      echo $srcfile > "$lockfile"
+    fi
+
+    if test -n "$fix_srcfile_path"; then
+      eval srcfile=\"$fix_srcfile_path\"
+    fi
+
+    # Only build a PIC object if we are building libtool libraries.
+    if test "$build_libtool_libs" = yes; then
+      # Without this assignment, base_compile gets emptied.
+      fbsd_hideous_sh_bug=$base_compile
+
+      if test "$pic_mode" != no; then
+	# All platforms use -DPIC, to notify preprocessed assembler code.
+	command="$base_compile $srcfile $pic_flag -DPIC"
+      else
+	# Don't build PIC code
+	command="$base_compile $srcfile"
+      fi
+      if test "$build_old_libs" = yes; then
+	lo_libobj="$libobj"
+	dir=`$echo "X$libobj" | $Xsed -e 's%/[^/]*$%%'`
+	if test "X$dir" = "X$libobj"; then
+	  dir="$objdir"
+	else
+	  dir="$dir/$objdir"
+	fi
+	libobj="$dir/"`$echo "X$libobj" | $Xsed -e 's%^.*/%%'`
+
+	if test -d "$dir"; then
+	  $show "$rm $libobj"
+	  $run $rm $libobj
+	else
+	  $show "$mkdir $dir"
+	  $run $mkdir $dir
+	  status=$?
+	  if test $status -ne 0 && test ! -d $dir; then
+	    exit $status
+	  fi
+	fi
+      fi
+      if test "$compiler_o_lo" = yes; then
+	output_obj="$libobj"
+	command="$command -o $output_obj"
+      elif test "$compiler_c_o" = yes; then
+	output_obj="$obj"
+	command="$command -o $output_obj"
+      fi
+
+      $run $rm "$output_obj"
+      $show "$command"
+      if $run eval "$command"; then :
+      else
+	test -n "$output_obj" && $run $rm $removelist
+	exit 1
+      fi
+
+      if test "$need_locks" = warn &&
+	 test x"`cat $lockfile 2>/dev/null`" != x"$srcfile"; then
+	echo "\
+*** ERROR, $lockfile contains:
+`cat $lockfile 2>/dev/null`
+
+but it should contain:
+$srcfile
+
+This indicates that another process is trying to use the same
+temporary object file, and libtool could not work around it because
+your compiler does not support \`-c' and \`-o' together.  If you
+repeat this compilation, it may succeed, by chance, but you had better
+avoid parallel builds (make -j) in this platform, or get a better
+compiler."
+
+	$run $rm $removelist
+	exit 1
+      fi
+
+      # Just move the object if needed, then go on to compile the next one
+      if test x"$output_obj" != x"$libobj"; then
+	$show "$mv $output_obj $libobj"
+	if $run $mv $output_obj $libobj; then :
+	else
+	  error=$?
+	  $run $rm $removelist
+	  exit $error
+	fi
+      fi
+
+      # If we have no pic_flag, then copy the object into place and finish.
+      if (test -z "$pic_flag" || test "$pic_mode" != default) &&
+	 test "$build_old_libs" = yes; then
+	# Rename the .lo from within objdir to obj
+	if test -f $obj; then
+	  $show $rm $obj
+	  $run $rm $obj
+	fi
+
+	$show "$mv $libobj $obj"
+	if $run $mv $libobj $obj; then :
+	else
+	  error=$?
+	  $run $rm $removelist
+	  exit $error
+	fi
+
+	xdir=`$echo "X$obj" | $Xsed -e 's%/[^/]*$%%'`
+	if test "X$xdir" = "X$obj"; then
+	  xdir="."
+	else
+	  xdir="$xdir"
+	fi
+	baseobj=`$echo "X$obj" | $Xsed -e "s%.*/%%"`
+	libobj=`$echo "X$baseobj" | $Xsed -e "$o2lo"`
+	# Now arrange that obj and lo_libobj become the same file
+	$show "(cd $xdir && $LN_S $baseobj $libobj)"
+	if $run eval '(cd $xdir && $LN_S $baseobj $libobj)'; then
+	  exit 0
+	else
+	  error=$?
+	  $run $rm $removelist
+	  exit $error
+	fi
+      fi
+
+      # Allow error messages only from the first compilation.
+      suppress_output=' >/dev/null 2>&1'
+    fi
+
+    # Only build a position-dependent object if we build old libraries.
+    if test "$build_old_libs" = yes; then
+      if test "$pic_mode" != yes; then
+	# Don't build PIC code
+	command="$base_compile $srcfile"
+      else
+	# All platforms use -DPIC, to notify preprocessed assembler code.
+	command="$base_compile $srcfile $pic_flag -DPIC"
+      fi
+      if test "$compiler_c_o" = yes; then
+	command="$command -o $obj"
+	output_obj="$obj"
+      fi
+
+      # Suppress compiler output if we already did a PIC compilation.
+      command="$command$suppress_output"
+      $run $rm "$output_obj"
+      $show "$command"
+      if $run eval "$command"; then :
+      else
+	$run $rm $removelist
+	exit 1
+      fi
+
+      if test "$need_locks" = warn &&
+	 test x"`cat $lockfile 2>/dev/null`" != x"$srcfile"; then
+	echo "\
+*** ERROR, $lockfile contains:
+`cat $lockfile 2>/dev/null`
+
+but it should contain:
+$srcfile
+
+This indicates that another process is trying to use the same
+temporary object file, and libtool could not work around it because
+your compiler does not support \`-c' and \`-o' together.  If you
+repeat this compilation, it may succeed, by chance, but you had better
+avoid parallel builds (make -j) in this platform, or get a better
+compiler."
+
+	$run $rm $removelist
+	exit 1
+      fi
+
+      # Just move the object if needed
+      if test x"$output_obj" != x"$obj"; then
+	$show "$mv $output_obj $obj"
+	if $run $mv $output_obj $obj; then :
+	else
+	  error=$?
+	  $run $rm $removelist
+	  exit $error
+	fi
+      fi
+
+      # Create an invalid libtool object if no PIC, so that we do not
+      # accidentally link it into a program.
+      if test "$build_libtool_libs" != yes; then
+	$show "echo timestamp > $libobj"
+	$run eval "echo timestamp > \$libobj" || exit $?
+      else
+	# Move the .lo from within objdir
+	$show "$mv $libobj $lo_libobj"
+	if $run $mv $libobj $lo_libobj; then :
+	else
+	  error=$?
+	  $run $rm $removelist
+	  exit $error
+	fi
+      fi
+    fi
+
+    # Unlock the critical section if it was locked
+    if test "$need_locks" != no; then
+      $run $rm "$lockfile"
+    fi
+
+    exit 0
+    ;;
+
+  # libtool link mode
+  link | relink)
+    modename="$modename: link"
+    case $host in
+    *-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-os2*)
+      # It is impossible to link a dll without this setting, and
+      # we shouldn't force the makefile maintainer to figure out
+      # which system we are compiling for in order to pass an extra
+      # flag for every libtool invokation.
+      # allow_undefined=no
+
+      # FIXME: Unfortunately, there are problems with the above when trying
+      # to make a dll which has undefined symbols, in which case not
+      # even a static library is built.  For now, we need to specify
+      # -no-undefined on the libtool link line when we can be certain
+      # that all symbols are satisfied, otherwise we get a static library.
+      allow_undefined=yes
+      ;;
+    *)
+      allow_undefined=yes
+      ;;
+    esac
+    libtool_args="$nonopt"
+    compile_command="$nonopt"
+    finalize_command="$nonopt"
+
+    compile_rpath=
+    finalize_rpath=
+    compile_shlibpath=
+    finalize_shlibpath=
+    convenience=
+    old_convenience=
+    deplibs=
+    old_deplibs=
+    compiler_flags=
+    linker_flags=
+    dllsearchpath=
+    lib_search_path=`pwd`
+
+    avoid_version=no
+    dlfiles=
+    dlprefiles=
+    dlself=no
+    export_dynamic=no
+    export_symbols=
+    export_symbols_regex=
+    generated=
+    libobjs=
+    ltlibs=
+    module=no
+    no_install=no
+    objs=
+    prefer_static_libs=no
+    preload=no
+    prev=
+    prevarg=
+    release=
+    rpath=
+    xrpath=
+    perm_rpath=
+    temp_rpath=
+    thread_safe=no
+    vinfo=
+
+    # We need to know -static, to get the right output filenames.
+    for arg
+    do
+      case $arg in
+      -all-static | -static)
+	if test "X$arg" = "X-all-static"; then
+	  if test "$build_libtool_libs" = yes && test -z "$link_static_flag"; then
+	    $echo "$modename: warning: complete static linking is impossible in this configuration" 1>&2
+	  fi
+	  if test -n "$link_static_flag"; then
+	    dlopen_self=$dlopen_self_static
+	  fi
+	else
+	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+	    dlopen_self=$dlopen_self_static
+	  fi
+	fi
+	build_libtool_libs=no
+	build_old_libs=yes
+	prefer_static_libs=yes
+	break
+	;;
+      esac
+    done
+
+    # See if our shared archives depend on static archives.
+    test -n "$old_archive_from_new_cmds" && build_old_libs=yes
+
+    # Go through the arguments, transforming them on the way.
+    while test $# -gt 0; do
+      arg="$1"
+      shift
+      case $arg in
+      *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	qarg=\"`$echo "X$arg" | $Xsed -e "$sed_quote_subst"`\" ### testsuite: skip nested quoting test
+	;;
+      *) qarg=$arg ;;
+      esac
+      libtool_args="$libtool_args $qarg"
+
+      # If the previous option needs an argument, assign it.
+      if test -n "$prev"; then
+	case $prev in
+	output)
+	  compile_command="$compile_command @OUTPUT@"
+	  finalize_command="$finalize_command @OUTPUT@"
+	  ;;
+	esac
+
+	case $prev in
+	dlfiles|dlprefiles)
+	  if test "$preload" = no; then
+	    # Add the symbol object into the linking commands.
+	    compile_command="$compile_command @SYMFILE@"
+	    finalize_command="$finalize_command @SYMFILE@"
+	    preload=yes
+	  fi
+	  case $arg in
+	  *.la | *.lo) ;;  # We handle these cases below.
+	  force)
+	    if test "$dlself" = no; then
+	      dlself=needless
+	      export_dynamic=yes
+	    fi
+	    prev=
+	    continue
+	    ;;
+	  self)
+	    if test "$prev" = dlprefiles; then
+	      dlself=yes
+	    elif test "$prev" = dlfiles && test "$dlopen_self" != yes; then
+	      dlself=yes
+	    else
+	      dlself=needless
+	      export_dynamic=yes
+	    fi
+	    prev=
+	    continue
+	    ;;
+	  *)
+	    if test "$prev" = dlfiles; then
+	      dlfiles="$dlfiles $arg"
+	    else
+	      dlprefiles="$dlprefiles $arg"
+	    fi
+	    prev=
+	    continue
+	    ;;
+	  esac
+	  ;;
+	expsyms)
+	  export_symbols="$arg"
+	  if test ! -f "$arg"; then
+	    $echo "$modename: symbol file \`$arg' does not exist"
+	    exit 1
+	  fi
+	  prev=
+	  continue
+	  ;;
+	expsyms_regex)
+	  export_symbols_regex="$arg"
+	  prev=
+	  continue
+	  ;;
+	release)
+	  release="-$arg"
+	  prev=
+	  continue
+	  ;;
+	rpath | xrpath)
+	  # We need an absolute path.
+	  case $arg in
+	  [\\/]* | [A-Za-z]:[\\/]*) ;;
+	  *)
+	    $echo "$modename: only absolute run-paths are allowed" 1>&2
+	    exit 1
+	    ;;
+	  esac
+	  if test "$prev" = rpath; then
+	    case "$rpath " in
+	    *" $arg "*) ;;
+	    *) rpath="$rpath $arg" ;;
+	    esac
+	  else
+	    case "$xrpath " in
+	    *" $arg "*) ;;
+	    *) xrpath="$xrpath $arg" ;;
+	    esac
+	  fi
+	  prev=
+	  continue
+	  ;;
+	xcompiler)
+	  compiler_flags="$compiler_flags $qarg"
+	  prev=
+	  compile_command="$compile_command $qarg"
+	  finalize_command="$finalize_command $qarg"
+	  continue
+	  ;;
+	xlinker)
+	  linker_flags="$linker_flags $qarg"
+	  compiler_flags="$compiler_flags $wl$qarg"
+	  prev=
+	  compile_command="$compile_command $wl$qarg"
+	  finalize_command="$finalize_command $wl$qarg"
+	  continue
+	  ;;
+	*)
+	  eval "$prev=\"\$arg\""
+	  prev=
+	  continue
+	  ;;
+	esac
+      fi # test -n $prev
+
+      prevarg="$arg"
+
+      case $arg in
+      -all-static)
+	if test -n "$link_static_flag"; then
+	  compile_command="$compile_command $link_static_flag"
+	  finalize_command="$finalize_command $link_static_flag"
+	fi
+	continue
+	;;
+
+      -allow-undefined)
+	# FIXME: remove this flag sometime in the future.
+	$echo "$modename: \`-allow-undefined' is deprecated because it is the default" 1>&2
+	continue
+	;;
+
+      -avoid-version)
+	avoid_version=yes
+	continue
+	;;
+
+      -dlopen)
+	prev=dlfiles
+	continue
+	;;
+
+      -dlpreopen)
+	prev=dlprefiles
+	continue
+	;;
+
+      -export-dynamic)
+	export_dynamic=yes
+	continue
+	;;
+
+      -export-symbols | -export-symbols-regex)
+	if test -n "$export_symbols" || test -n "$export_symbols_regex"; then
+	  $echo "$modename: more than one -exported-symbols argument is not allowed"
+	  exit 1
+	fi
+	if test "X$arg" = "X-export-symbols"; then
+	  prev=expsyms
+	else
+	  prev=expsyms_regex
+	fi
+	continue
+	;;
+
+      # The native IRIX linker understands -LANG:*, -LIST:* and -LNO:*
+      # so, if we see these flags be careful not to treat them like -L
+      -L[A-Z][A-Z]*:*)
+	case $with_gcc/$host in
+	no/*-*-irix*)
+	  compile_command="$compile_command $arg"
+	  finalize_command="$finalize_command $arg"
+	  ;;
+	esac
+	continue
+	;;
+
+      -L*)
+	dir=`$echo "X$arg" | $Xsed -e 's/^-L//'`
+	# We need an absolute path.
+	case $dir in
+	[\\/]* | [A-Za-z]:[\\/]*) ;;
+	*)
+	  absdir=`cd "$dir" && pwd`
+	  if test -z "$absdir"; then
+	    $echo "$modename: cannot determine absolute directory name of \`$dir'" 1>&2
+	    exit 1
+	  fi
+	  dir="$absdir"
+	  ;;
+	esac
+	case "$deplibs " in
+	*" -L$dir "*) ;;
+	*)
+	  deplibs="$deplibs -L$dir"
+	  lib_search_path="$lib_search_path $dir"
+	  ;;
+	esac
+	case $host in
+	*-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-os2*)
+	  case :$dllsearchpath: in
+	  *":$dir:"*) ;;
+	  *) dllsearchpath="$dllsearchpath:$dir";;
+	  esac
+	  ;;
+	esac
+	continue
+	;;
+
+      -l*)
+	if test "X$arg" = "X-lc" || test "X$arg" = "X-lm"; then
+	  case $host in
+	  *-*-cygwin* | *-*-pw32* | *-*-beos*)
+	    # These systems don't actually have a C or math library (as such)
+	    continue
+	    ;;
+	  *-*-mingw* | *-*-os2*)
+	    # These systems don't actually have a C library (as such)
+	    test "X$arg" = "X-lc" && continue
+	    ;;
+	  esac
+	fi
+	deplibs="$deplibs $arg"
+	continue
+	;;
+
+      -module)
+	module=yes
+	continue
+	;;
+
+      -no-fast-install)
+	fast_install=no
+	continue
+	;;
+
+      -no-install)
+	case $host in
+	*-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-os2*)
+	  # The PATH hackery in wrapper scripts is required on Windows
+	  # in order for the loader to find any dlls it needs.
+	  $echo "$modename: warning: \`-no-install' is ignored for $host" 1>&2
+	  $echo "$modename: warning: assuming \`-no-fast-install' instead" 1>&2
+	  fast_install=no
+	  ;;
+	*) no_install=yes ;;
+	esac
+	continue
+	;;
+
+      -no-undefined)
+	allow_undefined=no
+	continue
+	;;
+
+      -o) prev=output ;;
+
+      -release)
+	prev=release
+	continue
+	;;
+
+      -rpath)
+	prev=rpath
+	continue
+	;;
+
+      -R)
+	prev=xrpath
+	continue
+	;;
+
+      -R*)
+	dir=`$echo "X$arg" | $Xsed -e 's/^-R//'`
+	# We need an absolute path.
+	case $dir in
+	[\\/]* | [A-Za-z]:[\\/]*) ;;
+	*)
+	  $echo "$modename: only absolute run-paths are allowed" 1>&2
+	  exit 1
+	  ;;
+	esac
+	case "$xrpath " in
+	*" $dir "*) ;;
+	*) xrpath="$xrpath $dir" ;;
+	esac
+	continue
+	;;
+
+      -static)
+	# The effects of -static are defined in a previous loop.
+	# We used to do the same as -all-static on platforms that
+	# didn't have a PIC flag, but the assumption that the effects
+	# would be equivalent was wrong.  It would break on at least
+	# Digital Unix and AIX.
+	continue
+	;;
+
+      -thread-safe)
+	thread_safe=yes
+	continue
+	;;
+
+      -version-info)
+	prev=vinfo
+	continue
+	;;
+
+      -Wc,*)
+	args=`$echo "X$arg" | $Xsed -e "$sed_quote_subst" -e 's/^-Wc,//'`
+	arg=
+	IFS="${IFS= 	}"; save_ifs="$IFS"; IFS=','
+	for flag in $args; do
+	  IFS="$save_ifs"
+	  case $flag in
+	    *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	    flag="\"$flag\""
+	    ;;
+	  esac
+	  arg="$arg $wl$flag"
+	  compiler_flags="$compiler_flags $flag"
+	done
+	IFS="$save_ifs"
+	arg=`$echo "X$arg" | $Xsed -e "s/^ //"`
+	;;
+
+      -Wl,*)
+	args=`$echo "X$arg" | $Xsed -e "$sed_quote_subst" -e 's/^-Wl,//'`
+	arg=
+	IFS="${IFS= 	}"; save_ifs="$IFS"; IFS=','
+	for flag in $args; do
+	  IFS="$save_ifs"
+	  case $flag in
+	    *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	    flag="\"$flag\""
+	    ;;
+	  esac
+	  arg="$arg $wl$flag"
+	  compiler_flags="$compiler_flags $wl$flag"
+	  linker_flags="$linker_flags $flag"
+	done
+	IFS="$save_ifs"
+	arg=`$echo "X$arg" | $Xsed -e "s/^ //"`
+	;;
+
+      -Xcompiler)
+	prev=xcompiler
+	continue
+	;;
+
+      -Xlinker)
+	prev=xlinker
+	continue
+	;;
+
+      # Some other compiler flag.
+      -* | +*)
+	# Unknown arguments in both finalize_command and compile_command need
+	# to be aesthetically quoted because they are evaled later.
+	arg=`$echo "X$arg" | $Xsed -e "$sed_quote_subst"`
+	case $arg in
+	*[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	  arg="\"$arg\""
+	  ;;
+	esac
+	;;
+
+      *.lo | *.$objext)
+	# A library or standard object.
+	if test "$prev" = dlfiles; then
+	  # This file was specified with -dlopen.
+	  if test "$build_libtool_libs" = yes && test "$dlopen_support" = yes; then
+	    dlfiles="$dlfiles $arg"
+	    prev=
+	    continue
+	  else
+	    # If libtool objects are unsupported, then we need to preload.
+	    prev=dlprefiles
+	  fi
+	fi
+
+	if test "$prev" = dlprefiles; then
+	  # Preload the old-style object.
+	  dlprefiles="$dlprefiles "`$echo "X$arg" | $Xsed -e "$lo2o"`
+	  prev=
+	else
+	  case $arg in
+	  *.lo) libobjs="$libobjs $arg" ;;
+	  *) objs="$objs $arg" ;;
+	  esac
+	fi
+	;;
+
+      *.$libext)
+	# An archive.
+	deplibs="$deplibs $arg"
+	old_deplibs="$old_deplibs $arg"
+	continue
+	;;
+
+      *.la)
+	# A libtool-controlled library.
+
+	if test "$prev" = dlfiles; then
+	  # This library was specified with -dlopen.
+	  dlfiles="$dlfiles $arg"
+	  prev=
+	elif test "$prev" = dlprefiles; then
+	  # The library was specified with -dlpreopen.
+	  dlprefiles="$dlprefiles $arg"
+	  prev=
+	else
+	  deplibs="$deplibs $arg"
+	fi
+	continue
+	;;
+
+      # Some other compiler argument.
+      *)
+	# Unknown arguments in both finalize_command and compile_command need
+	# to be aesthetically quoted because they are evaled later.
+	arg=`$echo "X$arg" | $Xsed -e "$sed_quote_subst"`
+	case $arg in
+	*[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*|"")
+	  arg="\"$arg\""
+	  ;;
+	esac
+	;;
+      esac # arg
+
+      # Now actually substitute the argument into the commands.
+      if test -n "$arg"; then
+	compile_command="$compile_command $arg"
+	finalize_command="$finalize_command $arg"
+      fi
+    done # argument parsing loop
+
+    if test -n "$prev"; then
+      $echo "$modename: the \`$prevarg' option requires an argument" 1>&2
+      $echo "$help" 1>&2
+      exit 1
+    fi
+
+    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then
+      eval arg=\"$export_dynamic_flag_spec\"
+      compile_command="$compile_command $arg"
+      finalize_command="$finalize_command $arg"
+    fi
+
+    # calculate the name of the file, without its directory
+    outputname=`$echo "X$output" | $Xsed -e 's%^.*/%%'`
+    libobjs_save="$libobjs"
+
+    if test -n "$shlibpath_var"; then
+      # get the directories listed in $shlibpath_var
+      eval shlib_search_path=\`\$echo \"X\${$shlibpath_var}\" \| \$Xsed -e \'s/:/ /g\'\`
+    else
+      shlib_search_path=
+    fi
+    eval sys_lib_search_path=\"$sys_lib_search_path_spec\"
+    eval sys_lib_dlsearch_path=\"$sys_lib_dlsearch_path_spec\"
+
+    output_objdir=`$echo "X$output" | $Xsed -e 's%/[^/]*$%%'`
+    if test "X$output_objdir" = "X$output"; then
+      output_objdir="$objdir"
+    else
+      output_objdir="$output_objdir/$objdir"
+    fi
+    # Create the object directory.
+    if test ! -d $output_objdir; then
+      $show "$mkdir $output_objdir"
+      $run $mkdir $output_objdir
+      status=$?
+      if test $status -ne 0 && test ! -d $output_objdir; then
+	exit $status
+      fi
+    fi
+
+    # Determine the type of output
+    case $output in
+    "")
+      $echo "$modename: you must specify an output file" 1>&2
+      $echo "$help" 1>&2
+      exit 1
+      ;;
+    *.$libext) linkmode=oldlib ;;
+    *.lo | *.$objext) linkmode=obj ;;
+    *.la) linkmode=lib ;;
+    *) linkmode=prog ;; # Anything else should be a program.
+    esac
+
+    specialdeplibs=
+    libs=
+    # Find all interdependent deplibs by searching for libraries
+    # that are linked more than once (e.g. -la -lb -la)
+    for deplib in $deplibs; do
+      case "$libs " in
+      *" $deplib "*) specialdeplibs="$specialdeplibs $deplib" ;;
+      esac
+      libs="$libs $deplib"
+    done
+    deplibs=
+    newdependency_libs=
+    newlib_search_path=
+    need_relink=no # whether we're linking any uninstalled libtool libraries
+    notinst_deplibs= # not-installed libtool libraries
+    notinst_path= # paths that contain not-installed libtool libraries
+    case $linkmode in
+    lib)
+	passes="conv link"
+	for file in $dlfiles $dlprefiles; do
+	  case $file in
+	  *.la) ;;
+	  *)
+	    $echo "$modename: libraries can \`-dlopen' only libtool libraries: $file" 1>&2
+	    exit 1
+	    ;;
+	  esac
+	done
+	;;
+    prog)
+	compile_deplibs=
+	finalize_deplibs=
+	alldeplibs=no
+	newdlfiles=
+	newdlprefiles=
+	passes="conv scan dlopen dlpreopen link"
+	;;
+    *)  passes="conv"
+	;;
+    esac
+    for pass in $passes; do
+      if test $linkmode = prog; then
+	# Determine which files to process
+	case $pass in
+	dlopen)
+	  libs="$dlfiles"
+	  save_deplibs="$deplibs" # Collect dlpreopened libraries
+	  deplibs=
+	  ;;
+	dlpreopen) libs="$dlprefiles" ;;
+	link) libs="$deplibs %DEPLIBS% $dependency_libs" ;;
+	esac
+      fi
+      for deplib in $libs; do
+	lib=
+	found=no
+	case $deplib in
+	-l*)
+	  if test $linkmode = oldlib && test $linkmode = obj; then
+	    $echo "$modename: warning: \`-l' is ignored for archives/objects: $deplib" 1>&2
+	    continue
+	  fi
+	  if test $pass = conv; then
+	    deplibs="$deplib $deplibs"
+	    continue
+	  fi
+	  name=`$echo "X$deplib" | $Xsed -e 's/^-l//'`
+	  for searchdir in $newlib_search_path $lib_search_path $sys_lib_search_path $shlib_search_path; do
+	    # Search the libtool library
+	    lib="$searchdir/lib${name}.la"
+	    if test -f "$lib"; then
+	      found=yes
+	      break
+	    fi
+	  done
+	  if test "$found" != yes; then
+	    # deplib doesn't seem to be a libtool library
+	    if test "$linkmode,$pass" = "prog,link"; then
+	      compile_deplibs="$deplib $compile_deplibs"
+	      finalize_deplibs="$deplib $finalize_deplibs"
+	    else
+	      deplibs="$deplib $deplibs"
+	      test $linkmode = lib && newdependency_libs="$deplib $newdependency_libs"
+	    fi
+	    continue
+	  fi
+	  ;; # -l
+	-L*)
+	  case $linkmode in
+	  lib)
+	    deplibs="$deplib $deplibs"
+	    test $pass = conv && continue
+	    newdependency_libs="$deplib $newdependency_libs"
+	    newlib_search_path="$newlib_search_path "`$echo "X$deplib" | $Xsed -e 's/^-L//'`
+	    ;;
+	  prog)
+	    if test $pass = conv; then
+	      deplibs="$deplib $deplibs"
+	      continue
+	    fi
+	    if test $pass = scan; then
+	      deplibs="$deplib $deplibs"
+	      newlib_search_path="$newlib_search_path "`$echo "X$deplib" | $Xsed -e 's/^-L//'`
+	    else
+	      compile_deplibs="$deplib $compile_deplibs"
+	      finalize_deplibs="$deplib $finalize_deplibs"
+	    fi
+	    ;;
+	  *)
+	    $echo "$modename: warning: \`-L' is ignored for archives/objects: $deplib" 1>&2
+	    ;;
+	  esac # linkmode
+	  continue
+	  ;; # -L
+	-R*)
+	  if test $pass = link; then
+	    dir=`$echo "X$deplib" | $Xsed -e 's/^-R//'`
+	    # Make sure the xrpath contains only unique directories.
+	    case "$xrpath " in
+	    *" $dir "*) ;;
+	    *) xrpath="$xrpath $dir" ;;
+	    esac
+	  fi
+	  deplibs="$deplib $deplibs"
+	  continue
+	  ;;
+	*.la) lib="$deplib" ;;
+	*.$libext)
+	  if test $pass = conv; then
+	    deplibs="$deplib $deplibs"
+	    continue
+	  fi
+	  case $linkmode in
+	  lib)
+	    if test "$deplibs_check_method" != pass_all; then
+	      echo
+	      echo "*** Warning: This library needs some functionality provided by $deplib."
+	      echo "*** I have the capability to make that library automatically link in when"
+	      echo "*** you link to this library.  But I can only do this if you have a"
+	      echo "*** shared version of the library, which you do not appear to have."
+	    else
+	      echo
+	      echo "*** Warning: Linking the shared library $output against the"
+	      echo "*** static library $deplib is not portable!"
+	      deplibs="$deplib $deplibs"
+	    fi
+	    continue
+	    ;;
+	  prog)
+	    if test $pass != link; then
+	      deplibs="$deplib $deplibs"
+	    else
+	      compile_deplibs="$deplib $compile_deplibs"
+	      finalize_deplibs="$deplib $finalize_deplibs"
+	    fi
+	    continue
+	    ;;
+	  esac # linkmode
+	  ;; # *.$libext
+	*.lo | *.$objext)
+	  if test $pass = dlpreopen || test "$dlopen_support" != yes || test "$build_libtool_libs" = no; then
+	    # If there is no dlopen support or we're linking statically,
+	    # we need to preload.
+	    newdlprefiles="$newdlprefiles $deplib"
+	    compile_deplibs="$deplib $compile_deplibs"
+	    finalize_deplibs="$deplib $finalize_deplibs"
+	  else
+	    newdlfiles="$newdlfiles $deplib"
+	  fi
+	  continue
+	  ;;
+	%DEPLIBS%)
+	  alldeplibs=yes
+	  continue
+	  ;;
+	esac # case $deplib
+	if test $found = yes || test -f "$lib"; then :
+	else
+	  $echo "$modename: cannot find the library \`$lib'" 1>&2
+	  exit 1
+	fi
+
+	# Check to see that this really is a libtool archive.
+	if (sed -e '2q' $lib | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then :
+	else
+	  $echo "$modename: \`$lib' is not a valid libtool archive" 1>&2
+	  exit 1
+	fi
+
+	ladir=`$echo "X$lib" | $Xsed -e 's%/[^/]*$%%'`
+	test "X$ladir" = "X$lib" && ladir="."
+
+	dlname=
+	dlopen=
+	dlpreopen=
+	libdir=
+	library_names=
+	old_library=
+	# If the library was installed with an old release of libtool,
+	# it will not redefine variable installed.
+	installed=yes
+
+	# Read the .la file
+	case $lib in
+	*/* | *\\*) . $lib ;;
+	*) . ./$lib ;;
+	esac
+
+	if test "$linkmode,$pass" = "lib,link" ||
+	   test "$linkmode,$pass" = "prog,scan" ||
+	   { test $linkmode = oldlib && test $linkmode = obj; }; then
+	   # Add dl[pre]opened files of deplib
+	  test -n "$dlopen" && dlfiles="$dlfiles $dlopen"
+	  test -n "$dlpreopen" && dlprefiles="$dlprefiles $dlpreopen"
+	fi
+
+	if test $pass = conv; then
+	  # Only check for convenience libraries
+	  deplibs="$lib $deplibs"
+	  if test -z "$libdir"; then
+	    if test -z "$old_library"; then
+	      $echo "$modename: cannot find name of link library for \`$lib'" 1>&2
+	      exit 1
+	    fi
+	    # It is a libtool convenience library, so add in its objects.
+	    convenience="$convenience $ladir/$objdir/$old_library"
+	    old_convenience="$old_convenience $ladir/$objdir/$old_library"
+	    tmp_libs=
+	    for deplib in $dependency_libs; do
+	      deplibs="$deplib $deplibs"
+	      case "$tmp_libs " in
+	      *" $deplib "*) specialdeplibs="$specialdeplibs $deplib" ;;
+	      esac
+	      tmp_libs="$tmp_libs $deplib"
+	    done
+	  elif test $linkmode != prog && test $linkmode != lib; then
+	    $echo "$modename: \`$lib' is not a convenience library" 1>&2
+	    exit 1
+	  fi
+	  continue
+	fi # $pass = conv
+
+	# Get the name of the library we link against.
+	linklib=
+	for l in $old_library $library_names; do
+	  linklib="$l"
+	done
+	if test -z "$linklib"; then
+	  $echo "$modename: cannot find name of link library for \`$lib'" 1>&2
+	  exit 1
+	fi
+
+	# This library was specified with -dlopen.
+	if test $pass = dlopen; then
+	  if test -z "$libdir"; then
+	    $echo "$modename: cannot -dlopen a convenience library: \`$lib'" 1>&2
+	    exit 1
+	  fi
+	  if test -z "$dlname" || test "$dlopen_support" != yes || test "$build_libtool_libs" = no; then
+	    # If there is no dlname, no dlopen support or we're linking
+	    # statically, we need to preload.
+	    dlprefiles="$dlprefiles $lib"
+	  else
+	    newdlfiles="$newdlfiles $lib"
+	  fi
+	  continue
+	fi # $pass = dlopen
+
+	# We need an absolute path.
+	case $ladir in
+	[\\/]* | [A-Za-z]:[\\/]*) abs_ladir="$ladir" ;;
+	*)
+	  abs_ladir=`cd "$ladir" && pwd`
+	  if test -z "$abs_ladir"; then
+	    $echo "$modename: warning: cannot determine absolute directory name of \`$ladir'" 1>&2
+	    $echo "$modename: passing it literally to the linker, although it might fail" 1>&2
+	    abs_ladir="$ladir"
+	  fi
+	  ;;
+	esac
+	laname=`$echo "X$lib" | $Xsed -e 's%^.*/%%'`
+
+	# Find the relevant object directory and library name.
+	if test "X$installed" = Xyes; then
+	  if test ! -f "$libdir/$linklib" && test -f "$abs_ladir/$linklib"; then
+	    $echo "$modename: warning: library \`$lib' was moved." 1>&2
+	    dir="$ladir"
+	    absdir="$abs_ladir"
+	    libdir="$abs_ladir"
+	  else
+	    dir="$libdir"
+	    absdir="$libdir"
+	  fi
+	else
+	  dir="$ladir/$objdir"
+	  absdir="$abs_ladir/$objdir"
+	  # Remove this search path later
+	  notinst_path="$notinst_path $abs_ladir"
+	fi # $installed = yes
+	name=`$echo "X$laname" | $Xsed -e 's/\.la$//' -e 's/^lib//'`
+
+	# This library was specified with -dlpreopen.
+	if test $pass = dlpreopen; then
+	  if test -z "$libdir"; then
+	    $echo "$modename: cannot -dlpreopen a convenience library: \`$lib'" 1>&2
+	    exit 1
+	  fi
+	  # Prefer using a static library (so that no silly _DYNAMIC symbols
+	  # are required to link).
+	  if test -n "$old_library"; then
+	    newdlprefiles="$newdlprefiles $dir/$old_library"
+	  # Otherwise, use the dlname, so that lt_dlopen finds it.
+	  elif test -n "$dlname"; then
+	    newdlprefiles="$newdlprefiles $dir/$dlname"
+	  else
+	    newdlprefiles="$newdlprefiles $dir/$linklib"
+	  fi
+	fi # $pass = dlpreopen
+
+	if test -z "$libdir"; then
+	  # Link the convenience library
+	  if test $linkmode = lib; then
+	    deplibs="$dir/$old_library $deplibs"
+	  elif test "$linkmode,$pass" = "prog,link"; then
+	    compile_deplibs="$dir/$old_library $compile_deplibs"
+	    finalize_deplibs="$dir/$old_library $finalize_deplibs"
+	  else
+	    deplibs="$lib $deplibs"
+	  fi
+	  continue
+	fi
+
+	if test $linkmode = prog && test $pass != link; then
+	  newlib_search_path="$newlib_search_path $ladir"
+	  deplibs="$lib $deplibs"
+
+	  linkalldeplibs=no
+	  if test "$link_all_deplibs" != no || test -z "$library_names" ||
+	     test "$build_libtool_libs" = no; then
+	    linkalldeplibs=yes
+	  fi
+
+	  tmp_libs=
+	  for deplib in $dependency_libs; do
+	    case $deplib in
+	    -L*) newlib_search_path="$newlib_search_path "`$echo "X$deplib" | $Xsed -e 's/^-L//'`;; ### testsuite: skip nested quoting test
+	    esac
+	    # Need to link against all dependency_libs?
+	    if test $linkalldeplibs = yes; then
+	      deplibs="$deplib $deplibs"
+	    else
+	      # Need to hardcode shared library paths
+	      # or/and link against static libraries
+	      newdependency_libs="$deplib $newdependency_libs"
+	    fi
+	    case "$tmp_libs " in
+	    *" $deplib "*) specialdeplibs="$specialdeplibs $deplib" ;;
+	    esac
+	    tmp_libs="$tmp_libs $deplib"
+	  done # for deplib
+	  continue
+	fi # $linkmode = prog...
+
+	link_static=no # Whether the deplib will be linked statically
+	if test -n "$library_names" &&
+	   { test "$prefer_static_libs" = no || test -z "$old_library"; }; then
+	  # Link against this shared library
+
+	  if test "$linkmode,$pass" = "prog,link" ||
+	   { test $linkmode = lib && test $hardcode_into_libs = yes; }; then
+	    # Hardcode the library path.
+	    # Skip directories that are in the system default run-time
+	    # search path.
+	    case " $sys_lib_dlsearch_path " in
+	    *" $absdir "*) ;;
+	    *)
+	      case "$compile_rpath " in
+	      *" $absdir "*) ;;
+	      *) compile_rpath="$compile_rpath $absdir"
+	      esac
+	      ;;
+	    esac
+	    case " $sys_lib_dlsearch_path " in
+	    *" $libdir "*) ;;
+	    *)
+	      case "$finalize_rpath " in
+	      *" $libdir "*) ;;
+	      *) finalize_rpath="$finalize_rpath $libdir"
+	      esac
+	      ;;
+	    esac
+	    if test $linkmode = prog; then
+	      # We need to hardcode the library path
+	      if test -n "$shlibpath_var"; then
+		# Make sure the rpath contains only unique directories.
+		case "$temp_rpath " in
+		*" $dir "*) ;;
+		*" $absdir "*) ;;
+		*) temp_rpath="$temp_rpath $dir" ;;
+		esac
+	      fi
+	    fi
+	  fi # $linkmode,$pass = prog,link...
+
+	  if test "$alldeplibs" = yes &&
+	     { test "$deplibs_check_method" = pass_all ||
+	       { test "$build_libtool_libs" = yes &&
+		 test -n "$library_names"; }; }; then
+	    # We only need to search for static libraries
+	    continue
+	  fi
+
+	  if test "$installed" = no; then
+	    notinst_deplibs="$notinst_deplibs $lib"
+	    need_relink=yes
+	  fi
+
+	  if test -n "$old_archive_from_expsyms_cmds"; then
+	    # figure out the soname
+	    set dummy $library_names
+	    realname="$2"
+	    shift; shift
+	    libname=`eval \\$echo \"$libname_spec\"`
+	    # use dlname if we got it. it's perfectly good, no?
+	    if test -n "$dlname"; then
+	      soname="$dlname"
+	    elif test -n "$soname_spec"; then
+	      # bleh windows
+	      case $host in
+	      *cygwin*)
+		major=`expr $current - $age`
+		versuffix="-$major"
+		;;
+	      esac
+	      eval soname=\"$soname_spec\"
+	    else
+	      soname="$realname"
+	    fi
+
+	    # Make a new name for the extract_expsyms_cmds to use
+	    soroot="$soname"
+	    soname=`echo $soroot | sed -e 's/^.*\///'`
+	    newlib="libimp-`echo $soname | sed 's/^lib//;s/\.dll$//'`.a"
+
+	    # If the library has no export list, then create one now
+	    if test -f "$output_objdir/$soname-def"; then :
+	    else
+	      $show "extracting exported symbol list from \`$soname'"
+	      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	      eval cmds=\"$extract_expsyms_cmds\"
+	      for cmd in $cmds; do
+		IFS="$save_ifs"
+		$show "$cmd"
+		$run eval "$cmd" || exit $?
+	      done
+	      IFS="$save_ifs"
+	    fi
+
+	    # Create $newlib
+	    if test -f "$output_objdir/$newlib"; then :; else
+	      $show "generating import library for \`$soname'"
+	      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	      eval cmds=\"$old_archive_from_expsyms_cmds\"
+	      for cmd in $cmds; do
+		IFS="$save_ifs"
+		$show "$cmd"
+		$run eval "$cmd" || exit $?
+	      done
+	      IFS="$save_ifs"
+	    fi
+	    # make sure the library variables are pointing to the new library
+	    dir=$output_objdir
+	    linklib=$newlib
+	  fi # test -n $old_archive_from_expsyms_cmds
+
+	  if test $linkmode = prog || test "$mode" != relink; then
+	    add_shlibpath=
+	    add_dir=
+	    add=
+	    lib_linked=yes
+	    case $hardcode_action in
+	    immediate | unsupported)
+	      if test "$hardcode_direct" = no; then
+		add="$dir/$linklib"
+	      elif test "$hardcode_minus_L" = no; then
+		case $host in
+		*-*-sunos*) add_shlibpath="$dir" ;;
+		esac
+		add_dir="-L$dir"
+		add="-l$name"
+	      elif test "$hardcode_shlibpath_var" = no; then
+		add_shlibpath="$dir"
+		add="-l$name"
+	      else
+		lib_linked=no
+	      fi
+	      ;;
+	    relink)
+	      if test "$hardcode_direct" = yes; then
+		add="$dir/$linklib"
+	      elif test "$hardcode_minus_L" = yes; then
+		add_dir="-L$dir"
+		add="-l$name"
+	      elif test "$hardcode_shlibpath_var" = yes; then
+		add_shlibpath="$dir"
+		add="-l$name"
+	      else
+		lib_linked=no
+	      fi
+	      ;;
+	    *) lib_linked=no ;;
+	    esac
+
+	    if test "$lib_linked" != yes; then
+	      $echo "$modename: configuration error: unsupported hardcode properties"
+	      exit 1
+	    fi
+
+	    if test -n "$add_shlibpath"; then
+	      case :$compile_shlibpath: in
+	      *":$add_shlibpath:"*) ;;
+	      *) compile_shlibpath="$compile_shlibpath$add_shlibpath:" ;;
+	      esac
+	    fi
+	    if test $linkmode = prog; then
+	      test -n "$add_dir" && compile_deplibs="$add_dir $compile_deplibs"
+	      test -n "$add" && compile_deplibs="$add $compile_deplibs"
+	    else
+	      test -n "$add_dir" && deplibs="$add_dir $deplibs"
+	      test -n "$add" && deplibs="$add $deplibs"
+	      if test "$hardcode_direct" != yes && \
+		 test "$hardcode_minus_L" != yes && \
+		 test "$hardcode_shlibpath_var" = yes; then
+		case :$finalize_shlibpath: in
+		*":$libdir:"*) ;;
+		*) finalize_shlibpath="$finalize_shlibpath$libdir:" ;;
+		esac
+	      fi
+	    fi
+	  fi
+
+	  if test $linkmode = prog || test "$mode" = relink; then
+	    add_shlibpath=
+	    add_dir=
+	    add=
+	    # Finalize command for both is simple: just hardcode it.
+	    if test "$hardcode_direct" = yes; then
+	      add="$libdir/$linklib"
+	    elif test "$hardcode_minus_L" = yes; then
+	      add_dir="-L$libdir"
+	      add="-l$name"
+	    elif test "$hardcode_shlibpath_var" = yes; then
+	      case :$finalize_shlibpath: in
+	      *":$libdir:"*) ;;
+	      *) finalize_shlibpath="$finalize_shlibpath$libdir:" ;;
+	      esac
+	      add="-l$name"
+	    else
+	      # We cannot seem to hardcode it, guess we'll fake it.
+	      add_dir="-L$libdir"
+	      add="-l$name"
+	    fi
+
+	    if test $linkmode = prog; then
+	      test -n "$add_dir" && finalize_deplibs="$add_dir $finalize_deplibs"
+	      test -n "$add" && finalize_deplibs="$add $finalize_deplibs"
+	    else
+	      test -n "$add_dir" && deplibs="$add_dir $deplibs"
+	      test -n "$add" && deplibs="$add $deplibs"
+	    fi
+	  fi
+	elif test $linkmode = prog; then
+	  if test "$alldeplibs" = yes &&
+	     { test "$deplibs_check_method" = pass_all ||
+	       { test "$build_libtool_libs" = yes &&
+		 test -n "$library_names"; }; }; then
+	    # We only need to search for static libraries
+	    continue
+	  fi
+
+	  # Try to link the static library
+	  # Here we assume that one of hardcode_direct or hardcode_minus_L
+	  # is not unsupported.  This is valid on all known static and
+	  # shared platforms.
+	  if test "$hardcode_direct" != unsupported; then
+	    test -n "$old_library" && linklib="$old_library"
+	    compile_deplibs="$dir/$linklib $compile_deplibs"
+	    finalize_deplibs="$dir/$linklib $finalize_deplibs"
+	  else
+	    compile_deplibs="-l$name -L$dir $compile_deplibs"
+	    finalize_deplibs="-l$name -L$dir $finalize_deplibs"
+	  fi
+	elif test "$build_libtool_libs" = yes; then
+	  # Not a shared library
+	  if test "$deplibs_check_method" != pass_all; then
+	    # We're trying link a shared library against a static one
+	    # but the system doesn't support it.
+
+	    # Just print a warning and add the library to dependency_libs so
+	    # that the program can be linked against the static library.
+	    echo
+	    echo "*** Warning: This library needs some functionality provided by $lib."
+	    echo "*** I have the capability to make that library automatically link in when"
+	    echo "*** you link to this library.  But I can only do this if you have a"
+	    echo "*** shared version of the library, which you do not appear to have."
+	    if test "$module" = yes; then
+	      echo "*** Therefore, libtool will create a static module, that should work "
+	      echo "*** as long as the dlopening application is linked with the -dlopen flag."
+	      if test -z "$global_symbol_pipe"; then
+	        echo
+	        echo "*** However, this would only work if libtool was able to extract symbol"
+	        echo "*** lists from a program, using \`nm' or equivalent, but libtool could"
+	        echo "*** not find such a program.  So, this module is probably useless."
+	        echo "*** \`nm' from GNU binutils and a full rebuild may help."
+	      fi
+	      if test "$build_old_libs" = no; then
+	        build_libtool_libs=module
+	        build_old_libs=yes
+	      else
+	        build_libtool_libs=no
+	      fi
+	    fi
+	  else
+	    convenience="$convenience $dir/$old_library"
+	    old_convenience="$old_convenience $dir/$old_library"
+	    deplibs="$dir/$old_library $deplibs"
+	    link_static=yes
+	  fi
+	fi # link shared/static library?
+
+	if test $linkmode = lib; then
+	  if test -n "$dependency_libs" &&
+	     { test $hardcode_into_libs != yes || test $build_old_libs = yes ||
+	       test $link_static = yes; }; then
+	    # Extract -R from dependency_libs
+	    temp_deplibs=
+	    for libdir in $dependency_libs; do
+	      case $libdir in
+	      -R*) temp_xrpath=`$echo "X$libdir" | $Xsed -e 's/^-R//'`
+		   case " $xrpath " in
+		   *" $temp_xrpath "*) ;;
+		   *) xrpath="$xrpath $temp_xrpath";;
+		   esac;;
+	      *) temp_deplibs="$temp_deplibs $libdir";;
+	      esac
+	    done
+	    dependency_libs="$temp_deplibs"
+	  fi
+
+	  newlib_search_path="$newlib_search_path $absdir"
+	  # Link against this library
+	  test "$link_static" = no && newdependency_libs="$abs_ladir/$laname $newdependency_libs"
+	  # ... and its dependency_libs
+	  tmp_libs=
+	  for deplib in $dependency_libs; do
+	    newdependency_libs="$deplib $newdependency_libs"
+	    case "$tmp_libs " in
+	    *" $deplib "*) specialdeplibs="$specialdeplibs $deplib" ;;
+	    esac
+	    tmp_libs="$tmp_libs $deplib"
+	  done
+
+	  if test $link_all_deplibs != no; then
+	    # Add the search paths of all dependency libraries
+	    for deplib in $dependency_libs; do
+	      case $deplib in
+	      -L*) path="$deplib" ;;
+	      *.la)
+		dir=`$echo "X$deplib" | $Xsed -e 's%/[^/]*$%%'`
+		test "X$dir" = "X$deplib" && dir="."
+		# We need an absolute path.
+		case $dir in
+		[\\/]* | [A-Za-z]:[\\/]*) absdir="$dir" ;;
+		*)
+		  absdir=`cd "$dir" && pwd`
+		  if test -z "$absdir"; then
+		    $echo "$modename: warning: cannot determine absolute directory name of \`$dir'" 1>&2
+		    absdir="$dir"
+		  fi
+		  ;;
+		esac
+		if grep "^installed=no" $deplib > /dev/null; then
+		  path="-L$absdir/$objdir"
+		else
+		  eval libdir=`sed -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
+		  if test -z "$libdir"; then
+		    $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
+		    exit 1
+		  fi
+		  if test "$absdir" != "$libdir"; then
+		    $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
+		  fi
+		  path="-L$absdir"
+		fi
+		;;
+	      *) continue ;;
+	      esac
+	      case " $deplibs " in
+	      *" $path "*) ;;
+	      *) deplibs="$deplibs $path" ;;
+	      esac
+	    done
+	  fi # link_all_deplibs != no
+	fi # linkmode = lib
+      done # for deplib in $libs
+      if test $pass = dlpreopen; then
+	# Link the dlpreopened libraries before other libraries
+	for deplib in $save_deplibs; do
+	  deplibs="$deplib $deplibs"
+	done
+      fi
+      if test $pass != dlopen; then
+	test $pass != scan && dependency_libs="$newdependency_libs"
+	if test $pass != conv; then
+	  # Make sure lib_search_path contains only unique directories.
+	  lib_search_path=
+	  for dir in $newlib_search_path; do
+	    case "$lib_search_path " in
+	    *" $dir "*) ;;
+	    *) lib_search_path="$lib_search_path $dir" ;;
+	    esac
+	  done
+	  newlib_search_path=
+	fi
+
+	if test "$linkmode,$pass" != "prog,link"; then
+	  vars="deplibs"
+	else
+	  vars="compile_deplibs finalize_deplibs"
+	fi
+	for var in $vars dependency_libs; do
+	  # Add libraries to $var in reverse order
+	  eval tmp_libs=\"\$$var\"
+	  new_libs=
+	  for deplib in $tmp_libs; do
+	    case $deplib in
+	    -L*) new_libs="$deplib $new_libs" ;;
+	    *)
+	      case " $specialdeplibs " in
+	      *" $deplib "*) new_libs="$deplib $new_libs" ;;
+	      *)
+		case " $new_libs " in
+		*" $deplib "*) ;;
+		*) new_libs="$deplib $new_libs" ;;
+		esac
+		;;
+	      esac
+	      ;;
+	    esac
+	  done
+	  tmp_libs=
+	  for deplib in $new_libs; do
+	    case $deplib in
+	    -L*)
+	      case " $tmp_libs " in
+	      *" $deplib "*) ;;
+	      *) tmp_libs="$tmp_libs $deplib" ;;
+	      esac
+	      ;;
+	    *) tmp_libs="$tmp_libs $deplib" ;;
+	    esac
+	  done
+	  eval $var=\"$tmp_libs\"
+	done # for var
+      fi
+      if test "$pass" = "conv" &&
+       { test "$linkmode" = "lib" || test "$linkmode" = "prog"; }; then
+	libs="$deplibs" # reset libs
+	deplibs=
+      fi
+    done # for pass
+    if test $linkmode = prog; then
+      dlfiles="$newdlfiles"
+      dlprefiles="$newdlprefiles"
+    fi
+
+    case $linkmode in
+    oldlib)
+      if test -n "$dlfiles$dlprefiles" || test "$dlself" != no; then
+	$echo "$modename: warning: \`-dlopen' is ignored for archives" 1>&2
+      fi
+
+      if test -n "$rpath"; then
+	$echo "$modename: warning: \`-rpath' is ignored for archives" 1>&2
+      fi
+
+      if test -n "$xrpath"; then
+	$echo "$modename: warning: \`-R' is ignored for archives" 1>&2
+      fi
+
+      if test -n "$vinfo"; then
+	$echo "$modename: warning: \`-version-info' is ignored for archives" 1>&2
+      fi
+
+      if test -n "$release"; then
+	$echo "$modename: warning: \`-release' is ignored for archives" 1>&2
+      fi
+
+      if test -n "$export_symbols" || test -n "$export_symbols_regex"; then
+	$echo "$modename: warning: \`-export-symbols' is ignored for archives" 1>&2
+      fi
+
+      # Now set the variables for building old libraries.
+      build_libtool_libs=no
+      oldlibs="$output"
+      objs="$objs$old_deplibs"
+      ;;
+
+    lib)
+      # Make sure we only generate libraries of the form `libNAME.la'.
+      case $outputname in
+      lib*)
+	name=`$echo "X$outputname" | $Xsed -e 's/\.la$//' -e 's/^lib//'`
+	eval libname=\"$libname_spec\"
+	;;
+      *)
+	if test "$module" = no; then
+	  $echo "$modename: libtool library \`$output' must begin with \`lib'" 1>&2
+	  $echo "$help" 1>&2
+	  exit 1
+	fi
+	if test "$need_lib_prefix" != no; then
+	  # Add the "lib" prefix for modules if required
+	  name=`$echo "X$outputname" | $Xsed -e 's/\.la$//'`
+	  eval libname=\"$libname_spec\"
+	else
+	  libname=`$echo "X$outputname" | $Xsed -e 's/\.la$//'`
+	fi
+	;;
+      esac
+
+      if test -n "$objs"; then
+	if test "$deplibs_check_method" != pass_all; then
+	  $echo "$modename: cannot build libtool library \`$output' from non-libtool objects on this host:$objs" 2>&1
+	  exit 1
+	else
+	  echo
+	  echo "*** Warning: Linking the shared library $output against the non-libtool"
+	  echo "*** objects $objs is not portable!"
+	  libobjs="$libobjs $objs"
+	fi
+      fi
+
+      if test "$dlself" != no; then
+	$echo "$modename: warning: \`-dlopen self' is ignored for libtool libraries" 1>&2
+      fi
+
+      set dummy $rpath
+      if test $# -gt 2; then
+	$echo "$modename: warning: ignoring multiple \`-rpath's for a libtool library" 1>&2
+      fi
+      install_libdir="$2"
+
+      oldlibs=
+      if test -z "$rpath"; then
+	if test "$build_libtool_libs" = yes; then
+	  # Building a libtool convenience library.
+	  libext=al
+	  oldlibs="$output_objdir/$libname.$libext $oldlibs"
+	  build_libtool_libs=convenience
+	  build_old_libs=yes
+	fi
+
+	if test -n "$vinfo"; then
+	  $echo "$modename: warning: \`-version-info' is ignored for convenience libraries" 1>&2
+	fi
+
+	if test -n "$release"; then
+	  $echo "$modename: warning: \`-release' is ignored for convenience libraries" 1>&2
+	fi
+      else
+
+	# Parse the version information argument.
+	IFS="${IFS= 	}"; save_ifs="$IFS"; IFS=':'
+	set dummy $vinfo 0 0 0
+	IFS="$save_ifs"
+
+	if test -n "$8"; then
+	  $echo "$modename: too many parameters to \`-version-info'" 1>&2
+	  $echo "$help" 1>&2
+	  exit 1
+	fi
+
+	current="$2"
+	revision="$3"
+	age="$4"
+
+	# Check that each of the things are valid numbers.
+	case $current in
+	0 | [1-9] | [1-9][0-9] | [1-9][0-9][0-9]) ;;
+	*)
+	  $echo "$modename: CURRENT \`$current' is not a nonnegative integer" 1>&2
+	  $echo "$modename: \`$vinfo' is not valid version information" 1>&2
+	  exit 1
+	  ;;
+	esac
+
+	case $revision in
+	0 | [1-9] | [1-9][0-9] | [1-9][0-9][0-9]) ;;
+	*)
+	  $echo "$modename: REVISION \`$revision' is not a nonnegative integer" 1>&2
+	  $echo "$modename: \`$vinfo' is not valid version information" 1>&2
+	  exit 1
+	  ;;
+	esac
+
+	case $age in
+	0 | [1-9] | [1-9][0-9] | [1-9][0-9][0-9]) ;;
+	*)
+	  $echo "$modename: AGE \`$age' is not a nonnegative integer" 1>&2
+	  $echo "$modename: \`$vinfo' is not valid version information" 1>&2
+	  exit 1
+	  ;;
+	esac
+
+	if test $age -gt $current; then
+	  $echo "$modename: AGE \`$age' is greater than the current interface number \`$current'" 1>&2
+	  $echo "$modename: \`$vinfo' is not valid version information" 1>&2
+	  exit 1
+	fi
+
+	# Calculate the version variables.
+	major=
+	versuffix=
+	verstring=
+	case $version_type in
+	none) ;;
+
+	darwin)
+	  # Like Linux, but with the current version available in
+	  # verstring for coding it into the library header
+	  major=.`expr $current - $age`
+	  versuffix="$major.$age.$revision"
+	  # Darwin ld doesn't like 0 for these options...
+	  minor_current=`expr $current + 1`
+	  verstring="-compatibility_version $minor_current -current_version $minor_current.$revision"
+	  ;;
+
+	freebsd-aout)
+	  major=".$current"
+	  versuffix=".$current.$revision";
+	  ;;
+
+	freebsd-elf)
+	  major=".$current"
+	  versuffix=".$current";
+	  ;;
+
+	irix)
+	  major=`expr $current - $age + 1`
+	  verstring="sgi$major.$revision"
+
+	  # Add in all the interfaces that we are compatible with.
+	  loop=$revision
+	  while test $loop != 0; do
+	    iface=`expr $revision - $loop`
+	    loop=`expr $loop - 1`
+	    verstring="sgi$major.$iface:$verstring"
+	  done
+
+	  # Before this point, $major must not contain `.'.
+	  major=.$major
+	  versuffix="$major.$revision"
+	  ;;
+
+	linux)
+	  major=.`expr $current - $age`
+	  versuffix="$major.$age.$revision"
+	  ;;
+
+	osf)
+	  major=`expr $current - $age`
+	  versuffix=".$current.$age.$revision"
+	  verstring="$current.$age.$revision"
+
+	  # Add in all the interfaces that we are compatible with.
+	  loop=$age
+	  while test $loop != 0; do
+	    iface=`expr $current - $loop`
+	    loop=`expr $loop - 1`
+	    verstring="$verstring:${iface}.0"
+	  done
+
+	  # Make executables depend on our current version.
+	  verstring="$verstring:${current}.0"
+	  ;;
+
+	sunos)
+	  major=".$current"
+	  versuffix=".$current.$revision"
+	  ;;
+
+	windows)
+	  # Use '-' rather than '.', since we only want one
+	  # extension on DOS 8.3 filesystems.
+	  major=`expr $current - $age`
+	  versuffix="-$major"
+	  ;;
+
+	*)
+	  $echo "$modename: unknown library version type \`$version_type'" 1>&2
+	  echo "Fatal configuration error.  See the $PACKAGE docs for more information." 1>&2
+	  exit 1
+	  ;;
+	esac
+
+	# Clear the version info if we defaulted, and they specified a release.
+	if test -z "$vinfo" && test -n "$release"; then
+	  major=
+	  verstring="0.0"
+	  if test "$need_version" = no; then
+	    versuffix=
+	  else
+	    versuffix=".0.0"
+	  fi
+	fi
+
+	# Remove version info from name if versioning should be avoided
+	if test "$avoid_version" = yes && test "$need_version" = no; then
+	  major=
+	  versuffix=
+	  verstring=""
+	fi
+
+	# Check to see if the archive will have undefined symbols.
+	if test "$allow_undefined" = yes; then
+	  if test "$allow_undefined_flag" = unsupported; then
+	    $echo "$modename: warning: undefined symbols not allowed in $host shared libraries" 1>&2
+	    build_libtool_libs=no
+	    build_old_libs=yes
+	  fi
+	else
+	  # Don't allow undefined symbols.
+	  allow_undefined_flag="$no_undefined_flag"
+	fi
+      fi
+
+      if test "$mode" != relink; then
+	# Remove our outputs.
+	$show "${rm}r $output_objdir/$outputname $output_objdir/$libname.* $output_objdir/${libname}${release}.*"
+	$run ${rm}r $output_objdir/$outputname $output_objdir/$libname.* $output_objdir/${libname}${release}.*
+      fi
+
+      # Now set the variables for building old libraries.
+      if test "$build_old_libs" = yes && test "$build_libtool_libs" != convenience ; then
+	oldlibs="$oldlibs $output_objdir/$libname.$libext"
+
+	# Transform .lo files to .o files.
+	oldobjs="$objs "`$echo "X$libobjs" | $SP2NL | $Xsed -e '/\.'${libext}'$/d' -e "$lo2o" | $NL2SP`
+      fi
+
+      # Eliminate all temporary directories.
+      for path in $notinst_path; do
+	lib_search_path=`echo "$lib_search_path " | sed -e 's% $path % %g'`
+	deplibs=`echo "$deplibs " | sed -e 's% -L$path % %g'`
+	dependency_libs=`echo "$dependency_libs " | sed -e 's% -L$path % %g'`
+      done
+
+      if test -n "$xrpath"; then
+	# If the user specified any rpath flags, then add them.
+	temp_xrpath=
+	for libdir in $xrpath; do
+	  temp_xrpath="$temp_xrpath -R$libdir"
+	  case "$finalize_rpath " in
+	  *" $libdir "*) ;;
+	  *) finalize_rpath="$finalize_rpath $libdir" ;;
+	  esac
+	done
+	if test $hardcode_into_libs != yes || test $build_old_libs = yes; then
+	  dependency_libs="$temp_xrpath $dependency_libs"
+	fi
+      fi
+
+      # Make sure dlfiles contains only unique files that won't be dlpreopened
+      old_dlfiles="$dlfiles"
+      dlfiles=
+      for lib in $old_dlfiles; do
+	case " $dlprefiles $dlfiles " in
+	*" $lib "*) ;;
+	*) dlfiles="$dlfiles $lib" ;;
+	esac
+      done
+
+      # Make sure dlprefiles contains only unique files
+      old_dlprefiles="$dlprefiles"
+      dlprefiles=
+      for lib in $old_dlprefiles; do
+	case "$dlprefiles " in
+	*" $lib "*) ;;
+	*) dlprefiles="$dlprefiles $lib" ;;
+	esac
+      done
+
+      if test "$build_libtool_libs" = yes; then
+	if test -n "$rpath"; then
+	  case $host in
+	  *-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-os2* | *-*-beos*)
+	    # these systems don't actually have a c library (as such)!
+	    ;;
+	  *-*-rhapsody* | *-*-darwin1.[012])
+	    # Rhapsody C library is in the System framework
+	    deplibs="$deplibs -framework System"
+	    ;;
+	  *-*-netbsd*)
+	    # Don't link with libc until the a.out ld.so is fixed.
+	    ;;
+	  *)
+	    # Add libc to deplibs on all other systems if necessary.
+	    if test $build_libtool_need_lc = "yes"; then
+	      deplibs="$deplibs -lc"
+	    fi
+	    ;;
+	  esac
+	fi
+
+	# Transform deplibs into only deplibs that can be linked in shared.
+	name_save=$name
+	libname_save=$libname
+	release_save=$release
+	versuffix_save=$versuffix
+	major_save=$major
+	# I'm not sure if I'm treating the release correctly.  I think
+	# release should show up in the -l (ie -lgmp5) so we don't want to
+	# add it in twice.  Is that correct?
+	release=""
+	versuffix=""
+	major=""
+	newdeplibs=
+	droppeddeps=no
+	case $deplibs_check_method in
+	pass_all)
+	  # Don't check for shared/static.  Everything works.
+	  # This might be a little naive.  We might want to check
+	  # whether the library exists or not.  But this is on
+	  # osf3 & osf4 and I'm not really sure... Just
+	  # implementing what was already the behaviour.
+	  newdeplibs=$deplibs
+	  ;;
+	test_compile)
+	  # This code stresses the "libraries are programs" paradigm to its
+	  # limits. Maybe even breaks it.  We compile a program, linking it
+	  # against the deplibs as a proxy for the library.  Then we can check
+	  # whether they linked in statically or dynamically with ldd.
+	  $rm conftest.c
+	  cat > conftest.c <<EOF
+	  int main() { return 0; }
+EOF
+	  $rm conftest
+	  $CC -o conftest conftest.c $deplibs
+	  if test $? -eq 0 ; then
+	    ldd_output=`ldd conftest`
+	    for i in $deplibs; do
+	      name="`expr $i : '-l\(.*\)'`"
+	      # If $name is empty we are operating on a -L argument.
+	      if test -n "$name" && test "$name" != "0"; then
+		libname=`eval \\$echo \"$libname_spec\"`
+		deplib_matches=`eval \\$echo \"$library_names_spec\"`
+		set dummy $deplib_matches
+		deplib_match=$2
+		if test `expr "$ldd_output" : ".*$deplib_match"` -ne 0 ; then
+		  newdeplibs="$newdeplibs $i"
+		else
+		  droppeddeps=yes
+		  echo
+		  echo "*** Warning: This library needs some functionality provided by $i."
+		  echo "*** I have the capability to make that library automatically link in when"
+		  echo "*** you link to this library.  But I can only do this if you have a"
+		  echo "*** shared version of the library, which you do not appear to have."
+		fi
+	      else
+		newdeplibs="$newdeplibs $i"
+	      fi
+	    done
+	  else
+	    # Error occured in the first compile.  Let's try to salvage the situation:
+	    # Compile a seperate program for each library.
+	    for i in $deplibs; do
+	      name="`expr $i : '-l\(.*\)'`"
+	     # If $name is empty we are operating on a -L argument.
+	      if test -n "$name" && test "$name" != "0"; then
+		$rm conftest
+		$CC -o conftest conftest.c $i
+		# Did it work?
+		if test $? -eq 0 ; then
+		  ldd_output=`ldd conftest`
+		  libname=`eval \\$echo \"$libname_spec\"`
+		  deplib_matches=`eval \\$echo \"$library_names_spec\"`
+		  set dummy $deplib_matches
+		  deplib_match=$2
+		  if test `expr "$ldd_output" : ".*$deplib_match"` -ne 0 ; then
+		    newdeplibs="$newdeplibs $i"
+		  else
+		    droppeddeps=yes
+		    echo
+		    echo "*** Warning: This library needs some functionality provided by $i."
+		    echo "*** I have the capability to make that library automatically link in when"
+		    echo "*** you link to this library.  But I can only do this if you have a"
+		    echo "*** shared version of the library, which you do not appear to have."
+		  fi
+		else
+		  droppeddeps=yes
+		  echo
+		  echo "*** Warning!  Library $i is needed by this library but I was not able to"
+		  echo "***  make it link in!  You will probably need to install it or some"
+		  echo "*** library that it depends on before this library will be fully"
+		  echo "*** functional.  Installing it before continuing would be even better."
+		fi
+	      else
+		newdeplibs="$newdeplibs $i"
+	      fi
+	    done
+	  fi
+	  ;;
+	file_magic*)
+	  set dummy $deplibs_check_method
+	  file_magic_regex=`expr "$deplibs_check_method" : "$2 \(.*\)"`
+	  for a_deplib in $deplibs; do
+	    name="`expr $a_deplib : '-l\(.*\)'`"
+	    # If $name is empty we are operating on a -L argument.
+	    if test -n "$name" && test "$name" != "0"; then
+	      libname=`eval \\$echo \"$libname_spec\"`
+	      for i in $lib_search_path $sys_lib_search_path $shlib_search_path; do
+		    potential_libs=`ls $i/$libname[.-]* 2>/dev/null`
+		    for potent_lib in $potential_libs; do
+		      # Follow soft links.
+		      if ls -lLd "$potent_lib" 2>/dev/null \
+			 | grep " -> " >/dev/null; then
+			continue
+		      fi
+		      # The statement above tries to avoid entering an
+		      # endless loop below, in case of cyclic links.
+		      # We might still enter an endless loop, since a link
+		      # loop can be closed while we follow links,
+		      # but so what?
+		      potlib="$potent_lib"
+		      while test -h "$potlib" 2>/dev/null; do
+			potliblink=`ls -ld $potlib | sed 's/.* -> //'`
+			case $potliblink in
+			[\\/]* | [A-Za-z]:[\\/]*) potlib="$potliblink";;
+			*) potlib=`$echo "X$potlib" | $Xsed -e 's,[^/]*$,,'`"$potliblink";;
+			esac
+		      done
+		      if eval $file_magic_cmd \"\$potlib\" 2>/dev/null \
+			 | sed 10q \
+			 | egrep "$file_magic_regex" > /dev/null; then
+			newdeplibs="$newdeplibs $a_deplib"
+			a_deplib=""
+			break 2
+		      fi
+		    done
+	      done
+	      if test -n "$a_deplib" ; then
+		droppeddeps=yes
+		echo
+		echo "*** Warning: This library needs some functionality provided by $a_deplib."
+		echo "*** I have the capability to make that library automatically link in when"
+		echo "*** you link to this library.  But I can only do this if you have a"
+		echo "*** shared version of the library, which you do not appear to have."
+	      fi
+	    else
+	      # Add a -L argument.
+	      newdeplibs="$newdeplibs $a_deplib"
+	    fi
+	  done # Gone through all deplibs.
+	  ;;
+	match_pattern*)
+	  set dummy $deplibs_check_method
+	  match_pattern_regex=`expr "$deplibs_check_method" : "$2 \(.*\)"`
+	  for a_deplib in $deplibs; do
+	    name="`expr $a_deplib : '-l\(.*\)'`"
+	    # If $name is empty we are operating on a -L argument.
+	    if test -n "$name" && test "$name" != "0"; then
+	      libname=`eval \\$echo \"$libname_spec\"`
+	      for i in $lib_search_path $sys_lib_search_path $shlib_search_path; do
+		potential_libs=`ls $i/$libname[.-]* 2>/dev/null`
+		for potent_lib in $potential_libs; do
+		  if eval echo \"$potent_lib\" 2>/dev/null \
+		      | sed 10q \
+		      | egrep "$match_pattern_regex" > /dev/null; then
+		    newdeplibs="$newdeplibs $a_deplib"
+		    a_deplib=""
+		    break 2
+		  fi
+		done
+	      done
+	      if test -n "$a_deplib" ; then
+		droppeddeps=yes
+		echo
+		echo "*** Warning: This library needs some functionality provided by $a_deplib."
+		echo "*** I have the capability to make that library automatically link in when"
+		echo "*** you link to this library.  But I can only do this if you have a"
+		echo "*** shared version of the library, which you do not appear to have."
+	      fi
+	    else
+	      # Add a -L argument.
+	      newdeplibs="$newdeplibs $a_deplib"
+	    fi
+	  done # Gone through all deplibs.
+	  ;;
+	none | unknown | *)
+	  newdeplibs=""
+	  if $echo "X $deplibs" | $Xsed -e 's/ -lc$//' \
+	       -e 's/ -[LR][^ ]*//g' -e 's/[ 	]//g' |
+	     grep . >/dev/null; then
+	    echo
+	    if test "X$deplibs_check_method" = "Xnone"; then
+	      echo "*** Warning: inter-library dependencies are not supported in this platform."
+	    else
+	      echo "*** Warning: inter-library dependencies are not known to be supported."
+	    fi
+	    echo "*** All declared inter-library dependencies are being dropped."
+	    droppeddeps=yes
+	  fi
+	  ;;
+	esac
+	versuffix=$versuffix_save
+	major=$major_save
+	release=$release_save
+	libname=$libname_save
+	name=$name_save
+
+	case $host in
+	*-*-rhapsody* | *-*-darwin1.[012])
+	  # On Rhapsody replace the C library is the System framework
+	  newdeplibs=`$echo "X $newdeplibs" | $Xsed -e 's/ -lc / -framework System /'`
+	  ;;
+	esac
+
+	if test "$droppeddeps" = yes; then
+	  if test "$module" = yes; then
+	    echo
+	    echo "*** Warning: libtool could not satisfy all declared inter-library"
+	    echo "*** dependencies of module $libname.  Therefore, libtool will create"
+	    echo "*** a static module, that should work as long as the dlopening"
+	    echo "*** application is linked with the -dlopen flag."
+	    if test -z "$global_symbol_pipe"; then
+	      echo
+	      echo "*** However, this would only work if libtool was able to extract symbol"
+	      echo "*** lists from a program, using \`nm' or equivalent, but libtool could"
+	      echo "*** not find such a program.  So, this module is probably useless."
+	      echo "*** \`nm' from GNU binutils and a full rebuild may help."
+	    fi
+	    if test "$build_old_libs" = no; then
+	      oldlibs="$output_objdir/$libname.$libext"
+	      build_libtool_libs=module
+	      build_old_libs=yes
+	    else
+	      build_libtool_libs=no
+	    fi
+	  else
+	    echo "*** The inter-library dependencies that have been dropped here will be"
+	    echo "*** automatically added whenever a program is linked with this library"
+	    echo "*** or is declared to -dlopen it."
+
+	    if test $allow_undefined = no; then
+	      echo
+	      echo "*** Since this library must not contain undefined symbols,"
+	      echo "*** because either the platform does not support them or"
+	      echo "*** it was explicitly requested with -no-undefined,"
+	      echo "*** libtool will only create a static version of it."
+	      if test "$build_old_libs" = no; then
+		oldlibs="$output_objdir/$libname.$libext"
+		build_libtool_libs=module
+		build_old_libs=yes
+	      else
+		build_libtool_libs=no
+	      fi
+	    fi
+	  fi
+	fi
+	# Done checking deplibs!
+	deplibs=$newdeplibs
+      fi
+
+      # All the library-specific variables (install_libdir is set above).
+      library_names=
+      old_library=
+      dlname=
+
+      # Test again, we may have decided not to build it any more
+      if test "$build_libtool_libs" = yes; then
+	if test $hardcode_into_libs = yes; then
+	  # Hardcode the library paths
+	  hardcode_libdirs=
+	  dep_rpath=
+	  rpath="$finalize_rpath"
+	  test "$mode" != relink && rpath="$compile_rpath$rpath"
+	  for libdir in $rpath; do
+	    if test -n "$hardcode_libdir_flag_spec"; then
+	      if test -n "$hardcode_libdir_separator"; then
+		if test -z "$hardcode_libdirs"; then
+		  hardcode_libdirs="$libdir"
+		else
+		  # Just accumulate the unique libdirs.
+		  case $hardcode_libdir_separator$hardcode_libdirs$hardcode_libdir_separator in
+		  *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
+		    ;;
+		  *)
+		    hardcode_libdirs="$hardcode_libdirs$hardcode_libdir_separator$libdir"
+		    ;;
+		  esac
+		fi
+	      else
+		eval flag=\"$hardcode_libdir_flag_spec\"
+		dep_rpath="$dep_rpath $flag"
+	      fi
+	    elif test -n "$runpath_var"; then
+	      case "$perm_rpath " in
+	      *" $libdir "*) ;;
+	      *) perm_rpath="$perm_rpath $libdir" ;;
+	      esac
+	    fi
+	  done
+	  # Substitute the hardcoded libdirs into the rpath.
+	  if test -n "$hardcode_libdir_separator" &&
+	     test -n "$hardcode_libdirs"; then
+	    libdir="$hardcode_libdirs"
+	    eval dep_rpath=\"$hardcode_libdir_flag_spec\"
+	  fi
+	  if test -n "$runpath_var" && test -n "$perm_rpath"; then
+	    # We should set the runpath_var.
+	    rpath=
+	    for dir in $perm_rpath; do
+	      rpath="$rpath$dir:"
+	    done
+	    eval "$runpath_var='$rpath\$$runpath_var'; export $runpath_var"
+	  fi
+	  test -n "$dep_rpath" && deplibs="$dep_rpath $deplibs"
+	fi
+
+	shlibpath="$finalize_shlibpath"
+	test "$mode" != relink && shlibpath="$compile_shlibpath$shlibpath"
+	if test -n "$shlibpath"; then
+	  eval "$shlibpath_var='$shlibpath\$$shlibpath_var'; export $shlibpath_var"
+	fi
+
+	# Get the real and link names of the library.
+	eval library_names=\"$library_names_spec\"
+	set dummy $library_names
+	realname="$2"
+	shift; shift
+
+	if test -n "$soname_spec"; then
+	  eval soname=\"$soname_spec\"
+	else
+	  soname="$realname"
+	fi
+	test -z "$dlname" && dlname=$soname
+
+	lib="$output_objdir/$realname"
+	for link
+	do
+	  linknames="$linknames $link"
+	done
+
+	# Ensure that we have .o objects for linkers which dislike .lo
+	# (e.g. aix) in case we are running --disable-static
+	for obj in $libobjs; do
+	  xdir=`$echo "X$obj" | $Xsed -e 's%/[^/]*$%%'`
+	  if test "X$xdir" = "X$obj"; then
+	    xdir="."
+	  else
+	    xdir="$xdir"
+	  fi
+	  baseobj=`$echo "X$obj" | $Xsed -e 's%^.*/%%'`
+	  oldobj=`$echo "X$baseobj" | $Xsed -e "$lo2o"`
+	  if test ! -f $xdir/$oldobj; then
+	    $show "(cd $xdir && ${LN_S} $baseobj $oldobj)"
+	    $run eval '(cd $xdir && ${LN_S} $baseobj $oldobj)' || exit $?
+	  fi
+	done
+
+	# Use standard objects if they are pic
+	test -z "$pic_flag" && libobjs=`$echo "X$libobjs" | $SP2NL | $Xsed -e "$lo2o" | $NL2SP`
+
+	# Prepare the list of exported symbols
+	if test -z "$export_symbols"; then
+	  if test "$always_export_symbols" = yes || test -n "$export_symbols_regex"; then
+	    $show "generating symbol list for \`$libname.la'"
+	    export_symbols="$output_objdir/$libname.exp"
+	    $run $rm $export_symbols
+	    eval cmds=\"$export_symbols_cmds\"
+	    IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	    for cmd in $cmds; do
+	      IFS="$save_ifs"
+	      $show "$cmd"
+	      $run eval "$cmd" || exit $?
+	    done
+	    IFS="$save_ifs"
+	    if test -n "$export_symbols_regex"; then
+	      $show "egrep -e \"$export_symbols_regex\" \"$export_symbols\" > \"${export_symbols}T\""
+	      $run eval 'egrep -e "$export_symbols_regex" "$export_symbols" > "${export_symbols}T"'
+	      $show "$mv \"${export_symbols}T\" \"$export_symbols\""
+	      $run eval '$mv "${export_symbols}T" "$export_symbols"'
+	    fi
+	  fi
+	fi
+
+	if test -n "$export_symbols" && test -n "$include_expsyms"; then
+	  $run eval '$echo "X$include_expsyms" | $SP2NL >> "$export_symbols"'
+	fi
+
+	if test -n "$convenience"; then
+	  if test -n "$whole_archive_flag_spec"; then
+	    eval libobjs=\"\$libobjs $whole_archive_flag_spec\"
+	  else
+	    gentop="$output_objdir/${outputname}x"
+	    $show "${rm}r $gentop"
+	    $run ${rm}r "$gentop"
+	    $show "mkdir $gentop"
+	    $run mkdir "$gentop"
+	    status=$?
+	    if test $status -ne 0 && test ! -d "$gentop"; then
+	      exit $status
+	    fi
+	    generated="$generated $gentop"
+
+	    for xlib in $convenience; do
+	      # Extract the objects.
+	      case $xlib in
+	      [\\/]* | [A-Za-z]:[\\/]*) xabs="$xlib" ;;
+	      *) xabs=`pwd`"/$xlib" ;;
+	      esac
+	      xlib=`$echo "X$xlib" | $Xsed -e 's%^.*/%%'`
+	      xdir="$gentop/$xlib"
+
+	      $show "${rm}r $xdir"
+	      $run ${rm}r "$xdir"
+	      $show "mkdir $xdir"
+	      $run mkdir "$xdir"
+	      status=$?
+	      if test $status -ne 0 && test ! -d "$xdir"; then
+		exit $status
+	      fi
+	      $show "(cd $xdir && $AR x $xabs)"
+	      $run eval "(cd \$xdir && $AR x \$xabs)" || exit $?
+
+	      libobjs="$libobjs "`find $xdir -name \*.o -print -o -name \*.lo -print | $NL2SP`
+	    done
+	  fi
+	fi
+
+	if test "$thread_safe" = yes && test -n "$thread_safe_flag_spec"; then
+	  eval flag=\"$thread_safe_flag_spec\"
+	  linker_flags="$linker_flags $flag"
+	fi
+
+	# Make a backup of the uninstalled library when relinking
+	if test "$mode" = relink; then
+	  $run eval '(cd $output_objdir && $rm ${realname}U && $mv $realname ${realname}U)' || exit $?
+	fi
+
+	# Do each of the archive commands.
+	if test -n "$export_symbols" && test -n "$archive_expsym_cmds"; then
+	  eval cmds=\"$archive_expsym_cmds\"
+	else
+	  eval cmds=\"$archive_cmds\"
+	fi
+	IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	for cmd in $cmds; do
+	  IFS="$save_ifs"
+	  $show "$cmd"
+	  $run eval "$cmd" || exit $?
+	done
+	IFS="$save_ifs"
+
+	# Restore the uninstalled library and exit
+	if test "$mode" = relink; then
+	  $run eval '(cd $output_objdir && $rm ${realname}T && $mv $realname ${realname}T && $mv "$realname"U $realname)' || exit $?
+	  exit 0
+	fi
+
+	# Create links to the real library.
+	for linkname in $linknames; do
+	  if test "$realname" != "$linkname"; then
+	    $show "(cd $output_objdir && $rm $linkname && $LN_S $realname $linkname)"
+	    $run eval '(cd $output_objdir && $rm $linkname && $LN_S $realname $linkname)' || exit $?
+	  fi
+	done
+
+	# If -module or -export-dynamic was specified, set the dlname.
+	if test "$module" = yes || test "$export_dynamic" = yes; then
+	  # On all known operating systems, these are identical.
+	  dlname="$soname"
+	fi
+      fi
+      ;;
+
+    obj)
+      if test -n "$deplibs"; then
+	$echo "$modename: warning: \`-l' and \`-L' are ignored for objects" 1>&2
+      fi
+
+      if test -n "$dlfiles$dlprefiles" || test "$dlself" != no; then
+	$echo "$modename: warning: \`-dlopen' is ignored for objects" 1>&2
+      fi
+
+      if test -n "$rpath"; then
+	$echo "$modename: warning: \`-rpath' is ignored for objects" 1>&2
+      fi
+
+      if test -n "$xrpath"; then
+	$echo "$modename: warning: \`-R' is ignored for objects" 1>&2
+      fi
+
+      if test -n "$vinfo"; then
+	$echo "$modename: warning: \`-version-info' is ignored for objects" 1>&2
+      fi
+
+      if test -n "$release"; then
+	$echo "$modename: warning: \`-release' is ignored for objects" 1>&2
+      fi
+
+      case $output in
+      *.lo)
+	if test -n "$objs$old_deplibs"; then
+	  $echo "$modename: cannot build library object \`$output' from non-libtool objects" 1>&2
+	  exit 1
+	fi
+	libobj="$output"
+	obj=`$echo "X$output" | $Xsed -e "$lo2o"`
+	;;
+      *)
+	libobj=
+	obj="$output"
+	;;
+      esac
+
+      # Delete the old objects.
+      $run $rm $obj $libobj
+
+      # Objects from convenience libraries.  This assumes
+      # single-version convenience libraries.  Whenever we create
+      # different ones for PIC/non-PIC, this we'll have to duplicate
+      # the extraction.
+      reload_conv_objs=
+      gentop=
+      # reload_cmds runs $LD directly, so let us get rid of
+      # -Wl from whole_archive_flag_spec
+      wl=
+
+      if test -n "$convenience"; then
+	if test -n "$whole_archive_flag_spec"; then
+	  eval reload_conv_objs=\"\$reload_objs $whole_archive_flag_spec\"
+	else
+	  gentop="$output_objdir/${obj}x"
+	  $show "${rm}r $gentop"
+	  $run ${rm}r "$gentop"
+	  $show "mkdir $gentop"
+	  $run mkdir "$gentop"
+	  status=$?
+	  if test $status -ne 0 && test ! -d "$gentop"; then
+	    exit $status
+	  fi
+	  generated="$generated $gentop"
+
+	  for xlib in $convenience; do
+	    # Extract the objects.
+	    case $xlib in
+	    [\\/]* | [A-Za-z]:[\\/]*) xabs="$xlib" ;;
+	    *) xabs=`pwd`"/$xlib" ;;
+	    esac
+	    xlib=`$echo "X$xlib" | $Xsed -e 's%^.*/%%'`
+	    xdir="$gentop/$xlib"
+
+	    $show "${rm}r $xdir"
+	    $run ${rm}r "$xdir"
+	    $show "mkdir $xdir"
+	    $run mkdir "$xdir"
+	    status=$?
+	    if test $status -ne 0 && test ! -d "$xdir"; then
+	      exit $status
+	    fi
+	    $show "(cd $xdir && $AR x $xabs)"
+	    $run eval "(cd \$xdir && $AR x \$xabs)" || exit $?
+
+	    reload_conv_objs="$reload_objs "`find $xdir -name \*.o -print -o -name \*.lo -print | $NL2SP`
+	  done
+	fi
+      fi
+
+      # Create the old-style object.
+      reload_objs="$objs$old_deplibs "`$echo "X$libobjs" | $SP2NL | $Xsed -e '/\.'${libext}$'/d' -e '/\.lib$/d' -e "$lo2o" | $NL2SP`" $reload_conv_objs" ### testsuite: skip nested quoting test
+
+      output="$obj"
+      eval cmds=\"$reload_cmds\"
+      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+      for cmd in $cmds; do
+	IFS="$save_ifs"
+	$show "$cmd"
+	$run eval "$cmd" || exit $?
+      done
+      IFS="$save_ifs"
+
+      # Exit if we aren't doing a library object file.
+      if test -z "$libobj"; then
+	if test -n "$gentop"; then
+	  $show "${rm}r $gentop"
+	  $run ${rm}r $gentop
+	fi
+
+	exit 0
+      fi
+
+      if test "$build_libtool_libs" != yes; then
+	if test -n "$gentop"; then
+	  $show "${rm}r $gentop"
+	  $run ${rm}r $gentop
+	fi
+
+	# Create an invalid libtool object if no PIC, so that we don't
+	# accidentally link it into a program.
+	$show "echo timestamp > $libobj"
+	$run eval "echo timestamp > $libobj" || exit $?
+	exit 0
+      fi
+
+      if test -n "$pic_flag" || test "$pic_mode" != default; then
+	# Only do commands if we really have different PIC objects.
+	reload_objs="$libobjs $reload_conv_objs"
+	output="$libobj"
+	eval cmds=\"$reload_cmds\"
+	IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	for cmd in $cmds; do
+	  IFS="$save_ifs"
+	  $show "$cmd"
+	  $run eval "$cmd" || exit $?
+	done
+	IFS="$save_ifs"
+      else
+	# Just create a symlink.
+	$show $rm $libobj
+	$run $rm $libobj
+	xdir=`$echo "X$libobj" | $Xsed -e 's%/[^/]*$%%'`
+	if test "X$xdir" = "X$libobj"; then
+	  xdir="."
+	else
+	  xdir="$xdir"
+	fi
+	baseobj=`$echo "X$libobj" | $Xsed -e 's%^.*/%%'`
+	oldobj=`$echo "X$baseobj" | $Xsed -e "$lo2o"`
+	$show "(cd $xdir && $LN_S $oldobj $baseobj)"
+	$run eval '(cd $xdir && $LN_S $oldobj $baseobj)' || exit $?
+      fi
+
+      if test -n "$gentop"; then
+	$show "${rm}r $gentop"
+	$run ${rm}r $gentop
+      fi
+
+      exit 0
+      ;;
+
+    prog)
+      case $host in
+	*cygwin*) output=`echo $output | sed -e 's,.exe$,,;s,$,.exe,'` ;;
+      esac
+      if test -n "$vinfo"; then
+	$echo "$modename: warning: \`-version-info' is ignored for programs" 1>&2
+      fi
+
+      if test -n "$release"; then
+	$echo "$modename: warning: \`-release' is ignored for programs" 1>&2
+      fi
+
+      if test "$preload" = yes; then
+	if test "$dlopen_support" = unknown && test "$dlopen_self" = unknown &&
+	   test "$dlopen_self_static" = unknown; then
+	  $echo "$modename: warning: \`AC_LIBTOOL_DLOPEN' not used. Assuming no dlopen support."
+	fi
+      fi
+
+      case $host in
+      *-*-rhapsody* | *-*-darwin1.[012])
+	# On Rhapsody replace the C library is the System framework
+	compile_deplibs=`$echo "X $compile_deplibs" | $Xsed -e 's/ -lc / -framework System /'`
+	finalize_deplibs=`$echo "X $finalize_deplibs" | $Xsed -e 's/ -lc / -framework System /'`
+	;;
+      esac
+
+      compile_command="$compile_command $compile_deplibs"
+      finalize_command="$finalize_command $finalize_deplibs"
+
+      if test -n "$rpath$xrpath"; then
+	# If the user specified any rpath flags, then add them.
+	for libdir in $rpath $xrpath; do
+	  # This is the magic to use -rpath.
+	  case "$finalize_rpath " in
+	  *" $libdir "*) ;;
+	  *) finalize_rpath="$finalize_rpath $libdir" ;;
+	  esac
+	done
+      fi
+
+      # Now hardcode the library paths
+      rpath=
+      hardcode_libdirs=
+      for libdir in $compile_rpath $finalize_rpath; do
+	if test -n "$hardcode_libdir_flag_spec"; then
+	  if test -n "$hardcode_libdir_separator"; then
+	    if test -z "$hardcode_libdirs"; then
+	      hardcode_libdirs="$libdir"
+	    else
+	      # Just accumulate the unique libdirs.
+	      case $hardcode_libdir_separator$hardcode_libdirs$hardcode_libdir_separator in
+	      *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
+		;;
+	      *)
+		hardcode_libdirs="$hardcode_libdirs$hardcode_libdir_separator$libdir"
+		;;
+	      esac
+	    fi
+	  else
+	    eval flag=\"$hardcode_libdir_flag_spec\"
+	    rpath="$rpath $flag"
+	  fi
+	elif test -n "$runpath_var"; then
+	  case "$perm_rpath " in
+	  *" $libdir "*) ;;
+	  *) perm_rpath="$perm_rpath $libdir" ;;
+	  esac
+	fi
+	case $host in
+	*-*-cygwin* | *-*-mingw* | *-*-pw32* | *-*-os2*)
+	  case :$dllsearchpath: in
+	  *":$libdir:"*) ;;
+	  *) dllsearchpath="$dllsearchpath:$libdir";;
+	  esac
+	  ;;
+	esac
+      done
+      # Substitute the hardcoded libdirs into the rpath.
+      if test -n "$hardcode_libdir_separator" &&
+	 test -n "$hardcode_libdirs"; then
+	libdir="$hardcode_libdirs"
+	eval rpath=\" $hardcode_libdir_flag_spec\"
+      fi
+      compile_rpath="$rpath"
+
+      rpath=
+      hardcode_libdirs=
+      for libdir in $finalize_rpath; do
+	if test -n "$hardcode_libdir_flag_spec"; then
+	  if test -n "$hardcode_libdir_separator"; then
+	    if test -z "$hardcode_libdirs"; then
+	      hardcode_libdirs="$libdir"
+	    else
+	      # Just accumulate the unique libdirs.
+	      case $hardcode_libdir_separator$hardcode_libdirs$hardcode_libdir_separator in
+	      *"$hardcode_libdir_separator$libdir$hardcode_libdir_separator"*)
+		;;
+	      *)
+		hardcode_libdirs="$hardcode_libdirs$hardcode_libdir_separator$libdir"
+		;;
+	      esac
+	    fi
+	  else
+	    eval flag=\"$hardcode_libdir_flag_spec\"
+	    rpath="$rpath $flag"
+	  fi
+	elif test -n "$runpath_var"; then
+	  case "$finalize_perm_rpath " in
+	  *" $libdir "*) ;;
+	  *) finalize_perm_rpath="$finalize_perm_rpath $libdir" ;;
+	  esac
+	fi
+      done
+      # Substitute the hardcoded libdirs into the rpath.
+      if test -n "$hardcode_libdir_separator" &&
+	 test -n "$hardcode_libdirs"; then
+	libdir="$hardcode_libdirs"
+	eval rpath=\" $hardcode_libdir_flag_spec\"
+      fi
+      finalize_rpath="$rpath"
+
+      if test -n "$libobjs" && test "$build_old_libs" = yes; then
+	# Transform all the library objects into standard objects.
+	compile_command=`$echo "X$compile_command" | $SP2NL | $Xsed -e "$lo2o" | $NL2SP`
+	finalize_command=`$echo "X$finalize_command" | $SP2NL | $Xsed -e "$lo2o" | $NL2SP`
+      fi
+
+      dlsyms=
+      if test -n "$dlfiles$dlprefiles" || test "$dlself" != no; then
+	if test -n "$NM" && test -n "$global_symbol_pipe"; then
+	  dlsyms="${outputname}S.c"
+	else
+	  $echo "$modename: not configured to extract global symbols from dlpreopened files" 1>&2
+	fi
+      fi
+
+      if test -n "$dlsyms"; then
+	case $dlsyms in
+	"") ;;
+	*.c)
+	  # Discover the nlist of each of the dlfiles.
+	  nlist="$output_objdir/${outputname}.nm"
+
+	  $show "$rm $nlist ${nlist}S ${nlist}T"
+	  $run $rm "$nlist" "${nlist}S" "${nlist}T"
+
+	  # Parse the name list into a source file.
+	  $show "creating $output_objdir/$dlsyms"
+
+	  test -z "$run" && $echo > "$output_objdir/$dlsyms" "\
+/* $dlsyms - symbol resolution table for \`$outputname' dlsym emulation. */
+/* Generated by $PROGRAM - GNU $PACKAGE $VERSION$TIMESTAMP */
+
+#ifdef __cplusplus
+extern \"C\" {
+#endif
+
+/* Prevent the only kind of declaration conflicts we can make. */
+#define lt_preloaded_symbols some_other_symbol
+
+/* External symbol declarations for the compiler. */\
+"
+
+	  if test "$dlself" = yes; then
+	    $show "generating symbol list for \`$output'"
+
+	    test -z "$run" && $echo ': @PROGRAM@ ' > "$nlist"
+
+	    # Add our own program objects to the symbol list.
+	    progfiles=`$echo "X$objs$old_deplibs" | $SP2NL | $Xsed -e "$lo2o" | $NL2SP`
+	    for arg in $progfiles; do
+	      $show "extracting global C symbols from \`$arg'"
+	      $run eval "$NM $arg | $global_symbol_pipe >> '$nlist'"
+	    done
+
+	    if test -n "$exclude_expsyms"; then
+	      $run eval 'egrep -v " ($exclude_expsyms)$" "$nlist" > "$nlist"T'
+	      $run eval '$mv "$nlist"T "$nlist"'
+	    fi
+
+	    if test -n "$export_symbols_regex"; then
+	      $run eval 'egrep -e "$export_symbols_regex" "$nlist" > "$nlist"T'
+	      $run eval '$mv "$nlist"T "$nlist"'
+	    fi
+
+	    # Prepare the list of exported symbols
+	    if test -z "$export_symbols"; then
+	      export_symbols="$output_objdir/$output.exp"
+	      $run $rm $export_symbols
+	      $run eval "sed -n -e '/^: @PROGRAM@$/d' -e 's/^.* \(.*\)$/\1/p' "'< "$nlist" > "$export_symbols"'
+	    else
+	      $run eval "sed -e 's/\([][.*^$]\)/\\\1/g' -e 's/^/ /' -e 's/$/$/'"' < "$export_symbols" > "$output_objdir/$output.exp"'
+	      $run eval 'grep -f "$output_objdir/$output.exp" < "$nlist" > "$nlist"T'
+	      $run eval 'mv "$nlist"T "$nlist"'
+	    fi
+	  fi
+
+	  for arg in $dlprefiles; do
+	    $show "extracting global C symbols from \`$arg'"
+	    name=`echo "$arg" | sed -e 's%^.*/%%'`
+	    $run eval 'echo ": $name " >> "$nlist"'
+	    $run eval "$NM $arg | $global_symbol_pipe >> '$nlist'"
+	  done
+
+	  if test -z "$run"; then
+	    # Make sure we have at least an empty file.
+	    test -f "$nlist" || : > "$nlist"
+
+	    if test -n "$exclude_expsyms"; then
+	      egrep -v " ($exclude_expsyms)$" "$nlist" > "$nlist"T
+	      $mv "$nlist"T "$nlist"
+	    fi
+
+	    # Try sorting and uniquifying the output.
+	    if grep -v "^: " < "$nlist" | sort +2 | uniq > "$nlist"S; then
+	      :
+	    else
+	      grep -v "^: " < "$nlist" > "$nlist"S
+	    fi
+
+	    if test -f "$nlist"S; then
+	      eval "$global_symbol_to_cdecl"' < "$nlist"S >> "$output_objdir/$dlsyms"'
+	    else
+	      echo '/* NONE */' >> "$output_objdir/$dlsyms"
+	    fi
+
+	    $echo >> "$output_objdir/$dlsyms" "\
+
+#undef lt_preloaded_symbols
+
+#if defined (__STDC__) && __STDC__
+# define lt_ptr_t void *
+#else
+# define lt_ptr_t char *
+# define const
+#endif
+
+/* The mapping between symbol names and symbols. */
+const struct {
+  const char *name;
+  lt_ptr_t address;
+}
+lt_preloaded_symbols[] =
+{\
+"
+
+	    sed -n -e 's/^: \([^ ]*\) $/  {\"\1\", (lt_ptr_t) 0},/p' \
+		-e 's/^. \([^ ]*\) \([^ ]*\)$/  {"\2", (lt_ptr_t) \&\2},/p' \
+		  < "$nlist" >> "$output_objdir/$dlsyms"
+
+	    $echo >> "$output_objdir/$dlsyms" "\
+  {0, (lt_ptr_t) 0}
+};
+
+/* This works around a problem in FreeBSD linker */
+#ifdef FREEBSD_WORKAROUND
+static const void *lt_preloaded_setup() {
+  return lt_preloaded_symbols;
+}
+#endif
+
+#ifdef __cplusplus
+}
+#endif\
+"
+	  fi
+
+	  pic_flag_for_symtable=
+	  case $host in
+	  # compiling the symbol table file with pic_flag works around
+	  # a FreeBSD bug that causes programs to crash when -lm is
+	  # linked before any other PIC object.  But we must not use
+	  # pic_flag when linking with -static.  The problem exists in
+	  # FreeBSD 2.2.6 and is fixed in FreeBSD 3.1.
+	  *-*-freebsd2*|*-*-freebsd3.0*|*-*-freebsdelf3.0*)
+	    case "$compile_command " in
+	    *" -static "*) ;;
+	    *) pic_flag_for_symtable=" $pic_flag -DPIC -DFREEBSD_WORKAROUND";;
+	    esac;;
+	  *-*-hpux*)
+	    case "$compile_command " in
+	    *" -static "*) ;;
+	    *) pic_flag_for_symtable=" $pic_flag -DPIC";;
+	    esac
+	  esac
+
+	  # Now compile the dynamic symbol file.
+	  $show "(cd $output_objdir && $CC -c$no_builtin_flag$pic_flag_for_symtable \"$dlsyms\")"
+	  $run eval '(cd $output_objdir && $CC -c$no_builtin_flag$pic_flag_for_symtable "$dlsyms")' || exit $?
+
+	  # Clean up the generated files.
+	  $show "$rm $output_objdir/$dlsyms $nlist ${nlist}S ${nlist}T"
+	  $run $rm "$output_objdir/$dlsyms" "$nlist" "${nlist}S" "${nlist}T"
+
+	  # Transform the symbol file into the correct name.
+	  compile_command=`$echo "X$compile_command" | $Xsed -e "s%@SYMFILE@%$output_objdir/${outputname}S.${objext}%"`
+	  finalize_command=`$echo "X$finalize_command" | $Xsed -e "s%@SYMFILE@%$output_objdir/${outputname}S.${objext}%"`
+	  ;;
+	*)
+	  $echo "$modename: unknown suffix for \`$dlsyms'" 1>&2
+	  exit 1
+	  ;;
+	esac
+      else
+	# We keep going just in case the user didn't refer to
+	# lt_preloaded_symbols.  The linker will fail if global_symbol_pipe
+	# really was required.
+
+	# Nullify the symbol file.
+	compile_command=`$echo "X$compile_command" | $Xsed -e "s% @SYMFILE@%%"`
+	finalize_command=`$echo "X$finalize_command" | $Xsed -e "s% @SYMFILE@%%"`
+      fi
+
+      if test $need_relink = no || test "$build_libtool_libs" != yes; then
+	# Replace the output file specification.
+	compile_command=`$echo "X$compile_command" | $Xsed -e 's%@OUTPUT@%'"$output"'%g'`
+	link_command="$compile_command$compile_rpath"
+
+	# We have no uninstalled library dependencies, so finalize right now.
+	$show "$link_command"
+	$run eval "$link_command"
+	status=$?
+
+	# Delete the generated files.
+	if test -n "$dlsyms"; then
+	  $show "$rm $output_objdir/${outputname}S.${objext}"
+	  $run $rm "$output_objdir/${outputname}S.${objext}"
+	fi
+
+	exit $status
+      fi
+
+      if test -n "$shlibpath_var"; then
+	# We should set the shlibpath_var
+	rpath=
+	for dir in $temp_rpath; do
+	  case $dir in
+	  [\\/]* | [A-Za-z]:[\\/]*)
+	    # Absolute path.
+	    rpath="$rpath$dir:"
+	    ;;
+	  *)
+	    # Relative path: add a thisdir entry.
+	    rpath="$rpath\$thisdir/$dir:"
+	    ;;
+	  esac
+	done
+	temp_rpath="$rpath"
+      fi
+
+      if test -n "$compile_shlibpath$finalize_shlibpath"; then
+	compile_command="$shlibpath_var=\"$compile_shlibpath$finalize_shlibpath\$$shlibpath_var\" $compile_command"
+      fi
+      if test -n "$finalize_shlibpath"; then
+	finalize_command="$shlibpath_var=\"$finalize_shlibpath\$$shlibpath_var\" $finalize_command"
+      fi
+
+      compile_var=
+      finalize_var=
+      if test -n "$runpath_var"; then
+	if test -n "$perm_rpath"; then
+	  # We should set the runpath_var.
+	  rpath=
+	  for dir in $perm_rpath; do
+	    rpath="$rpath$dir:"
+	  done
+	  compile_var="$runpath_var=\"$rpath\$$runpath_var\" "
+	fi
+	if test -n "$finalize_perm_rpath"; then
+	  # We should set the runpath_var.
+	  rpath=
+	  for dir in $finalize_perm_rpath; do
+	    rpath="$rpath$dir:"
+	  done
+	  finalize_var="$runpath_var=\"$rpath\$$runpath_var\" "
+	fi
+      fi
+
+      if test "$no_install" = yes; then
+	# We don't need to create a wrapper script.
+	link_command="$compile_var$compile_command$compile_rpath"
+	# Replace the output file specification.
+	link_command=`$echo "X$link_command" | $Xsed -e 's%@OUTPUT@%'"$output"'%g'`
+	# Delete the old output file.
+	$run $rm $output
+	# Link the executable and exit
+	$show "$link_command"
+	$run eval "$link_command" || exit $?
+	exit 0
+      fi
+
+      if test "$hardcode_action" = relink; then
+	# Fast installation is not supported
+	link_command="$compile_var$compile_command$compile_rpath"
+	relink_command="$finalize_var$finalize_command$finalize_rpath"
+
+	$echo "$modename: warning: this platform does not like uninstalled shared libraries" 1>&2
+	$echo "$modename: \`$output' will be relinked during installation" 1>&2
+      else
+	if test "$fast_install" != no; then
+	  link_command="$finalize_var$compile_command$finalize_rpath"
+	  if test "$fast_install" = yes; then
+	    relink_command=`$echo "X$compile_var$compile_command$compile_rpath" | $Xsed -e 's%@OUTPUT@%\$progdir/\$file%g'`
+	  else
+	    # fast_install is set to needless
+	    relink_command=
+	  fi
+	else
+	  link_command="$compile_var$compile_command$compile_rpath"
+	  relink_command="$finalize_var$finalize_command$finalize_rpath"
+	fi
+      fi
+
+      # Replace the output file specification.
+      link_command=`$echo "X$link_command" | $Xsed -e 's%@OUTPUT@%'"$output_objdir/$outputname"'%g'`
+
+      # Delete the old output files.
+      $run $rm $output $output_objdir/$outputname $output_objdir/lt-$outputname
+
+      $show "$link_command"
+      $run eval "$link_command" || exit $?
+
+      # Now create the wrapper script.
+      $show "creating $output"
+
+      # Quote the relink command for shipping.
+      if test -n "$relink_command"; then
+	# Preserve any variables that may affect compiler behavior
+	for var in $variables_saved_for_relink; do
+	  if eval test -z \"\${$var+set}\"; then
+	    relink_command="{ test -z \"\${$var+set}\" || unset $var || { $var=; export $var; }; }; $relink_command"
+	  elif eval var_value=\$$var; test -z "$var_value"; then
+	    relink_command="$var=; export $var; $relink_command"
+	  else
+	    var_value=`$echo "X$var_value" | $Xsed -e "$sed_quote_subst"`
+	    relink_command="$var=\"$var_value\"; export $var; $relink_command"
+	  fi
+	done
+	relink_command="cd `pwd`; $relink_command"
+	relink_command=`$echo "X$relink_command" | $Xsed -e "$sed_quote_subst"`
+      fi
+
+      # Quote $echo for shipping.
+      if test "X$echo" = "X$SHELL $0 --fallback-echo"; then
+	case $0 in
+	[\\/]* | [A-Za-z]:[\\/]*) qecho="$SHELL $0 --fallback-echo";;
+	*) qecho="$SHELL `pwd`/$0 --fallback-echo";;
+	esac
+	qecho=`$echo "X$qecho" | $Xsed -e "$sed_quote_subst"`
+      else
+	qecho=`$echo "X$echo" | $Xsed -e "$sed_quote_subst"`
+      fi
+
+      # Only actually do things if our run command is non-null.
+      if test -z "$run"; then
+	# win32 will think the script is a binary if it has
+	# a .exe suffix, so we strip it off here.
+	case $output in
+	  *.exe) output=`echo $output|sed 's,.exe$,,'` ;;
+	esac
+	# test for cygwin because mv fails w/o .exe extensions
+	case $host in
+	  *cygwin*) exeext=.exe ;;
+	  *) exeext= ;;
+	esac
+	$rm $output
+	trap "$rm $output; exit 1" 1 2 15
+
+	$echo > $output "\
+#! $SHELL
+
+# $output - temporary wrapper script for $objdir/$outputname
+# Generated by $PROGRAM - GNU $PACKAGE $VERSION$TIMESTAMP
+#
+# The $output program cannot be directly executed until all the libtool
+# libraries that it depends on are installed.
+#
+# This wrapper script should never be moved out of the build directory.
+# If it is, it will not operate correctly.
+
+# Sed substitution that helps us do robust quoting.  It backslashifies
+# metacharacters that are still active within double-quoted strings.
+Xsed='sed -e 1s/^X//'
+sed_quote_subst='$sed_quote_subst'
+
+# The HP-UX ksh and POSIX shell print the target directory to stdout
+# if CDPATH is set.
+if test \"\${CDPATH+set}\" = set; then CDPATH=:; export CDPATH; fi
+
+relink_command=\"$relink_command\"
+
+# This environment variable determines our operation mode.
+if test \"\$libtool_install_magic\" = \"$magic\"; then
+  # install mode needs the following variable:
+  notinst_deplibs='$notinst_deplibs'
+else
+  # When we are sourced in execute mode, \$file and \$echo are already set.
+  if test \"\$libtool_execute_magic\" != \"$magic\"; then
+    echo=\"$qecho\"
+    file=\"\$0\"
+    # Make sure echo works.
+    if test \"X\$1\" = X--no-reexec; then
+      # Discard the --no-reexec flag, and continue.
+      shift
+    elif test \"X\`(\$echo '\t') 2>/dev/null\`\" = 'X\t'; then
+      # Yippee, \$echo works!
+      :
+    else
+      # Restart under the correct shell, and then maybe \$echo will work.
+      exec $SHELL \"\$0\" --no-reexec \${1+\"\$@\"}
+    fi
+  fi\
+"
+	$echo >> $output "\
+
+  # Find the directory that this script lives in.
+  thisdir=\`\$echo \"X\$file\" | \$Xsed -e 's%/[^/]*$%%'\`
+  test \"x\$thisdir\" = \"x\$file\" && thisdir=.
+
+  # Follow symbolic links until we get to the real thisdir.
+  file=\`ls -ld \"\$file\" | sed -n 's/.*-> //p'\`
+  while test -n \"\$file\"; do
+    destdir=\`\$echo \"X\$file\" | \$Xsed -e 's%/[^/]*\$%%'\`
+
+    # If there was a directory component, then change thisdir.
+    if test \"x\$destdir\" != \"x\$file\"; then
+      case \"\$destdir\" in
+      [\\\\/]* | [A-Za-z]:[\\\\/]*) thisdir=\"\$destdir\" ;;
+      *) thisdir=\"\$thisdir/\$destdir\" ;;
+      esac
+    fi
+
+    file=\`\$echo \"X\$file\" | \$Xsed -e 's%^.*/%%'\`
+    file=\`ls -ld \"\$thisdir/\$file\" | sed -n 's/.*-> //p'\`
+  done
+
+  # Try to get the absolute directory name.
+  absdir=\`cd \"\$thisdir\" && pwd\`
+  test -n \"\$absdir\" && thisdir=\"\$absdir\"
+"
+
+	if test "$fast_install" = yes; then
+	  echo >> $output "\
+  program=lt-'$outputname'$exeext
+  progdir=\"\$thisdir/$objdir\"
+
+  if test ! -f \"\$progdir/\$program\" || \\
+     { file=\`ls -1dt \"\$progdir/\$program\" \"\$progdir/../\$program\" 2>/dev/null | sed 1q\`; \\
+       test \"X\$file\" != \"X\$progdir/\$program\"; }; then
+
+    file=\"\$\$-\$program\"
+
+    if test ! -d \"\$progdir\"; then
+      $mkdir \"\$progdir\"
+    else
+      $rm \"\$progdir/\$file\"
+    fi"
+
+	  echo >> $output "\
+
+    # relink executable if necessary
+    if test -n \"\$relink_command\"; then
+      if (eval \$relink_command); then :
+      else
+	$rm \"\$progdir/\$file\"
+	exit 1
+      fi
+    fi
+
+    $mv \"\$progdir/\$file\" \"\$progdir/\$program\" 2>/dev/null ||
+    { $rm \"\$progdir/\$program\";
+      $mv \"\$progdir/\$file\" \"\$progdir/\$program\"; }
+    $rm \"\$progdir/\$file\"
+  fi"
+	else
+	  echo >> $output "\
+  program='$outputname'
+  progdir=\"\$thisdir/$objdir\"
+"
+	fi
+
+	echo >> $output "\
+
+  if test -f \"\$progdir/\$program\"; then"
+
+	# Export our shlibpath_var if we have one.
+	if test "$shlibpath_overrides_runpath" = yes && test -n "$shlibpath_var" && test -n "$temp_rpath"; then
+	  $echo >> $output "\
+    # Add our own library path to $shlibpath_var
+    $shlibpath_var=\"$temp_rpath\$$shlibpath_var\"
+
+    # Some systems cannot cope with colon-terminated $shlibpath_var
+    # The second colon is a workaround for a bug in BeOS R4 sed
+    $shlibpath_var=\`\$echo \"X\$$shlibpath_var\" | \$Xsed -e 's/::*\$//'\`
+
+    export $shlibpath_var
+"
+	fi
+
+	# fixup the dll searchpath if we need to.
+	if test -n "$dllsearchpath"; then
+	  $echo >> $output "\
+    # Add the dll search path components to the executable PATH
+    PATH=$dllsearchpath:\$PATH
+"
+	fi
+
+	$echo >> $output "\
+    if test \"\$libtool_execute_magic\" != \"$magic\"; then
+      # Run the actual program with our arguments.
+"
+	case $host in
+	# win32 systems need to use the prog path for dll
+	# lookup to work
+	*-*-cygwin* | *-*-pw32*)
+	  $echo >> $output "\
+      exec \$progdir/\$program \${1+\"\$@\"}
+"
+	  ;;
+
+	# Backslashes separate directories on plain windows
+	*-*-mingw | *-*-os2*)
+	  $echo >> $output "\
+      exec \$progdir\\\\\$program \${1+\"\$@\"}
+"
+	  ;;
+
+	*)
+	  $echo >> $output "\
+      # Export the path to the program.
+      PATH=\"\$progdir:\$PATH\"
+      export PATH
+
+      exec \$program \${1+\"\$@\"}
+"
+	  ;;
+	esac
+	$echo >> $output "\
+      \$echo \"\$0: cannot exec \$program \${1+\"\$@\"}\"
+      exit 1
+    fi
+  else
+    # The program doesn't exist.
+    \$echo \"\$0: error: \$progdir/\$program does not exist\" 1>&2
+    \$echo \"This script is just a wrapper for \$program.\" 1>&2
+    echo \"See the $PACKAGE documentation for more information.\" 1>&2
+    exit 1
+  fi
+fi\
+"
+	chmod +x $output
+      fi
+      exit 0
+      ;;
+    esac
+
+    # See if we need to build an old-fashioned archive.
+    for oldlib in $oldlibs; do
+
+      if test "$build_libtool_libs" = convenience; then
+	oldobjs="$libobjs_save"
+	addlibs="$convenience"
+	build_libtool_libs=no
+      else
+	if test "$build_libtool_libs" = module; then
+	  oldobjs="$libobjs_save"
+	  build_libtool_libs=no
+	else
+	  oldobjs="$objs$old_deplibs "`$echo "X$libobjs_save" | $SP2NL | $Xsed -e '/\.'${libext}'$/d' -e '/\.lib$/d' -e "$lo2o" | $NL2SP`
+	fi
+	addlibs="$old_convenience"
+      fi
+
+      if test -n "$addlibs"; then
+	gentop="$output_objdir/${outputname}x"
+	$show "${rm}r $gentop"
+	$run ${rm}r "$gentop"
+	$show "mkdir $gentop"
+	$run mkdir "$gentop"
+	status=$?
+	if test $status -ne 0 && test ! -d "$gentop"; then
+	  exit $status
+	fi
+	generated="$generated $gentop"
+
+	# Add in members from convenience archives.
+	for xlib in $addlibs; do
+	  # Extract the objects.
+	  case $xlib in
+	  [\\/]* | [A-Za-z]:[\\/]*) xabs="$xlib" ;;
+	  *) xabs=`pwd`"/$xlib" ;;
+	  esac
+	  xlib=`$echo "X$xlib" | $Xsed -e 's%^.*/%%'`
+	  xdir="$gentop/$xlib"
+
+	  $show "${rm}r $xdir"
+	  $run ${rm}r "$xdir"
+	  $show "mkdir $xdir"
+	  $run mkdir "$xdir"
+	  status=$?
+	  if test $status -ne 0 && test ! -d "$xdir"; then
+	    exit $status
+	  fi
+	  $show "(cd $xdir && $AR x $xabs)"
+	  $run eval "(cd \$xdir && $AR x \$xabs)" || exit $?
+
+	  oldobjs="$oldobjs "`find $xdir -name \*.${objext} -print -o -name \*.lo -print | $NL2SP`
+	done
+      fi
+
+      # Do each command in the archive commands.
+      if test -n "$old_archive_from_new_cmds" && test "$build_libtool_libs" = yes; then
+	eval cmds=\"$old_archive_from_new_cmds\"
+      else
+	# Ensure that we have .o objects in place in case we decided
+	# not to build a shared library, and have fallen back to building
+	# static libs even though --disable-static was passed!
+	for oldobj in $oldobjs; do
+	  if test ! -f $oldobj; then
+	    xdir=`$echo "X$oldobj" | $Xsed -e 's%/[^/]*$%%'`
+	    if test "X$xdir" = "X$oldobj"; then
+	      xdir="."
+	    else
+	      xdir="$xdir"
+	    fi
+	    baseobj=`$echo "X$oldobj" | $Xsed -e 's%^.*/%%'`
+	    obj=`$echo "X$baseobj" | $Xsed -e "$o2lo"`
+	    $show "(cd $xdir && ${LN_S} $obj $baseobj)"
+	    $run eval '(cd $xdir && ${LN_S} $obj $baseobj)' || exit $?
+	  fi
+	done
+
+	eval cmds=\"$old_archive_cmds\"
+      fi
+      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+      for cmd in $cmds; do
+	IFS="$save_ifs"
+	$show "$cmd"
+	$run eval "$cmd" || exit $?
+      done
+      IFS="$save_ifs"
+    done
+
+    if test -n "$generated"; then
+      $show "${rm}r$generated"
+      $run ${rm}r$generated
+    fi
+
+    # Now create the libtool archive.
+    case $output in
+    *.la)
+      old_library=
+      test "$build_old_libs" = yes && old_library="$libname.$libext"
+      $show "creating $output"
+
+      # Preserve any variables that may affect compiler behavior
+      for var in $variables_saved_for_relink; do
+	if eval test -z \"\${$var+set}\"; then
+	  relink_command="{ test -z \"\${$var+set}\" || unset $var || { $var=; export $var; }; }; $relink_command"
+	elif eval var_value=\$$var; test -z "$var_value"; then
+	  relink_command="$var=; export $var; $relink_command"
+	else
+	  var_value=`$echo "X$var_value" | $Xsed -e "$sed_quote_subst"`
+	  relink_command="$var=\"$var_value\"; export $var; $relink_command"
+	fi
+      done
+      # Quote the link command for shipping.
+      relink_command="cd `pwd`; $SHELL $0 --mode=relink $libtool_args"
+      relink_command=`$echo "X$relink_command" | $Xsed -e "$sed_quote_subst"`
+
+      # Only create the output if not a dry run.
+      if test -z "$run"; then
+	for installed in no yes; do
+	  if test "$installed" = yes; then
+	    if test -z "$install_libdir"; then
+	      break
+	    fi
+	    output="$output_objdir/$outputname"i
+	    # Replace all uninstalled libtool libraries with the installed ones
+	    newdependency_libs=
+	    for deplib in $dependency_libs; do
+	      case $deplib in
+	      *.la)
+		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
+		eval libdir=`sed -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
+		if test -z "$libdir"; then
+		  $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
+		  exit 1
+		fi
+		newdependency_libs="$newdependency_libs $libdir/$name"
+		;;
+	      *) newdependency_libs="$newdependency_libs $deplib" ;;
+	      esac
+	    done
+	    dependency_libs="$newdependency_libs"
+	    newdlfiles=
+	    for lib in $dlfiles; do
+	      name=`$echo "X$lib" | $Xsed -e 's%^.*/%%'`
+	      eval libdir=`sed -n -e 's/^libdir=\(.*\)$/\1/p' $lib`
+	      if test -z "$libdir"; then
+		$echo "$modename: \`$lib' is not a valid libtool archive" 1>&2
+		exit 1
+	      fi
+	      newdlfiles="$newdlfiles $libdir/$name"
+	    done
+	    dlfiles="$newdlfiles"
+	    newdlprefiles=
+	    for lib in $dlprefiles; do
+	      name=`$echo "X$lib" | $Xsed -e 's%^.*/%%'`
+	      eval libdir=`sed -n -e 's/^libdir=\(.*\)$/\1/p' $lib`
+	      if test -z "$libdir"; then
+		$echo "$modename: \`$lib' is not a valid libtool archive" 1>&2
+		exit 1
+	      fi
+	      newdlprefiles="$newdlprefiles $libdir/$name"
+	    done
+	    dlprefiles="$newdlprefiles"
+	  fi
+	  $rm $output
+	  # place dlname in correct position for cygwin
+	  tdlname=$dlname
+	  case $host,$output,$installed,$module,$dlname in
+	    *cygwin*,*lai,yes,no,*.dll) tdlname=../bin/$dlname ;;
+	  esac
+	  $echo > $output "\
+# $outputname - a libtool library file
+# Generated by $PROGRAM - GNU $PACKAGE $VERSION$TIMESTAMP
+#
+# Please DO NOT delete this file!
+# It is necessary for linking the library.
+
+# The name that we can dlopen(3).
+dlname='$tdlname'
+
+# Names of this library.
+library_names='$library_names'
+
+# The name of the static archive.
+old_library='$old_library'
+
+# Libraries that this one depends upon.
+dependency_libs='$dependency_libs'
+
+# Version information for $libname.
+current=$current
+age=$age
+revision=$revision
+
+# Is this an already installed library?
+installed=$installed
+
+# Files to dlopen/dlpreopen
+dlopen='$dlfiles'
+dlpreopen='$dlprefiles'
+
+# Directory that this library needs to be installed in:
+libdir='$install_libdir'"
+	  if test "$installed" = no && test $need_relink = yes; then
+	    $echo >> $output "\
+relink_command=\"$relink_command\""
+	  fi
+	done
+      fi
+
+      # Do a symbolic link so that the libtool archive can be found in
+      # LD_LIBRARY_PATH before the program is installed.
+      $show "(cd $output_objdir && $rm $outputname && $LN_S ../$outputname $outputname)"
+      $run eval '(cd $output_objdir && $rm $outputname && $LN_S ../$outputname $outputname)' || exit $?
+      ;;
+    esac
+    exit 0
+    ;;
+
+  # libtool install mode
+  install)
+    modename="$modename: install"
+
+    # There may be an optional sh(1) argument at the beginning of
+    # install_prog (especially on Windows NT).
+    if test "$nonopt" = "$SHELL" || test "$nonopt" = /bin/sh ||
+       # Allow the use of GNU shtool's install command.
+       $echo "X$nonopt" | $Xsed | grep shtool > /dev/null; then
+      # Aesthetically quote it.
+      arg=`$echo "X$nonopt" | $Xsed -e "$sed_quote_subst"`
+      case $arg in
+      *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*)
+	arg="\"$arg\""
+	;;
+      esac
+      install_prog="$arg "
+      arg="$1"
+      shift
+    else
+      install_prog=
+      arg="$nonopt"
+    fi
+
+    # The real first argument should be the name of the installation program.
+    # Aesthetically quote it.
+    arg=`$echo "X$arg" | $Xsed -e "$sed_quote_subst"`
+    case $arg in
+    *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*)
+      arg="\"$arg\""
+      ;;
+    esac
+    install_prog="$install_prog$arg"
+
+    # We need to accept at least all the BSD install flags.
+    dest=
+    files=
+    opts=
+    prev=
+    install_type=
+    isdir=no
+    stripme=
+    for arg
+    do
+      if test -n "$dest"; then
+	files="$files $dest"
+	dest="$arg"
+	continue
+      fi
+
+      case $arg in
+      -d) isdir=yes ;;
+      -f) prev="-f" ;;
+      -g) prev="-g" ;;
+      -m) prev="-m" ;;
+      -o) prev="-o" ;;
+      -s)
+	stripme=" -s"
+	continue
+	;;
+      -*) ;;
+
+      *)
+	# If the previous option needed an argument, then skip it.
+	if test -n "$prev"; then
+	  prev=
+	else
+	  dest="$arg"
+	  continue
+	fi
+	;;
+      esac
+
+      # Aesthetically quote the argument.
+      arg=`$echo "X$arg" | $Xsed -e "$sed_quote_subst"`
+      case $arg in
+      *[\[\~\#\^\&\*\(\)\{\}\|\;\<\>\?\'\ \	]*|*]*)
+	arg="\"$arg\""
+	;;
+      esac
+      install_prog="$install_prog $arg"
+    done
+
+    if test -z "$install_prog"; then
+      $echo "$modename: you must specify an install program" 1>&2
+      $echo "$help" 1>&2
+      exit 1
+    fi
+
+    if test -n "$prev"; then
+      $echo "$modename: the \`$prev' option requires an argument" 1>&2
+      $echo "$help" 1>&2
+      exit 1
+    fi
+
+    if test -z "$files"; then
+      if test -z "$dest"; then
+	$echo "$modename: no file or destination specified" 1>&2
+      else
+	$echo "$modename: you must specify a destination" 1>&2
+      fi
+      $echo "$help" 1>&2
+      exit 1
+    fi
+
+    # Strip any trailing slash from the destination.
+    dest=`$echo "X$dest" | $Xsed -e 's%/$%%'`
+
+    # Check to see that the destination is a directory.
+    test -d "$dest" && isdir=yes
+    if test "$isdir" = yes; then
+      destdir="$dest"
+      destname=
+    else
+      destdir=`$echo "X$dest" | $Xsed -e 's%/[^/]*$%%'`
+      test "X$destdir" = "X$dest" && destdir=.
+      destname=`$echo "X$dest" | $Xsed -e 's%^.*/%%'`
+
+      # Not a directory, so check to see that there is only one file specified.
+      set dummy $files
+      if test $# -gt 2; then
+	$echo "$modename: \`$dest' is not a directory" 1>&2
+	$echo "$help" 1>&2
+	exit 1
+      fi
+    fi
+    case $destdir in
+    [\\/]* | [A-Za-z]:[\\/]*) ;;
+    *)
+      for file in $files; do
+	case $file in
+	*.lo) ;;
+	*)
+	  $echo "$modename: \`$destdir' must be an absolute directory name" 1>&2
+	  $echo "$help" 1>&2
+	  exit 1
+	  ;;
+	esac
+      done
+      ;;
+    esac
+
+    # This variable tells wrapper scripts just to set variables rather
+    # than running their programs.
+    libtool_install_magic="$magic"
+
+    staticlibs=
+    future_libdirs=
+    current_libdirs=
+    for file in $files; do
+
+      # Do each installation.
+      case $file in
+      *.$libext)
+	# Do the static libraries later.
+	staticlibs="$staticlibs $file"
+	;;
+
+      *.la)
+	# Check to see that this really is a libtool archive.
+	if (sed -e '2q' $file | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then :
+	else
+	  $echo "$modename: \`$file' is not a valid libtool archive" 1>&2
+	  $echo "$help" 1>&2
+	  exit 1
+	fi
+
+	library_names=
+	old_library=
+	relink_command=
+	# If there is no directory component, then add one.
+	case $file in
+	*/* | *\\*) . $file ;;
+	*) . ./$file ;;
+	esac
+
+	# Add the libdir to current_libdirs if it is the destination.
+	if test "X$destdir" = "X$libdir"; then
+	  case "$current_libdirs " in
+	  *" $libdir "*) ;;
+	  *) current_libdirs="$current_libdirs $libdir" ;;
+	  esac
+	else
+	  # Note the libdir as a future libdir.
+	  case "$future_libdirs " in
+	  *" $libdir "*) ;;
+	  *) future_libdirs="$future_libdirs $libdir" ;;
+	  esac
+	fi
+
+	dir=`$echo "X$file" | $Xsed -e 's%/[^/]*$%%'`/
+	test "X$dir" = "X$file/" && dir=
+	dir="$dir$objdir"
+
+	if test -n "$relink_command"; then
+	  $echo "$modename: warning: relinking \`$file'" 1>&2
+	  $show "$relink_command"
+	  if $run eval "$relink_command"; then :
+	  else
+	    $echo "$modename: error: relink \`$file' with the above command before installing it" 1>&2
+	    continue
+	  fi
+	fi
+
+	# See the names of the shared library.
+	set dummy $library_names
+	if test -n "$2"; then
+	  realname="$2"
+	  shift
+	  shift
+
+	  srcname="$realname"
+	  test -n "$relink_command" && srcname="$realname"T
+
+	  # Install the shared library and build the symlinks.
+	  $show "$install_prog $dir/$srcname $destdir/$realname"
+	  $run eval "$install_prog $dir/$srcname $destdir/$realname" || exit $?
+	  if test -n "$stripme" && test -n "$striplib"; then
+	    $show "$striplib $destdir/$realname"
+	    $run eval "$striplib $destdir/$realname" || exit $?
+	  fi
+
+	  if test $# -gt 0; then
+	    # Delete the old symlinks, and create new ones.
+	    for linkname
+	    do
+	      if test "$linkname" != "$realname"; then
+		$show "(cd $destdir && $rm $linkname && $LN_S $realname $linkname)"
+		$run eval "(cd $destdir && $rm $linkname && $LN_S $realname $linkname)"
+	      fi
+	    done
+	  fi
+
+	  # Do each command in the postinstall commands.
+	  lib="$destdir/$realname"
+	  eval cmds=\"$postinstall_cmds\"
+	  IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	  for cmd in $cmds; do
+	    IFS="$save_ifs"
+	    $show "$cmd"
+	    $run eval "$cmd" || exit $?
+	  done
+	  IFS="$save_ifs"
+	fi
+
+	# Install the pseudo-library for information purposes.
+	name=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
+	instname="$dir/$name"i
+	$show "$install_prog $instname $destdir/$name"
+	$run eval "$install_prog $instname $destdir/$name" || exit $?
+
+	# Maybe install the static library, too.
+	test -n "$old_library" && staticlibs="$staticlibs $dir/$old_library"
+	;;
+
+      *.lo)
+	# Install (i.e. copy) a libtool object.
+
+	# Figure out destination file name, if it wasn't already specified.
+	if test -n "$destname"; then
+	  destfile="$destdir/$destname"
+	else
+	  destfile=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
+	  destfile="$destdir/$destfile"
+	fi
+
+	# Deduce the name of the destination old-style object file.
+	case $destfile in
+	*.lo)
+	  staticdest=`$echo "X$destfile" | $Xsed -e "$lo2o"`
+	  ;;
+	*.$objext)
+	  staticdest="$destfile"
+	  destfile=
+	  ;;
+	*)
+	  $echo "$modename: cannot copy a libtool object to \`$destfile'" 1>&2
+	  $echo "$help" 1>&2
+	  exit 1
+	  ;;
+	esac
+
+	# Install the libtool object if requested.
+	if test -n "$destfile"; then
+	  $show "$install_prog $file $destfile"
+	  $run eval "$install_prog $file $destfile" || exit $?
+	fi
+
+	# Install the old object if enabled.
+	if test "$build_old_libs" = yes; then
+	  # Deduce the name of the old-style object file.
+	  staticobj=`$echo "X$file" | $Xsed -e "$lo2o"`
+
+	  $show "$install_prog $staticobj $staticdest"
+	  $run eval "$install_prog \$staticobj \$staticdest" || exit $?
+	fi
+	exit 0
+	;;
+
+      *)
+	# Figure out destination file name, if it wasn't already specified.
+	if test -n "$destname"; then
+	  destfile="$destdir/$destname"
+	else
+	  destfile=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
+	  destfile="$destdir/$destfile"
+	fi
+
+	# Do a test to see if this is really a libtool program.
+	if (sed -e '4q' $file | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then
+	  notinst_deplibs=
+	  relink_command=
+
+	  # If there is no directory component, then add one.
+	  case $file in
+	  */* | *\\*) . $file ;;
+	  *) . ./$file ;;
+	  esac
+
+	  # Check the variables that should have been set.
+	  if test -z "$notinst_deplibs"; then
+	    $echo "$modename: invalid libtool wrapper script \`$file'" 1>&2
+	    exit 1
+	  fi
+
+	  finalize=yes
+	  for lib in $notinst_deplibs; do
+	    # Check to see that each library is installed.
+	    libdir=
+	    if test -f "$lib"; then
+	      # If there is no directory component, then add one.
+	      case $lib in
+	      */* | *\\*) . $lib ;;
+	      *) . ./$lib ;;
+	      esac
+	    fi
+	    libfile="$libdir/"`$echo "X$lib" | $Xsed -e 's%^.*/%%g'` ### testsuite: skip nested quoting test
+	    if test -n "$libdir" && test ! -f "$libfile"; then
+	      $echo "$modename: warning: \`$lib' has not been installed in \`$libdir'" 1>&2
+	      finalize=no
+	    fi
+	  done
+
+	  relink_command=
+	  # If there is no directory component, then add one.
+	  case $file in
+	  */* | *\\*) . $file ;;
+	  *) . ./$file ;;
+	  esac
+
+	  outputname=
+	  if test "$fast_install" = no && test -n "$relink_command"; then
+	    if test "$finalize" = yes && test -z "$run"; then
+	      tmpdir="/tmp"
+	      test -n "$TMPDIR" && tmpdir="$TMPDIR"
+	      tmpdir="$tmpdir/libtool-$$"
+	      if $mkdir -p "$tmpdir" && chmod 700 "$tmpdir"; then :
+	      else
+		$echo "$modename: error: cannot create temporary directory \`$tmpdir'" 1>&2
+		continue
+	      fi
+	      file=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
+	      outputname="$tmpdir/$file"
+	      # Replace the output file specification.
+	      relink_command=`$echo "X$relink_command" | $Xsed -e 's%@OUTPUT@%'"$outputname"'%g'`
+
+	      $show "$relink_command"
+	      if $run eval "$relink_command"; then :
+	      else
+		$echo "$modename: error: relink \`$file' with the above command before installing it" 1>&2
+		${rm}r "$tmpdir"
+		continue
+	      fi
+	      file="$outputname"
+	    else
+	      $echo "$modename: warning: cannot relink \`$file'" 1>&2
+	    fi
+	  else
+	    # Install the binary that we compiled earlier.
+	    file=`$echo "X$file" | $Xsed -e "s%\([^/]*\)$%$objdir/\1%"`
+	  fi
+	fi
+
+	# remove .exe since cygwin /usr/bin/install will append another
+	# one anyways
+	case $install_prog,$host in
+	/usr/bin/install*,*cygwin*)
+	  case $file:$destfile in
+	  *.exe:*.exe)
+	    # this is ok
+	    ;;
+	  *.exe:*)
+	    destfile=$destfile.exe
+	    ;;
+	  *:*.exe)
+	    destfile=`echo $destfile | sed -e 's,.exe$,,'`
+	    ;;
+	  esac
+	  ;;
+	esac
+	$show "$install_prog$stripme $file $destfile"
+	$run eval "$install_prog\$stripme \$file \$destfile" || exit $?
+	test -n "$outputname" && ${rm}r "$tmpdir"
+	;;
+      esac
+    done
+
+    for file in $staticlibs; do
+      name=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
+
+      # Set up the ranlib parameters.
+      oldlib="$destdir/$name"
+
+      $show "$install_prog $file $oldlib"
+      $run eval "$install_prog \$file \$oldlib" || exit $?
+
+      if test -n "$stripme" && test -n "$striplib"; then
+	$show "$old_striplib $oldlib"
+	$run eval "$old_striplib $oldlib" || exit $?
+      fi
+
+      # Do each command in the postinstall commands.
+      eval cmds=\"$old_postinstall_cmds\"
+      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+      for cmd in $cmds; do
+	IFS="$save_ifs"
+	$show "$cmd"
+	$run eval "$cmd" || exit $?
+      done
+      IFS="$save_ifs"
+    done
+
+    if test -n "$future_libdirs"; then
+      $echo "$modename: warning: remember to run \`$progname --finish$future_libdirs'" 1>&2
+    fi
+
+    if test -n "$current_libdirs"; then
+      # Maybe just do a dry run.
+      test -n "$run" && current_libdirs=" -n$current_libdirs"
+      exec $SHELL $0 --finish$current_libdirs
+      exit 1
+    fi
+
+    exit 0
+    ;;
+
+  # libtool finish mode
+  finish)
+    modename="$modename: finish"
+    libdirs="$nonopt"
+    admincmds=
+
+    if test -n "$finish_cmds$finish_eval" && test -n "$libdirs"; then
+      for dir
+      do
+	libdirs="$libdirs $dir"
+      done
+
+      for libdir in $libdirs; do
+	if test -n "$finish_cmds"; then
+	  # Do each command in the finish commands.
+	  eval cmds=\"$finish_cmds\"
+	  IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	  for cmd in $cmds; do
+	    IFS="$save_ifs"
+	    $show "$cmd"
+	    $run eval "$cmd" || admincmds="$admincmds
+       $cmd"
+	  done
+	  IFS="$save_ifs"
+	fi
+	if test -n "$finish_eval"; then
+	  # Do the single finish_eval.
+	  eval cmds=\"$finish_eval\"
+	  $run eval "$cmds" || admincmds="$admincmds
+       $cmds"
+	fi
+      done
+    fi
+
+    # Exit here if they wanted silent mode.
+    test "$show" = ":" && exit 0
+
+    echo "----------------------------------------------------------------------"
+    echo "Libraries have been installed in:"
+    for libdir in $libdirs; do
+      echo "   $libdir"
+    done
+    echo
+    echo "If you ever happen to want to link against installed libraries"
+    echo "in a given directory, LIBDIR, you must either use libtool, and"
+    echo "specify the full pathname of the library, or use the \`-LLIBDIR'"
+    echo "flag during linking and do at least one of the following:"
+    if test -n "$shlibpath_var"; then
+      echo "   - add LIBDIR to the \`$shlibpath_var' environment variable"
+      echo "     during execution"
+    fi
+    if test -n "$runpath_var"; then
+      echo "   - add LIBDIR to the \`$runpath_var' environment variable"
+      echo "     during linking"
+    fi
+    if test -n "$hardcode_libdir_flag_spec"; then
+      libdir=LIBDIR
+      eval flag=\"$hardcode_libdir_flag_spec\"
+
+      echo "   - use the \`$flag' linker flag"
+    fi
+    if test -n "$admincmds"; then
+      echo "   - have your system administrator run these commands:$admincmds"
+    fi
+    if test -f /etc/ld.so.conf; then
+      echo "   - have your system administrator add LIBDIR to \`/etc/ld.so.conf'"
+    fi
+    echo
+    echo "See any operating system documentation about shared libraries for"
+    echo "more information, such as the ld(1) and ld.so(8) manual pages."
+    echo "----------------------------------------------------------------------"
+    exit 0
+    ;;
+
+  # libtool execute mode
+  execute)
+    modename="$modename: execute"
+
+    # The first argument is the command name.
+    cmd="$nonopt"
+    if test -z "$cmd"; then
+      $echo "$modename: you must specify a COMMAND" 1>&2
+      $echo "$help"
+      exit 1
+    fi
+
+    # Handle -dlopen flags immediately.
+    for file in $execute_dlfiles; do
+      if test ! -f "$file"; then
+	$echo "$modename: \`$file' is not a file" 1>&2
+	$echo "$help" 1>&2
+	exit 1
+      fi
+
+      dir=
+      case $file in
+      *.la)
+	# Check to see that this really is a libtool archive.
+	if (sed -e '2q' $file | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then :
+	else
+	  $echo "$modename: \`$lib' is not a valid libtool archive" 1>&2
+	  $echo "$help" 1>&2
+	  exit 1
+	fi
+
+	# Read the libtool library.
+	dlname=
+	library_names=
+
+	# If there is no directory component, then add one.
+	case $file in
+	*/* | *\\*) . $file ;;
+	*) . ./$file ;;
+	esac
+
+	# Skip this library if it cannot be dlopened.
+	if test -z "$dlname"; then
+	  # Warn if it was a shared library.
+	  test -n "$library_names" && $echo "$modename: warning: \`$file' was not linked with \`-export-dynamic'"
+	  continue
+	fi
+
+	dir=`$echo "X$file" | $Xsed -e 's%/[^/]*$%%'`
+	test "X$dir" = "X$file" && dir=.
+
+	if test -f "$dir/$objdir/$dlname"; then
+	  dir="$dir/$objdir"
+	else
+	  $echo "$modename: cannot find \`$dlname' in \`$dir' or \`$dir/$objdir'" 1>&2
+	  exit 1
+	fi
+	;;
+
+      *.lo)
+	# Just add the directory containing the .lo file.
+	dir=`$echo "X$file" | $Xsed -e 's%/[^/]*$%%'`
+	test "X$dir" = "X$file" && dir=.
+	;;
+
+      *)
+	$echo "$modename: warning \`-dlopen' is ignored for non-libtool libraries and objects" 1>&2
+	continue
+	;;
+      esac
+
+      # Get the absolute pathname.
+      absdir=`cd "$dir" && pwd`
+      test -n "$absdir" && dir="$absdir"
+
+      # Now add the directory to shlibpath_var.
+      if eval "test -z \"\$$shlibpath_var\""; then
+	eval "$shlibpath_var=\"\$dir\""
+      else
+	eval "$shlibpath_var=\"\$dir:\$$shlibpath_var\""
+      fi
+    done
+
+    # This variable tells wrapper scripts just to set shlibpath_var
+    # rather than running their programs.
+    libtool_execute_magic="$magic"
+
+    # Check if any of the arguments is a wrapper script.
+    args=
+    for file
+    do
+      case $file in
+      -*) ;;
+      *)
+	# Do a test to see if this is really a libtool program.
+	if (sed -e '4q' $file | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then
+	  # If there is no directory component, then add one.
+	  case $file in
+	  */* | *\\*) . $file ;;
+	  *) . ./$file ;;
+	  esac
+
+	  # Transform arg to wrapped name.
+	  file="$progdir/$program"
+	fi
+	;;
+      esac
+      # Quote arguments (to preserve shell metacharacters).
+      file=`$echo "X$file" | $Xsed -e "$sed_quote_subst"`
+      args="$args \"$file\""
+    done
+
+    if test -z "$run"; then
+      if test -n "$shlibpath_var"; then
+	# Export the shlibpath_var.
+	eval "export $shlibpath_var"
+      fi
+
+      # Restore saved enviroment variables
+      if test "${save_LC_ALL+set}" = set; then
+	LC_ALL="$save_LC_ALL"; export LC_ALL
+      fi
+      if test "${save_LANG+set}" = set; then
+	LANG="$save_LANG"; export LANG
+      fi
+
+      # Now actually exec the command.
+      eval "exec \$cmd$args"
+
+      $echo "$modename: cannot exec \$cmd$args"
+      exit 1
+    else
+      # Display what would be done.
+      if test -n "$shlibpath_var"; then
+	eval "\$echo \"\$shlibpath_var=\$$shlibpath_var\""
+	$echo "export $shlibpath_var"
+      fi
+      $echo "$cmd$args"
+      exit 0
+    fi
+    ;;
+
+  # libtool clean and uninstall mode
+  clean | uninstall)
+    modename="$modename: $mode"
+    rm="$nonopt"
+    files=
+    rmforce=
+    exit_status=0
+
+    # This variable tells wrapper scripts just to set variables rather
+    # than running their programs.
+    libtool_install_magic="$magic"
+
+    for arg
+    do
+      case $arg in
+      -f) rm="$rm $arg"; rmforce=yes ;;
+      -*) rm="$rm $arg" ;;
+      *) files="$files $arg" ;;
+      esac
+    done
+
+    if test -z "$rm"; then
+      $echo "$modename: you must specify an RM program" 1>&2
+      $echo "$help" 1>&2
+      exit 1
+    fi
+
+    rmdirs=
+
+    for file in $files; do
+      dir=`$echo "X$file" | $Xsed -e 's%/[^/]*$%%'`
+      if test "X$dir" = "X$file"; then
+	dir=.
+	objdir="$objdir"
+      else
+	objdir="$dir/$objdir"
+      fi
+      name=`$echo "X$file" | $Xsed -e 's%^.*/%%'`
+      test $mode = uninstall && objdir="$dir"
+
+      # Remember objdir for removal later, being careful to avoid duplicates
+      if test $mode = clean; then
+	case " $rmdirs " in
+	  *" $objdir "*) ;;
+	  *) rmdirs="$rmdirs $objdir" ;;
+	esac
+      fi
+
+      # Don't error if the file doesn't exist and rm -f was used.
+      if (test -L "$file") >/dev/null 2>&1 \
+        || (test -h "$file") >/dev/null 2>&1 \
+	|| test -f "$file"; then
+        :
+      elif test -d "$file"; then
+        exit_status=1
+	continue
+      elif test "$rmforce" = yes; then
+        continue
+      fi
+
+      rmfiles="$file"
+
+      case $name in
+      *.la)
+	# Possibly a libtool archive, so verify it.
+	if (sed -e '2q' $file | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then
+	  . $dir/$name
+
+	  # Delete the libtool libraries and symlinks.
+	  for n in $library_names; do
+	    rmfiles="$rmfiles $objdir/$n"
+	  done
+	  test -n "$old_library" && rmfiles="$rmfiles $objdir/$old_library"
+	  test $mode = clean && rmfiles="$rmfiles $objdir/$name $objdir/${name}i"
+
+	  if test $mode = uninstall; then
+	    if test -n "$library_names"; then
+	      # Do each command in the postuninstall commands.
+	      eval cmds=\"$postuninstall_cmds\"
+	      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	      for cmd in $cmds; do
+		IFS="$save_ifs"
+		$show "$cmd"
+		$run eval "$cmd"
+		if test $? != 0 && test "$rmforce" != yes; then
+		  exit_status=1
+		fi
+	      done
+	      IFS="$save_ifs"
+	    fi
+
+	    if test -n "$old_library"; then
+	      # Do each command in the old_postuninstall commands.
+	      eval cmds=\"$old_postuninstall_cmds\"
+	      IFS="${IFS= 	}"; save_ifs="$IFS"; IFS='~'
+	      for cmd in $cmds; do
+		IFS="$save_ifs"
+		$show "$cmd"
+		$run eval "$cmd"
+		if test $? != 0 && test "$rmforce" != yes; then
+		  exit_status=1
+		fi
+	      done
+	      IFS="$save_ifs"
+	    fi
+	    # FIXME: should reinstall the best remaining shared library.
+	  fi
+	fi
+	;;
+
+      *.lo)
+	if test "$build_old_libs" = yes; then
+	  oldobj=`$echo "X$name" | $Xsed -e "$lo2o"`
+	  rmfiles="$rmfiles $dir/$oldobj"
+	fi
+	;;
+
+      *)
+	# Do a test to see if this is a libtool program.
+	if test $mode = clean &&
+	   (sed -e '4q' $file | egrep "^# Generated by .*$PACKAGE") >/dev/null 2>&1; then
+	  relink_command=
+	  . $dir/$file
+
+	  rmfiles="$rmfiles $objdir/$name $objdir/${name}S.${objext}"
+	  if test "$fast_install" = yes && test -n "$relink_command"; then
+	    rmfiles="$rmfiles $objdir/lt-$name"
+	  fi
+	fi
+	;;
+      esac
+      $show "$rm $rmfiles"
+      $run $rm $rmfiles || exit_status=1
+    done
+
+    # Try to remove the ${objdir}s in the directories where we deleted files
+    for dir in $rmdirs; do
+      if test -d "$dir"; then
+	$show "rmdir $dir"
+	$run rmdir $dir >/dev/null 2>&1
+      fi
+    done
+
+    exit $exit_status
+    ;;
+
+  "")
+    $echo "$modename: you must specify a MODE" 1>&2
+    $echo "$generic_help" 1>&2
+    exit 1
+    ;;
+  esac
+
+  $echo "$modename: invalid operation mode \`$mode'" 1>&2
+  $echo "$generic_help" 1>&2
+  exit 1
+fi # test -z "$show_help"
+
+# We need to display help for each of the modes.
+case $mode in
+"") $echo \
+"Usage: $modename [OPTION]... [MODE-ARG]...
+
+Provide generalized library-building support services.
+
+    --config          show all configuration variables
+    --debug           enable verbose shell tracing
+-n, --dry-run         display commands without modifying any files
+    --features        display basic configuration information and exit
+    --finish          same as \`--mode=finish'
+    --help            display this help message and exit
+    --mode=MODE       use operation mode MODE [default=inferred from MODE-ARGS]
+    --quiet           same as \`--silent'
+    --silent          don't print informational messages
+    --version         print version information
+
+MODE must be one of the following:
+
+      clean           remove files from the build directory
+      compile         compile a source file into a libtool object
+      execute         automatically set library path, then run a program
+      finish          complete the installation of libtool libraries
+      install         install libraries or executables
+      link            create a library or an executable
+      uninstall       remove libraries from an installed directory
+
+MODE-ARGS vary depending on the MODE.  Try \`$modename --help --mode=MODE' for
+a more detailed description of MODE."
+  exit 0
+  ;;
+
+clean)
+  $echo \
+"Usage: $modename [OPTION]... --mode=clean RM [RM-OPTION]... FILE...
+
+Remove files from the build directory.
+
+RM is the name of the program to use to delete files associated with each FILE
+(typically \`/bin/rm').  RM-OPTIONS are options (such as \`-f') to be passed
+to RM.
+
+If FILE is a libtool library, object or program, all the files associated
+with it are deleted. Otherwise, only FILE itself is deleted using RM."
+  ;;
+
+compile)
+  $echo \
+"Usage: $modename [OPTION]... --mode=compile COMPILE-COMMAND... SOURCEFILE
+
+Compile a source file into a libtool library object.
+
+This mode accepts the following additional options:
+
+  -o OUTPUT-FILE    set the output file name to OUTPUT-FILE
+  -prefer-pic       try to building PIC objects only
+  -prefer-non-pic   try to building non-PIC objects only
+  -static           always build a \`.o' file suitable for static linking
+
+COMPILE-COMMAND is a command to be used in creating a \`standard' object file
+from the given SOURCEFILE.
+
+The output file name is determined by removing the directory component from
+SOURCEFILE, then substituting the C source code suffix \`.c' with the
+library object suffix, \`.lo'."
+  ;;
+
+execute)
+  $echo \
+"Usage: $modename [OPTION]... --mode=execute COMMAND [ARGS]...
+
+Automatically set library path, then run a program.
+
+This mode accepts the following additional options:
+
+  -dlopen FILE      add the directory containing FILE to the library path
+
+This mode sets the library path environment variable according to \`-dlopen'
+flags.
+
+If any of the ARGS are libtool executable wrappers, then they are translated
+into their corresponding uninstalled binary, and any of their required library
+directories are added to the library path.
+
+Then, COMMAND is executed, with ARGS as arguments."
+  ;;
+
+finish)
+  $echo \
+"Usage: $modename [OPTION]... --mode=finish [LIBDIR]...
+
+Complete the installation of libtool libraries.
+
+Each LIBDIR is a directory that contains libtool libraries.
+
+The commands that this mode executes may require superuser privileges.  Use
+the \`--dry-run' option if you just want to see what would be executed."
+  ;;
+
+install)
+  $echo \
+"Usage: $modename [OPTION]... --mode=install INSTALL-COMMAND...
+
+Install executables or libraries.
+
+INSTALL-COMMAND is the installation command.  The first component should be
+either the \`install' or \`cp' program.
+
+The rest of the components are interpreted as arguments to that command (only
+BSD-compatible install options are recognized)."
+  ;;
+
+link)
+  $echo \
+"Usage: $modename [OPTION]... --mode=link LINK-COMMAND...
+
+Link object files or libraries together to form another library, or to
+create an executable program.
+
+LINK-COMMAND is a command using the C compiler that you would use to create
+a program from several object files.
+
+The following components of LINK-COMMAND are treated specially:
+
+  -all-static       do not do any dynamic linking at all
+  -avoid-version    do not add a version suffix if possible
+  -dlopen FILE      \`-dlpreopen' FILE if it cannot be dlopened at runtime
+  -dlpreopen FILE   link in FILE and add its symbols to lt_preloaded_symbols
+  -export-dynamic   allow symbols from OUTPUT-FILE to be resolved with dlsym(3)
+  -export-symbols SYMFILE
+		    try to export only the symbols listed in SYMFILE
+  -export-symbols-regex REGEX
+		    try to export only the symbols matching REGEX
+  -LLIBDIR          search LIBDIR for required installed libraries
+  -lNAME            OUTPUT-FILE requires the installed library libNAME
+  -module           build a library that can dlopened
+  -no-fast-install  disable the fast-install mode
+  -no-install       link a not-installable executable
+  -no-undefined     declare that a library does not refer to external symbols
+  -o OUTPUT-FILE    create OUTPUT-FILE from the specified objects
+  -release RELEASE  specify package release information
+  -rpath LIBDIR     the created library will eventually be installed in LIBDIR
+  -R[ ]LIBDIR       add LIBDIR to the runtime path of programs and libraries
+  -static           do not do any dynamic linking of libtool libraries
+  -version-info CURRENT[:REVISION[:AGE]]
+		    specify library version info [each variable defaults to 0]
+
+All other options (arguments beginning with \`-') are ignored.
+
+Every other argument is treated as a filename.  Files ending in \`.la' are
+treated as uninstalled libtool libraries, other files are standard or library
+object files.
+
+If the OUTPUT-FILE ends in \`.la', then a libtool library is created,
+only library objects (\`.lo' files) may be specified, and \`-rpath' is
+required, except when creating a convenience library.
+
+If OUTPUT-FILE ends in \`.a' or \`.lib', then a standard library is created
+using \`ar' and \`ranlib', or on Windows using \`lib'.
+
+If OUTPUT-FILE ends in \`.lo' or \`.${objext}', then a reloadable object file
+is created, otherwise an executable program is created."
+  ;;
+
+uninstall)
+  $echo \
+"Usage: $modename [OPTION]... --mode=uninstall RM [RM-OPTION]... FILE...
+
+Remove libraries from an installation directory.
+
+RM is the name of the program to use to delete files associated with each FILE
+(typically \`/bin/rm').  RM-OPTIONS are options (such as \`-f') to be passed
+to RM.
+
+If FILE is a libtool library, all the files associated with it are deleted.
+Otherwise, only FILE itself is deleted using RM."
+  ;;
+
+*)
+  $echo "$modename: invalid operation mode \`$mode'" 1>&2
+  $echo "$help" 1>&2
+  exit 1
+  ;;
+esac
+
+echo
+$echo "Try \`$modename --help' for more information about other modes."
+
+exit 0
+
+# Local Variables:
+# mode:shell-script
+# sh-indentation:2
+# End:
diff -Naur gd-2.0.1/missing gd-2.0.1.patched/missing
--- gd-2.0.1/missing	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/missing	Tue Jul 30 05:29:52 2002
@@ -0,0 +1,188 @@
+#! /bin/sh
+# Common stub for a few missing GNU programs while installing.
+# Copyright (C) 1996, 1997 Free Software Foundation, Inc.
+# Franc,ois Pinard <pinard@iro.umontreal.ca>, 1996.
+
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2, or (at your option)
+# any later version.
+
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
+# 02111-1307, USA.
+
+if test $# -eq 0; then
+  echo 1>&2 "Try \`$0 --help' for more information"
+  exit 1
+fi
+
+case "$1" in
+
+  -h|--h|--he|--hel|--help)
+    echo "\
+$0 [OPTION]... PROGRAM [ARGUMENT]...
+
+Handle \`PROGRAM [ARGUMENT]...' for when PROGRAM is missing, or return an
+error status if there is no known handling for PROGRAM.
+
+Options:
+  -h, --help      display this help and exit
+  -v, --version   output version information and exit
+
+Supported PROGRAM values:
+  aclocal      touch file \`aclocal.m4'
+  autoconf     touch file \`configure'
+  autoheader   touch file \`config.h.in'
+  automake     touch all \`Makefile.in' files
+  bison        create \`y.tab.[ch]', if possible, from existing .[ch]
+  flex         create \`lex.yy.c', if possible, from existing .c
+  lex          create \`lex.yy.c', if possible, from existing .c
+  makeinfo     touch the output file
+  yacc         create \`y.tab.[ch]', if possible, from existing .[ch]"
+    ;;
+
+  -v|--v|--ve|--ver|--vers|--versi|--versio|--version)
+    echo "missing - GNU libit 0.0"
+    ;;
+
+  -*)
+    echo 1>&2 "$0: Unknown \`$1' option"
+    echo 1>&2 "Try \`$0 --help' for more information"
+    exit 1
+    ;;
+
+  aclocal)
+    echo 1>&2 "\
+WARNING: \`$1' is missing on your system.  You should only need it if
+         you modified \`acinclude.m4' or \`configure.in'.  You might want
+         to install the \`Automake' and \`Perl' packages.  Grab them from
+         any GNU archive site."
+    touch aclocal.m4
+    ;;
+
+  autoconf)
+    echo 1>&2 "\
+WARNING: \`$1' is missing on your system.  You should only need it if
+         you modified \`configure.in'.  You might want to install the
+         \`Autoconf' and \`GNU m4' packages.  Grab them from any GNU
+         archive site."
+    touch configure
+    ;;
+
+  autoheader)
+    echo 1>&2 "\
+WARNING: \`$1' is missing on your system.  You should only need it if
+         you modified \`acconfig.h' or \`configure.in'.  You might want
+         to install the \`Autoconf' and \`GNU m4' packages.  Grab them
+         from any GNU archive site."
+    files=`sed -n 's/^[ ]*A[CM]_CONFIG_HEADER([^):]*:\([^)]*\)).*/\1/p' configure.in`
+    if test -z "$files"; then
+      files=`sed -n 's/^[ ]*A[CM]_CONFIG_HEADER(\([^):]*\)).*/\1/p' configure.in`
+      test -z "$files" || files="$files.in"
+    else
+      files=`echo "$files" | sed -e 's/:/ /g'`
+    fi
+    test -z "$files" && files="config.h.in"
+    touch $files
+    ;;
+
+  automake)
+    echo 1>&2 "\
+WARNING: \`$1' is missing on your system.  You should only need it if
+         you modified \`Makefile.am', \`acinclude.m4' or \`configure.in'.
+         You might want to install the \`Automake' and \`Perl' packages.
+         Grab them from any GNU archive site."
+    find . -type f -name Makefile.am -print \
+      | sed 's/^\(.*\).am$/touch \1.in/' \
+      | sh
+    ;;
+
+  bison|yacc)
+    echo 1>&2 "\
+WARNING: \`$1' is missing on your system.  You should only need it if
+         you modified a \`.y' file.  You may need the \`Bison' package
+         in order for those modifications to take effect.  You can get
+         \`Bison' from any GNU archive site."
+    rm -f y.tab.c y.tab.h
+    if [ $# -ne 1 ]; then
+        eval LASTARG="\${$#}"
+	case "$LASTARG" in
+	*.y)
+	    SRCFILE=`echo "$LASTARG" | sed 's/y$/c/'`
+	    if [ -f "$SRCFILE" ]; then
+	         cp "$SRCFILE" y.tab.c
+	    fi
+	    SRCFILE=`echo "$LASTARG" | sed 's/y$/h/'`
+	    if [ -f "$SRCFILE" ]; then
+	         cp "$SRCFILE" y.tab.h
+	    fi
+	  ;;
+	esac
+    fi
+    if [ ! -f y.tab.h ]; then
+	echo >y.tab.h
+    fi
+    if [ ! -f y.tab.c ]; then
+	echo 'main() { return 0; }' >y.tab.c
+    fi
+    ;;
+
+  lex|flex)
+    echo 1>&2 "\
+WARNING: \`$1' is missing on your system.  You should only need it if
+         you modified a \`.l' file.  You may need the \`Flex' package
+         in order for those modifications to take effect.  You can get
+         \`Flex' from any GNU archive site."
+    rm -f lex.yy.c
+    if [ $# -ne 1 ]; then
+        eval LASTARG="\${$#}"
+	case "$LASTARG" in
+	*.l)
+	    SRCFILE=`echo "$LASTARG" | sed 's/l$/c/'`
+	    if [ -f "$SRCFILE" ]; then
+	         cp "$SRCFILE" lex.yy.c
+	    fi
+	  ;;
+	esac
+    fi
+    if [ ! -f lex.yy.c ]; then
+	echo 'main() { return 0; }' >lex.yy.c
+    fi
+    ;;
+
+  makeinfo)
+    echo 1>&2 "\
+WARNING: \`$1' is missing on your system.  You should only need it if
+         you modified a \`.texi' or \`.texinfo' file, or any other file
+         indirectly affecting the aspect of the manual.  The spurious
+         call might also be the consequence of using a buggy \`make' (AIX,
+         DU, IRIX).  You might want to install the \`Texinfo' package or
+         the \`GNU make' package.  Grab either from any GNU archive site."
+    file=`echo "$*" | sed -n 's/.*-o \([^ ]*\).*/\1/p'`
+    if test -z "$file"; then
+      file=`echo "$*" | sed 's/.* \([^ ]*\) *$/\1/'`
+      file=`sed -n '/^@setfilename/ { s/.* \([^ ]*\) *$/\1/; p; q; }' $file`
+    fi
+    touch $file
+    ;;
+
+  *)
+    echo 1>&2 "\
+WARNING: \`$1' is needed, and you do not seem to have it handy on your
+         system.  You might have modified some files without having the
+         proper tools for further handling them.  Check the \`README' file,
+         it often tells you about the needed prerequirements for installing
+         this package.  You may also peek at any GNU archive site, in case
+         some other package would contain this missing \`$1' program."
+    exit 1
+    ;;
+esac
+
+exit 0
diff -Naur gd-2.0.1/mkinstalldirs gd-2.0.1.patched/mkinstalldirs
--- gd-2.0.1/mkinstalldirs	Wed Dec 31 19:00:00 1969
+++ gd-2.0.1.patched/mkinstalldirs	Tue Jul 30 05:38:47 2002
@@ -0,0 +1,40 @@
+#! /bin/sh
+# mkinstalldirs --- make directory hierarchy
+# Author: Noah Friedman <friedman@prep.ai.mit.edu>
+# Created: 1993-05-16
+# Public domain
+
+# $Id: patch_gd.pl,v 1.6 2002/08/06 20:42:52 lstein Exp $
+
+errstatus=0
+
+for file
+do
+   set fnord `echo ":$file" | sed -ne 's/^:\//#/;s/^://;s/\// /g;s/^#/\//;p'`
+   shift
+
+   pathcomp=
+   for d
+   do
+     pathcomp="$pathcomp$d"
+     case "$pathcomp" in
+       -* ) pathcomp=./$pathcomp ;;
+     esac
+
+     if test ! -d "$pathcomp"; then
+        echo "mkdir $pathcomp" 1>&2
+
+        mkdir "$pathcomp" || lasterr=$?
+
+        if test ! -d "$pathcomp"; then
+  	  errstatus=$lasterr
+        fi
+     fi
+
+     pathcomp="$pathcomp/"
+   done
+done
+
+exit $errstatus
+
+# mkinstalldirs ends here
END_OF_PATCH

close PATCH or die "patch failed with status $?\n";
  
chmod 0755,'./configure';
chmod 0755,'./config.guess';
chmod 0755,'./missing';
chmod 0755,'./install-sh';
warn "\nAll done.  Read INSTALL and then run the `configure' script.\n";

