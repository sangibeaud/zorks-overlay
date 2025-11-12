# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="Interactive tool for preparing and wrting rapsberry Pi images"
HOMEPAGE="raspberrypi/rpi-imager"
SRC_URI="https://downloads.raspberrypi.com/imager/imager_${PV}_amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


QA_PRESTRIPPED="usr/bin/rpi-imager"

S=${WORKDIR}

src_unpack(){
	unpack_deb ${A}
}

src_install(){
	docompress -x /usr/share/doc
	dodoc usr/share/doc/rpi-imager-amd64/*
	insinto /usr/share
	doins -r usr/share/{applications,icons,metainfo}
	exeinto /usr/bin/
	doexe usr/bin/rpi-imager
}

pkg_postinst(){
	xdg_icon_cache_update
}

pkg_postrm(){
	xdg_icon_cache_update
}
