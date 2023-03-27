# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

#PYTHON_COMPAT=( python2_7 python3_4  python3_5 python3_6 )
PYTHON_COMPAT=( python3_{8..10} )
inherit git-r3 distutils-r1

DESCRIPTION="MyHDL is a Python package for using Python as a hardware description and verification language."
EGIT_REPO_URI="https://github.com/myhdl/myhdl.git"

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
