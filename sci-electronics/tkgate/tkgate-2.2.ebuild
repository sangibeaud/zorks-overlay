# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3

DESCRIPTION="Digital circuit simulator, written by Jeffery P. Hansen"
HOMEPAGE="https://github.com/glixx/tkgate"
SRC_URI=""
EGIT_REPO_URI="https://github.com/glixx/tkgate.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-lang/tcl:0
	dev-lang/tk:0
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig"


src_configure(){
	autoupdate
	autoreconf -fi
	./configure --prefix=/usr
}


no_src_install(){
	make install
}
