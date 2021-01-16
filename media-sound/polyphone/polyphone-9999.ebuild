# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 xdg-utils

DESCRIPTION="open-source soundfont editor for creating musical instruments"
HOMEPAGE="https://github.com/davy7125/polyphone"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/davy7125/polyphone.git"

LICENSE=""
SLOT="0"
KEYWORDS=""

DEPEND="dev-libs/qcustomplot
	media-libs/rtmidi
	media-libs/portaudio
	"
NO_DEPEND="libFLAC.so=8-64 (flac)
libjack.so=0-64 (jack, jack2)
libogg.so=0-64 (libogg)
libportaudio.so=2-64 (portaudio)
libqcustomplot.so=2-64 (qcustomplot)
libstk-4.6.1.so=libstk-4.6.1.so-64 (stk)
libvorbis.so=0-64 (libvorbis)
libvorbisenc.so=2-64 (libvorbis)
libvorbisfile.so=3-64 (libvorbis)
openssl
qt5-base
qt5-svg
rtmidi
zlib
flac (make)
jack (make)
libogg (make)
libvorbis (make)
portaudio (make)
qcustomplot (make)
qt5-tools (make)
stk (make) "

RDEPEND="${DEPEND}"
BDEPEND=""

src_compile(){
	cd ${S}
	mkdir build
	cd build
	qmake -qt5 PREFIX=/usr ../sources || die "Qmake choked"
	emake
	}

src_install(){
	cd ${S}/build
	emake install INSTALL_ROOT="${D}" 
	}

pkg_postinst(){
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	}

pkg_postrm(){
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	}

