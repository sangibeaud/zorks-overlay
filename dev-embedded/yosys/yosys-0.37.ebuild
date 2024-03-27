# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{8,9,10,11} )
#inherit git-r3 python-any-r1
inherit git-r3 python-any-r1

DESCRIPTION="Yosys - Yosys Open SYnthesis Suite"
HOMEPAGE="http://yosysht.net/yosys"
LICENSE="ISC"
#SRC_URI="https://github.com/YosysHQ/yosys/archive/refs/tags/${P}.tar.gz"
#SRC_URI="https://github.com/cliffordwolf/${PN}/archive/${P}.tar.gz"
EGIT_REPO_URI="https://github.com/YosysHQ/yosys.git"
EGIT_SUBMODULES=( abc )


SLOT="0"
KEYWORDS="amd64"
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

#S="${WORKDIR}/${PN}-${P}"

src_unpack(){
	default

	git-r3_src_unpack
}

src_configure() {
	emake config-gcc
	echo "ENABLE_ABC := 1" >> "${S}/Makefile.conf"
}

src_compile() {
	emake ENABLE_ABC=1 PREFIX="${EPREFIX}/usr"
}

src_install() {
	emake ENABLE_ABC=1 PREFIX="${ED}/usr" install
}
