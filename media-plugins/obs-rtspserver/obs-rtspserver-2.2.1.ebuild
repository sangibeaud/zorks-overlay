
# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="RTSP server plugin for obs-studio "
HOMEPAGE="https://obsproject.com/forum/resources/obs-rtspserver.1037/"
SRC_URI="https://github.com/iamscottxu/obs-rtspserver/releases/download/v2.2.1/obs-rtspserver-v2.2.1-linux.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 "

DEPEND="media-video/obs-studio"
RDEPEND="${DEPEND}"
BDEPEND=""

BASENAME="obs-rtspserver-v${PV}-linux"

src_unpack(){
	pwd
	ls
	unpack ${A}
	ls
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
	doexe ${WORKDIR}/${P}/usr/lib/obs-plugins/obs-rtspserver.so
	insinto /usr/share/obs/obs-plugins/obs-rtspserver/
	elog install from : usr/share/obs/obs-plugins/obs-rtspserver/
	ls ${S}/ usr/share/obs/obs-plugins/obs-rtspserver/
	doins -r usr/share/obs/obs-plugins/obs-rtspserver/locale
	#doins data/default_move.effect
	}



