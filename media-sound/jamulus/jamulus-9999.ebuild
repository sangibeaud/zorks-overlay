# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 qmake-utils xdg

DESCRIPTION="Jamulus software enables musicians to perform real-time jam sessions over the internet"
HOMEPAGE="http://llcon.sourceforge.net/"
EGIT_REPO_URI="https://github.com/corrados/jamulus.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-qt/qtmultimedia[widgets]"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile(){
	qmake PREFIX=/usr
	emake
}

src_install(){
emake install INSTALL_ROOT="${D}"
}

