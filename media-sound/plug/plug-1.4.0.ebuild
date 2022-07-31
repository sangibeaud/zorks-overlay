# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6


inherit git-r3 cmake-utils

DESCRIPTION="Software for Fender Mustang Amps. This is a fork of piorekf's Plug."
HOMEPAGE="https://github.com/offa/plug"
EGIT_REPO_URI="https://github.com/offa/plug"
EGIT_COMMIT="tags/v1.4.0"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=" >=dev-util/cmake-3.12.0
	dev-libs/libusb
	>=dev-qt/qtcore-5
	>=dev-qt/qtwidgets-5
	>=dev-qt/qtgui-5
	"
RDEPEND="${DEPEND}"
BDEPEND=""


src_prepare() {
	cd ${S}
	epatch "${FILESDIR}/${PN}-Werror.patch"
	sed -i "s/\/lib\/udev\/rules.d/\/etc\/udev\/rules.d/" cmake/Install.cmake
	sed -i "s/\/lib\/share\/applications/\/usr\/share\/applications/" cmake/Install.cmake
	#epatch "${FILESDIR}/${PN}-cmake.patch"
}

src_configure() {
    local mycmakeargs=(
	 -DUNITTEST=OFF
	)
    cmake-utils_src_configure

}

dummy_src_compile() {
	cd ${S}/build/
	emake
}
