# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION=""
HOMEPAGE="http://faust.grame.fr/onlinecompiler/"
EGIT_REPO_URI="https://github.com/grame-cncm/onlinecompiler.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-lang/php
	www-servers/lighttpd
	app-text/highlight"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install (){
	dodir /usr/share/faust-online
	cp -R "${S}/." "${D}/usr/share/faust-online/" || die "Install failed!"
	chgrp lighttpd ${D}/usr/share/faust-online/tmp

#	echo include \"mod_cgi.conf\" >> ${D}/etc/lighttpd/faust-online.conf
# uncomment for php/fastcgi support
#   include "mod_fastcgi.conf"

}
