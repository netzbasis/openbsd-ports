# $OpenBSD: Makefile,v 1.4 2020/11/24 16:45:43 millert Exp $

COMMENT =		source code spelling checker

MODPY_EGG_VERSION =	2.0.0

DISTNAME =		codespell-${MODPY_EGG_VERSION}

CATEGORIES =		devel textproc

HOMEPAGE =		https://github.com/codespell-project/codespell

# GPLv2
PERMIT_PACKAGE =	Yes

MODPY_PI =		Yes
MODULES =		lang/python
MODPY_SETUPTOOLS =	Yes
MODPY_PYTEST =		Yes
MODPY_PYTEST_ARGS =	codespell_lib

MODPY_VERSION =		${MODPY_DEFAULT_VERSION_3}

RUN_DEPENDS =		textproc/py-chardet${MODPY_FLAVOR}

TEST_DEPENDS =		${FULLPKGNAME}:${FULLPKGPATH} \
			devel/py-test-cov${MODPY_FLAVOR}

.include <bsd.port.mk>
