# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tcltk/snack/snack-2.2.10-r6.ebuild,v 1.3 2014/03/31 21:01:52 mgorny Exp $

EAPI=8

#PYTHON_COMPAT=( python{2_6,2_7} pypy pypy2_0 )
PYTHON_COMPAT=( python3_8 pypy pypy3)

inherit autotools distutils-r1 multilib

DESCRIPTION="Musical Midi Accompaniement"
HOMEPAGE="http://www.mellowood.ca/"
# e.g. http://www.mellowood.ca/mma/mma-bin-16.06.tar.gz
SRC_URI="http://www.mellowood.ca/mma/${PN}-bin-${PV}.tar.gz"

LICENSE="GPL"
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

S="${WORKDIR}/${PN}-bin-${PV}"

#PYTHON_MODNAME="tkSnack.py"

AUTOTOOLS_IN_SOURCE_BUILD=0

#PATCHES=(
	#"${FILESDIR}"/alsa-undef-sym.patch
	#"${FILESDIR}"/${P}-CVE-2012-6303-fix.patch
#	)

no_src_prepare() {
	elog "Running src_prepare"

	#cd .. || die

	#autotools-utils_src_prepare

	#sed \
	#	-e 's|^\(#define roundf(.*\)|//\1|' \
	#	-i generic/jkFormatMP3.c || die
}

#src_configure() {
#}

src_compile() {
	elog "No compile ... this is normal"
#	autotools-utils_src_compile
}

src_install() {

	elog "Running src_install"
	#if use python ; then
	elog "Python install"
		#cd "${S}"/../python || die
		cd "${S}" || die
		#echo "" | python ./cp-install
	elog "Creating install directories and moving data files"
		mkdir -p ${D}/usr/local/share/mma || die
		mkdir -p ${D}/usr/local/bin || die
		cp -r * ${D}/usr/local/share/mma
		ln -s  ${D}usr/local/share/mma/mma.py ${D}/usr/local/bin/mma
		#dosym  ${D}/usr/local/share/mma/mma.py ${D}/usr/local/bin/mma
		#distutils-r1_src_install
	#fi
	elog "docs install"
		doman ${D}/usr/local/share/mma/docs/man/*.1
		doman ${D}/usr/local/share/mma/docs/man/*.8

	if use examples ; then
		elog "Documenting examples"
		docinto examples

		#use python && dodoc -r demos/python
	fi
}

pkg_postinst() {
	elog "Regenerate grooves library"
	sudo mma -G
}
