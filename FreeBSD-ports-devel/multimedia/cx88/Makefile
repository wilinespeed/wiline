# Created by: Jason Harmening <jason.harmening@gmail.com>
# $FreeBSD$

PORTNAME=	cx88
PORTVERSION=	1.4.11
PORTREVISION=	2
CATEGORIES=	multimedia
MASTER_SITES=	ftp://corona.homeunix.net/ports/cx88/

MAINTAINER=	jason.harmening@gmail.com
COMMENT=	Drivers for Conexant CX23880/1/2/3/5/7/8-based TV/radio capture cards

LICENSE=	BSD2CLAUSE

LIB_DEPENDS=	libjson-c.so:devel/json-c
BUILD_DEPENDS=	${LOCALBASE}/lib/libezxml.a:textproc/ezxml \
		libtuner>=1.1.2:multimedia/libtuner

MAKE_ARGS+=	LIBTUNER_LIB=${LOCALBASE}/lib/libtuner LIBTUNER_HEADER=${LOCALBASE}/include/libtuner KMODDIR=${KMODDIR} PREFIX=${STAGEDIR}${PREFIX}
MAKE_JOBS_UNSAFE=	yes
USES=			kmod libedit pkgconfig uidfix
USE_RC_SUBR=		cx88d

OPTIONS_DEFINE=	DEBUG LINUX_COMPAT HAL

DEBUG_DESC=		Enable debugging and verbose driver output
LINUX_COMPAT_DESC=	Support for Linux DVB and radio API
HAL_DESC=		Register Linux DVB devices with HAL

OPTIONS_DEFAULT=	LINUX_COMPAT

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MDEBUG}
MAKE_ARGS+=	DIAGNOSTIC=0x7f -DDEBUG
.endif

.if ${PORT_OPTIONS:MLINUX_COMPAT}
LIB_DEPENDS+=	libcuse4bsd.so:multimedia/cuse4bsd-kmod
BUILD_DEPENDS+=	v4l_compat>=1.0.20100321:multimedia/v4l_compat
MAKE_ARGS+=	-D WITH_LINUX_COMPAT
.if ${PORT_OPTIONS:MHAL}
LIB_DEPENDS+=	libhal.so:sysutils/hal \
		libdbus-1.so:devel/dbus
MAKE_ARGS+=	-D WITH_HAL
.endif
.endif

MAKE_ARGS+=	DEFAULT_XML_CONFIG="${EXAMPLESDIR}/cx88.xml.sample"

.include <bsd.port.mk>
