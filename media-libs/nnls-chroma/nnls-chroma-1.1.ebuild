# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Analyses a single channel of audio input ofthe Vamp host"
HOMEPAGE="http://www.isophonics.net/nnls-chroma"
SRC_URI="https://code.soundsoftware.ac.uk/attachments/download/1691/nnls-chroma-1.1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/pygtksourceview-2.10.1-r1 
	>=media-libs/libsmf-1.3 
	>=x11-libs/gtksourceview-2.10.5-r3 
	>=media-libs/vamp-plugin-sdk-2.7.1
"
RDEPEND="${DEPEND}"

src_compile() {
	emake -f Makefile.linux
	emake -f Makefile.linux Chordino
	emake -f Makefile.linux Tuning

	}

src_install() {
	dodoc CITATION COPYING README releasenotes-*.txt

	insinto /usr/lib64/vamp
	doins nnls-chroma.cat
	doins nnls-chroma.n3
	doins nnls-chroma.so
	fperms 0755 /usr/lib64/vamp/nnls-chroma.so
}

