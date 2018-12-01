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
IUSE=""

DEPEND="
	x11-libs/cairo
	media-libs/libsndfile
"
RDEPEND="${DEPEND}"
BDEPEND="dev-lang/php"


src_prepare() {
	cd ${S}
	patch -p 1 --verbose  < ${FILESDIR}/lsp-plugins-jackd.patch
}

src_compile() {
	BUILD_PROFILE=x86_64 CC_FLAGS=-DLSP_NO_EXPERIMENTAL emake all
}

src_install() {
	BUILD_PROFILE=x86_64 CC_FLAGS=-DLSP_NO_EXPERIMENTAL \
		emake install \
		BIN_PATH=${D}/usr/bin \
		LIB_PATH=${D}/usr/lib64 \
		DOC_PATH=${D}/usr/share/doc
		#emake DESTDIR=${D} install 
}
