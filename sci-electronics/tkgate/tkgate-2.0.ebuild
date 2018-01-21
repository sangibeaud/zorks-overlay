# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tcltk/snack/snack-2.2.10-r6.ebuild,v 1.3 2014/03/31 21:01:52 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} pypy pypy2_0 )

inherit autotools autotools-utils distutils-r1 multilib

DESCRIPTION="Tk gate logici circuit design"
HOMEPAGE="http://www.tkgate.org/"
SRC_URI="http://www.tkgate.org/downloads/${PN}-${PV}-b10.tgz"

LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
SLOT="0"
IUSE="examples python threads"

RESTRICT="test" # Bug 78354

DEPEND="
	dev-lang/tcl
	dev-lang/tk
	python? ( ${PYTHON_DEPS} )
	"


RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${PV}-b10"

#PYTHON_MODNAME="tkSnack.py"

AUTOTOOLS_IN_SOURCE_BUILD=1

#PATCHES=(
	#"${FILESDIR}"/alsa-undef-sym.patch
	#"${FILESDIR}"/${P}-CVE-2012-6303-fix.patch
#	)

src_prepare() {
	# adds -install_name (soname on Darwin)
	[[ ${CHOST} == *-darwin* ]] && PATCHES+=( "${FILESDIR}"/${P}-darwin.patch )

	cd .. || die

	autotools-utils_src_prepare

	#sed \
	#	-e 's|^\(#define roundf(.*\)|//\1|' \
	#	-i generic/jkFormatMP3.c || die
}

src_configure() {
	local myeconfargs=(
		--libdir="${EPREFIX}"/usr/$(get_libdir)
		--includedir="${EPREFIX}"/usr/include
		LIBS="-lm"
		)

	#use alsa && myconf+=( --enable-alsa )
	use threads && myconf+=( --enable-threads )

	#use vorbis && \
	#	myconf+=( --with-ogg-include="${EPREFIX}"/usr/include ) && \
	#	myconf+=( --with-ogg-lib="${EPREFIX}"/usr/$(get_libdir) )

	autotools-utils_src_configure
}

src_compile() {
	autotools-utils_src_compile
}

src_install() {
	autotools-utils_src_install

	if use python ; then
		cd "${S}"/../python || die
		distutils-r1_src_install
	fi

	#cd "${S}"/.. || die
	cd "${S}" || die

	dohtml doc/*

	if use examples ; then
		docinto examples
		sed -i -e 's/wish[0-9.]+/wish/g' demos/tcl/* || die
		dodoc -r demos/tcl

		use python && dodoc -r demos/python
	fi
}
