# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT="3.{10..11}"

CMAKE_MAKEFILE_GENERATOR="ninja"
inherit cmake git-r3

DESCRIPTION="https://github.com/YosysHQ/prjtrellis/archive/refs/tags/1.2.1.tar.gz"
HOMEPAGE="https://github.com/YosysHQ/prjtrellis/archive/refs/tags/1.2.1.tar.gz"
#SRC_URI="https://github.com/YosysHQ/prjtrellis/archive/refs/tags/1.2.1.tar.gz"
EGIT_REPO_URI="https://github.com/YosysHQ/prjtrellis.git"
EGIT_COMMIT=${PV}

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/boost"
RDEPEND="${DEPEND}"
BDEPEND=""

#CMAKE_USE_DIR="libtrellis"


#no_src_configure(){
	#cd ${WORKDIR}/libtrellis/
	#cmake -S libtrellis
	#cmake_src_configure
	#eapply_user
#}

src_prepare(){
	cd libtrellis
#   cmake .
#	cmake_src_prepare
	eapply_user
	cmake_src_prepare
}

src_configure(){
	cmake_src_configure
}

