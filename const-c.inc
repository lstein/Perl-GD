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

/* This allows slightly more efficient code on !USE_ITHREADS: */
#ifdef USE_ITHREADS
#  define COP_FILE(c)	CopFILE(c)
#  define COP_FILE_F	"s"
#else
#  define COP_FILE(c)	CopFILESV(c)
#  define COP_FILE_F	SVf
#endif

static void
constant_add_symbol(pTHX_  HV *hash, const char *name, I32 namelen, SV *value) {
    if (namelen == namelen) {
	newCONSTSUB(hash, (char *)name, value);
    }
}



#ifndef SYMBIAN

/* Store a hash of all symbols missing from the package. To avoid trampling on
   the package namespace (uninvited) put each package's hash in our namespace.
   To avoid creating lots of typeblogs and symbol tables for sub-packages, put
   each package's hash into one hash in our namespace.  */

static HV *
get_missing_hash(pTHX) {
    HV *const parent
	= get_hv("ExtUtils::Constant::ProxySubs::Missing", GVf_MULTI);
    /* We could make a hash of hashes directly, but this would confuse anything
	at Perl space that looks at us, and as we're visible in Perl space,
	best to play nice. */
    SV *const *const ref
	= hv_fetch(parent, "GD", 2, TRUE);
    HV *new_hv;

    if (!ref)
	return NULL;

    if (SvROK(*ref))
	return (HV*) SvRV(*ref);

    new_hv = newHV();
    SvUPGRADE(*ref, SVt_RV);
    SvRV_set(*ref, (SV *)new_hv);
    SvROK_on(*ref);
    return new_hv;
}

#endif

