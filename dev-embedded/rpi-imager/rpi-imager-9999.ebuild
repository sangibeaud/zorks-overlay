# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="INtercaive tool for preparing and wrting rapsberry Pi images"
HOMEPAGE="raspberrypi/rpi-imager"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/raspberrypi/rpi-imager"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare(){
	cmake ${$WORKDIR}/src/
    
}


