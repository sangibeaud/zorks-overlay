# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Run your GitHub Actions locally"
HOMEPAGE="https://github.com/nektos/act"
SRC_URI="https://github.com/nektos/act/releases/download/v0.2.60/act_Linux_x86_64.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PRESTRIPPED="/usr/bin/ghaction"

src_unpack(){
	mkdir -p ${WORKDIR}/${P}
	cd ${WORKDIR}/${P}

	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
}

src_prepare(){
	mv act ghaction
	eapply_user
}

src_install(){
	dobin ghaction
	dodoc README.md LICENSE
}
