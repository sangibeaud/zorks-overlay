# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="NNLS Chroma analyses a single channel of audio using frame-wise spectral input from the Vamp host"
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

	}

