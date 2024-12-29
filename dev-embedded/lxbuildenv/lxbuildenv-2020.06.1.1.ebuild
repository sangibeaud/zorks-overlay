# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..13} pypy3 )


inherit git-r3 distutils-r1

DESCRIPTION="Simple LiteX Build Environment"
HOMEPAGE="https://github.com/xobs/lxbuildenv"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/xobs/lxbuildenv.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


pkg_setup(){
	if [ ${PV} == "9999" ]; then
		einfo builing edge git commit 9999
	else
		EGIT_COMMIT="v${PV}"
		einfo building tagged version "v${PV}"
	fi
}

