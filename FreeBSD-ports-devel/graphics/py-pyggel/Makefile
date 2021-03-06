# Created by: Rusmir Dusko <nemysis@FreeBSD.org>
# $FreeBSD$

PORTNAME=	pyggel
PORTVERSION=	0.08
DISTVERSIONSUFFIX=	-alpha4c
PORTREVISION=	2
CATEGORIES=	graphics python
MASTER_SITES=	GOOGLE_CODE
DISTNAME=	${PORTNAME:tu}-V${DISTVERSION}${DISTVERSIONSUFFIX}
DIST_SUBDIR=	python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	koalative@gmail.com
COMMENT=	Python Graphical Game Engine and Libraries

LICENSE=	LGPL3 PD
LICENSE_COMB=	dual

RUN_DEPENDS=	${PYNUMPY} \
		${PYGAME} \
		${PYTHON_PKGNAMEPREFIX}opengl>=0:graphics/py-opengl \
		${PYTHON_PKGNAMEPREFIX}pillow>=0:graphics/py-pillow

USES=		dos2unix python:2 zip
DOS2UNIX_GLOB=	*.mtl *.py *.txt
USE_PYTHON=	autoplist distutils
NO_BUILD=	yes

PORTDOCS=	Readme.txt
PORTEXAMPLES=	*

OPTIONS_DEFINE=	DOCS EXAMPLES

.include <bsd.port.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|data_files =|#data_files =|' \
		${WRKSRC}/setup.py

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${STAGEDIR}${DOCSDIR}

.if ${PORT_OPTIONS:MEXAMPLES}
	@(cd ${WRKSRC}/examples_and_tutorials && ${COPYTREE_SHARE} . \
		${STAGEDIR}${EXAMPLESDIR}/examples_and_tutorials)
	@(cd ${WRKSRC} && ${COPYTREE_SHARE} data ${STAGEDIR}${EXAMPLESDIR})
. for f in test_FBO test_camera test_gui test_mesh test_particle test_texture_swap
	@(cd ${WRKSRC} && ${COPYTREE_SHARE} ${f}.py ${STAGEDIR}${EXAMPLESDIR})
. endfor
.endif

.include <bsd.port.mk>
