# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} pypy3 )

inherit distutils-r1  git-r3

DESCRIPTION="Openbox Key Editor "
HOMEPAGE="http://code.google.com/p/obkey"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/luffah/obkey.git"
#EGIT_COMMIT="tags/v1.3"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


