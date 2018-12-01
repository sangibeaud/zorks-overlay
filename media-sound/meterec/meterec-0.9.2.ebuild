# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Simple console recorder."
HOMEPAGE="http://linuxband.org"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"
#https://github.com/noseka1/linuxband.git
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ~mips ~sparc ~x86"


DEPEND="virtual/jack \
	sys-libs/ncurses 
	>=media-libs/libsndfile-1.0.0 
	>=dev-libs/libconfig-1.3.2
	"
RDEPEND="${DEPEND}"

#src_configure() {
#	 elog "in configure"
#
#	 	if [[ -x ${ECONF_SOURCE:-.}/configure ]] ; then
#			econf
#			elog ":)"
#		fi
#
#    
#}

src_install() {
	elog "installing to ${D}"
	
    emake DESTDIR="${D}" install
	ls -la ${D}usr/bin/test
	[[ -f ${D}usr/bin/test ]] && rm ${D}usr/bin/test

#    dodoc AUTHORS COPYING README INSTALL
}

