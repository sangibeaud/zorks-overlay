# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="compatibility with v4.2 or libraries"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=media-libs/opencv-4"
RDEPEND="${DEPEND}"
BDEPEND=""

MYVERS={PV}

src_unpack(){
	mkdir ${WORKDIR}/${P}
}

src_install(){

	for thisone in core imgproc objdetect; do
                dosym ./libopencv_${thisone}.so /usr/$(get_libdir)/libopencv-${thisone}.so.${PV}
        done
}

