#ifdef PERL_CAPI
#define WIN32IO_IS_STDIO
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <gd.h>
#include <gdfontg.h>
#include <gdfontl.h>
#include <gdfontmb.h>
#include <gdfonts.h>
#include <gdfontt.h>
#include <errno.h>

#ifdef FCGI
 #include <fcgi_stdio.h>
#else
 #ifdef USE_SFIO
  #include <config.h>
 #else
  #include <stdio.h>
 #endif
 #include <perlio.h>
#endif
/* Copyright 1995 - 1998, Lincoln D. Stein.  See accompanying README file for
	usage restrictions */

#ifndef PERL_REVISION
#   ifndef __PATCHLEVEL_H_INCLUDED__
#       include "patchlevel.h"
#   endif
#   ifndef PERL_REVISION
#       define PERL_REVISION    (5)
        /* Replace: 1 */
#       define PERL_VERSION     PATCHLEVEL
#       define PERL_SUBVERSION  SUBVERSION
        /* Replace PERL_PATCHLEVEL with PERL_VERSION */
        /* Replace: 0 */
#   endif
#endif

#if (PERL_VERSION == 5) && (PERL_SUBVERSION==3)
#ifndef PL_na
# define PL_na na
#endif

#ifndef SvPV_nolen
# define SvPV_nolen(sv) SvPV(sv, PL_na)
#endif
#endif /* 5.00503 */

#ifdef WIN32
#define snprintf _snprintf
#endif

#ifndef START_MY_CXT
static truecolor_default = 0;
#endif

static int
not_here(char *s)
{
    croak("%s not implemented on this architecture", s);
    return -1;
}

static double
constant(char *name)
{
    errno = 0;
    switch (*name) {
    case 'A':
	break;
    case 'B':
	break;
    case 'C':
	break;
    case 'D':
	break;
    case 'E':
	break;
    case 'F':
	break;
    case 'G':
	if (strEQ(name, "GD_CMP_IMAGE"))
#ifdef GD_CMP_IMAGE
	  return GD_CMP_IMAGE;
#else
	    goto not_there;
#endif
	if (strEQ(name, "GD_CMP_NUM_COLORS"))
#ifdef GD_CMP_NUM_COLORS
	  return GD_CMP_NUM_COLORS;
#else
	goto not_there;
#endif
	if (strEQ(name, "GD_CMP_COLOR"))
#ifdef GD_CMP_COLOR
	  return GD_CMP_COLOR;
#else
	goto not_there;
#endif
	if (strEQ(name, "GD_CMP_SIZE_X"))
#ifdef GD_CMP_SIZE_X
	  return GD_CMP_SIZE_X;
#else
	goto not_there;
#endif
	if (strEQ(name, "GD_CMP_SIZE_Y"))
#ifdef GD_CMP_SIZE_Y
	  return GD_CMP_SIZE_Y;
#else
	goto not_there;
#endif
	if (strEQ(name, "GD_CMP_TRANSPARENT"))
#ifdef GD_CMP_TRANSPARENT
	  return GD_CMP_TRANSPARENT;
#else
	goto not_there;
#endif
	if (strEQ(name, "GD_CMP_BACKGROUND"))
#ifdef GD_CMP_BACKGROUND
	  return GD_CMP_BACKGROUND;
#else
	goto not_there;
#endif
	if (strEQ(name, "GD_CMP_INTERLACE"))
#ifdef GD_CMP_INTERLACE
	  return GD_CMP_INTERLACE;
#else
	goto not_there;
#endif
	if (strEQ(name, "GD_CMP_TRUECOLOR"))
#ifdef GD_CMP_TRUECOLOR
	  return GD_CMP_TRUECOLOR;
#else
	goto not_there;
#endif
	break;
    case 'H':
	break;
    case 'I':
	break;
    case 'J':
	break;
    case 'K':
	break;
    case 'L':
	break;
    case 'M':
	break;
    case 'N':
	break;
    case 'O':
	break;
    case 'P':
	break;
    case 'Q':
	break;
    case 'R':
	break;
    case 'S':
	break;
    case 'T':
	break;
    case 'U':
	break;
    case 'V':
	break;
    case 'W':
	break;
    case 'X':
	break;
    case 'Y':
	break;
    case 'Z':
	break;
    case 'a':
	break;
    case 'b':
	break;
    case 'c':
	break;
    case 'd':
	break;
    case 'e':
	break;
    case 'f':
	break;
    case 'g':
	if (strEQ(name, "gdBrushed"))
#ifdef gdBrushed
	    return gdBrushed;
#else
	    goto not_there;
#endif
	if (strEQ(name, "gdDashSize"))
#ifdef gdDashSize
	    return gdDashSize;
#else
	    goto not_there;
#endif
	if (strEQ(name, "gdMaxColors"))
#ifdef gdMaxColors
	    return gdMaxColors;
#else
	    goto not_there;
#endif
	if (strEQ(name, "gdStyled"))
#ifdef gdStyled
	    return gdStyled;
#else
	    goto not_there;
#endif
	if (strEQ(name, "gdStyledBrushed"))
#ifdef gdStyledBrushed
	    return gdStyledBrushed;
#else
	    goto not_there;
#endif
	if (strEQ(name, "gdTiled"))
#ifdef gdTiled
	    return gdTiled;
#else
	    goto not_there;
#endif
	if (strEQ(name, "gdTransparent"))
#ifdef gdTransparent
	    return gdTransparent;
#else
	    goto not_there;
#endif
        if (strEQ(name,"gdAntiAliased"))
#ifdef gdAntiAliased
	    return gdAntiAliased;
#else
	    goto not_there;
#endif
        if (strEQ(name,"gdAntiAliased"))
#ifdef gdAntiAliased
	    return gdAntiAliased;
#else
	    goto not_there;
#endif
        if (strEQ(name,"gdArc"))
#ifdef gdArc
	  return gdArc;
#else
	    goto not_there;
#endif
        if (strEQ(name,"gdPie"))
#ifdef gdPie
	  return gdPie;
#else
	    goto not_there;
#endif
        if (strEQ(name,"gdChord"))
#ifdef gdChord
	  return gdChord;
#else
	    goto not_there;
#endif
        if (strEQ(name,"gdNoFill"))
#ifdef gdNoFill
	  return gdNoFill;
#else
	    goto not_there;
#endif
        if (strEQ(name,"gdEdged"))
#ifdef gdEdged
	  return gdEdged;
#else
	    goto not_there;
#endif
		if (strEQ(name,"gdAlphaMax"))
#ifdef gdAlphaMax
		return gdAlphaMax;
#else
		goto not_there;
#endif
		if (strEQ(name,"gdAlphaOpaque"))
#ifdef gdAlphaOpaque
		return gdAlphaOpaque;
#else
		goto not_there;
#endif
		if (strEQ(name,"gdAlphaTransparent"))
#ifdef gdAlphaTransparent
		return gdAlphaTransparent;
#else
		goto not_there;
#endif

	break;
    case 'h':
	break;
    case 'i':
	break;
    case 'j':
	break;
    case 'k':
	break;
    case 'l':
	break;
    case 'm':
	break;
    case 'n':
	break;
    case 'o':
	break;
    case 'p':
	break;
    case 'q':
	break;
    case 'r':
	break;
    case 's':
	break;
    case 't':
	break;
    case 'u':
	break;
    case 'v':
	break;
    case 'w':
	break;
    case 'x':
	break;
    case 'y':
	break;
    case 'z':
	break;
    }
    errno = EINVAL;
    return 0;

not_there:
    errno = ENOENT;
    return 0;
}

typedef gdImagePtr	GD__Image;
typedef gdFontPtr	GD__Font;
typedef PerlIO          * InputStream;

