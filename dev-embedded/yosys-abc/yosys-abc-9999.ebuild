# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Yosys version of Berkley ABC, RTL optimization "
HOMEPAGE="https://github.com/YosysHQ/abc.git"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/YosysHQ/abc.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
	mkdir -p ${D}/opt/yosys-abc/
	exeinto /opt/yosys-abc/
	insinto /opt/yosys-abc/
	doins *
	doexe abc
}

