/*
 * $OpenBSD: checkpass_bsd.c,v 1.2 2017/01/11 13:32:11 zhuk Exp $
 *
 * Copyright (c) 2012 Vadim Zhukov <persgray@gmail.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#include "kcheckpass.h"

#ifdef USE_BSDAUTH

/*******************************************************************
 * This is the authentication code for BSD Authentication system
 *******************************************************************/

#include <sys/types.h>
#include <string.h>

#include <login_cap.h>
#include <bsd_auth.h>


AuthReturn Authenticate(const char *method, const char *login,
        char *(*conv) (ConvRequest, const char *))
{
  char *passwd;

  if (strcmp(method, "classic"))
    return AuthError;

  if (!(passwd = conv(ConvGetHidden, 0)))
    return AuthAbort;

  return (auth_userokay((char*)login, NULL, NULL, passwd) ? AuthOk : AuthBad);
}

#endif
