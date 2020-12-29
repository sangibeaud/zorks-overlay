# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tcltk/snack/snack-2.2.10-r6.ebuild,v 1.3 2014/03/31 21:01:52 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_8} pypy pypy2_0 )

inherit autotools autotools-utils distutils-r1 multilib

DESCRIPTION="Musical Midi Accompaniement GUI front end"
HOMEPAGE="https://welltemperedstudio.wordpress.com/code/lemma/"
#https://github.com/geksiong/LeMMA.git
SRC_URI="http://xenon.stanford.edu/%7Egeksiong/code/lemma/LeMMA0.9a.zip"

LICENSE="GPL"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
SLOT="0"
IUSE=""

RESTRICT="test" # Bug 78354

RDEPEND=" media-sound/mma
	"


RDEPEND="${DEPEND}"

S="${WORKDIR}/"


AUTOTOOLS_IN_SOURCE_BUILD=0

#PATCHES=(
	#"${FILESDIR}"/alsa-undef-sym.patch
	#"${FILESDIR}"/${P}-CVE-2012-6303-fix.patch
#	)

src_prepare() {
	elog "Running src_prepare"
	epatch ${FILESDIR}/env-python.patch
	#eapply_user

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
	elog "shell install"
		#cd "${S}"/../python || die
		cd "${S}" || die
		#echo "" | python ./cp-install
	elog "Creating install directories and moving data files"
		mkdir -p ${D}/usr/share/lemma || die
		mkdir -p ${D}/usr/bin || die
		cp -r * ${D}/usr/share/lemma
		ln -s  ${D}/usr/share/lemma/lemma.py ${D}/usr/bin/lemma
		#distutils-r1_src_install
	#fi
	elog "docs install"
		#
		dodoc README CHANGES

	#if use examples ; then
	#	elog "Documenting examples"
	#	docinto examples

	#	use python && dodoc -r demos/python
	#fi
}

no_src_install(){
    python2 install.py --prefix=/usr --noprompt
	}

pkg_postinst() {
	elog "At end of install, ..."
}
