#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "libgd/gd.h"
#ifdef FCGI
#include <fcgi_stdio.h>
#else
#ifdef USE_SFIO
#include <config.h>
#include <perlio.h>
#else
#include <stdio.h>
#endif
#endif
/* Copyright 1995, 1996, Lincoln D. Stein.  See accompanying README file for
	usage restrictions */

static int
not_here(s)
char *s;
{
    croak("%s not implemented on this architecture", s);
    return -1;
}

static double
constant(name, arg)
char *name;
int arg;
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
extern 	gdFontPtr	gdFontLarge;
extern	gdFontPtr	gdFontSmall;
extern	gdFontPtr	gdFontMediumBold;
extern	gdFontPtr	gdFontTiny;

/* Utility functions */
FILE* fh2file (fhandle,style)
char* fhandle;
char* style;
{
  dSP ;
  int count ;
  FILE* file;
  int fd,newfd;
  
  ENTER ;
  SAVETMPS;
  PUSHMARK(sp) ;
  XPUSHs(sv_2mortal(newSVpv(fhandle,0)));
  PUTBACK ;
  count = perl_call_pv("GD::fileno", G_SCALAR);
  SPAGAIN ;
  if (count != 1)
    croak("Didn't get a single result from fileno() call.\n");
  fd = POPi;
  PUTBACK ;
  FREETMPS ;
  LEAVE ;

  newfd = dup(fd);
  file = fdopen(newfd,style);
  return file;
}

MODULE = GD		PACKAGE = GD

double
constant(name,arg)
	char *		name
	int		arg

MODULE = GD		PACKAGE = GD::Image	PREFIX=gd

GD::Image
gdnew(packname="GD::Image", x=64, y=64)
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
gdnewFromGif(packname="GD::Image", filehandle)
	char *	packname
	char *	filehandle
	PROTOTYPE: $$
	CODE:
	{
		gdImagePtr theImage;
		FILE*	theFile;
		theFile = fh2file(filehandle,"r");
		if (theFile == NULL) {
		  RETVAL = NULL;
		} else {
		  theImage = gdImageCreateFromGif(theFile);
		  RETVAL = theImage;
		}
		fclose(theFile);
	}
	OUTPUT:
		RETVAL

GD::Image
gdnewFromXbm(packname="GD::Image", filehandle)
	char *	packname
	char *	filehandle
	PROTOTYPE: $$
	CODE:
	{
		gdImagePtr theImage;
		FILE*	theFile;
		theFile = fh2file(filehandle,"r");
		if (theFile == NULL) {
			RETVAL = NULL;
		} else {
			theImage = gdImageCreateFromXbm(theFile);
			RETVAL = theImage;
		}
		fclose(theFile);
	}
	OUTPUT:
		RETVAL

GD::Image
gdnewFromGd(packname="GD::Image", filehandle)
	char *	packname
	char *	filehandle
	PROTOTYPE: $$
	CODE:
	{
		gdImagePtr theImage;
		FILE*	theFile;
		theFile = fh2file(filehandle,"r");
		if (theFile == NULL) {
			RETVAL = NULL;
		} else {
			theImage = gdImageCreateFromGd(theFile);
			RETVAL = theImage;
		}
		fclose(theFile);
	}
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
gdgif(image)
  GD::Image	image
  PROTOTYPE: $
  CODE:
  {
	void*         data;
	int           size;
	data = gdImageGifPtr(image,&size);
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

		gdImageOpenPolygon(image,polyptr,length,color);
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
