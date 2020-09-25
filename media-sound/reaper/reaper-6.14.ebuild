# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Reaper DAW by Cockos"
HOMEPAGE="reaper.fm"

inherit versionator
MY_PN="reaper"
#MY_PV=$(replace_version_separator 2 '')
MY_PV=$(replace_all_version_separators '')
MY_P="${MY_PN}_${MY_PV}"
MY_P="${MY_PN}${MY_PV}"

#MY_P="reaper_550rc1"

SRC_URI="
	amd64? ( https://landoleet.org/old/${MY_P}_linux_x86_64.tar.xz -> reaper_linux_x86_64-${PV}.tar.xz ) "
#	amd64? ( https://landoleet.org/dev/old/reaper_550rc1_developer_linux_x86_64.tar.xz -> reaper_linux_x86_64.tar.xz ) "
#                https://landoleet.org/dev/old/reaper_550rc1_developer_linux_x86_64.tar.xz	
#	arm? ( http://www.landoleet.org/dev/${PN}_${PV}_developer_linux_armv7l.tar.xz -> reaper.tar.xz )



LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/libswell
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
	exeinto "/usr/local/lib/reaper-${PV}"

	mv "${S}/REAPER/libSwell.so" "${S}/REAPER/__libSwell.so"
	doexe REAPER/reaper
	doexe REAPER/reamote-server
	cp  "${S}/REAPER/license.txt" "${D}usr/local/lib/reaper-${PV}/"
	#cp  "${S}/REAPER/tips.txt" "${D}usr/local/lib/reaper-${PV}/"
	cp  "${S}/REAPER/whatsnew.txt" "${D}usr/local/lib/reaper-${PV}/"
	insinto "/usr/local/lib/reaper-${PV}"
    #doins -r "${S}/REAPER/"* "${D}usr/local/lib/reaper-${PV}/" || die "Install failed!"
    #doexe  "${S}/REAPER/"*  || die "Install failed!"
	dosym "/usr/local/lib/reaper-${PV}" "/usr/local/lib/reaper"
	dosym "/usr/local/lib/libSwell.so" "/usr/local/lib/reaper-${PV}/libSwell.so"

	#All the documentation
	dodoc readme-linux.txt REAPER/license.txt REAPER/whatsnew.txt
	# dodoc REAPER/tips.txt 
	#"Docs/REAPER Quick Start.pdf" 
	
	#everything else the dirty way
	cp -r "${S}/REAPER/Plugins" "${D}usr/local/lib/reaper-${PV}/" || die "Install failed!"
	cp -r "${S}/REAPER/InstallData" "${D}usr/local/lib/reaper-${PV}/" || die "Install failed!"
	cp -r "${S}/REAPER/Resources" "${D}usr/local/lib/reaper-${PV}/" || die "Install failed!"

	#
	einfo < readme-linux.txt
	echo "[Desktop Entry]
Name=Reaper
Exec=reaper
Icon=reaper
Type=Application
Categories=AudioVideo;Audio" >> ${S}/reaper.desktop
	mkdir -p ${D}usr/share/applications/
	cp ${S}/reaper.desktop "${D}usr/share/applications/" || die "Install failed!"

	
}