#ifdef PERL_OBJECT
#  ifdef WIN32
#define GDIMAGECREATEFROMPNG(x)  gdImageCreateFromPng((FILE*)x)
#define GDIMAGECREATEFROMXBM(x)  gdImageCreateFromXbm((FILE*)x)
#define GDIMAGECREATEFROMJPEG(x) gdImageCreateFromJpeg((FILE*)x)
#define GDIMAGECREATEFROMGIF(x)  gdImageCreateFromGif((FILE*)x)
#define GDIMAGECREATEFROMWBMP(x) gdImageCreateFromWBMP((FILE*)x)
#define GDIMAGECREATEFROMGD(x)   gdImageCreateFromGd((FILE*)x)
#define GDIMAGECREATEFROMGD2(x)  gdImageCreateFromGd2((FILE*)x)
#define GDIMAGECREATEFROMGD2PART(x,a,b,c,d) gdImageCreateFromGd2Part((FILE*)x,a,b,c,d)
#  endif
#else
#  ifdef USE_PERLIO
#define GDIMAGECREATEFROMPNG(x) gdImageCreateFromPng(PerlIO_findFILE(x))
#define GDIMAGECREATEFROMXBM(x) gdImageCreateFromXbm(PerlIO_findFILE(x))
#define GDIMAGECREATEFROMJPEG(x) gdImageCreateFromJpeg(PerlIO_findFILE(x))
#define GDIMAGECREATEFROMGIF(x)  gdImageCreateFromGif(PerlIO_findFILE(x))
#define GDIMAGECREATEFROMWBMP(x) gdImageCreateFromWBMP(PerlIO_findFILE(x))
#define GDIMAGECREATEFROMGD(x) gdImageCreateFromGd(PerlIO_findFILE(x))
#define GDIMAGECREATEFROMGD2(x) gdImageCreateFromGd2(PerlIO_findFILE(x))
#define GDIMAGECREATEFROMGD2PART(x,a,b,c,d) gdImageCreateFromGd2Part(PerlIO_findFILE(x),a,b,c,d)
#  else
#define GDIMAGECREATEFROMPNG(x) gdImageCreateFromPng(x)
#define GDIMAGECREATEFROMXBM(x) gdImageCreateFromXbm(x)
#define GDIMAGECREATEFROMJPEG(x) gdImageCreateFromJpeg(x)
#define GDIMAGECREATEFROMGIF(x) gdImageCreateFromGif(x)
#define GDIMAGECREATEFROMWBMP(x) gdImageCreateFromWBMP(x)
#define GDIMAGECREATEFROMGD(x) gdImageCreateFromGd(x)
#define GDIMAGECREATEFROMGD2(x) gdImageCreateFromGd2(x)
#define GDIMAGECREATEFROMGD2PART(x,a,b,c,d) gdImageCreateFromGd2Part(x,a,b,c,d)
#  endif
#endif

#define littleendian(a) \
    (a[3]<<24)+(a[2]<<16)+(a[1]<<8)+a[0]

/* definitions required to create images from in-memory buffers */
		     
typedef struct bufIOCtx {
  gdIOCtx    ctx;
  char*      data;
  int        length;
  int        pos;
} bufIOCtx;

typedef struct bufIOCtx *bufIOCtxPtr;

static int bufGetC (gdIOCtxPtr ctx) {
  bufIOCtxPtr bctx = (bufIOCtxPtr) ctx;

  if (bctx->pos >= bctx->length) return EOF;
  return bctx->data[bctx->pos];
}

static int bufGetBuf (gdIOCtxPtr ctx, void* buf, int len) {
  bufIOCtxPtr bctx = (bufIOCtxPtr) ctx;
  int remain,rlen;

  remain = bctx->length - bctx->pos;
  if (remain >= len) {
    rlen = len;
  } else {
    if (remain <= 0) return EOF;
    rlen = remain;
  }
  memcpy(buf,(void*)(bctx->data + bctx->pos),rlen);
  bctx->pos += rlen;
  return rlen;
}

static int bufSeek (gdIOCtxPtr ctx, const int pos) {
  bufIOCtxPtr bctx = (bufIOCtxPtr) ctx;
  bctx->pos = pos;
  if (bctx->pos > bctx->length)
    bctx->pos = bctx->length;
  return TRUE;
}

static long bufTell (gdIOCtxPtr ctx) {
  bufIOCtxPtr bctx = (bufIOCtxPtr) ctx;
  return bctx->pos;
}

static void bufFree(gdIOCtxPtr ctx) {
  Safefree(ctx);
}

static gdIOCtx* newDynamicCtx (char* data, int length) {
  bufIOCtxPtr   ctx;
  
#ifdef Newz
  Newz(0,ctx,1,bufIOCtx);
#else
  Newxz(ctx,1,bufIOCtx);
#endif
  if (ctx == NULL) return NULL;
  ctx->data   = data;
  ctx->pos    = 0;
  ctx->length = length;

  ctx->ctx.getC   = bufGetC;
  ctx->ctx.getBuf = bufGetBuf;
  ctx->ctx.seek   = bufSeek;
  ctx->ctx.tell   = bufTell;
  ctx->ctx.gd_free = bufFree;
  ctx->ctx.putC   = NULL;
  ctx->ctx.putBuf = NULL;
  return (gdIOCtx*)ctx;
}

/* helper routines for image transformation */
static GD__Image
gd_cloneDim(GD__Image src, int x, int y) {
  GD__Image dst;
  if (gdImageTrueColor(src)) {
     dst = (GD__Image) gdImageCreateTrueColor(x,y);
  } else {
     int i;
     dst = (GD__Image) gdImageCreatePalette(x,y);
     /* copy across the palette information */
     for (i = 0; i < gdMaxColors; i++) {
	dst->red[i]   = src->red[i];
	dst->green[i] = src->green[i];
	dst->blue[i]  = src->blue[i];
	dst->alpha[i] = src->alpha[i];
	dst->open[i]  = src->open[i];
     }
     dst->colorsTotal = src->colorsTotal;
     dst->transparent = src->transparent;
     dst->interlace   = src->interlace;
     dst->thick       = src->thick;
  }
  return(dst);
}

void
get_xformbounds(GD__Image src, int *x, int *y,
			int *x1, int *y1, int *x2, int *y2)
{
   *x  = gdImageSX(src);
   *y  = gdImageSY(src);
   *x1 = *x - 1;
   *y1 = *y - 1;
   *x2 = *x / 2;
   *y2 = *y / 2;
}

/* helper macros for image transformations */
#define GDGetImagePixel(im,x,y) \
	gdImageTrueColor(im) ? \
	gdImageTrueColorPixel(im,x,y) : \
	gdImagePalettePixel(im,x,y)

#define GDSetImagePixel(im,x,y,p) \
	gdImageTrueColor(im) ? \
	(gdImageTrueColorPixel(im,x,y) = p) : \
	(gdImagePalettePixel(im,x,y) = p)

#define GDCopyImagePixel(dst,dx,dy,src,sx,sy) \
	gdImageTrueColor(src) ? \
	(gdImageTrueColorPixel(dst,dx,dy)=gdImageTrueColorPixel(src,sx,sy)) : \
	(gdImagePalettePixel(dst,dx,dy)=gdImagePalettePixel(src,sx,sy))

/* Check the image format being returned */
void
gd_chkimagefmt(GD__Image image, int truecolor) {
  if ((image != NULL)
      && !truecolor) {			/* return a palette image */
     if (gdImageTrueColor(image)) {
	gdImageTrueColorToPalette(image,1,gdMaxColors);
     }
  }
}

/* GLOBAL THREAD-SAFE DATA */

#ifdef START_MY_CXT

#define MY_CXT_KEY "GD::_guts" XS_VERSION
typedef struct {
  /* Current image true color default
   *  0 - create palette based images by default
   *  1 - create true color images by default
   */
  int truecolor_default;
} my_cxt_t;

START_MY_CXT
#endif

MODULE = GD		PACKAGE = GD

double
constant(name)
	char *		name

BOOT:
{
#ifdef START_MY_CXT
   MY_CXT_INIT;
   MY_CXT.truecolor_default = 0;
#endif
}

MODULE = GD		PACKAGE = GD::Image	PREFIX=gd

# Set the new image true color default
#   0 - create palette based images by default
#   1 - create true color images by default
int
gdtrueColor(packname="GD::Image", ...)
	char *	packname
	PROTOTYPE: $$
        PREINIT:
#ifdef START_MY_CXT
        dMY_CXT;
        int previous_value = MY_CXT.truecolor_default;
#else
        int previous_value = truecolor_default;
#endif
	CODE:
	{
          if (items > 1)
#ifdef START_MY_CXT
	    MY_CXT.truecolor_default = (int)SvIV(ST(1));
#else
            truecolor_default = (int)SvIV(ST(1));
#endif
          RETVAL = previous_value;
	}
        OUTPUT:
	  RETVAL

GD::Image
gd_new(packname="GD::Image", x=64, y=64, ...)
	char *	packname
	int	x
	int	y
        PROTOTYPE: $;$$$
        PREINIT:
#ifdef START_MY_CXT
        dMY_CXT;
	int truecolor = MY_CXT.truecolor_default;
#else
        int truecolor = truecolor_default;
#endif
	CODE:
	{
		gdImagePtr theImage;
                if (items > 3)
		  truecolor = (int)SvIV(ST(3));
		if (truecolor) {
		   theImage = (GD__Image) gdImageCreateTrueColor(x,y);
		} else {
		   theImage = (GD__Image) gdImageCreate(x,y);
		}
		RETVAL = theImage;
	}
	OUTPUT:
		RETVAL

