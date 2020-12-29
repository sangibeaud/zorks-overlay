# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

DESCRIPTION="Sketching embedded digital audio"
HOMEPAGE="http://www.axoloti.com/"
SRC_URI="https://github.com/axoloti/axoloti/releases/download/${PV}/axoloti-linux-${PV}.deb"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/jdk-1.8"
BDEPEND="	dev-java/ant
	dev-java/ant-apache-bsf
	dev-java/bsf
"
OLDDEPEND_WAS="
	dev-java/ant-apache-bsf[-python]
	dev-java/bsf[-python]
	"
RDEPEND="${DEPEND}"


src_unpack(){
	unpack_deb ${A}
#mkdir -p ${WORKDIR}/foo
mkdir -p ${WORKDIR}/${PN}-${PV}
elog "Nthing to prepare"
}

src_install(){
	ls ${WORKDIR}
	#cp -R "${WORKDIR}/opt" "${D}-${PV}" || die "install failed!"
	mv ${WORKDIR}/opt/Axoloti ${WORKDIR}/opt/Axoloti-${PV}
	cp -R "${WORKDIR}/opt" "${D}" || die "install failed!"
}