struct notfound_s {const char *name; I32 namelen;} ;

    static const struct notfound_s values_for_notfound[] =
      {
#ifndef GD_CMP_IMAGE
        { "GD_CMP_IMAGE", 12 },
#endif
#ifndef GD_CMP_NUM_COLORS
        { "GD_CMP_NUM_COLORS", 17 },
#endif
#ifndef GD_CMP_COLOR
        { "GD_CMP_COLOR", 12 },
#endif
#ifndef GD_CMP_SIZE_X
        { "GD_CMP_SIZE_X", 13 },
#endif
#ifndef GD_CMP_SIZE_Y
        { "GD_CMP_SIZE_Y", 13 },
#endif
#ifndef GD_CMP_TRANSPARENT
        { "GD_CMP_TRANSPARENT", 18 },
#endif
#ifndef GD_CMP_BACKGROUND
        { "GD_CMP_BACKGROUND", 17 },
#endif
#ifndef GD_CMP_INTERLACE
        { "GD_CMP_INTERLACE", 16 },
#endif
#ifndef GD_CMP_TRUECOLOR
        { "GD_CMP_TRUECOLOR", 16 },
#endif
#ifndef GD_PIXELATE_UPPERLEFT
        { "GD_PIXELATE_UPPERLEFT", 21 },
#endif
#ifndef GD_PIXELATE_AVERAGE
        { "GD_PIXELATE_AVERAGE", 19 },
#endif
#ifndef gdBrushed
        { "gdBrushed", 9 },
#endif
#ifndef gdDashSize
        { "gdDashSize", 10 },
#endif
#ifndef gdMaxColors
        { "gdMaxColors", 11 },
#endif
#ifndef gdStyled
        { "gdStyled", 8 },
#endif
#ifndef gdStyledBrushed
        { "gdStyledBrushed", 15 },
#endif
#ifndef gdTiled
        { "gdTiled", 7 },
#endif
#ifndef gdTransparent
        { "gdTransparent", 13 },
#endif
#ifndef gdAntiAliased
        { "gdAntiAliased", 13 },
#endif
#ifndef gdArc
        { "gdArc", 5 },
#endif
#ifndef gdPie
        { "gdPie", 5 },
#endif
#ifndef gdChord
        { "gdChord", 7 },
#endif
#ifndef gdNoFill
        { "gdNoFill", 8 },
#endif
#ifndef gdEdged
        { "gdEdged", 7 },
#endif
#ifndef gdEffectReplace
        { "gdEffectReplace", 15 },
#endif
#ifndef gdEffectAlphaBlend
        { "gdEffectAlphaBlend", 18 },
#endif
#ifndef gdEffectNormal
        { "gdEffectNormal", 14 },
#endif
#ifndef gdEffectOverlay
        { "gdEffectOverlay", 15 },
#endif
#ifndef gdEffectMultiply
        { "gdEffectMultiply", 16 },
#endif
#ifndef gdAlphaMax
        { "gdAlphaMax", 10 },
#endif
#ifndef gdAlphaOpaque
        { "gdAlphaOpaque", 13 },
#endif
#ifndef gdAlphaTransparent
        { "gdAlphaTransparent", 18 },
#endif
#ifndef gdRedMax
        { "gdRedMax", 8 },
#endif
#ifndef gdGreenMax
        { "gdGreenMax", 10 },
#endif
#ifndef gdBlueMax
        { "gdBlueMax", 9 },
#endif
#ifndef GD_MAJOR_VERSION
        { "GD_MAJOR_VERSION", 16 },
#endif
#ifndef GD_MINOR_VERSION
        { "GD_MINOR_VERSION", 16 },
#endif
#ifndef GD_RELEASE_VERSION
        { "GD_RELEASE_VERSION", 18 },
#endif
#ifndef GD_FLIP_HORINZONTAL
        { "GD_FLIP_HORINZONTAL", 19 },
#endif
#ifndef GD_FLIP_VERTICAL
        { "GD_FLIP_VERTICAL", 16 },
#endif
#ifndef GD_FLIP_BOTH
        { "GD_FLIP_BOTH", 12 },
#endif
#ifndef GD_RESOLUTION
        { "GD_RESOLUTION", 13 },
#endif
#ifndef GD_DEFAULT
        { "GD_DEFAULT", 10 },
#endif
#ifndef GD_BELL
        { "GD_BELL", 7 },
#endif
#ifndef GD_BESSEL
        { "GD_BESSEL", 9 },
#endif
#ifndef GD_BILINEAR_FIXED
        { "GD_BILINEAR_FIXED", 17 },
#endif
#ifndef GD_BICUBIC
        { "GD_BICUBIC", 10 },
#endif
#ifndef GD_BICUBIC_FIXED
        { "GD_BICUBIC_FIXED", 16 },
#endif
#ifndef GD_BLACKMAN
        { "GD_BLACKMAN", 11 },
#endif
#ifndef GD_BOX
        { "GD_BOX", 6 },
#endif
#ifndef GD_BSPLINE
        { "GD_BSPLINE", 10 },
#endif
#ifndef GD_CATMULLROM
        { "GD_CATMULLROM", 13 },
#endif
#ifndef GD_GAUSSIAN
        { "GD_GAUSSIAN", 11 },
#endif
#ifndef GD_GENERALIZED_CUBIC
        { "GD_GENERALIZED_CUBIC", 20 },
#endif
#ifndef GD_HERMITE
        { "GD_HERMITE", 10 },
#endif
#ifndef GD_HAMMING
        { "GD_HAMMING", 10 },
#endif
#ifndef GD_HANNING
        { "GD_HANNING", 10 },
#endif
#ifndef GD_MITCHELL
        { "GD_MITCHELL", 11 },
#endif
#ifndef GD_NEAREST_NEIGHBOUR
        { "GD_NEAREST_NEIGHBOUR", 20 },
#endif
#ifndef GD_POWER
        { "GD_POWER", 8 },
#endif
#ifndef GD_QUADRATIC
        { "GD_QUADRATIC", 12 },
#endif
#ifndef GD_SINC
        { "GD_SINC", 7 },
#endif
#ifndef GD_TRIANGLE
        { "GD_TRIANGLE", 11 },
#endif
#ifndef GD_WEIGHTED4
        { "GD_WEIGHTED4", 12 },
#endif
#ifndef GD_LINEAR
        { "GD_LINEAR", 9 },
#endif
#ifndef GD_METHOD_COUNT
        { "GD_METHOD_COUNT", 15 },
#endif
#ifndef GD_AFFINE_TRANSLATE
        { "GD_AFFINE_TRANSLATE", 19 },
#endif
#ifndef GD_AFFINE_SCALE
        { "GD_AFFINE_SCALE", 15 },
#endif
#ifndef GD_AFFINE_ROTATE
        { "GD_AFFINE_ROTATE", 16 },
#endif
#ifndef GD_AFFINE_SHEAR_HORIZONTAL
        { "GD_AFFINE_SHEAR_HORIZONTAL", 26 },
#endif
#ifndef GD_AFFINE_SHEAR_VERTICAL
        { "GD_AFFINE_SHEAR_VERTICAL", 24 },
#endif
        { NULL, 0 } };
struct iv_s {const char *name; I32 namelen; IV value;};