#ifdef HAVE_PNG
GD::Image
gd_newFromPng(packname="GD::Image", filehandle, ...)
	char *	packname
	InputStream	filehandle
	PROTOTYPE: $$;$
        PREINIT:
#ifdef START_MY_CXT
        dMY_CXT;
	int truecolor = MY_CXT.truecolor_default;
#else
        int truecolor = truecolor_default;
#endif
	CODE:
	RETVAL = (GD__Image) GDIMAGECREATEFROMPNG(filehandle);
        if (items > 2) truecolor = (int)SvIV(ST(2));
	gd_chkimagefmt(RETVAL, truecolor);
	OUTPUT:
	RETVAL

GD::Image
gdnewFromPngData(packname="GD::Image", imageData, ...)
	char *	packname
	SV *	imageData
	PROTOTYPE: $$;$
        PREINIT:
	  gdIOCtx* ctx;
          char*    data;
          STRLEN   len;
#ifdef START_MY_CXT
	  dMY_CXT;
	  int truecolor = MY_CXT.truecolor_default;
#else
          int truecolor = truecolor_default;
#endif
	CODE:
	data = SvPV(imageData,len);
        ctx = newDynamicCtx(data,len);
	RETVAL = (GD__Image) gdImageCreateFromPngCtx(ctx);
        (ctx->gd_free)(ctx);
        if (items > 2) truecolor = (int)SvIV(ST(2));
	gd_chkimagefmt(RETVAL, truecolor);
	OUTPUT:
	RETVAL

#endif

GD::Image
gdnewFromGdData(packname="GD::Image", imageData)
	char *	packname
	SV *	imageData
	PROTOTYPE: $$
        PREINIT:
          char*    data;
          STRLEN   len;
	CODE:
	data = SvPV(imageData,len);
	RETVAL = (GD__Image) gdImageCreateFromGdPtr(len,(void*) data);
	OUTPUT:
	RETVAL

GD::Image
gdnewFromGd2Data(packname="GD::Image", imageData)
	char *	packname
	SV *	imageData
	PROTOTYPE: $$
        PREINIT:
          char*    data;
          STRLEN   len;
	CODE:
	data = SvPV(imageData,len);
	RETVAL = (GD__Image) gdImageCreateFromGd2Ptr(len,(void*) data);
	OUTPUT:
	RETVAL

#ifdef HAVE_JPEG
GD::Image
gdnewFromJpegData(packname="GD::Image", imageData, ...)
	char *	packname
	SV *    imageData
	PROTOTYPE: $$;$
        PREINIT:
	  gdIOCtx* ctx;
          char*    data;
          STRLEN   len;
#ifdef START_MY_CXT
	  dMY_CXT;
          int     truecolor = MY_CXT.truecolor_default;
#else
          int     truecolor = truecolor_default;
#endif
	CODE:
	  data = SvPV(imageData,len);
          ctx = newDynamicCtx(data,len);
          RETVAL = (GD__Image) gdImageCreateFromJpegCtx(ctx);
          (ctx->gd_free)(ctx);
          if (items > 2) truecolor = (int)SvIV(ST(2));
	  gd_chkimagefmt(RETVAL, truecolor);
	OUTPUT:
	  RETVAL

#endif

GD::Image
gdnewFromWBMPData(packname="GD::Image", imageData, ...)
	char *	packname
	SV *    imageData
	PROTOTYPE: $$;$
        PREINIT:
	  gdIOCtx* ctx;
          char*    data;
          STRLEN   len;
#ifdef START_MY_CXT
	  dMY_CXT;
          int     truecolor = MY_CXT.truecolor_default;
#else
          int     truecolor = truecolor_default;
#endif
	CODE:
	data = SvPV(imageData,len);
        ctx = newDynamicCtx(data,len);
	RETVAL = (GD__Image) gdImageCreateFromWBMPCtx(ctx);
        (ctx->gd_free)(ctx);
        if (items > 2) truecolor = (int)SvIV(ST(2));
	gd_chkimagefmt(RETVAL, truecolor);
	OUTPUT:
	RETVAL

GD::Image
gd_newFromXbm(packname="GD::Image", filehandle)
	char *	packname
	InputStream	filehandle
	PROTOTYPE: $$
	CODE:
	RETVAL = GDIMAGECREATEFROMXBM(filehandle);
	OUTPUT:
	RETVAL

GD::Image
gd_newFromGd(packname="GD::Image", filehandle)
	char *	packname
	InputStream	filehandle
	PROTOTYPE: $$
	CODE:
	RETVAL = GDIMAGECREATEFROMGD(filehandle);
	OUTPUT:
	RETVAL

GD::Image
gd_newFromGd2(packname="GD::Image", filehandle)
	char *	packname
	InputStream	filehandle
	PROTOTYPE: $$
	CODE:
	RETVAL = GDIMAGECREATEFROMGD2(filehandle);
	OUTPUT:
	RETVAL

#ifdef HAVE_JPEG
GD::Image
gd_newFromJpeg(packname="GD::Image", filehandle, ...)
	char *	packname
	InputStream	filehandle
	PROTOTYPE: $$;$
        PREINIT:
#ifdef START_MY_CXT
	  dMY_CXT;
          int     truecolor = MY_CXT.truecolor_default;
#else
          int     truecolor = truecolor_default;
#endif
	CODE:
	  RETVAL = GDIMAGECREATEFROMJPEG(filehandle);
          if (items > 2) truecolor = (int)SvIV(ST(2));
	  gd_chkimagefmt(RETVAL, truecolor);
	OUTPUT:
          RETVAL

#endif

GD::Image
gd_newFromWBMP(packname="GD::Image", filehandle)
	char *	packname
	InputStream	filehandle
	PROTOTYPE: $$
        PREINIT:
	  gdImagePtr img;
	  SV* errormsg;
	CODE:
	img = GDIMAGECREATEFROMWBMP(filehandle);
        if (img == NULL) {
          errormsg = perl_get_sv("@",0);
	  if (errormsg != NULL)
	    sv_setpv(errormsg,"libgd was not built with WBMP support\n");
	  XSRETURN_EMPTY;
        }
        RETVAL = img;
	OUTPUT:
        RETVAL

GD::Image
gdnewFromXpm(packname="GD::Image", filename)
	char *	packname
	char *	filename
	PROTOTYPE: $$
        PREINIT:
	  gdImagePtr img;
	  SV* errormsg;
	CODE:
#ifdef HAVE_XPM
        img = (GD__Image) gdImageCreateFromXpm(filename);
        if (img == NULL) {
            errormsg = perl_get_sv("@",0);
            if (errormsg != NULL)
              sv_setpv(errormsg,"libgd was not built with xpm support\n");
            XSRETURN_EMPTY;
        }
        RETVAL = img;
#else
        errormsg = perl_get_sv("@",0);
        sv_setpv(errormsg,"libgd was not built with xpm support\n");
        XSRETURN_EMPTY;
#endif
        OUTPUT:
        RETVAL

GD::Image
gd_newFromGd2Part(packname="GD::Image", filehandle,srcX,srcY,width,height)
	char *	packname
	InputStream	filehandle
	int	srcX
	int	srcY
	int	width
	int	height
	PROTOTYPE: $$$$$$
	CODE:
	RETVAL = GDIMAGECREATEFROMGD2PART(filehandle,srcX,srcY,width,height);
	OUTPUT:
	RETVAL

#ifdef HAVE_GIF
GD::Image
gd_newFromGif(packname="GD::Image", filehandle)
	char *	packname
	InputStream	filehandle
	PROTOTYPE: $$;$
        PREINIT:
#ifdef START_MY_CXT
	  dMY_CXT;
          int     truecolor = MY_CXT.truecolor_default;
#else
          int     truecolor = truecolor_default;
#endif
	CODE:
	  RETVAL = GDIMAGECREATEFROMGIF(filehandle);
	OUTPUT:
          RETVAL

GD::Image
gdnewFromGifData(packname="GD::Image", imageData)
	char *	packname
	SV *    imageData
	PROTOTYPE: $$;$
        PREINIT:
	  gdIOCtx* ctx;
          char*    data;
          STRLEN   len;
#ifdef START_MY_CXT
	  dMY_CXT;
          int     truecolor = MY_CXT.truecolor_default;
#else
          int     truecolor = truecolor_default;
