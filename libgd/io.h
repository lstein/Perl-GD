/* just a big of compatibility for the fast CGI protocol */

#include <config.h>
#ifdef FCGI
#include <fcgi_stdio.h>
#else
#ifdef USE_SFIO
#include <perlio.h>
#undef fread
#undef fwrite
#define fread(buffer, len, size, file)   PerlIO_read(file,buffer,size*len)
#define fwrite(buffer, len, size, file) PerlIO_write(file,buffer,size*len)
#else
#include <stdio.h>
#endif
#endif
