# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="Plugin to add a filter called Scale To Sound which makes a source scale based on the audio levels of any audio source you choose. "
HOMEPAGE="https://obsproject.com/forum/resources/scale-to-sound.1336/"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/Qufyy/obs-scale-to-sound.git"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS=""

DEPEND="media-video/obs-studio"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure(){
	local mycmakeargs=("-DBUILD_STANDALONE=1") 
	cmake_src_configure
	}