#endif
	CODE:
	data = SvPV(imageData,len);
        ctx = newDynamicCtx(data,len);
	RETVAL = (GD__Image) gdImageCreateFromGifCtx(ctx);
        (ctx->gd_free)(ctx);
	OUTPUT:
	RETVAL

#endif

void
gdDESTROY(image)
	GD::Image	image
	PROTOTYPE: $
	CODE:
	{
  	  gdImageDestroy(image);
	}

SV* gdSTORABLE_freeze(image,cloning)
     GD::Image image
     int       cloning
     PROTOTYPE: $$
     CODE:
     {
       void*     data;
       int       size;

       if (cloning) XSRETURN_UNDEF;
       data = gdImageGd2Ptr(image,0,GD2_FMT_COMPRESSED,&size);
       RETVAL=newSVpvn((char*)data,size);
       gdFree(data);
     }
     OUTPUT:
       RETVAL

void gdSTORABLE_thaw(object,cloning,serialized)
     SV*      object
     int      cloning
     SV*      serialized
     PREINIT:
     STRLEN    length;
     void*     data;
     GD__Image image;
     CODE:
     {
       if (cloning) XSRETURN_UNDEF;
       data = (void*) SvPV(serialized,length);
       image = gdImageCreateFromGd2Ptr(length,data);
/*       sv_setiv(SvRV(object),(int)image); */
       sv_setiv(SvRV(object),(long int)image);
     }

#ifdef HAVE_PNG
SV*
gdpng(image, ...)
  GD::Image	image
  PROTOTYPE: $;$
  PREINIT:
  CODE:
  {
	void*         data;
	int           size;
	int           level;
        if (items > 1) {
	  level = (int)SvIV(ST(1));
	  data  = (void *) gdImagePngPtrEx(image,&size,level);
	} else {
	  data = (void *) gdImagePngPtr(image,&size);
	}
	RETVAL = newSVpvn((char*) data,size);
	gdFree(data);
  }
  OUTPUT:
    RETVAL

#endif

#ifdef HAVE_JPEG
SV*
gdjpeg(image,quality=-1)
  GD::Image	image
  int           quality
  PROTOTYPE: $
  PREINIT:
  SV* errormsg;
  CODE:
  {
	void*         data;
	int           size;
	data = (void *) gdImageJpegPtr(image,&size,quality);
        if (data == NULL) {
          errormsg = perl_get_sv("@",0);
	  if (errormsg != NULL)
	    sv_setpv(errormsg,"libgd was not built with jpeg support\n");
	  XSRETURN_EMPTY;
        }
	RETVAL = newSVpvn((char*) data,size);
	gdFree(data);
  }
  OUTPUT:
    RETVAL

#endif

SV*
gdgifanimbegin(image,globalcm=-1,loops=-1)
  GD::Image	image
  int           globalcm
  int           loops
  PROTOTYPE: $$$
  PREINIT:
  CODE:
  {
	void*         data;
	int           size;
#ifdef HAVE_ANIMGIF
	data = (void *) gdImageGifAnimBeginPtr(image,&size,globalcm,loops);
	RETVAL = newSVpvn((char*) data,size);
	gdFree(data);
#else
        die("libgd 2.0.33 or higher required for animated GIF support");
#endif
  }
  OUTPUT:
    RETVAL

SV*
gdgifanimadd(image,localcm=-1,leftofs=-1,topofs=-1,delay=-1,disposal=-1,previm=0)
  GD::Image	image
  int           localcm
  int           leftofs
  int           topofs
  int           delay
  int           disposal
  GD::Image	previm
  PROTOTYPE: $$$$$$$
  CODE:
  {
	void*         data;
	int           size;
#ifdef HAVE_ANIMGIF
	data = (void *) gdImageGifAnimAddPtr(image,&size,localcm,leftofs,topofs,delay,disposal,previm);
	RETVAL = newSVpvn((char*) data,size);
	gdFree(data);
#else
        die("libgd 2.0.33 or higher required for animated GIF support");
#endif
  }
  OUTPUT:
    RETVAL

SV*
gdgifanimend(image)
  GD::Image	image
  PROTOTYPE: $
  CODE:
  {
	void*         data;
	int           size;
#ifdef HAVE_ANIMGIF
	data = (void *) gdImageGifAnimEndPtr(&size);
	RETVAL = newSVpvn((char*) data,size);
	gdFree(data);
#else
        die("libgd 2.0.33 or higher required for animated GIF support");
#endif
  }
  OUTPUT:
    RETVAL

SV*
gdwbmp(image,fg)
  GD::Image	image
  int           fg
  PROTOTYPE: $
  PREINIT:
  SV* errormsg;
  CODE:
  {
	void*         data;
	int           size;
	data = (void *) gdImageWBMPPtr(image,&size,fg);
        if (data == NULL) {
          errormsg = perl_get_sv("@",0);
	  if (errormsg != NULL)
	    sv_setpv(errormsg,"libgd was not built with WBMP support\n");
	  XSRETURN_EMPTY;
        }
	RETVAL = newSVpvn((char*) data,size);
	gdFree(data);
  }
  OUTPUT:
    RETVAL

#ifdef HAVE_GIF
SV*
gdgif(image)
  GD::Image	image
  PROTOTYPE: $
  PREINIT:
  SV* errormsg;
  CODE:
  {
	void*         data;
	int           size;
	data = (void *) gdImageGifPtr(image,&size);
        if (data == NULL) {
          errormsg = perl_get_sv("@",0);
	  if (errormsg != NULL)
	    sv_setpv(errormsg,"libgd was not built with gif support\n");
	  XSRETURN_EMPTY;
        }
	RETVAL = newSVpvn((char*) data,size);
	gdFree(data);
  }
  OUTPUT:
    RETVAL

#endif

SV*
gdgd(image)
  GD::Image	image
  PROTOTYPE: $
  CODE:
  {
	void*         data;
	int           size;
	data = gdImageGdPtr(image,&size);
	RETVAL = newSVpvn((char*) data,size);
	gdFree(data);
  }
  OUTPUT:
    RETVAL

SV*
gdgd2(image)
  GD::Image	image
  PROTOTYPE: $
  CODE:
  {
	void*         data;
	int           size;
	data = gdImageGd2Ptr(image,0,GD2_FMT_COMPRESSED,&size);
	RETVAL = newSVpvn((char*) data,size);
	gdFree(data);
  }
  OUTPUT:
    RETVAL

int
gdtransparent(image, ...)
	GD::Image	image
        PROTOTYPE: $;$
	CODE:
	{
		int color;
		if (items > 1) {
			color=(int)SvIV(ST(1));
			gdImageColorTransparent(image,color);
		}
		RETVAL = gdImageGetTransparent(image);
	}
	OUTPUT:
		RETVAL

void
gdgetBounds(image)
	GD::Image	image
	PROTOTYPE: $
	PPCODE:
	{
		int sx,sy;
		sx = gdImageSX(image);
		sy = gdImageSY(image);
		EXTEND(sp,2);
		PUSHs(sv_2mortal(newSViv(sx)));
		PUSHs(sv_2mortal(newSViv(sy)));
	}

int
gdisTrueColor(image)
	GD::Image	image
	PROTOTYPE: $
	CODE:
	{
		RETVAL=gdImageTrueColor(image);
	}
	OUTPUT:
		RETVAL

void
gdtrueColorToPalette(image, dither=0, colors=gdMaxColors)
	GD::Image	image
	int		dither
	int		colors
        PROTOTYPE: $;$$
	CODE:
	{
		gdImageTrueColorToPalette(image,dither,colors);
	}

void
gdrgb(image,color)
	GD::Image	image
	int		color
        PROTOTYPE: $$
	PPCODE:
	{
		int r,g,b;
		r = gdImageRed(image,color);
		g = gdImageGreen(image,color);
		b = gdImageBlue(image,color);
		EXTEND(sp,3);
		PUSHs(sv_2mortal(newSViv(r)));
		PUSHs(sv_2mortal(newSViv(g)));
		PUSHs(sv_2mortal(newSViv(b)));
	}

int
gdboundsSafe(image,x,y)
	GD::Image	image
	int		x
	int		y
        PROTOTYPE: $$$
	CODE:
	{
	  RETVAL=gdImageBoundsSafe(image,x,y);
	  if (RETVAL == 0)
	    XSRETURN_UNDEF;
	}
	OUTPUT:
            RETVAL

int
gdgetPixel(image,x,y)
	GD::Image	image
	int		x
	int		y
	PROTOTYPE: $$$
	CODE:
	{
		RETVAL=gdImageGetPixel(image,x,y);
	}
	OUTPUT:
		RETVAL

