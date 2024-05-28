# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Sample and MIDI device manager "
HOMEPAGE="https://dagargo.github.io/elektroid/"
#EGIT_REPO_URI="https://github.com/dagargo/elektroid/"
SRC_URI="https://github.com/dagargo/elektroid/releases/download/${PV}/elektroid-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/libzip
	media-libs/libsndfile
	x11-libs/gtk+"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure(){
	autoreconf --install
	econf
}
