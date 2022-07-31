# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils

DESCRIPTION="Open source polyphonic software synthesizer with lots of modulation"
HOMEPAGE="http://tytel.org/helm/"
EGIT_REPO_URI="https://github.com/mtytel/helm.git"
#EGIT_TAG="0.5.0"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/alsa-lib
	media-libs/freetype
	media-libs/lv2
	virtual/jack
	virtual/opengl
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXext
	x11-libs/libXinerama
	x11-libs/libXrandr
	"
DEPEND="${RDEPEND}"


#src_fetch() {
#	git-r3_fetch
#}


#src_prepare() {
#	epatch "${FILESDIR}"/${P}-gcc6.patch
#	rm patches/Synth/.DS_Store || die
#	sed -e 's|/usr/lib/|/usr/'$(get_libdir)'/|' -i Makefile || die
#	epatch_user
#}

src_compile() {
#	emake PREFIX=/usr all
	make 
}

#src_install() {
#	default
#	make_desktop_entry /usr/bin/helm Helm /usr/share/helm/icons/helm_icon_32_1x.png
#}

