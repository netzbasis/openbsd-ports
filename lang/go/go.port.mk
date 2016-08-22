# $OpenBSD: go.port.mk,v 1.13 2016/08/21 14:08:25 czarkoff Exp $

ONLY_FOR_ARCHS ?=	${GO_ARCHS}

MODGO_BUILDDEP ?=	Yes

MODGO_RUN_DEPENDS =	lang/go
MODGO_BUILD_DEPENDS =	lang/go

.if ${NO_BUILD:L} == "no" && ${MODGO_BUILDDEP:L} == "yes"
BUILD_DEPENDS +=	${MODGO_BUILD_DEPENDS}
.endif

MODGO_PACKAGE_PATH =	${PREFIX}/go-pkg
MODGO_PACKAGES =	go-pkg/pkg/openbsd_${MACHINE_ARCH:S/i386/386/}
MODGO_SOURCES =		go-pkg/src
MODGO_TOOLS =		go-pkg/tool/openbsd_${MACHINE_ARCH:S/i386/386/}

SUBST_VARS +=		MODGO_TOOLS MODGO_PACKAGES MODGO_SOURCES

MODGO_SUBDIR ?=		${WRKDIST}
MODGO_TYPE ?=		bin
MODGO_WORKSPACE ?=	${WRKDIR}/go
MODGO_GOPATH ?=		${MODGO_WORKSPACE}:${MODGO_PACKAGE_PATH}
MODGO_ENV +=		GOPATH="${MODGO_GOPATH}"
MODGO_CMD ?=		${SETENV} ${MODGO_ENV} go
MODGO_BUILD_CMD =	${MODGO_CMD} install ${MODGO_FLAGS}
MODGO_TEST_CMD =	${MODGO_CMD} test ${MODGO_FLAGS}

.if defined(GH_ACCOUNT) && defined(GH_PROJECT)
ALL_TARGET ?=		github.com/${GH_ACCOUNT}/${GH_PROJECT}
.endif
TEST_TARGET ?=		${ALL_TARGET}

SEPARATE_BUILD ?=	Yes
WRKSRC ?=		${MODGO_WORKSPACE}/src/${ALL_TARGET}

MODGO_SETUP_WORKSPACE =	mkdir -p ${WRKSRC:H}; mv ${MODGO_SUBDIR} ${WRKSRC};

CATEGORIES +=		lang/go

MODGO_BUILD_TARGET =	${MODGO_BUILD_CMD} ${ALL_TARGET}
MODGO_FLAGS +=		-x

.if empty(DEBUG)
# by default omit symbol table, debug information and DWARF symbol table
MODGO_FLAGS +=		-ldflags="-s -w"
.endif

INSTALL_STRIP =
.if ${MODGO_TYPE:L:Mbin}
MODGO_INSTALL_TARGET =	${INSTALL_PROGRAM} ${MODGO_WORKSPACE}/bin/* \
				${PREFIX}/bin;
.endif

# Go source files serve the purpose of libraries, so sources should be included
# with library ports.
.if ${MODGO_TYPE:L:Mlib}
MODGO_INSTALL_TARGET +=	${INSTALL_DATA_DIR} ${MODGO_PACKAGE_PATH} && \
			cd ${MODGO_WORKSPACE} && \
			find src pkg -type d -exec ${INSTALL_DATA_DIR} \
				${MODGO_PACKAGE_PATH}/{} \; && \
			find src pkg -type f -exec ${INSTALL_DATA} -p \
				${MODGO_WORKSPACE}/{} \
				${MODGO_PACKAGE_PATH}/{} \;

# This is required to force rebuilding of go libraries upon changes in
# toolchain.
RUN_DEPENDS +=		${MODGO_RUN_DEPENDS}
.endif

MODGO_TEST_TARGET =	${MODGO_TEST_CMD} ${TEST_TARGET}

.if empty(CONFIGURE_STYLE)
.  if !target(post-patch)
post-patch:
	${MODGO_SETUP_WORKSPACE}
.  endif

.  if !target(do-build)
do-build:
	${MODGO_BUILD_TARGET}
.  endif

.  if !target(do-install)
do-install:
	${MODGO_INSTALL_TARGET}
.  endif

.  if !target(do-test)
do-test:
	${MODGO_TEST_TARGET}
.  endif
.endif
