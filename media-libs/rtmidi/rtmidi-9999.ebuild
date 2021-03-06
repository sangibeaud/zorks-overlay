# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools git-r3

DESCRIPTION="common C++ API for realtime MIDI input/output"
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="https://github.com/thestk/rtmidi.git"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS=""
IUSE="+alsa doc +jack"
RDEPEND="alsa? ( media-libs/alsa-lib )
	jack? ( media-sound/jack-audio-connection-kit )"

DEPEND="${RDEPEND}"

my_src_prepare() {
#	epatch "${FILESDIR}/${P}_buildsystem.patch"
	eautoreconf
#	eapply_user
}

src_configure() {
	econf $(use_with alsa) \
	$(use_with jack) || die "./configure failed"
}

#src_compile() {
#	emake -j1 || die "make failed"
#}

#src_install() {
#	dodoc readme
#	if use doc; then
#		dodoc doc/release.txt
#		dohtml doc/html/*
#	fi
#	dolib.so librtmidi.so.1.2.0.1
#	dosym "librtmidi.so.1.2.0.1" "/usr/$(get_libdir)/librtmidi.so"
#	dosym "librtmidi.so.1.2.0.1" "/usr/$(get_libdir)/librtmidi.so.1"
#	insinto /usr/$(get_libdir)/pkgconfig
#	doins rtmidi.pc
#	insinto /usr/include
#	doins RtMidi.h RtError.h
#}
