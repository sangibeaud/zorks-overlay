# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="iCommand line glsl viewer"
HOMEPAGE="http://patriciogonzalezvivo.com/2015/glslViewer/"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/patriciogonzalezvivo/glslViewer.git"

LICENSE=""
SLOT="0"
KEYWORDS=""

DEPEND="media-libs/glu
	media-libs/glfw
	x11-libs/libXinerama
	media-video/ffmpeg"

RDEPEND="${DEPEND}"
BDEPEND=""
