# $OpenBSD: Makefile,v 1.1120 2021/01/07 07:02:24 daniel Exp $

COMMENT =	exceptions to pkg_add rules
CATEGORIES =	devel databases
DISTFILES =

# API.rev
PKGNAME =	quirks-3.508
PKG_ARCH =	*
MAINTAINER =	Marc Espie <espie@openbsd.org>

# BSD
PERMIT_PACKAGE =	Yes

PERLDIR =	${PREFIX}/libdata/perl5/site_perl

do-build:
	@find ${FILESDIR} -type f -name \*.pm -exec perl -c {} \;

do-install:
	${INSTALL_DATA_DIR} ${PERLDIR}/OpenBSD/Quirks
	${INSTALL_DATA} ${FILESDIR}/Quirks.pm ${PERLDIR}/OpenBSD/Quirks.pm
	${INSTALL_DATA} ${FILESDIR}/Quirks/ghc.pm ${PERLDIR}/OpenBSD/Quirks/ghc.pm

.include <bsd.port.mk>
