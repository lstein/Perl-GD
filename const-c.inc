#define PERL_constant_NOTFOUND	1
#define PERL_constant_NOTDEF	2
#define PERL_constant_ISIV	3
#define PERL_constant_ISNO	4
#define PERL_constant_ISNV	5
#define PERL_constant_ISPV	6
#define PERL_constant_ISPVN	7
#define PERL_constant_ISSV	8
#define PERL_constant_ISUNDEF	9
#define PERL_constant_ISUV	10
#define PERL_constant_ISYES	11

#ifndef NVTYPE
typedef double NV; /* 5.6 and later define NVTYPE, and typedef NV to it.  */
#endif
#ifndef aTHX_
#define aTHX_ /* 5.6 or later define this for threading support.  */
#endif
#ifndef pTHX_
#define pTHX_ /* 5.6 or later define this for threading support.  */
#endif

static int
constant_7 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     GD_BELL GD_SINC gdChord gdEdged gdTiled */
  /* Offset 3 gives the best switch position.  */
  switch (name[3]) {
  case 'B':
    if (memEQ(name, "GD_BELL", 7)) {
    /*                  ^         */
#ifdef GD_BELL
      *iv_return = GD_BELL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'S':
    if (memEQ(name, "GD_SINC", 7)) {
    /*                  ^         */
#ifdef GD_SINC
      *iv_return = GD_SINC;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'd':
    if (memEQ(name, "gdEdged", 7)) {
    /*                  ^         */
#ifdef gdEdged
      *iv_return = gdEdged;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'h':
    if (memEQ(name, "gdChord", 7)) {
    /*                  ^         */
#ifdef gdChord
      *iv_return = gdChord;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'i':
    if (memEQ(name, "gdTiled", 7)) {
    /*                  ^         */
#ifdef gdTiled
      *iv_return = gdTiled;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_8 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     GD_POWER gdNoFill gdRedMax gdStyled */
  /* Offset 2 gives the best switch position.  */
  switch (name[2]) {
  case 'N':
    if (memEQ(name, "gdNoFill", 8)) {
    /*                 ^           */
#ifdef gdNoFill
      *iv_return = gdNoFill;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'R':
    if (memEQ(name, "gdRedMax", 8)) {
    /*                 ^           */
#ifdef gdRedMax
      *iv_return = gdRedMax;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'S':
    if (memEQ(name, "gdStyled", 8)) {
    /*                 ^           */
#ifdef gdStyled
      *iv_return = gdStyled;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case '_':
    if (memEQ(name, "GD_POWER", 8)) {
    /*                 ^           */
#ifdef GD_POWER
      *iv_return = GD_POWER;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_9 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     GD_BESSEL GD_LINEAR gdBlueMax gdBrushed */
  /* Offset 6 gives the best switch position.  */
  switch (name[6]) {
  case 'E':
    if (memEQ(name, "GD_LINEAR", 9)) {
    /*                     ^        */
#ifdef GD_LINEAR
      *iv_return = GD_LINEAR;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'M':
    if (memEQ(name, "gdBlueMax", 9)) {
    /*                     ^        */
#ifdef gdBlueMax
      *iv_return = gdBlueMax;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'S':
    if (memEQ(name, "GD_BESSEL", 9)) {
    /*                     ^        */
#ifdef GD_BESSEL
      *iv_return = GD_BESSEL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'h':
    if (memEQ(name, "gdBrushed", 9)) {
    /*                     ^        */
#ifdef gdBrushed
      *iv_return = gdBrushed;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_10 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     GD_BICUBIC GD_BSPLINE GD_DEFAULT GD_HAMMING GD_HANNING GD_HERMITE
     gdAlphaMax gdDashSize gdGreenMax */
  /* Offset 5 gives the best switch position.  */
  switch (name[5]) {
  case 'C':
    if (memEQ(name, "GD_BICUBIC", 10)) {
    /*                    ^           */
#ifdef GD_BICUBIC
      *iv_return = GD_BICUBIC;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'F':
    if (memEQ(name, "GD_DEFAULT", 10)) {
    /*                    ^           */
#ifdef GD_DEFAULT
      *iv_return = GD_DEFAULT;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'M':
    if (memEQ(name, "GD_HAMMING", 10)) {
    /*                    ^           */
#ifdef GD_HAMMING
      *iv_return = GD_HAMMING;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'N':
    if (memEQ(name, "GD_HANNING", 10)) {
    /*                    ^           */
#ifdef GD_HANNING
      *iv_return = GD_HANNING;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'P':
    if (memEQ(name, "GD_BSPLINE", 10)) {
    /*                    ^           */
#ifdef GD_BSPLINE
      *iv_return = GD_BSPLINE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'R':
    if (memEQ(name, "GD_HERMITE", 10)) {
    /*                    ^           */
#ifdef GD_HERMITE
      *iv_return = GD_HERMITE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'e':
    if (memEQ(name, "gdGreenMax", 10)) {
    /*                    ^           */
#ifdef gdGreenMax
      *iv_return = gdGreenMax;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'h':
    if (memEQ(name, "gdAlphaMax", 10)) {
    /*                    ^           */
#ifdef gdAlphaMax
      *iv_return = gdAlphaMax;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "gdDashSize", 10)) {
    /*                    ^           */
#ifdef gdDashSize
      *iv_return = gdDashSize;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_11 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     GD_BLACKMAN GD_GAUSSIAN GD_MITCHELL GD_TRIANGLE gdMaxColors */
  /* Offset 5 gives the best switch position.  */
  switch (name[5]) {
  case 'A':
    if (memEQ(name, "GD_BLACKMAN", 11)) {
    /*                    ^            */
#ifdef GD_BLACKMAN
      *iv_return = GD_BLACKMAN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'C':
    if (memEQ(name, "gdMaxColors", 11)) {
    /*                    ^            */
#ifdef gdMaxColors
      *iv_return = gdMaxColors;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'I':
    if (memEQ(name, "GD_TRIANGLE", 11)) {
    /*                    ^            */
#ifdef GD_TRIANGLE
      *iv_return = GD_TRIANGLE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'T':
    if (memEQ(name, "GD_MITCHELL", 11)) {
    /*                    ^            */
#ifdef GD_MITCHELL
      *iv_return = GD_MITCHELL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'U':
    if (memEQ(name, "GD_GAUSSIAN", 11)) {
    /*                    ^            */
#ifdef GD_GAUSSIAN
      *iv_return = GD_GAUSSIAN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_12 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     GD_CMP_COLOR GD_CMP_IMAGE GD_FLIP_BOTH GD_QUADRATIC GD_WEIGHTED4 */
  /* Offset 10 gives the best switch position.  */
  switch (name[10]) {
  case 'D':
    if (memEQ(name, "GD_WEIGHTED4", 12)) {
    /*                         ^        */
#ifdef GD_WEIGHTED4
      *iv_return = GD_WEIGHTED4;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'G':
    if (memEQ(name, "GD_CMP_IMAGE", 12)) {
    /*                         ^        */
#ifdef GD_CMP_IMAGE
      *iv_return = GD_CMP_IMAGE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'I':
    if (memEQ(name, "GD_QUADRATIC", 12)) {
    /*                         ^        */
#ifdef GD_QUADRATIC
      *iv_return = GD_QUADRATIC;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'O':
    if (memEQ(name, "GD_CMP_COLOR", 12)) {
    /*                         ^        */
#ifdef GD_CMP_COLOR
      *iv_return = GD_CMP_COLOR;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'T':
    if (memEQ(name, "GD_FLIP_BOTH", 12)) {
    /*                         ^        */
#ifdef GD_FLIP_BOTH
      *iv_return = GD_FLIP_BOTH;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_13 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     GD_CATMULLROM GD_CMP_SIZE_X GD_CMP_SIZE_Y GD_RESOLUTION gdAlphaOpaque
     gdAntiAliased gdTransparent */
  /* Offset 12 gives the best switch position.  */
  switch (name[12]) {
  case 'M':
    if (memEQ(name, "GD_CATMULLRO", 12)) {
    /*                           M      */
#ifdef GD_CATMULLROM
      *iv_return = GD_CATMULLROM;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'N':
    if (memEQ(name, "GD_RESOLUTIO", 12)) {
    /*                           N      */
#ifdef GD_RESOLUTION
      *iv_return = GD_RESOLUTION;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'X':
    if (memEQ(name, "GD_CMP_SIZE_", 12)) {
    /*                           X      */
#ifdef GD_CMP_SIZE_X
      *iv_return = GD_CMP_SIZE_X;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'Y':
    if (memEQ(name, "GD_CMP_SIZE_", 12)) {
    /*                           Y      */
#ifdef GD_CMP_SIZE_Y
      *iv_return = GD_CMP_SIZE_Y;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'd':
    if (memEQ(name, "gdAntiAliase", 12)) {
    /*                           d      */
#ifdef gdAntiAliased
      *iv_return = gdAntiAliased;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'e':
    if (memEQ(name, "gdAlphaOpaqu", 12)) {
    /*                           e      */
#ifdef gdAlphaOpaque
      *iv_return = gdAlphaOpaque;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 't':
    if (memEQ(name, "gdTransparen", 12)) {
    /*                           t      */
#ifdef gdTransparent
      *iv_return = gdTransparent;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_15 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     GD_AFFINE_SCALE GD_METHOD_COUNT gdEffectOverlay gdEffectReplace
     gdStyledBrushed */
  /* Offset 8 gives the best switch position.  */
  switch (name[8]) {
  case 'B':
    if (memEQ(name, "gdStyledBrushed", 15)) {
    /*                       ^             */
#ifdef gdStyledBrushed
      *iv_return = gdStyledBrushed;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'D':
    if (memEQ(name, "GD_METHOD_COUNT", 15)) {
    /*                       ^             */
#ifdef GD_METHOD_COUNT
      *iv_return = GD_METHOD_COUNT;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'E':
    if (memEQ(name, "GD_AFFINE_SCALE", 15)) {
    /*                       ^             */
#ifdef GD_AFFINE_SCALE
      *iv_return = GD_AFFINE_SCALE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'O':
    if (memEQ(name, "gdEffectOverlay", 15)) {
    /*                       ^             */
#ifdef gdEffectOverlay
      *iv_return = gdEffectOverlay;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'R':
    if (memEQ(name, "gdEffectReplace", 15)) {
    /*                       ^             */
#ifdef gdEffectReplace
      *iv_return = gdEffectReplace;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_16 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     GD_AFFINE_ROTATE GD_BICUBIC_FIXED GD_CMP_INTERLACE GD_CMP_TRUECOLOR
     GD_FLIP_VERTICAL GD_MAJOR_VERSION GD_MINOR_VERSION gdEffectMultiply */
  /* Offset 8 gives the best switch position.  */
  switch (name[8]) {
  case 'E':
    if (memEQ(name, "GD_AFFINE_ROTATE", 16)) {
    /*                       ^              */
#ifdef GD_AFFINE_ROTATE
      *iv_return = GD_AFFINE_ROTATE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'I':
    if (memEQ(name, "GD_BICUBIC_FIXED", 16)) {
    /*                       ^              */
#ifdef GD_BICUBIC_FIXED
      *iv_return = GD_BICUBIC_FIXED;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'M':
    if (memEQ(name, "gdEffectMultiply", 16)) {
    /*                       ^              */
#ifdef gdEffectMultiply
      *iv_return = gdEffectMultiply;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'N':
    if (memEQ(name, "GD_CMP_INTERLACE", 16)) {
    /*                       ^              */
#ifdef GD_CMP_INTERLACE
      *iv_return = GD_CMP_INTERLACE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'R':
    if (memEQ(name, "GD_CMP_TRUECOLOR", 16)) {
    /*                       ^              */
#ifdef GD_CMP_TRUECOLOR
      *iv_return = GD_CMP_TRUECOLOR;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'V':
    if (memEQ(name, "GD_FLIP_VERTICAL", 16)) {
    /*                       ^              */
#ifdef GD_FLIP_VERTICAL
      *iv_return = GD_FLIP_VERTICAL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case '_':
    if (memEQ(name, "GD_MAJOR_VERSION", 16)) {
    /*                       ^              */
#ifdef GD_MAJOR_VERSION
      *iv_return = GD_MAJOR_VERSION;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "GD_MINOR_VERSION", 16)) {
    /*                       ^              */
#ifdef GD_MINOR_VERSION
      *iv_return = GD_MINOR_VERSION;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_17 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     GD_BILINEAR_FIXED GD_CMP_BACKGROUND GD_CMP_NUM_COLORS */
  /* Offset 13 gives the best switch position.  */
  switch (name[13]) {
  case 'I':
    if (memEQ(name, "GD_BILINEAR_FIXED", 17)) {
    /*                            ^          */
#ifdef GD_BILINEAR_FIXED
      *iv_return = GD_BILINEAR_FIXED;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'L':
    if (memEQ(name, "GD_CMP_NUM_COLORS", 17)) {
    /*                            ^          */
#ifdef GD_CMP_NUM_COLORS
      *iv_return = GD_CMP_NUM_COLORS;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'O':
    if (memEQ(name, "GD_CMP_BACKGROUND", 17)) {
    /*                            ^          */
#ifdef GD_CMP_BACKGROUND
      *iv_return = GD_CMP_BACKGROUND;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_18 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     GD_CMP_TRANSPARENT GD_RELEASE_VERSION gdAlphaTransparent
     gdEffectAlphaBlend */
  /* Offset 5 gives the best switch position.  */
  switch (name[5]) {
  case 'L':
    if (memEQ(name, "GD_RELEASE_VERSION", 18)) {
    /*                    ^                   */
#ifdef GD_RELEASE_VERSION
      *iv_return = GD_RELEASE_VERSION;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'P':
    if (memEQ(name, "GD_CMP_TRANSPARENT", 18)) {
    /*                    ^                   */
#ifdef GD_CMP_TRANSPARENT
      *iv_return = GD_CMP_TRANSPARENT;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'e':
    if (memEQ(name, "gdEffectAlphaBlend", 18)) {
    /*                    ^                   */
#ifdef gdEffectAlphaBlend
      *iv_return = gdEffectAlphaBlend;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'h':
    if (memEQ(name, "gdAlphaTransparent", 18)) {
    /*                    ^                   */
#ifdef gdAlphaTransparent
      *iv_return = gdAlphaTransparent;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_19 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     GD_AFFINE_TRANSLATE GD_FLIP_HORINZONTAL GD_PIXELATE_AVERAGE */
  /* Offset 4 gives the best switch position.  */
  switch (name[4]) {
  case 'F':
    if (memEQ(name, "GD_AFFINE_TRANSLATE", 19)) {
    /*                   ^                     */
#ifdef GD_AFFINE_TRANSLATE
      *iv_return = GD_AFFINE_TRANSLATE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'I':
    if (memEQ(name, "GD_PIXELATE_AVERAGE", 19)) {
    /*                   ^                     */
#ifdef GD_PIXELATE_AVERAGE
      *iv_return = GD_PIXELATE_AVERAGE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'L':
    if (memEQ(name, "GD_FLIP_HORINZONTAL", 19)) {
    /*                   ^                     */
#ifdef GD_FLIP_HORINZONTAL
      *iv_return = GD_FLIP_HORINZONTAL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant (pTHX_ const char *name, STRLEN len, IV *iv_return) {
  /* Initially switch on the length of the name.  */
  /* When generated this function returned values for the list of names given
     in this section of perl code.  Rather than manually editing these functions
     to add or remove constants, which would result in this comment and section
     of code becoming inaccurate, we recommend that you edit this section of
     code, and use it to regenerate a new set of constant functions which you
     then use to replace the originals.

     Regenerate these constant functions by feeding this entire source file to
     perl -x

#!/usr/local/bin/perl5.24.1d-nt -w
use ExtUtils::Constant qw (constant_types C_constant XS_constant);

my $types = {map {($_, 1)} qw(IV)};
my @names = (qw(GD_AFFINE_ROTATE GD_AFFINE_SCALE GD_AFFINE_SHEAR_HORIZONTAL
	       GD_AFFINE_SHEAR_VERTICAL GD_AFFINE_TRANSLATE GD_BELL GD_BESSEL
	       GD_BICUBIC GD_BICUBIC_FIXED GD_BILINEAR_FIXED GD_BLACKMAN GD_BOX
	       GD_BSPLINE GD_CATMULLROM GD_CMP_BACKGROUND GD_CMP_COLOR
	       GD_CMP_IMAGE GD_CMP_INTERLACE GD_CMP_NUM_COLORS GD_CMP_SIZE_X
	       GD_CMP_SIZE_Y GD_CMP_TRANSPARENT GD_CMP_TRUECOLOR GD_DEFAULT
	       GD_FLIP_BOTH GD_FLIP_HORINZONTAL GD_FLIP_VERTICAL GD_GAUSSIAN
	       GD_GENERALIZED_CUBIC GD_HAMMING GD_HANNING GD_HERMITE GD_LINEAR
	       GD_MAJOR_VERSION GD_METHOD_COUNT GD_MINOR_VERSION GD_MITCHELL
	       GD_NEAREST_NEIGHBOUR GD_PIXELATE_AVERAGE GD_PIXELATE_UPPERLEFT
	       GD_POWER GD_QUADRATIC GD_RELEASE_VERSION GD_RESOLUTION GD_SINC
	       GD_TRIANGLE GD_WEIGHTED4 gdAlphaMax gdAlphaOpaque
	       gdAlphaTransparent gdAntiAliased gdArc gdBlueMax gdBrushed
	       gdChord gdDashSize gdEdged gdEffectAlphaBlend gdEffectMultiply
	       gdEffectNormal gdEffectOverlay gdEffectReplace gdGreenMax
	       gdMaxColors gdNoFill gdPie gdRedMax gdStyled gdStyledBrushed
	       gdTiled gdTransparent));

print constant_types(), "\n"; # macro defs
foreach (C_constant ("GD", 'constant', 'IV', $types, undef, 3, @names) ) {
    print $_, "\n"; # C constant subs
}
print "\n#### XS Section:\n";
print XS_constant ("GD", $types);
__END__
   */

  switch (len) {
  case 5:
    /* Names all of length 5.  */
    /* gdArc gdPie */
    /* Offset 4 gives the best switch position.  */
    switch (name[4]) {
    case 'c':
      if (memEQ(name, "gdAr", 4)) {
      /*                   c     */
#ifdef gdArc
        *iv_return = gdArc;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    case 'e':
      if (memEQ(name, "gdPi", 4)) {
      /*                   e     */
#ifdef gdPie
        *iv_return = gdPie;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    }
    break;
  case 6:
    if (memEQ(name, "GD_BOX", 6)) {
#ifdef GD_BOX
      *iv_return = GD_BOX;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 7:
    return constant_7 (aTHX_ name, iv_return);
    break;
  case 8:
    return constant_8 (aTHX_ name, iv_return);
    break;
  case 9:
    return constant_9 (aTHX_ name, iv_return);
    break;
  case 10:
    return constant_10 (aTHX_ name, iv_return);
    break;
  case 11:
    return constant_11 (aTHX_ name, iv_return);
    break;
  case 12:
    return constant_12 (aTHX_ name, iv_return);
    break;
  case 13:
    return constant_13 (aTHX_ name, iv_return);
    break;
  case 14:
    if (memEQ(name, "gdEffectNormal", 14)) {
#ifdef gdEffectNormal
      *iv_return = gdEffectNormal;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 15:
    return constant_15 (aTHX_ name, iv_return);
    break;
  case 16:
    return constant_16 (aTHX_ name, iv_return);
    break;
  case 17:
    return constant_17 (aTHX_ name, iv_return);
    break;
  case 18:
    return constant_18 (aTHX_ name, iv_return);
    break;
  case 19:
    return constant_19 (aTHX_ name, iv_return);
    break;
  case 20:
    /* Names all of length 20.  */
    /* GD_GENERALIZED_CUBIC GD_NEAREST_NEIGHBOUR */
    /* Offset 13 gives the best switch position.  */
    switch (name[13]) {
    case 'D':
      if (memEQ(name, "GD_GENERALIZED_CUBIC", 20)) {
      /*                            ^             */
#ifdef GD_GENERALIZED_CUBIC
        *iv_return = GD_GENERALIZED_CUBIC;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    case 'I':
      if (memEQ(name, "GD_NEAREST_NEIGHBOUR", 20)) {
      /*                            ^             */
#ifdef GD_NEAREST_NEIGHBOUR
        *iv_return = GD_NEAREST_NEIGHBOUR;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    }
    break;
  case 21:
    if (memEQ(name, "GD_PIXELATE_UPPERLEFT", 21)) {
#ifdef GD_PIXELATE_UPPERLEFT
      *iv_return = GD_PIXELATE_UPPERLEFT;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 24:
    if (memEQ(name, "GD_AFFINE_SHEAR_VERTICAL", 24)) {
#ifdef GD_AFFINE_SHEAR_VERTICAL
      *iv_return = GD_AFFINE_SHEAR_VERTICAL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 26:
    if (memEQ(name, "GD_AFFINE_SHEAR_HORIZONTAL", 26)) {
#ifdef GD_AFFINE_SHEAR_HORIZONTAL
      *iv_return = GD_AFFINE_SHEAR_HORIZONTAL;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

