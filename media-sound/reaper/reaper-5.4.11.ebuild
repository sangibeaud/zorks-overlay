# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Reaper DAW by Cockos"
HOMEPAGE="reaper.fm"

inherit versionator
MY_PN="reaper"
MY_PV=$(replace_version_separator 2 '')
MY_P="${MY_PN}_${MY_PV}"

#MY_P="reaper_541r13"

SRC_URI="
	amd64? ( http://landoleet.org/dev/old/${MY_P}_developer_linux_x86_64.tar.xz -> reaper_linux_x86_64.tar.xz ) "
	
#	arm? ( http://www.landoleet.org/dev/${PN}_${PV}_developer_linux_armv7l.tar.xz -> reaper.tar.xz )



LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/libSwell
	"
src_unpack() {
    if [ "${A}" != "" ]; then
        unpack ${A}
    fi

	mv reaper_linux_x86_64/ ${PN}-${PV}/
	

}

#src_prepare() {
#	elog "nothing!"
#}


src_install() {
	#Trivial install ...
	dodir "/usr/local/lib/reaper-${PV}"
	mv "${S}/REAPER/libSwell.so" "${S}/REAPER/__libSwell.so"
    cp -r "${S}/REAPER/"* "${D}usr/local/lib/reaper-${PV}/" || die "Install failed!"
	dosym "/usr/local/lib/reaper-${PV}" "/usr/local/lib/reaper"
	dosym "/usr/local/lib/libSwell.so " "/usr/local/lib/reaper-${PV}/libSwell.so"

	dodoc readme-linux.txt REAPER/license.txt 
	einfo < readme-linux.txt
}


