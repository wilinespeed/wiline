# Created by: Goran Tal <goran.tal@gmail.com>
# $FreeBSD$

PORTNAME=	dikt
PORTVERSION=	2l3
CATEGORIES=	textproc net kde
MASTER_SITES=	https://bitbucket.org/dikt/code/downloads/

MAINTAINER=	goran.tal@gmail.com
COMMENT=	Dictionary for KDE4

USE_KDE4=	kdelibs kdeprefix automoc4
USE_QT4=	corelib gui network svg xml \
		qmake_build moc_build rcc_build uic_build
USES=		cmake tar:txz

PLIST_FILES=	bin/dikt \
		share/applications/kde4/dikt.desktop \
		share/apps/dikt/diktui.rc \
		share/apps/dikt/dikt.css \
		share/apps/dikt/format.conf \
		share/icons/hicolor/128x128/apps/dikt.png \
		share/kde4/services/dict.protocol

.include <bsd.port.mk>
