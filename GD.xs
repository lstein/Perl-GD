#ifdef PERL_CAPI
#define WIN32IO_IS_STDIO
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <gd.h>
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

static int
not_here(char *s)
{
    croak("%s not implemented on this architecture", s);
    return -1;
}

static double
constant(char *name, int arg)
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
extern 	gdFontPtr	gdFontGiant;
extern 	gdFontPtr	gdFontLarge;
extern	gdFontPtr	gdFontSmall;
extern	gdFontPtr	gdFontMediumBold;
extern	gdFontPtr	gdFontTiny;

#ifdef PERL_OBJECT
#  ifdef WIN32
#define GDIMAGECREATEFROMPNG(x) gdImageCreateFromPng((FILE*)x)
#define GDIMAGECREATEFROMXBM(x) gdImageCreateFromXbm((FILE*)x)
#define GDIMAGECREATEFROMJPEG(x) gdImageCreateFromJpeg((FILE*)x)
#define GDIMAGECREATEFROMWBMP(x) gdImageCreateFromWBMP((FILE*)x)
#define GDIMAGECREATEFROMGD(x) gdImageCreateFromGd((FILE*)x)
#define GDIMAGECREATEFROMGD2(x) gdImageCreateFromGd2((FILE*)x)
#define GDIMAGECREATEFROMGD2PART(x,a,b,c,d) gdImageCreateFromGd2Part((FILE*)x,a,b,c,d)
#  endif
#else
#define GDIMAGECREATEFROMPNG(x) gdImageCreateFromPng(x)
#define GDIMAGECREATEFROMXBM(x) gdImageCreateFromXbm(x)
#define GDIMAGECREATEFROMJPEG(x) gdImageCreateFromJpeg(x)
#define GDIMAGECREATEFROMWBMP(x) gdImageCreateFromWBMP(x)
#define GDIMAGECREATEFROMGD(x) gdImageCreateFromGd(x)
#define GDIMAGECREATEFROMGD2(x) gdImageCreateFromGd2(x)
#define GDIMAGECREATEFROMGD2PART(x,a,b,c,d) gdImageCreateFromGd2Part(x,a,b,c,d)
#endif

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
  
  Newz(0,ctx,1,bufIOCtx);
  if (ctx == NULL) return NULL;
  ctx->data   = data;
  ctx->pos    = 0;
  ctx->length = length;

  ctx->ctx.getC   = bufGetC;
  ctx->ctx.getBuf = bufGetBuf;
  ctx->ctx.seek   = bufSeek;
  ctx->ctx.tell   = bufTell;
  ctx->ctx.free   = bufFree;
  ctx->ctx.putC   = NULL;
  ctx->ctx.putBuf = NULL;
  return (gdIOCtx*)ctx;
}

MODULE = GD		PACKAGE = GD

double
constant(name,arg)
	char *		name
	int		arg

MODULE = GD		PACKAGE = GD::Image	PREFIX=gd

GD::Image
gd_new(packname="GD::Image", x=64, y=64)
	char *	packname
	int	x
	int	y
        PROTOTYPE: $;$$
	CODE:
	{
		gdImagePtr theImage;
		theImage = gdImageCreate(x,y);
		RETVAL = theImage;
	}
	OUTPUT:
		RETVAL

GD::Image
gd_newFromPng(packname="GD::Image", filehandle)
	char *	packname
	InputStream	filehandle
	PROTOTYPE: $$
	CODE:
	RETVAL = (GD__Image) GDIMAGECREATEFROMPNG(filehandle);
	OUTPUT:
	RETVAL

GD::Image
gdnewFromPngData(packname="GD::Image", imageData)
	char *	packname
	SV *  imageData
	PROTOTYPE: $$
        PREINIT:
	  gdIOCtx* ctx;
          char*    data;
          STRLEN   len;
	CODE:
	data = SvPV(imageData,len);
        ctx = newDynamicCtx(data,len);
	RETVAL = (GD__Image) gdImageCreateFromPngCtx(ctx);
        ctx->free(ctx);
	OUTPUT:
	RETVAL

