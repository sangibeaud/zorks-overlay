# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="traktion waveform"
HOMEPAGE=""
SRC_URI="https://cdn.tracktion.com/file/tracktiondownload/waveform/11026/waveform_64bit_v11.0.26.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	mkdir ${S}
	cd ${S}
	elog `pwd`
	ar x ${DISTDIR}/waveform_64bit_v11.0.26.deb
	tar -xvf data.tar.xz
}


src_install () {
	elog `pwd`
	elog `ls ${S}`
	exeinto /usr/bin
	doexe usr/bin/*
	elog exes done !
	insinto  /usr/share
	doins -r usr/share/*
}

 
pkg_postinst(){
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	}

pkg_postrm(){
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	}
