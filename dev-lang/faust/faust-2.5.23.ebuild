# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Faust programming language"
HOMEPAGE="https://github.com/grame-cncm/faust"
SRC_URI="https://github.com/grame-cncm/faust/archive/${PV}.tar.gz"
#EGIT_REPO_URI="https://github.com/grame-cncm/faust.git"

LICENSE="iGPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="httpd +llvm +static-libs"

DEPEND="net-libs/libmicrohttpd"
RDEPEND="${DEPEND}"

no_src_prepare() {
	cd $S
	git submodule update --init

	#eapply_user

	if use remote; then
		#remote_prepare
		echo conditional patch if jack-audio is 0.125
		#if [ $(jackd --version | grep -q "0.125") ]; then
		jackd --version
	    jackd --version | grep -q "0.125"  && echo "Version 0.125 !"
		echo ${FILESDIR}
	    jackd --version | grep -q "0.125"  && patch --verbose -p1 < "${FILESDIR}/jack-midi-0.125.patch"
		#else
		#	echo "... and it isn't"
		#fi
		#patch --verbose -p1 < "$FILESDIR"/faust-memcpy.patch
	fi
	patch --verbose -p1 < "$FILESDIR"/faust-llvm6.0.1-compat.patch

}

src_prepare() {
	
	patch --verbose -p1 < "$FILESDIR"/faust-llvm6.0.1-compat.patch

	cd ${S}
	git clone --verbose https://github.com/grame-cncm/faustlibraries.git libraries 


}

no_remote_prepare() {
	echo old school prepare with sed
	jackd --version | grep -q "0.125"  && \
		sed  -i "s/jack_midi_reset_buffer/jack_midi_clear_buffer/" ${S}/architecture/faust/midi/jack-midi.h
	epatch --verbose "$FILESDIR"/faust-memcpy.patch
}

src_compile() {
	if use httpd; then
		emake DESTDIR=${D} httpd
	fi

	if use static-libs; then 
		echo "Standard build with static libs"
	else
		emake DESTDIR=${D} dynamic
	fi

	if use llvm; then 
		emake DESTDIR=${D}
	else
		echo "Does the even work ?"
		emake DESTDIR=${D} light
	fi

}


src_install() {
	PREFIX=/usr emake DESTDIR="${D}" install

}