GD::Image
gdnewFromGdData(packname="GD::Image", imageData)
	char *	packname
	SV *  imageData
	PROTOTYPE: $$
        PREINIT:
	  gdIOCtx* ctx;
          char*    data;
          STRLEN   len;
	CODE:
	data = SvPV(imageData,len);
        ctx = newDynamicCtx(data,len);
	RETVAL = (GD__Image) gdImageCreateFromGdCtx(ctx);
        ctx->free(ctx);
	OUTPUT:
	RETVAL

GD::Image
gdnewFromGd2Data(packname="GD::Image", imageData)
	char *	packname
	SV *  imageData
	PROTOTYPE: $$
        PREINIT:
	  gdIOCtx* ctx;
          char*    data;
          STRLEN   len;
	CODE:
	data = SvPV(imageData,len);
        ctx = newDynamicCtx(data,len);
	RETVAL = (GD__Image) gdImageCreateFromGd2Ctx(ctx);
        ctx->free(ctx);
	OUTPUT:
	RETVAL

GD::Image
gdnewFromJpegData(packname="GD::Image", imageData)
	char *	packname
	SV *  imageData
	PROTOTYPE: $$
        PREINIT:
	  gdIOCtx* ctx;
          char*    data;
          STRLEN   len;
	CODE:
	data = SvPV(imageData,len);
        ctx = newDynamicCtx(data,len);
	RETVAL = (GD__Image) gdImageCreateFromJpegCtx(ctx);
        ctx->free(ctx);
	OUTPUT:
	RETVAL

GD::Image
gdnewFromWBMPData(packname="GD::Image", imageData)
	char *	packname
	SV *  imageData
	PROTOTYPE: $$
        PREINIT:
	  gdIOCtx* ctx;
          char*    data;
          STRLEN   len;
	CODE:
	data = SvPV(imageData,len);
        ctx = newDynamicCtx(data,len);
	RETVAL = (GD__Image) gdImageCreateFromWBMPCtx(ctx);
        ctx->free(ctx);
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

GD::Image
gd_newFromJpeg(packname="GD::Image", filehandle)
	char *	packname
	InputStream	filehandle
	PROTOTYPE: $$
        PREINIT:
	  gdImagePtr img;
	  SV* errormsg;
	CODE:
#ifdef HAVE_JPEG
	img = GDIMAGECREATEFROMJPEG(filehandle);
        if (img == NULL) {
          errormsg = perl_get_sv("@",0);
	  if (errormsg != NULL)
	    sv_setpv(errormsg,"GD/libgd was not built with jpeg support\n");
	  XSRETURN_EMPTY;
        }
        RETVAL = img;
#else
        errormsg = perl_get_sv("@",0);
        sv_setpv(errormsg,"libgd was not built with jpeg support\n");
        XSRETURN_EMPTY;
#endif
	OUTPUT:
        RETVAL

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
	char * filename
	PROTOTYPE: $$
        PREINIT:
	  gdImagePtr img;
	  SV* errormsg;
	CODE:
#ifdef HAVE_XPM
	img = gdImageCreateFromXpm(filename);
        if (img == NULL) {
	    errormsg = perl_get_sv("@",0);
	    if (errormsg != NULL)
	      sv_setpv(errormsg,"libgd was not built with xpm support\n");
	    XSRETURN_EMPTY;
        }
        RETVAL = img;
#else
        errormsg = perl_get_sv("@",0);
        sv_setpv(errormsg,"GD/libgd was not built with XPM support\n");
        XSRETURN_EMPTY;
#endif
        OUTPUT:
        RETVAL

GD::Image
gd_newFromGd2Part(packname="GD::Image", filehandle,srcX,srcY,width,height)
	char *	packname
	InputStream	filehandle
	int srcX
	int srcY
	int width
	int height
	PROTOTYPE: $$
	CODE:
	RETVAL = GDIMAGECREATEFROMGD2PART(filehandle,srcX,srcY,width,height);
	OUTPUT:
	RETVAL

