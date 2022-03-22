# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="OBS front end plugin to manages scenes and sources."
HOMEPAGE="https://github.com/exeldro/obs-source-copy"
#SRC_URI="https://github.com/cpyarger/obs-midi/releases/download/tag-0.9.3-ALPHA-3.66/obs-midi-Linux-0.9.3-ALPHA-3.66-x64.tar.gz"
SRC_URI="https://obsproject.com/forum/resources/source-copy.1261/version/4071/download?file=81023"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 "

DEPEND="media-video/obs-studio"
RDEPEND="${DEPEND}"
BDEPEND=""



src_unpack(){
	#elog in unpack\(\)
	#elog distdir :
	#ls ${DISTDIR}
	cp ${DISTDIR}/${A} ${T}/sc.zip
	unzip  ${T}/sc.zip
	tar -xf source-copy-*.tar.gz
	cd ${WORKDIR}
	#pwd
	mv source-copy ${P}
	#obs-source-copy-${PN} ${P}
	#ls
}

src_install(){
	exeinto /usr/lib64/obs-plugins
	mv ${WORKDIR}/${P}/bin/64bit/source-copy.so ${WORKDIR}/${P}/bin/64bit/obs-source-copy.so
	doexe ${WORKDIR}/${P}/bin/64bit/obs-source-copy.so
	mkdir -p ${D}/usr/share/obs/obs-plugins/${PN}/locale
	elog data directory created
	insinto usr/share/obs/obs-plugins/${PN}/locale
	doins ${WORKDIR}/${P}/data/locale/*
	}



