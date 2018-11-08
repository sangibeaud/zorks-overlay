# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="An integrated system for Impulse Response measurements"
HOMEPAGE="http://kokkinizita.linuxaudio.org/linuxaudio/"
SRC_URI="http://kokkinizita.linuxaudio.org/linuxaudio/downloads/aliki-0.3.0.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=media-libs/zita-alsa-pcmi-0.2.0
	>=dev-lib/libclthreads-2.4
	>=media-libs/libclxclient-3.9
	media-libs/libsndfile
	media-libs/alsa-libs
	media-sound/jack-audio-connection-kit
	"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake -C ${S}/source PREFIX=/usr aliki
	emake -C ${S}/source PREFIX=/usr aliki-rt
}

src_install() {
	mkdir -p ${D}/usr/bin
	emake -C ${S}/source DESTDIR=${D} PREFIX=/usr install

	dodoc README INSTALL COPYING AUTHORS doc/*
}