void
gdDESTROY(image)
	GD::Image	image
	PROTOTYPE: $
	CODE:
	{
		gdImageDestroy(image);
	}

SV*
gdpng(image)
  GD::Image	image
  PROTOTYPE: $
  CODE:
  {
	void*         data;
	int           size;
	data = (void *) gdImagePngPtr(image,&size);
	RETVAL = newSVpv((char*) data,size);
	free(data);
  }
  OUTPUT:
    RETVAL

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
#ifdef HAVE_JPEG
	data = (void *) gdImageJpegPtr(image,&size,quality);
        if (data == NULL) {
          errormsg = perl_get_sv("@",0);
	  if (errormsg != NULL)
	    sv_setpv(errormsg,"libgd was not built with jpeg support\n");
	  XSRETURN_EMPTY;
        }
	RETVAL = newSVpv((char*) data,size);
	free(data);
#else
        errormsg = perl_get_sv("@",0);
        sv_setpv(errormsg,"libgd was not built with jpeg support\n");
        XSRETURN_EMPTY;
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
	RETVAL = newSVpv((char*) data,size);
	free(data);
  }
  OUTPUT:
    RETVAL

SV*
gdgd(image)
  GD::Image	image
  PROTOTYPE: $
  CODE:
  {
	void*         data;
	int           size;
	data = gdImageGdPtr(image,&size);
	RETVAL = newSVpv((char*) data,size);
	free(data);
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
	RETVAL = newSVpv((char*) data,size);
	free(data);
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
	PROTOTYPE: $$$
	CODE:
	{
		gdImageSetPixel(image,x,y,color);
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
colorsTotal(image)
	GD::Image	image
	PROTOTYPE: $
	CODE:
	{
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
		gdImageString(image,font,x,y,s,color);
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
		gdImageStringUp(image,font,x,y,s,color);
	}

void
gdstringFT(image,fgcolor,fontname,ptsize,angle,x,y,string)
        SV *	        image
        int             fgcolor
	char *          fontname
	double          ptsize
	double          angle
	int		x
        int             y
        char *          string
        PROTOTYPE: $$$$$$$$
        PREINIT:
	  gdImagePtr img;
	  int brect[8];
	  char *err;
	  SV* errormsg;
	  int i;
	PPCODE:
	{
          if (sv_isobject(image) && sv_derived_from(image, "GD::Image")) {
            IV tmp = SvIV((SV*)SvRV(image));
            img = (gdImagePtr) tmp;
	  } else {
	    img = NULL;
	  }

	  err = gdImageStringFT(img,brect,fgcolor,fontname,ptsize,angle,x,y,string);
	  if (err) {
	    errormsg = perl_get_sv("@",0);
	    if (errormsg != NULL)
	      sv_setpv(errormsg,err);
	    XSRETURN_EMPTY;
	  } else {
	    EXTEND(sp,8);
	    for (i=0;i<8;i++)
	      PUSHs(sv_2mortal(newSViv(brect[i])));
	  }

	}

MODULE = GD		PACKAGE = GD::Font	PREFIX=gd

GD::Font
gdSmall(packname="GD::Font")
	char *	packname
        PROTOTYPE: $
	CODE:
	{
		RETVAL = gdFontSmall;
	}
	OUTPUT:
		RETVAL

GD::Font
gdLarge(packname="GD::Font")
	char *	packname
	PROTOTYPE: $
	CODE:
	{
		RETVAL = gdFontLarge;
	}
	OUTPUT:
		RETVAL

GD::Font
gdGiant(packname="GD::Font")
	char *	packname
	PROTOTYPE: $
	CODE:
	{
		RETVAL = gdFontGiant;
	}
	OUTPUT:
		RETVAL

GD::Font
gdMediumBold(packname="GD::Font")
	char *	packname
	PROTOTYPE: $
	CODE:
	{
		RETVAL = gdFontMediumBold;
	}
	OUTPUT:
		RETVAL

GD::Font
gdTiny(packname="GD::Font")
	char *	packname
	PROTOTYPE: $
	CODE:
	{
		RETVAL = gdFontTiny;
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
