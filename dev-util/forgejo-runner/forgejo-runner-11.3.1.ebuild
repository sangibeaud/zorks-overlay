# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="forgejo runner"
HOMEPAGE="https://code.forgejo.org/forgejo/runner/releases"
SRC_URI="https://code.forgejo.org/forgejo/runner/archive/v${PV}.tar.gz"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-lang/go
	"
RDEPEND="${DEPEND}"
BDEPEND=""


src_unpack(){
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
	mv ${WORKDIR}/runner ${WORKDIR}/${PN}-${PV}
}
