# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="OBS Midi plugin"
HOMEPAGE="https://github.com/cpyarger/obs-midi"
SRC_URI="https://github.com/cpyarger/obs-midi/releases/download/tag-0.9.3-ALPHA-3.66/obs-midi-Linux-0.9.3-ALPHA-3.66-x64.tar.gz"

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
	mv obs-studio ${P}
	ls
}

src_install(){
	exeinto /usr/lib64/obs-plugins
	doexe ${WORKDIR}/${P}/plugins/obs-midi/bin/64bit/obs-midi.so
	}



