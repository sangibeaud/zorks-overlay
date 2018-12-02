# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="EDA product for altera devices virtual install environment"
HOMEPAGE="https://www.altera.com/products/design-software/fpga-design/quartus-prime/overview.html"
################################SRC_URI="Quartus-lite-${PV}-linux.tar"
# variable to store the download URLS
DOWNLOADPAGE="http://dl.altera.com/?edition=lite"
DOWNLOADFT="https://raw.githubusercontent.com/brendanhoran/gentoo-custom/master/files/libfreetype.so.6"

LICENSE="Quartus-prime-megacore"
SLOT="0"

# No keywords as per bug 575684
KEYWORDS="~amd64"
IUSE="-bindist -doc -examples minimal"

DEPEND="media-libs/libpng:1.2[abi_x86_32]
		x11-libs/libXft[abi_x86_32]
		app-arch/bzip2[abi_x86_32]
		sys-libs/zlib[abi_x86_32]
		sys-libs/glibc[multilib]"

#RESTRICT="fetch bindist"

#S=${WORKDIR}

pkg_nofetch() {
	elog "Due to licensing restrictions, and old libary versions."
	elog "You need to download the distfiles manually."
	elog "-------------------------------------------------------"
	elog "For Quartus :"
	elog "Please navigate to ${DOWNLOADPAGE}"
	elog "Sign in with your Altera account (you need to register)"
	elog "Download Quartus-lite-${PV}-linux.tar  and place it into \${DISTDIR}"
	elog "And restart the installation."
}

pkg_pretend() {
	einfo "The checksum and unpack will take quite some time to run"
}

src_unpack() {
	mkdir ${WORKDIR}/${P}
	touch ${S}/.keep
}

src_install() {
	einfo "The Quartus install runs in unattended mode"
	einfo "you wont see much and it will take a long time"

	#./setup.sh --mode unattended --unattendedmodeui none \
	#	--installdir "${D}/opt/quartus-lite-${PV}" || die
	#make_desktop_entry "/opt/quartus-lite-${PV}/quartus/bin/quartus" \
	#	"Quartus lite ${PV}" "/opt/quartus-lite-${PV}/quartus/adm/quartusii.png"
}

pkg_postinst() {
	elog "To launch Quartus, run /opt/quartus-lite-${PV}/quartus/bin/quartus"
}
