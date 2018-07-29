# $OpenBSD: Makefile,v 1.1.1.1 2018/07/21 09:48:39 rsadowski Exp $

COMMENT =		template and text document library for Qt5

VERSION =		5.1.0
PKGNAME =		grantlee-qt5-${VERSION}
DISTNAME =		grantlee-${VERSION}

SHARED_LIBS +=  Grantlee_Templates        0.0 # 5.1
SHARED_LIBS +=  Grantlee_TextDocument     0.0 # 5.1

CATEGORIES =		devel x11

HOMEPAGE =		https://github.com/steveire/grantlee

MAINTAINER =		KDE porting team <openbsd-kde@googlegroups.com>

# LGPLv2.1
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += ${COMPILER_LIBCXX} Qt5Core Qt5Gui c m

MASTER_SITES =		http://downloads.grantlee.org/ \
			http://www.loegria.net/grantlee/

MODULES =		devel/cmake \
			x11/qt5

TEST_DEPENDS =		${BUILD_PKGPATH}
TEST_IS_INTERACTIVE =	X11

CONFIGURE_ARGS =	-DCMAKE_DISABLE_FIND_PACKAGE_Doxygen:Bool=Yes \
			-DCMAKE_DISABLE_FIND_PACKAGE_LCov:Bool=Yes \
			-DCMAKE_DISABLE_FIND_PACKAGE_Cccc:Bool=Yes

.include <bsd.port.mk>