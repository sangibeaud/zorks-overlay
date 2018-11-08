# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

DESCRIPTION="Faust programming language"
HOMEPAGE="https://github.com/grame-cncm/faust"
#SRC_URI="https://github.com/grame-cncm/faust.git"
EGIT_REPO_URI="https://github.com/grame-cncm/faust.git"

LICENSE="iGPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="remote"

DEPEND="net-libs/libmicrohttpd"
RDEPEND="${DEPEND}"

src_prepare() {
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
	fi

}

remote_prepare() {
	echo old school prepare with sed
	jackd --version | grep -q "0.125"  && \
		sed  -i "s/jack_midi_reset_buffer/jack_midi_clear_buffer/" ${S}/architecture/faust/midi/jack-midi.h
}

src_compile() {
	emake compiler
	#emake all
	if use remote; then
		emake remote
	fi
}


src_install() {
	emake DESTDIR="${D}" install

}


