/* just a big of compatibility for the fast CGI protocol */

#ifdef FCGI
#include <fcgi_stdio.h>
#else
#include <stdio.h>
#endif
