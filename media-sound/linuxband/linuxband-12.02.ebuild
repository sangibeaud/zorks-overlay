# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="LinuxBand is a GUI front-end for MMA (Musical MIDI Accompaniment)."
HOMEPAGE="http://linuxband.org"
SRC_URI="http://linuxband.org/assets/sources/${PN}-${PV}.tar.gz"
#https://github.com/noseka1/linuxband.git
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ~mips ~sparc ~x86"


DEPEND="media-libs/libsmf virtual/jack  media-sound/mma"
RDEPEND="${DEPEND} dev-python/pygtk dev-python/pygtksourceview "

#src_configure() {
#     econf --with-posix-regex
#}

src_install() {
    emake DESTDIR="${D}" install

    dodoc COPYING README.md
}

