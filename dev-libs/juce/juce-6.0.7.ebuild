# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/juce-framework/JUCE/archive/${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/juce-framework/JUCE.git"
fi

DESCRIPTION="A cross-platform C++ framework"
HOMEPAGE="https://juce.com/"
LICENSE="juce-6"
SLOT="6.0.7"
IUSE="+projucer extras examples"

DEPEND="
	media-libs/alsa-lib
	media-libs/freetype:2
	net-libs/webkit-gtk
	net-misc/curl
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-util/cmake-3.12
	virtual/pkgconfig
"

src_unpack() {
	default
	mv "${WORKDIR}/JUCE-${PV}" "${WORKDIR}/${P}"
}

src_configure() {
	local mycmakeargs=(
		"-DJUCE_BUILD_EXAMPLES="$(usex examples ON OFF)
	)
	if use projucer || use extras ; then
		mycmakeargs+=("-DJUCE_BUILD_EXTRAS=ON")
	else
		mycmakeargs+=("-DJUCE_BUILD_EXTRAS=OFF")
	fi
	if use projucer && ! use extras ; then
		cd extras
		cmake_comment_add_subdirectory AudioPerformanceTest
		cmake_comment_add_subdirectory AudioPluginHost
		cmake_comment_add_subdirectory BinaryBuilder
		cmake_comment_add_subdirectory NetworkGraphicsDemo
		cmake_comment_add_subdirectory UnitTestRunner
		cd ..
	fi
	cmake_src_configure
}

src_install() {
	# Install JUCE to /opt
	dodir /opt
	cp -r "${S}/" "${D}/opt/${P}/" || die
	# Move programs to JUCE folder
	cp "${BUILD_DIR}/tools/extras/Build/juceaide/juceaide_artefacts/Debug/juceaide" "${D}/opt/${P}/"
	if use projucer || use extras ; then
		cp "${BUILD_DIR}/extras/Projucer/Projucer_artefacts/${CMAKE_BUILD_TYPE}/Projucer" "${D}/opt/${P}/"
	fi
	if use extras ; then
		cp "${BUILD_DIR}/extras/AudioPerformanceTest/AudioPerformanceTest_artefacts/${CMAKE_BUILD_TYPE}/AudioPerformanceTest" "${D}/opt/${P}/"
		cp "${BUILD_DIR}/extras/AudioPluginHost/AudioPluginHost_artefacts/${CMAKE_BUILD_TYPE}/AudioPluginHost" "${D}/opt/${P}/"
		cp "${BUILD_DIR}/extras/BinaryBuilder/BinaryBuilder_artefacts/${CMAKE_BUILD_TYPE}/BinaryBuilder" "${D}/opt/${P}/"
		cp "${BUILD_DIR}/extras/NetworkGraphicsDemo/NetworkGraphicsDemo_artefacts/${CMAKE_BUILD_TYPE}/NetworkGraphicsDemo" "${D}/opt/${P}/"
		cp "${BUILD_DIR}/extras/UnitTestRunner/UnitTestRunner_artefacts/${CMAKE_BUILD_TYPE}/UnitTestRunner" "${D}/opt/${P}/"
	fi
}

pkg_postinst() {
	elog "Since different applications use different versions of JUCE,"
	elog "binaries have not been installed to /usr/bin."
	elog "I've yet to make an eselect module for this stuff, so you may want"
	elog "to symlink /usr/local/bin/Projucer to /opt/juce-${PV}/Projucer (or"
	elog "whatever) to run them easier."
}
