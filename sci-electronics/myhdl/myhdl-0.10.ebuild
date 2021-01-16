# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6,3_7,3_8,3_9} )
inherit git-r3 distutils-r1

DESCRIPTION="MyHDL is a Python package for using Python as a hardware description and verification language."
EGIT_REPO_URI="https://github.com/myhdl/myhdl.git"
EGIT_COMMIT="refs/tags/0.10"

RESTRICT="nomirror"
HOMEPAGE="http://www.myhdl.org/"
RDEPEND=""
IUSE=""
SLOT="0"
KEYWORDS="amd64"
LICENSE="LPGL-2.1"



src_install() {
	distutils-r1_src_install
	dodoc *.txt
	cp -r doc/* example cosimulation ${D}/usr/share/doc/${PF}
}
