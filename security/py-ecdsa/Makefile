# $OpenBSD: Makefile,v 1.14 2020/11/14 11:39:46 benoit Exp $

COMMENT =		Python implementation of ECDSA cryptography

MODPY_EGG_VERSION = 	0.16.1
DISTNAME = 		ecdsa-${MODPY_EGG_VERSION}
PKGNAME = 		py-${DISTNAME}
CATEGORIES = 		security

HOMEPAGE = 		https://github.com/warner/python-ecdsa

MAINTAINER = 		Benoit Lecocq <benoit@openbsd.org>

# MIT
PERMIT_PACKAGE =	Yes

MODPY_PI =		Yes

MODULES =		lang/python
MODPY_SETUPTOOLS =	Yes
MODPY_PYTEST =		Yes
MODPY_PYTEST_ARGS =	src/ecdsa

FLAVORS =		python3
FLAVOR ?=

RUN_DEPENDS =		devel/py-six${MODPY_FLAVOR}

TEST_DEPENDS =		devel/py-hypothesis${MODPY_FLAVOR} \
			devel/py-test${MODPY_FLAVOR}

.include <bsd.port.mk>
