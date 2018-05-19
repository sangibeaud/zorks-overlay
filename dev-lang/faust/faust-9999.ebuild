# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Faust programming language"
HOMEPAGE="https://github.com/grame-cncm/faust"
#SRC_URI="https://github.com/grame-cncm/faust.git"
EGIT_REPO_URI="https://github.com/grame-cncm/faust.git"

LICENSE="iGPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	cd $S
	git submodule update --init

	eapply_user
}