void
gdsetPixel(image,x,y,color)
	GD::Image	image
	int		x
	int		y
	int		color
	PROTOTYPE: $$$$
	CODE:
	{
		gdImageSetPixel(image,x,y,color);
	}

GD::Image
gdcopyRotate90(src)
	GD::Image	src
	PROTOTYPE: $
	CODE:
	{
		int x, y, x1, y1, x2, y2, i, j;
		GD__Image dst;
		get_xformbounds(src, &x, &y, &x1, &y1, &x2, &y2);
		dst = (GD__Image) gd_cloneDim(src, y, x);

		for (j=0;j<y;j++) {
		   for (i=0;i<x;i++) {
		      GDCopyImagePixel(dst,y1-j,i,src,i,j);
		   }
		}
		RETVAL = dst;
	}
	OUTPUT:
		RETVAL

GD::Image
gdcopyRotate180(src)
	GD::Image	src
	PROTOTYPE: $
	CODE:
	{
		int x, y, x1, y1, x2, y2, i, j;
		GD__Image dst;
		get_xformbounds(src, &x, &y, &x1, &y1, &x2, &y2);
		dst = (GD__Image) gd_cloneDim(src, x, y);

		for (j=0;j<y;j++) {
		   for (i=0;i<x;i++) {
		      GDCopyImagePixel(dst,x1-i,y1-j,src,i,j);
		   }
		}
		RETVAL = dst;
	}
	OUTPUT:
		RETVAL

GD::Image
gdcopyRotate270(src)
	GD::Image	src
	PROTOTYPE: $
	CODE:
	{
		int x, y, x1, y1, x2, y2, i, j;
		GD__Image dst;
		get_xformbounds(src, &x, &y, &x1, &y1, &x2, &y2);
		dst = (GD__Image) gd_cloneDim(src, y, x);
		
		for (i=0;i<x;i++) {
		   for (j=0;j<y;j++) {
		      GDCopyImagePixel(dst,j,x1-i,src,i,j);
		   }
		}
		RETVAL = dst;
	}
	OUTPUT:
		RETVAL

GD::Image
gdcopyFlipHorizontal(src)
	GD::Image	src
	PROTOTYPE: $
	CODE:
	{
		int x, y, x1, y1, x2, y2, i, j;
		GD__Image dst;
		get_xformbounds(src, &x, &y, &x1, &y1, &x2, &y2);
		dst = (GD__Image) gd_cloneDim(src, x, y);

		for (j=0;j<y;j++) {
		   for (i=0;i<x;i++) {
		      GDCopyImagePixel(dst,x1-i,j,src,i,j);
		   }
		}
		RETVAL = dst;
	}
	OUTPUT:
		RETVAL

GD::Image
gdcopyFlipVertical(src)
	GD::Image	src
	PROTOTYPE: $
	CODE:
	{
		int x, y, x1, y1, x2, y2, i, j;
		GD__Image dst;
		get_xformbounds(src, &x, &y, &x1, &y1, &x2, &y2);
		dst = (GD__Image) gd_cloneDim(src, x, y);

		for (j=0;j<y;j++) {
		   for (i=0;i<x;i++) {
		      GDCopyImagePixel(dst,i,y1-j,src,i,j);
		   }
		}
		RETVAL = dst;
	}
	OUTPUT:
		RETVAL

GD::Image
gdcopyTranspose(src)
	GD::Image	src
	PROTOTYPE: $
	CODE:
	{
		int x, y, x1, y1, x2, y2, i, j;
		GD__Image dst;
		get_xformbounds(src, &x, &y, &x1, &y1, &x2, &y2);
		dst = (GD__Image) gd_cloneDim(src, y, x);

		for (j=0;j<y;j++) {
		   for (i=0;i<x;i++) {
		      GDCopyImagePixel(dst,j,i,src,i,j);
		   }
		}
		RETVAL = dst;
	}
	OUTPUT:
		RETVAL

GD::Image
gdcopyReverseTranspose(src)
	GD::Image	src
	PROTOTYPE: $
	CODE:
	{
		int x, y, x1, y1, x2, y2, i, j;
		GD__Image dst;
		get_xformbounds(src, &x, &y, &x1, &y1, &x2, &y2);
		dst = (GD__Image) gd_cloneDim(src, y, x);

		for (j=0;j<y;j++) {
		   for (i=0;i<x;i++) {
		      GDCopyImagePixel(dst,y1-j,x1-i,src,i,j);
		   }
		}
		RETVAL = dst;
	}
	OUTPUT:
		RETVAL

void
gdrotate180(src)
	GD::Image	src
	PROTOTYPE: $
	CODE:
	{
		int x, y, x1, y1, x2, y2, i, j, tmp;
		get_xformbounds(src, &x, &y, &x1, &y1, &x2, &y2);

		for (j=0;j<y2;j++) {
		   for (i=0;i<x;i++) {
		      tmp = GDGetImagePixel(src,x1-i,y1-j);
		      GDCopyImagePixel(src,x1-i,y1-j,src,i,j);
		      GDSetImagePixel(src,i,j,tmp);
		   }
		}
	}

void
gdcopyRotated(dst,src,dstX,dstY,srcX,srcY,srcW,srcH,angle)
        GD::Image       dst
	GD::Image	src
        double          dstX
        double          dstY
        int             srcX
        int             srcY
        int             srcW
        int             srcH
        int             angle
	PROTOTYPE: $$$$$$$$$
	CODE:
	{
#ifdef VERSION_33
        gdImageCopyRotated(dst,src,dstX,dstY,srcX,srcY,srcW,srcH,angle);
#else
        die("libgd 2.0.33 or higher required for copyRotated support");
#endif
	}

void
gdflipHorizontal(src)
	GD::Image	src
	PROTOTYPE: $
	CODE:
	{
		int x, y, x1, y1, x2, y2, i, j, tmp;
		get_xformbounds(src, &x, &y, &x1, &y1, &x2, &y2);

		for (j=0;j<y;j++) {
		   for (i=0;i<x2;i++) {
		      tmp = GDGetImagePixel(src,x1-i,j);
		      GDCopyImagePixel(src,x1-i,j,src,i,j);
		      GDSetImagePixel(src,i,j,tmp);
		   }
		}
	}

void
gdflipVertical(src)
	GD::Image	src
	PROTOTYPE: $
	CODE:
	{
		int x, y, x1, y1, x2, y2, i, j, tmp;
		get_xformbounds(src, &x, &y, &x1, &y1, &x2, &y2);

		for (j=0;j<y2;j++) {
		   for (i=0;i<x;i++) {
		      tmp = GDGetImagePixel(src,i,y1-j);
		      GDCopyImagePixel(src,i,y1-j,src,i,j);
		      GDSetImagePixel(src,i,j,tmp);
		   }
		}
	}

void
gdline(image,x1,y1,x2,y2,color)
	GD::Image	image
	int		x1
	int		y1
	int		x2
	int		y2
	int		color
        PROTOTYPE: $$$$$$
	CODE:
	{
		gdImageLine(image,x1,y1,x2,y2,color);
	}

void
gddashedLine(image,x1,y1,x2,y2,color)
	GD::Image	image
	int		x1
	int		y1
	int		x2
	int		y2
	int		color
        PROTOTYPE: $$$$$$
	CODE:
	{
		gdImageDashedLine(image,x1,y1,x2,y2,color);
	}

void
gdopenPolygon(image,poly,color)
	GD::Image	image
	SV *		poly
	int		color
        PROTOTYPE: $$$
	CODE:
	{
		dSP ;
		int length,count ;
		int x,y,i ;
		gdPointPtr polyptr;

		ENTER ;
		SAVETMPS ;
		PUSHMARK(sp) ;
		XPUSHs(poly) ;
		PUTBACK ;
		count = perl_call_method("length",G_SCALAR) ;
		SPAGAIN ;
		if (count != 1)
			croak("Didn't get a single result from GD::Poly::length() call.\n");
		length = POPi ;
		PUTBACK ;
		FREETMPS ;
		LEAVE ;

		polyptr = (gdPointPtr)safemalloc(sizeof(gdPoint)*length);
		if (polyptr == NULL)
			croak("safemalloc() returned NULL in GD::Image::poly().\n");
		
		for (i=0;i<length;i++) {
			ENTER ;
			SAVETMPS ;
			PUSHMARK(sp) ;
			XPUSHs(poly) ;
			XPUSHs(sv_2mortal(newSViv(i))) ;
			PUTBACK ;
			count = perl_call_method("getPt",G_ARRAY) ;
			SPAGAIN ;
			if (count != 2)
				croak("Didn't get a single result from GD::Poly::length() call.\n");
			y = POPi ;
			x = POPi ;
			PUTBACK ;
			FREETMPS ;
			LEAVE ;

			polyptr[i].x = x;
			polyptr[i].y = y;
		}

		gdImagePolygon(image,polyptr,length,color);
		safefree((char*) polyptr);
	}

