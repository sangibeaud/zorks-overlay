# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION=""
HOMEPAGE=""
EGIT_REPO_URI="https://github.com/steinbergmedia/vst3sdk.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=" examples vst2"

DEPEND=" examples? ( x11-libs/cairo[xcb] )"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	cd ${S}
	#git submodule init
	eapply_user
}

src_compile() {
	if use examples;
	then
		cd ${WORKDIR}
		cd ${S}
		mkdir build
		cd build
		#cmake ../vst3sdk
		cmake ..
		elog Now build the example Plug-in
		make
	fi
}
