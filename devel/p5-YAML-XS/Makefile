# $OpenBSD: Makefile,v 1.24 2020/12/06 02:03:33 afresh1 Exp $

COMMENT =	YAML Serialization using XS and libyaml

MODULES =	cpan

V =		0.82
DISTNAME =	YAML-LibYAML-$V
PKGNAME =	p5-YAML-XS-$V
CATEGORIES =	devel

MAINTAINER =	Andrew Hewus Fresh <afresh1@openbsd.org>

# Perl
PERMIT_PACKAGE =		Yes

WANTLIB =	c perl

# To avoid skipping tests
TEST_DEPENDS =	devel/p5-boolean

.include <bsd.port.mk>