void
gdunclosedPolygon(image,poly,color)
	GD::Image	image
	SV *		poly
	int		color
        PROTOTYPE: $$$
	CODE:
	{
		dSP ;
		int length,count ;
		int x,y,i ;
		gdPointPtr polyptr;
#ifdef HAVE_UNCLOSEDPOLY
		ENTER ;
		SAVETMPS ;
		PUSHMARK(sp) ;
		XPUSHs(poly) ;
		PUTBACK ;
		count = perl_call_method("length",G_SCALAR) ;
		SPAGAIN ;
		if (count != 1)
			croak("Didn't get a single result from GD::Poly::length() call.\n");
		length = POPi ;
		PUTBACK ;
		FREETMPS ;
		LEAVE ;

		polyptr = (gdPointPtr)safemalloc(sizeof(gdPoint)*length);
		if (polyptr == NULL)
			croak("safemalloc() returned NULL in GD::Image::poly().\n");
		
		for (i=0;i<length;i++) {
			ENTER ;
			SAVETMPS ;
			PUSHMARK(sp) ;
			XPUSHs(poly) ;
			XPUSHs(sv_2mortal(newSViv(i))) ;
			PUTBACK ;
			count = perl_call_method("getPt",G_ARRAY) ;
			SPAGAIN ;
			if (count != 2)
				croak("Didn't get a single result from GD::Poly::length() call.\n");
			y = POPi ;
			x = POPi ;
			PUTBACK ;
			FREETMPS ;
			LEAVE ;

			polyptr[i].x = x;
			polyptr[i].y = y;
		}

		gdImageOpenPolygon(image,polyptr,length,color);
		safefree((char*) polyptr);
#else
	die("libgd 2.0.33 or higher required for unclosed polygon support");
#endif
	}

void
gdfilledPolygon(image,poly,color)
	GD::Image	image
	SV *		poly
	int		color
        PROTOTYPE: $$$
	CODE:
	{
		dSP ;
		int length,count ;
		int x,y,i ;
		gdPointPtr polyptr;

		ENTER ;
		SAVETMPS ;
		PUSHMARK(sp) ;
		XPUSHs(poly) ;
		PUTBACK ;
		count = perl_call_method("length",G_SCALAR) ;
		SPAGAIN ;
		if (count != 1)
			croak("Didn't get a single result from GD::Poly::length() call.\n");
		length = POPi ;
		PUTBACK ;
		FREETMPS ;
		LEAVE ;

		polyptr = (gdPointPtr)safemalloc(sizeof(gdPoint)*length);
		if (polyptr == NULL)
			croak("safemalloc() returned NULL in GD::Image::poly().\n");
		
		for (i=0;i<length;i++) {
			ENTER ;
			SAVETMPS ;
			PUSHMARK(sp) ;
			XPUSHs(poly) ;
			XPUSHs(sv_2mortal(newSViv(i))) ;
			PUTBACK ;
			count = perl_call_method("getPt",G_ARRAY) ;
			SPAGAIN ;
			if (count != 2)
				croak("Didn't get a single result from GD::Poly::length() call.\n");
			y = POPi ;
			x = POPi ;
			PUTBACK ;
			FREETMPS ;
			LEAVE ;

			polyptr[i].x = x;
			polyptr[i].y = y;
		}

		gdImageFilledPolygon(image,polyptr,length,color);
		safefree((char*) polyptr);
	}

void
gdrectangle(image,x1,y1,x2,y2,color)
	GD::Image	image
	int		x1
	int		y1
	int		x2
	int		y2
	int		color
        PROTOTYPE: $$$$$$
	CODE:
	{
		gdImageRectangle(image,x1,y1,x2,y2,color);
	}

void
gdfilledRectangle(image,x1,y1,x2,y2,color)
	GD::Image	image
	int		x1
	int		y1
	int		x2
	int		y2
	int		color
        PROTOTYPE: $$$$$$
	CODE:
	{
		gdImageFilledRectangle(image,x1,y1,x2,y2,color);
	}

void
gdfilledEllipse(image,cx,cy,w,h,color)
	GD::Image	image
	int		cx
	int		cy
	int		w
	int		h
	int		color
        PROTOTYPE: $$$$$$
	CODE:
	{
		gdImageFilledEllipse(image,cx,cy,w,h,color);
	}

void
gdarc(image,cx,cy,w,h,s,e,color)
	GD::Image	image
	int		cx
	int		cy
	int		w
	int		h
	int		s
	int		e
	int		color
        PROTOTYPE: $$$$$$$$
	CODE:
	{
		gdImageArc(image,cx,cy,w,h,s,e,color);
	}

void
gdfilledArc(image,cx,cy,w,h,s,e,color,arc_style=0)
	GD::Image	image
	int		cx
	int		cy
	int		w
	int		h
	int		s
	int		e
	int		color
	int		arc_style
        PROTOTYPE: $$$$$$$$$
	CODE:
	{
		gdImageFilledArc(image,cx,cy,w,h,s,e,color,arc_style);
	}

void
fillToBorder(image,x,y,border,color)
	GD::Image	image
	int		x
	int		y
	int		border
	int		color
        PROTOTYPE: $$$$$
	CODE:
	{
		gdImageFillToBorder(image,x,y,border,color);
	}

void
fill(image,x,y,color)
	GD::Image	image
	int		x
	int		y
	int		color
        PROTOTYPE: $$$$
	CODE:
	{
		gdImageFill(image,x,y,color);
	}

void
setBrush(image,brush)
	GD::Image	image
	GD::Image	brush
        PROTOTYPE: $$
	CODE:
	{
		gdImageSetBrush(image,brush);
	}

void
setTile(image,tile)
	GD::Image	image
	GD::Image	tile
        PROTOTYPE: $$
	CODE:
	{
		gdImageSetTile(image,tile);
	}

void
setThickness(image,thickness)
	GD::Image	image
	int		thickness
        PROTOTYPE: $$
	CODE:
	{
	  gdImageSetThickness(image,thickness);
	}


void
setStyle(image, ...)
	GD::Image	image
        PROTOTYPE: $;$
	CODE:
	{
		int	*style;
		int	i;

		if (items < 2)
			return;
		style = (int*) safemalloc(sizeof(int)*(items-1));
		if (style == NULL)
			croak("malloc returned NULL at setStyle().\n");
		for(i=1;i<items;i++) {
			style[i-1]=(int)SvIV(ST(i));
		}
		gdImageSetStyle(image,style,items-1);
		safefree((char*) style);
	}

int
colorAllocate(image,r,g,b)
	GD::Image	image
	int		r
	int		g
	int		b
        PROTOTYPE: $$$$
	CODE:
	{
		RETVAL = gdImageColorAllocate(image,r,g,b);
	}
	OUTPUT:
		RETVAL

int
colorAllocateAlpha(image,r,g,b,a)
	GD::Image	image
	int		r
	int		g
	int		b
	int		a
		PROTOTYPE: $$$$
	CODE:
	{
		RETVAL = gdImageColorAllocateAlpha(image,r,g,b,a);
	}
	OUTPUT:
		RETVAL

int
colorClosest(image,r,g,b)
	GD::Image	image
	int		r
	int		g
	int		b
        PROTOTYPE: $$$$
	CODE:
	{
		RETVAL = gdImageColorClosest(image,r,g,b);
	}
	OUTPUT:
		RETVAL

int
colorClosestAlpha(image,r,g,b,a)
	GD::Image	image
	int		r
	int		g
	int		b
	int		a
		PROTOTYPE: $$$$
	CODE:
	{
		RETVAL = gdImageColorClosest(image,r,g,b);
	}
	OUTPUT:
		RETVAL

int
colorClosestHWB(image,r,g,b)
	GD::Image	image
	int		r
	int		g
	int		b
        PROTOTYPE: $$$$
	CODE:
	{
		RETVAL = gdImageColorClosestHWB(image,r,g,b);
	}
	OUTPUT:
		RETVAL

int
colorExact(image,r,g,b)
	GD::Image	image
	int		r
	int		g
	int		b
	PROTOTYPE: $$$$
	CODE:
	{
		RETVAL = gdImageColorExact(image,r,g,b);
	}
	OUTPUT:
		RETVAL

