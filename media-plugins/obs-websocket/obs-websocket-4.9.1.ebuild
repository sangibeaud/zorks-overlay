# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

DESCRIPTION="OBS Web Socket server"
HOMEPAGE="https://github.com/obsproject/obs-websocket"
SRC_URI="https://github.com/obsproject/obs-websocket/releases/download/4.9.1/obs-websocket_4.9.1-1_amd64.deb"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 "

DEPEND="media-video/obs-studio"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack(){
	unpack ${A}
	cd ${WORKDIR}
	ls
	pwd
	mkdir  ${P}
	cd ${P}
	tar -xf ../data.tar.xz
}

src_install(){
	exeinto /usr/lib64/obs-plugins
	doexe ${WORKDIR}/${P}/usr/lib/obs-plugins/${PN}.so
	mkdir -p  ${WORKDIR}/${P}/usr/share/obs/obs-plugins/${PN}
	insinto ${WORKDIR}/${P}/usr/share/obs/obs-plugins/${PN}
	doins usr/share/obs/obs-plugins/${PN}/locale/*
	}



