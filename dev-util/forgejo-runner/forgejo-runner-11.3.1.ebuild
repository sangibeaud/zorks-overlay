# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#inherit go-module

DESCRIPTION="forgejo runner"
HOMEPAGE="https://code.forgejo.org/forgejo/runner/releases"
#SRC_URI="https://code.forgejo.org/forgejo/runner/archive/v${PV}.tar.gz"
SRC_URI="https://code.forgejo.org/forgejo/runner/releases/download/v${PV}/${P}-linux-amd64.xz"
#	arm64? https://code.forgejo.org/forgejo/runner/releases/download/v${PV}/${P}-linux-arm64.xz"
LICENSE="GPL3"
SLOT="0"
KEYWORDS=""

DEPEND="
	acct-group/forgejo-runner
	acct-user/forgejo-runner
	app-containers/docker
	"
RDEPEND="${DEPEND}"
BDEPEND=""


no_src_unpack(){
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
	mv ${WORKDIR}/${P}-linux-amd64 ${WORKDIR}/${PN}-${PV}
}

