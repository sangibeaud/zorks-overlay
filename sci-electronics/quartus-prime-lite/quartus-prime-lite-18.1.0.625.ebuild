# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils

DESCRIPTION="Full-featured EDA product for altera devices"
HOMEPAGE="https://www.altera.com/products/design-software/fpga-design/quartus-prime/overview.html"
SRC_URI="Quartus-lite-${PV}-linux.tar"
# variable to store the download URL
DOWNLOADPAGE="http://dl.altera.com/?edition=lite"

LICENSE="Quartus-prime-megacore"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=" \
	dev-libs/expat \
	media-libs/fontconfig \
	media-libs/freetype \
	media-libs/libcanberra \
	>=media-libs/libpng-1.2 \
	x11-libs/libICE \
	x11-libs/libSM \
	sys-apps/util-linux \
	sys-libs/ncurses \
	dev-lang/tcl \
	sys-libs/zlib \
	x11-libs/libx11 \
	x11-libs/libxau \
	x11-libs/libxdmcp \
	x11-libs/libxext \
	x11-libs/libxft \
	x11-libs/libxrender \
	x11-libs/libxt \
	x11-libs/libxtst"
# 32bit versions : lib32-expat lib32-fontconfig lib32-freetype2 lib32-glibc lib32-gtk2 lib32-libcanberra lib32-libpng lib32-libpng12 lib32-libice lib32-libsm lib32-util-linux lib32-ncurses lib32-zlib lib32-libx11 lib32-libxau lib32-libxdmcp lib32-libxext lib32-libxft lib32-libxrender lib32-libxt lib32-libxtst."

RDEPEND="media-libs/libpng:1.2"

RESTRICT="fetch bindist"

S=${WORKDIR}

pkg_nofetch() {
	elog "Due to licensing restrictions, you need to download the distfile manually."
	elog "Please navigate to ${DOWNLOADPAGE}"
	elog "Sign in with your Altera account (you need to register)"
	elog "Download ${SRC_URI} and place it into ${DISTDIR}"
	elog "And restart the installation."
}

pkg_pretend() {
	einfo "The checksum and unpack will take quite some time to run"
}

src_install() {
	einfo "The Quartus install runs in unattended mode"
	einfo "you wont see much and it will take a long time"

	./setup.sh --mode unattended --unattendedmodeui none \
		--installdir "${D}/opt/quartus-lite-${PV}"
	make_desktop_entry "/opt/quartus-lite-${PV}/quartus/bin/quartus" \
		"Quartus lite ${PV}" "/opt/quartus-lite-${PV}/quartus/adm/quartusii.png"
}

pkg_postinst() {
	elog "To launch Quartus, run /opt/quartus-lite-${PV}/quartus/bin/quartus"
}