int
colorExactAlpha(image,r,g,b,a)
	GD::Image	image
	int		r
	int		g
	int		b
	int		a
	PROTOTYPE: $$$$
	CODE:
	{
		RETVAL = gdImageColorExactAlpha(image,r,g,b,a);
	}
	OUTPUT:
		RETVAL

int
colorResolve(image,r,g,b)
	GD::Image	image
	int		r
	int		g
	int		b
	PROTOTYPE: $$$$
	CODE:
	{
		RETVAL = gdImageColorResolve(image,r,g,b);
	}
	OUTPUT:
		RETVAL

int
colorResolveAlpha(image,r,g,b,a)
	GD::Image	image
	int		r
	int		g
	int		b
	int		a
	PROTOTYPE: $$$$
	CODE:
	{
		RETVAL = gdImageColorResolveAlpha(image,r,g,b,a);
	}
	OUTPUT:
		RETVAL

int
colorsTotal(image)
	GD::Image	image
	PROTOTYPE: $
	CODE:
	{
	   if (gdImageTrueColor(image))
 	     XSRETURN_UNDEF;
	   RETVAL = gdImageColorsTotal(image);
	}
	OUTPUT:
		RETVAL


int
interlaced(image, ...)
	GD::Image	image
	PROTOTYPE: $;$
	CODE:
	{
	  if (items > 1) {
	    if (SvOK(ST(1)))
	      gdImageInterlace(image,1);
	    else
	      gdImageInterlace(image,0);
	  }
	  RETVAL = gdImageGetInterlaced(image);
	}
        OUTPUT:
	  RETVAL

int
compare(image1,image2)
	GD::Image	image1
	GD::Image	image2
	PROTOTYPE: $$
	CODE:
	{
	  RETVAL = gdImageCompare(image1,image2);
	}
	OUTPUT:
		RETVAL

void
colorDeallocate(image,color)
	GD::Image	image
	int		color
	PROTOTYPE: $$
	CODE:
	{
		gdImageColorDeallocate(image,color);
	}

void
copy(destination,source,dstX,dstY,srcX,srcY,w,h)
	GD::Image	destination
	GD::Image	source
	int		dstX
	int		dstY
	int		srcX
	int		srcY
	int		w
	int		h
        PROTOTYPE: $$$$$$$$
	CODE:
	{
		gdImageCopy(destination,source,dstX,dstY,srcX,srcY,w,h);
	}

void
copyResized(destination,source,dstX,dstY,srcX,srcY,destW,destH,srcW,srcH)
	GD::Image	destination
	GD::Image	source
	int		dstX
	int		dstY
	int		srcX
	int		srcY
	int		destW
	int		destH
	int		srcW
	int		srcH
        PROTOTYPE: $$$$$$$$$$
	CODE:
	{
		gdImageCopyResized(destination,source,dstX,dstY,srcX,srcY,destW,destH,srcW,srcH);
	}

void
copyResampled(destination,source,dstX,dstY,srcX,srcY,destW,destH,srcW,srcH)
	GD::Image	destination
	GD::Image	source
	int		dstX
	int		dstY
	int		srcX
	int		srcY
	int		destW
	int		destH
	int		srcW
	int		srcH
        PROTOTYPE: $$$$$$$$$$
	CODE:
	{
		gdImageCopyResampled(destination,source,dstX,dstY,srcX,srcY,destW,destH,srcW,srcH);
	}

void
copyMerge(destination,source,dstX,dstY,srcX,srcY,w,h,pct)
	GD::Image	destination
	GD::Image	source
	int		dstX
	int		dstY
	int		srcX
	int		srcY
	int		w
	int		h
        int             pct
        PROTOTYPE: $$$$$$$$$
	CODE:
	{
		gdImageCopyMerge(destination,source,dstX,dstY,srcX,srcY,w,h,pct);
	}

void
copyMergeGray(destination,source,dstX,dstY,srcX,srcY,w,h,pct)
	GD::Image	destination
	GD::Image	source
	int		dstX
	int		dstY
	int		srcX
	int		srcY
	int		w
	int		h
        int             pct
        PROTOTYPE: $$$$$$$$$
	CODE:
	{
		gdImageCopyMergeGray(destination,source,dstX,dstY,srcX,srcY,w,h,pct);
	}

void
paletteCopy(destination,source)
	GD::Image	destination
	GD::Image	source
        PROTOTYPE: $$
	CODE:
	{
		gdImagePaletteCopy(destination,source);
	}

void
gdchar(image,font,x,y,c,color)
	GD::Image	image
	GD::Font	font
	int		x
	int		y
	char *		c
	int		color
        PROTOTYPE: $$$$$$
	CODE:
	{
		gdImageChar(image,font,x,y,*c,color);
	}

void
gdcharUp(image,font,x,y,c,color)
	GD::Image	image
	GD::Font	font
	int		x
	int		y
	char *		c
	int		color
        PROTOTYPE: $$$$$$
	CODE:
	{
		gdImageCharUp(image,font,x,y,*c,color);
	}

void
gdstring(image,font,x,y,s,color)
	GD::Image	image
	GD::Font	font
	int		x
	int		y
	char *		s
	int		color
        PROTOTYPE: $$$$$$
	CODE:
	{
		gdImageString(image,font,x,y,(unsigned char*)s,color);
	}

void
gdstringUp(image,font,x,y,s,color)
	GD::Image	image
	GD::Font	font
	int		x
	int		y
	char *		s
	int		color
        PROTOTYPE: $$$$$$
	CODE:
	{
		gdImageStringUp(image,font,x,y,(unsigned char*)s,color);
	}

void
gdstringFT(image,fgcolor,fontname,ptsize,angle,x,y,string,...)
        SV *	        image
        int             fgcolor
	char *          fontname
	double          ptsize
	double          angle
	int		x
        int             y
        char *          string
        PROTOTYPE: $$$$$$$$;$
        PREINIT:
	  gdImagePtr img;
	  int        brect[8];
	  char       *err;
          char       *a;
	  SV*        errormsg;
          HV*        hash;
          SV**       value;
	  int        i;
          int        hdpi;
          int        vdpi;
          gdFTStringExtra strex;
	PPCODE:
	{
#ifndef HAVE_FT
  	errormsg = perl_get_sv("@",0);
	sv_setpv(errormsg,"libgd was not built with FreeType font support\n");
	XSRETURN_EMPTY;
#endif
          if (sv_isobject(image) && sv_derived_from(image, "GD::Image")) {
            IV tmp = SvIV((SV*)SvRV(image));
            img = (gdImagePtr) tmp;
	  } else {
	    img = NULL;
	  }

	  if (items == 9) {  /* hashref options at end */
	    if (SvTYPE(SvRV(ST(8))) != SVt_PVHV)
	      croak ("Usage: $gd->stringFT(image,fgcolor,fontname,ptsize,angle,x,y,string,[{options}])");
	    hash  = (HV*)SvRV(ST(8));
	    strex.flags       = 0;
	    strex.linespacing = 0;
	    strex.charmap     = 0;
	    if (value = hv_fetch(hash,"linespacing",strlen("linespacing"),0)) {
	      strex.flags |= gdFTEX_LINESPACE;
	      strex.linespacing = SvNV(*value);
	    }
	    if (value = hv_fetch(hash,"charmap",strlen("charmap"),0)) {
	      strex.flags |= gdFTEX_CHARMAP;
	      if (strEQ(SvPV_nolen(*value),"Unicode"))
		strex.charmap = gdFTEX_Unicode;
	      else if (strEQ(SvPV_nolen(*value),"Shift_JIS"))
		strex.charmap = gdFTEX_Shift_JIS;
	      else if (strEQ(SvPV_nolen(*value),"Big5"))
		strex.charmap = gdFTEX_Big5;
	      else
		croak("Unknown charmap %s",SvPV_nolen(*value));
	    }
#ifdef VERSION_33
            if (value = hv_fetch(hash,"resolution",strlen("resolution"),0)) {
	      strex.flags |= gdFTEX_RESOLUTION;
	      a = SvPV_nolen(*value);
	      if (sscanf(a,"%d,%d",&hdpi,&vdpi) == 2) {
		strex.hdpi = hdpi;
		strex.vdpi = vdpi;
	      }
	    }
            if (value = hv_fetch(hash,"kerning",strlen("kerning"),0)) {
	      if (!SvTRUE(*value)) {
		strex.flags |= gdFTEX_DISABLE_KERNING;
	      }
              else
                strex.flags &= gdFTEX_DISABLE_KERNING;
	    }
#endif
	    err = gdImageStringFTEx(img,brect,fgcolor,fontname,ptsize,angle,x,y,string,&strex);
	  }

	  else {
	    err = gdImageStringFT(img,brect,fgcolor,fontname,ptsize,angle,x,y,string);
	  }
	  if (err) {
	    errormsg = perl_get_sv("@",0);
	    if (errormsg != NULL)
	      sv_setpv(errormsg,err);
	    XSRETURN_EMPTY;
	  } else {
	    EXTEND(sp,8);
	    for (i=0;i<8;i++) {
	      PUSHs(sv_2mortal(newSViv(brect[i])));
	    }
	  }

	}

