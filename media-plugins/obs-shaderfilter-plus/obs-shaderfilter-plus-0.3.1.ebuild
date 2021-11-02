
# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="OBS Midi plugin"
HOMEPAGE="https://github.com/Limeth/obs-shaderfilter-plus"
SRC_URI="https://github.com/Limeth/obs-shaderfilter-plus/releases/download/v0.3.1/libobs_shaderfilter_plus_linux_x64.so"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 "

DEPEND="media-video/obs-studio"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack(){
	pwd
	mkdir ${WORKDIR}/${P}
	cp ../distdir/${A} ${WORKDIR}/${P}
}

no_src_prepare(){
	elog "source archive :"
	ls ${S}/${A}
	mv ${S}/${A} ${WORKDIR}
}

src_install(){
	exeinto /usr/lib64/obs-plugins
	doexe ${WORKDIR}/${P}/libobs_shaderfilter_plus_linux_x64.so
	}



