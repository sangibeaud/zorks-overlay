# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="experimental LV2 to VST2.x wrapper"
HOMEPAGE="https://github.com/x42/lv2vst"
EGIT_REPO_URI="https://github.com/x42/lv2vst.git"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
	mkdir -p ${D}/usr/lib64/vst/lv2vst
	elog destination directory created
	exeinto /usr/lib64/vst/lv2vst/
	doexe lv2vst.so 
	#doins ${WORKDIR}/${P}/lv2vst.so ${D}/usr/lib64/vst/lv2vst/
}
