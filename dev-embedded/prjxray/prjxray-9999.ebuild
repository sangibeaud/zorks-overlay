# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT="3.10,3.11"

CMAKE_MAKEFILE_GENERATOR="ninja"
inherit cmake git-r3

DESCRIPTION="Documenting the Xilinx FPGA architecture."
HOMEPAGE="https://github.com/f4pga/prjxray"
#SRC_URI="https://github.com/YosysHQ/prjtrellis/archive/refs/tags/1.2.1.tar.gz"
EGIT_REPO_URI="https://github.com/f4pga/prjxray.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/boost
	dev-lang/python"
RDEPEND="${DEPEND}"
BDEPEND=""

#CMAKE_USE_DIR="libtrellis"

pkg_setup(){
	if [ ${PV} == "9999" ]; then
		elog edge build
	else
		elog builversion ${PV}
		EGIT_COMMIT=${PV}
	fi
}

#no_src_configure(){
	#cd ${WORKDIR}/libtrellis/
	#cmake -S libtrellis
	#cmake_src_configure
	#eapply_user
#}

src_prepare(){
#	cd libxray
#   cmake .
#	cmake_src_prepare
	eapply_user
	cmake_src_prepare
}

src_configure(){
	einfo This ebuild FORCES use of python 3.10, bc cmake is not my cup of tea
	einfo So you mut ensure other tools are compatible e.g. nextpnr
	local mycmakeargs=(
#		-DPython3_EXECUTABLE=/usr/bin/python3.11
#		-DPython3_INCLUDE_DIR=/usr/include/python3.11  
#		-DPython3_LIBRARY=/usr/lib64/libpython3.11.so 
	)
	cmake_src_configure
}

