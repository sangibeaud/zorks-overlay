# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

DESCRIPTION="Sketching embedded digital audio"
HOMEPAGE="http://www.axoloti.com/"
SRC_URI="https://github.com/axoloti/axoloti/releases/download/2.0.0/axoloti-linux-2.0.0.deb"

LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=virtual/jdk-1.8
	dev-java/ant
	dev-java/ant-apache-bsf[-python]
	dev-java/bsf[-python]
	"
RDEPEND="${DEPEND}"
BDEPEND=""


src_unpack(){
	unpack_deb ${A}
mkdir -p ${WORKDIR}/foo
mkdir -p ${WORKDIR}/${PN}-${PV}
elog "Nthing to prepare"
}

src_install(){
	ls ${WORKDIR}
	cp -R "${WORKDIR}/opt" "${D}" || die "install failed!"
}
