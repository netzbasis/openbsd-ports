# $OpenBSD: Makefile,v 1.29 2020/12/03 19:29:06 robert Exp $

USE_WXNEEDED=		Yes

COMMENT=		powerful text editor for the MATE desktop

CATEGORIES=		textproc

MATE_VERSION=		1.24.1
MATE_PROJECT=		pluma

# GPLv2
PERMIT_PACKAGE=	Yes

WANTLIB += ICE SM X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama
WANTLIB += Xrandr Xrender aspell atk-1.0 atk-bridge-2.0 c cairo
WANTLIB += cairo-gobject enchant-2 epoxy expat ffi fontconfig freetype
WANTLIB += fribidi gdk-3 gdk_pixbuf-2.0 gio-2.0 girepository-1.0
WANTLIB += glib-2.0 gmodule-2.0 gobject-2.0 graphite2 gthread-2.0 gtk-3
WANTLIB += gtksourceview-3.0 harfbuzz iconv intl lzma m pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0 pcre peas-1.0 peas-gtk-1.0
WANTLIB += pixman-1 png pthread xcb xcb-render xcb-shm xml2 z

COMPILER =		base-clang ports-gcc base-gcc

MODULES=		devel/dconf \
			lang/python \
			x11/gnome

USE_LIBTOOL=		gnu

MODPY_VERSION=		${MODPY_DEFAULT_VERSION_3}

BUILD_DEPENDS=		devel/iso-codes
RUN_DEPENDS=		devel/iso-codes

LIB_DEPENDS=		devel/libpeas \
			textproc/enchant2 \
			x11/gtksourceview3

MODGNOME_TOOLS=		desktop-file-utils yelp

CONFIGURE_STYLE=	gnu

CONFIGURE_ARGS=		--disable-tests

.include <bsd.port.mk>
