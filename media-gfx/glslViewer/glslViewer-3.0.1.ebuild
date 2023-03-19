# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="iCommand line glsl viewer"
HOMEPAGE="http://patriciogonzalezvivo.com/2015/glslViewer/"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/patriciogonzalezvivo/glslViewer.git"
EGIT_COMMIT="${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="media-libs/glu
	media-libs/glfw
	media-video/ffmpeg"

RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES="${FILESDIR}/add-tinfo-library.patch"

no_src_compile(){
	PREFIX=/usr emake
	}

no_src_install(){
	exeinto /usr/bin
	doexe ${S}/${PN}
	}
