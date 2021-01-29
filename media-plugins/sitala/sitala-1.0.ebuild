# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://decomposer.de/sitala/releases/sitala-1.0_amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	net-libs/libcurl-debian
	net-misc/curl[curl_ssl_gnutls]
	"
BDEPEND=""
src_unpack(){
	unpack ${A}
	unpack ${WORKDIR}/data.tar.gz
	mkdir ${P}/
	mv usr/ ${P}/
	}

src_prepare(){
	ls -R ${WORKDIR}
	eapply_user
	#unpack ${WORKDIR}/data.tar.gz
	
	}

src_install(){
	exeinto /usr/bin/
	doexe usr/bin/sitala
	dodir /usr/share/sitala
	insinto /usr/share/
	doins -r usr/share/sitala
	#doicon usr/icon/sitala.png
	domenu  usr/share/applications/sitala.desktop
	exeinto /usr/lib64/vst/
	doexe usr/lib/lxvst/libsitala.so
	}
