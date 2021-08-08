# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="openc++ framework"
HOMEPAGE="https://openframeworks.cc"
#SRC_URI="https://openframeworks.cc/versions/v0.11.2/of_v0.11.2_linux64gcc6_release.tar.gz"
SRC_URI="https://openframeworks.cc/versions/v${PV}/of_v${PV}_linux64gcc6_release.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	gnome-base/gconf
	media-libs/openal 
	media-libs/glew 
	media-libs/freeglut 
	media-libs/freeimage 
	media-libs/gstreamer 
	media-libs/gst-plugins-base
	media-libs/gst-plugins-good 
	media-libs/gst-plugins-bad
	media-plugins/gst-plugins-libav 
	media-libs/opencv 
	x11-libs/libXcursor 
	media-libs/assimp 
	dev-libs/boost 
	media-libs/glfw 
	dev-libs/uriparser[doc] 
	net-misc/curl 
	dev-libs/pugixml 
	media-libs/rtaudio 
	dev-libs/poco
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	unpack ${A}
	ls
	mv of* ${P}
}

src_compile(){
	cd ${WORKDIR}/${P}/scripts/linux
	./compileOF.sh -j3

	# tesing with some exmaple
	cd ${WORKDIR}/${P}/examples/graphics/polygonExample
	make
	make run

	cd ${WORKDIR}/${P}/scripts/linux
	./compilePG.sh

	}


src_install(){
	mkdir -p ${D}/opt/
	cp -r ${WORKDIR}/${P} ${D}/opt/

}

no_src_prepare() {
	cd ${S}
	pwd
	}
