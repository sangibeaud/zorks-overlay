# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

DESCRIPTION="LSP (Linux Studio Plugins) is a collection of open-source plugins
currently compatible with LADSPA, LV2 and LinuxVST formats.
"
HOMEPAGE="http://lsp-plug.in/"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/sadko4u/lsp-plugins.git"
#EGIT_COMMIT=""

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="jack ladspa lv2 vst -doc"

DEPEND="
	>=dev-libs/glibc-2.19
	>=dev-libs/libsndfile-1.0.25
	>=x11-libs/libcairo-1.14
	>=x11-libs/libfreetype-2.10
	x11-libs/libGL
"
RDEPEND="${DEPEND}"
BDEPEND="dev-lang/php"


no_src_prepare() {
	cd ${S}
	patch -p 1 --verbose  < ${FILESDIR}/lsp-plugins-jackd.patch
}

src_configure(){
	emake config
}

src_compile() {
	local modules=""

	if use doc; then
		modules="${modules} doc"
	fi
	#if use notavaliduseflag; then
	#	modules="${modules} jack"
	#fi
	if use lv2; then
		modules="${modules} lv2"
	fi
	if use ladspa; then
		modules="${modules} ladspa"
	fi
	if use vst; then
		modules="${modules} vst"
	fi
	echo "Building Modules .... ${modules}."
	BUILD_PROFILE=x86_64 CC_FLAGS=-DLSP_NO_EXPERIMENTAL emake "BUILD_MODULES=\'${modules}\'" all
}

src_install() {
	BUILD_PROFILE=x86_64 CC_FLAGS=-DLSP_NO_EXPERIMENTAL \
		emake install \
		BIN_PATH=${D}/usr/bin \
		LIB_PATH=${D}/usr/lib64 \
		DOC_PATH=${D}/usr/share/doc
		#emake DESTDIR=${D} install 
}
