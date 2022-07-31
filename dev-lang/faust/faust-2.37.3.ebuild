# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#inherit cmake

DESCRIPTION="Faust programming language"
HOMEPAGE="https://github.com/grame-cncm/faust"
SRC_URI="https://github.com/grame-cncm/faust/archive/refs/tags/2.37.3.tar.gz"

#EGIT_REPO_URI="https://github.com/grame-cncm/faust.git"
#EGIT_COMMIT="v2-5-10"

LICENSE="iGPL"
SLOT="0"
KEYWORDS="amd64"
IUSE="remote"

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
		patch --verbose -p1 < "$FILESDIR"/faust-memcpy.patch
	fi

}

no_remote_prepare() {
	echo old school prepare with sed
	jackd --version | grep -q "0.125"  && \
		sed  -i "s/jack_midi_reset_buffer/jack_midi_clear_buffer/" ${S}/architecture/faust/midi/jack-midi.h
	epatch --verbose "$FILESDIR"/faust-memcpy.patch
}

src_compile(){
	PREFIX=/usr emake 
}

no_src_compile() {
	#emake compiler
	#emake all
	#if use remote; then
	#	PREFIX=/usr emake httpd
	#	PREFIX=/usr emake 
	#else
	#	PREFIX=/usr emake light
	#fia
	cd ${WORKDIR}/build
}


no_src_install() {
	PREFIX=/usr emake DESTDIR="${D}" install

}


