# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="OBS Advanced Scene swithcer  plugin"
HOMEPAGE="https://github.com/WarmUpTill/SceneSwitcher"
#SRC_URI="https://github.com/WarmUpTill/SceneSwitcher/releases/download/1.16.1/SceneSwitcher.zip"
EGIT_REPO_URI="https://github.com/WarmUpTill/SceneSwitcher/"

LICENSE="GPL"
SLOT="0"
KEYWORDS=""

DEPEND="media-video/obs-studio
	>=media-libs/opencv-4.2
	=media-libs/opencv-compat-4.2"
RDEPEND="${DEPEND}"
BDEPEND=""


src_install(){
	exeinto /usr/lib64/obs-plugins
	doexe ${WORKDIR}/${P}/bin/64bit/advanced-scene-switcher.so

	#dodir  /usr/share/obs/obs-plugins/${PN}
	#insinto /usr/share/obs/obs-plugins/${PN}
	dodir  /usr/share/obs/obs-plugins/advanced-scene-switcher
	insinto /usr/share/obs/obs-plugins/advanced-scene-switcher
	doins -r ${WORKDIR}/${P}/data/*

	}




src_compile(){

	cmake -DBUILD_OUT_OF_TREE=1 -DLIBOBS_INCLUDE_DIR=[...]/obs-studio/libobs/ -DLIBOBS_LIB=[...]/libobs.so -DLIBOBS_FRONTEND_INCLUDE_DIR=[...]/obs-studio/UI/obs-frontend-api/ -DLIBOBS_FRONTEND_API_LIB=/usr/lib64/libobs-frontend-api.so -DCMAKE_INSTALL_PREFIX=/usr .. 

}
