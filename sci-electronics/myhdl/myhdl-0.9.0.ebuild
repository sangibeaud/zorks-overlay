# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

#PYTHON_COMPAT=( python2_7 python3_4 )
PYTHON_COMPAT=( python3_8 )
inherit distutils-r1

DESCRIPTION="MyHDL is a Python package for using Python as a hardware description and verification language."
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

RESTRICT="nomirror"
HOMEPAGE="http://www.myhdl.org/"
RDEPEND=""
IUSE=""
SLOT="0"
KEYWORDS="~amd64"
LICENSE="LPGL-2.1"



src_install() {
	distutils-r1_src_install
	dodoc *.txt
	cp -r doc/* example cosimulation ${D}/usr/share/doc/${PF}
}
