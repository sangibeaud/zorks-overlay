# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_10 )
PYTHON_REQ_USE='threads(+)'
NO_WAF_LIBDIR=yes

inherit git-r3 python-any-r1 meson
#waf-utils

DESCRIPTION="Audio plugin host"
HOMEPAGE="https://kushview.net/element/"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/kushview/Element.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


