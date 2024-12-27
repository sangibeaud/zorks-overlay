# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Place and route for FOSS fpga toolchain"
HOMEPAGE="https://github.com/gatecat/nextpnr-xilinx"

IUSE="-arch_generic -arch_ecp5 -arch_ice40 +arch_xilinx +python +test"

#SRC_URI=""
EGIT_REPO_URI="https://github.com/gatecat/nextpnr-xilinx.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/boost
	dev-cpp/eigen"
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_setup(){
	if [ ${PV} == "9999" ]; then
		einfo builing edge git commit 9999
	else
		EGIT_COMMIT=${PV}
		einfo building tagged version ${PV}
	fi
}

src_configure(){
	local archs=$archs 
	use arch_generic && archs=${archs}";generic"
	use arch_ecp5 && archs=${archs}";ecp5"
	use arch_ice40 && archs=${archs}";ice40"
	use arch_xilinx && archs=${archs}";xilinx"
	if [${archs} == ""]; then 
		archs="all"
	fi
	einfo building for arch : $archs
	local mycmakeargs=(
		"-DARCH=${archs}"
#		"-DPython3_EXECUTABLE=/usr/bin/python3.10 "
#		"-DPython3_INCLUDE_DIR=/usr/include/python3.10 "
#		"-DPython3_LIBRARY=/usr/lib64/libpython3.10.so "
#		"-DPYTHONLIBS_VERSION_STRING=3.10 "
#		"-DTRELLIS_INSTALL_PREFIX=/usr"
#		-DBUILD_TESTS="$(usex test)"
		-DBUILD_TESTS="ON"
		-DBUILD_PYTHON="$(usex python)"
	)
	cmake_src_configure

}




src_test() {
	cmake_src_test
}

no_src_compile() {
	PREFIX="/usr" emake all 
}

no_src_install() {
	#PREFIX=${D}/usr emake install
	DESTDIR=${D} PREFIX=/usr emake install
	}
