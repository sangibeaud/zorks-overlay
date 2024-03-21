# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="eCantorix is a singing synthesis frontend for espeak"
HOMEPAGE="https://github.com/divVerent/ecantorix"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/divVerent/ecantorix"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-accessibility/espeak-ng
	media-sound/sox"
RDEPEND="${DEPEND}"
BDEPEND=""
