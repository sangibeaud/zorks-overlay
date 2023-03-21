# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="OBS Advanced Scene Switcher"
HOMEPAGE="https://github.com/WarmUpTill/SceneSwitcher"
SRC_URI="https://github.com/WarmUpTill/SceneSwitcher/releases/download/${PV}/SceneSwitcher.zip"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 "

DEPEND="media-video/obs-studio
	>=media-libs/opencv-4.2
	>=media-libs/opencv-compat-4.2"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack(){
	unpack ${A}
	cd ${WORKDIR}
	ls
	pwd
	mv SceneSwitcher/Linux/advanced-scene-switcher ${P}
	ls
}

src_install(){
	exeinto /usr/lib64/obs-plugins
	doexe ${WORKDIR}/${P}/bin/64bit/advanced-scene-switcher.so

	#dodir  /usr/share/obs/obs-plugins/${PN}
	#insinto /usr/share/obs/obs-plugins/${PN}
	dodir  /usr/share/obs/obs-plugins/advanced-scene-switcher
	insinto /usr/share/obs/obs-plugins/advanced-scene-switcher
	doins -r ${WORKDIR}/${P}/data/*

	}




