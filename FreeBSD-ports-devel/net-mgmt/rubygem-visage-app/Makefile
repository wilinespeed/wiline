# Created by: Brad Davis <brd@FreeBSD.org>
# $FreeBSD$

PORTNAME=	visage-app
PORTVERSION=	2.1.0
CATEGORIES=	net-mgmt rubygems
MASTER_SITES=	RG

MAINTAINER=	brd@FreeBSD.org
COMMENT=	Graph tool for Collectd

LICENSE=	MIT

RUN_DEPENDS=	rubygem-errand>=0.7.3:devel/rubygem-errand \
		rubygem-haml>=3.1.4:www/rubygem-haml \
		rubygem-sinatra>=1.3.2:www/rubygem-sinatra \
		rubygem-tilt>=1.3.3:devel/rubygem-tilt \
		rubygem-yajl-ruby>=1.1.0:devel/rubygem-yajl-ruby

NO_ARCH=	yes

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

PLIST_FILES=	bin/visage-app

.include <bsd.port.mk>
