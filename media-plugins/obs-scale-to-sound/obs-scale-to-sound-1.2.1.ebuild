
# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Plugin for OBS Studio that adds a filter which makes a source scale based on the audio levels of any audio source you choose"
HOMEPAGE="https://obsproject.com/forum/resources/scale-to-sound.1336/"
SRC_URI="https://github.com/Qufyy/obs-scale-to-sound/releases/download/1.2.1/obs-scale-to-sound-1.2.1-linux64.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 "

DEPEND="media-video/obs-studio"
RDEPEND="${DEPEND}"
BDEPEND=""

BASENAME="scale-to-sound"

src_unpack(){
	pwd
	ls
	unpack ${A}
	mv ${BASENAME} ${P}
	#cp ../distdir/${A} ${WORKDIR}/${P}
}

src_prepare(){
	elog "source archive :"
	ls ${S}
	#mv ${S}/${PN} ${$P}
	eapply_user
}

src_install(){
	exeinto /usr/lib64/obs-plugins/
	doexe ${WORKDIR}/${P}/bin/64bit/scale-to-sound.so
	insinto /usr/share/obs/obs-plugins/scale-to-sound/
	doins data/default_move.effect
	}