int
gdstringFTCircle(image,cx,cy,radius,textRadius,fillPortion,fontname,points,top,bottom,fgcolor)
        GD::Image       image
        int             cx
        int             cy
        double          radius
        double          textRadius
        double          fillPortion
	char *          fontname
	double          points
        char *          top
        char *          bottom
        int             fgcolor
        PROTOTYPE: $$$$$$$$$$$
        PREINIT:
        char*      err;        
        SV*        errormsg;
        CODE:
	{
#ifdef HAVE_FT
#ifdef HAVE_FTCIRCLE
	fprintf(stderr,"cx=%d,cy=%d,radius=%f,textRadius=%f,fillPortion=%f,fontname=%s,points=%f,top=%s,bottom=%s,fgcolor=%d",
		cx,cy,radius,textRadius,
		fillPortion,fontname,points,top,bottom,fgcolor);
        err = gdImageStringFTCircle(image,cx,cy,radius,textRadius,
				    fillPortion,fontname,points,top,bottom,fgcolor);
        if (err) {
	    errormsg = perl_get_sv("@",0);
	    if (errormsg != NULL)
	      sv_setpv(errormsg,err);
	    XSRETURN_EMPTY;
	  } else {
            RETVAL = 1;
	  }
#else
  	errormsg = perl_get_sv("@",0);
	sv_setpv(errormsg,"libgd must be version 2.0.33 or higher to use this function\n");
	XSRETURN_EMPTY;
#endif
#else
  	errormsg = perl_get_sv("@",0);
	sv_setpv(errormsg,"libgd was not built with FreeType support\n");
	XSRETURN_EMPTY;
#endif
	}
        OUTPUT:
           RETVAL

int
gduseFontConfig(image,flag)
     SV*         image
     int         flag
PROTOTYPE: $$
PREINIT:
     SV* errormsg;
CODE:
{
#ifdef HAVE_FONTCONFIG
   RETVAL = gdFTUseFontConfig(flag);
#else
   errormsg = perl_get_sv("@",0);
   sv_setpv(errormsg,"libgd was not built with fontconfig support\n");
   XSRETURN_EMPTY;
#endif
}
OUTPUT:
  RETVAL

void
gdalphaBlending(image,blending)
     GD::Image       image
        int             blending
PROTOTYPE: $$
CODE:
{
  gdImageAlphaBlending(image,blending);
}

void
gdsaveAlpha(image,saveAlphaArg)
     GD::Image       image
        int             saveAlphaArg
PROTOTYPE: $$
CODE:
{
  gdImageSaveAlpha(image,saveAlphaArg) ;
}

void
gdclip(image,...)
	GD::Image	image
        PROTOTYPE: $;$$$$
        PREINIT:
        int		coords[4];
        int             i;
        PPCODE:
	{
	  if (items == 5) {
	    for (i=0;i<4;i++)
	      coords[i] = (int)SvIV(ST(i+1));
	    gdImageSetClip(image,coords[0],coords[1],coords[2],coords[3]);
	  }
	  else if (items > 1) /* something weird */
	    croak("Usage: $gd->clip() or $gd->clip(x1,x2,y1,y2)");

	  gdImageGetClip(image,&coords[0],&coords[1],&coords[2],&coords[3]);
	  EXTEND(sp,4);
	  for (i=0;i<4;i++)
	    PUSHs(sv_2mortal(newSViv(coords[i])));
	}

void
gdsetAntiAliased(image,color)
     GD::Image       image
     int             color
PROTOTYPE: $$
CODE:
{
  gdImageSetAntiAliased(image,color);
}


void
gdsetAntiAliasedDontBlend(image,color,flag=1)
     GD::Image       image
     int             color
     int             flag
PROTOTYPE: $$$
CODE:
{
  gdImageSetAntiAliasedDontBlend(image,color,flag);
}


MODULE = GD		PACKAGE = GD::Font	PREFIX=gd

GD::Font
gdload(packname="GD::Font",fontpath)
     char * packname
     char * fontpath
     PROTOTYPE: $$
     PREINIT:
       int             fontfile;
       int             datasize;
       SV*             errormsg;
       char            errstr[256];
       gdFontPtr       font;
       unsigned char   word[4];
       char*           fontdata;
     CODE:
     {
       fontfile = open(fontpath,O_RDONLY);
       if (fontfile < 0) {
         errormsg = perl_get_sv("@",0);
	 snprintf(errstr,256,"could not open font file %s: %s",fontpath,strerror(errno));
         sv_setpv(errormsg,errstr);
 	 XSRETURN_EMPTY;
       }
       font = (gdFontPtr)safemalloc(sizeof(gdFont));
       if (font == NULL)
	 croak("safemalloc() returned NULL while trying to allocate font struct.\n");
       /* read header from font - note that the file is assumed to be littleendian*/
       if (read(fontfile,word,4) < 4)
	 croak("error while reading font file: %s",strerror(errno));
       font->nchars = littleendian(word);

       if (read(fontfile,word,4) < 4)
	 croak("error while reading font file: %s",strerror(errno));
       font->offset = littleendian(word);

       if (read(fontfile,word,4) < 4)
	 croak("error while reading font file: %s",strerror(errno));
       font->w = littleendian(word);

       if (read(fontfile,word,4) < 4)
	 croak("error while reading font file: %s",strerror(errno));
       font->h = littleendian(word);

       datasize = font->nchars * font->w * font->h;
       fontdata = (char*)safemalloc(datasize);
       if (fontdata == NULL)
	 croak("safemalloc() returned NULL while trying to allocate font bitmap.\n");

       if (read(fontfile,fontdata,datasize) < datasize)
	 croak("error while reading font file: %s",strerror(errno));

       font->data = fontdata;

       close(fontfile); /* please don't leak file descriptors! */
       RETVAL = font;
     }
     OUTPUT:
            RETVAL

void
gdDESTROY(self)
     GD::Font      self
     PROTOTYPE: $
     CODE:
     {
       if (self == gdFontGetSmall()      ||
	   self == gdFontGetLarge()      ||
	   self == gdFontGetGiant()      ||
	   self == gdFontGetMediumBold() ||
	   self == gdFontGetTiny() )
	 XSRETURN_EMPTY;
       safefree(self->data);
       safefree(self);
     }

GD::Font
gdSmall(packname="GD::Font")
	char *	packname
        PROTOTYPE: $
	CODE:
	{
		RETVAL = gdFontGetSmall();
	}
	OUTPUT:
		RETVAL

GD::Font
gdLarge(packname="GD::Font")
	char *	packname
	PROTOTYPE: $
	CODE:
	{
		RETVAL = gdFontGetLarge();
	}
	OUTPUT:
		RETVAL

GD::Font
gdGiant(packname="GD::Font")
	char *	packname
	PROTOTYPE: $
	CODE:
	{
		RETVAL = gdFontGetGiant();
	}
	OUTPUT:
		RETVAL

GD::Font
gdMediumBold(packname="GD::Font")
	char *	packname
	PROTOTYPE: $
	CODE:
	{
		RETVAL = gdFontGetMediumBold();
	}
	OUTPUT:
		RETVAL

GD::Font
gdTiny(packname="GD::Font")
	char *	packname
	PROTOTYPE: $
	CODE:
	{
		RETVAL = gdFontGetTiny();
	}
	OUTPUT:
		RETVAL

int
gdnchars(font)
	GD::Font	font
	PROTOTYPE: $
	CODE:
	{
		RETVAL = font->nchars;
	}
	OUTPUT:
		RETVAL

int
gdoffset(font)
	GD::Font	font
	PROTOTYPE: $
	CODE:
	{
		RETVAL = font->offset;
	}
	OUTPUT:
		RETVAL

int
gdwidth(font)
	GD::Font	font
	PROTOTYPE: $
	CODE:
	{
		RETVAL = font->w;
	}
	OUTPUT:
		RETVAL

int
gdheight(font)
	GD::Font	font
	PROTOTYPE: $
	CODE:
	{
		RETVAL = font->h;
	}
	OUTPUT:
		RETVAL

