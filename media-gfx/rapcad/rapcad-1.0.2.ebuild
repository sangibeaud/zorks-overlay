# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 qmake-utils

DESCRIPTION=""
HOMEPAGE=""
#SRC_URI="https://github.com/GilesBathgate/RapCAD/archive/refs/tags/v1.0.2.tar.gz"
EGIT_REPO_URI="https://github.com/GilesBathgate/RapCAD.git"
EGIT_COMMIT="v${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-qt/qtcore-5.5
	dev-qt/qtwidgets
	dev-qt/qtconcurrent
	dev-qt/qtgui
	x11-libs/libdrm
	"
RDEPEND="${DEPEND}"
BDEPEND=""


src_compile(){
    eqmake5 PREFIX=/usr
    emake
}

src_install(){
emake install INSTALL_ROOT="${D}"
}

no_src_compile(){
	eqmake5 DESTDIR=/usr
	#eapply_user
}
