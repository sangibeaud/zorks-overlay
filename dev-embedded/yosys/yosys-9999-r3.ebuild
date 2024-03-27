# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{4,5,6,7,8,9,10,11} )
inherit git-r3 python-any-r1

DESCRIPTION="Yosys - Yosys Open SYnthesis Suite"
HOMEPAGE="http://www.clifford.at/icestorm/"
LICENSE="ISC"
EGIT_REPO_URI="https://github.com/YosysHQ/yosys.git"
EGIT_REPO_URI_ABC="https://github.com/YosisHQ/abc.git"

SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	sys-libs/readline:=
	dev-libs/libffi
	dev-vcs/git
	dev-lang/tcl:=
	dev-vcs/mercurial"

DEPEND="
	${PYTHON_DEPS}
	sys-devel/bison
	sys-devel/flex
	sys-apps/gawk
	virtual/pkgconfig
	${RDEPEND}"

S="${WORKDIR}/${PN}-${PV}"
no_src_configure() {
	emake config-gcc
	echo "ENABLE_ABC := 1" >> "${S}/Makefile.conf"
}

EGIT_REPO_URI_ABC="http://github.com/YosisHQ/abc.git"

no_src_unpack() {
    git-r3_src_unpack
    EGIT_REPO_URI=$EGIT_REPO_URI_ABC
    EGIT_CHECKOUT_DIR=${WORKDIR}/${P}/abc/
    EGIT_CHECKOUT_DIR=${S}/abc/
	ABCREV= $(egrep "ABCREV" ${S}/Makefile)
	elog At ABC revision : $ABCREV
	EGIT_REV=$ABCREV
    git-r3_src_unpack
}


src_compile() {
	ln -s /opt/yosys-abc/ ${S}/abc
	emake ENABLE_ABC=1 ABCURL="https://github.com/YosysHQ/abc.git" PREFIX="${EPREFIX}/usr"
}

src_install() {
	emake ENABLE_ABC=1 PREFIX="${ED}/usr" install
}
