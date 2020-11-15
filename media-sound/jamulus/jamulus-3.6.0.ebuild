# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils xdg

DESCRIPTION="Jamulus software enables musicians to perform real-time jam sessions over the internet"
HOMEPAGE="http://llcon.sourceforge.net/"
#EGIT_REPO_URI="https://github.com/corrados/jamulus.git"
MY_TAGGED_VERSION=$(ver_rs 1- '_')
#EGIT_COMMIT="tags/r${MY_TAGGED_VERSION}"
SRC_URI="https://github.com/corrados/jamulus/archive/r${MY_TAGGED_VERSION}.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-qt/qtmultimedia[widgets]"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack(){
    if [[ -n ${A} ]]; then
		unpack ${A}
	fi
	echo ${WORKDIR}
	echo Package name : ${PN}
	ls ${WORKDIR}
	#ls ${S}/${WORKDIR}
	mv ${WORKDIR}/${PN}-r${MY_TAGGED_VERSION} ${WORKDIR}/${PN}-${PV}
	einfo `ls $WORKDIR`
}

src_compile(){
	qmake PREFIX=/usr
	emake
}

src_install(){
emake install INSTALL_ROOT="${D}"
}

