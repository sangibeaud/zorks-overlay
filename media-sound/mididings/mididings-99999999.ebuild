# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9} )
#PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="tk?"
inherit distutils-r1

DESCRIPTION="A MIDI router and processor based on Python, supporting ALSA and JACK MIDI"
HOMEPAGE="http://das.nasophon.de/mididings/"

if [ "${PV}" = "99999999" ]; then
	inherit git-r3
	#EGIT_REPO_URI="git://github.com/dsacre/mididings.git"
	#EGIT_REPO_URI="git://github.com/rodisch/mididings.git"
	EGIT_REPO_URI="git://github.com/rralf/mididings.git"
	KEYWORDS="~amd64"
else
	SRC_URI="http://das.nasophon.de/download/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2+"
SLOT="0"
IUSE="alsa dbus doc examples inotify jack osc +smf tk"
#IUSE="alsa dbus doc examples inotify jack osc tk"
REQUIRED_USE="|| ( alsa jack )"

RDEPEND="${PYTHON_DEPS}
	>=dev-libs/boost-1.34.1:=[python,threads,${PYTHON_USEDEP}]
	dev-libs/glib:2=
	dev-python/decorator[${PYTHON_USEDEP}]
	alsa? ( media-libs/alsa-lib:= )
	dbus? ( dev-python/dbus-python[${PYTHON_USEDEP}] )
	inotify? ( >=dev-python/pyinotify-0.8[${PYTHON_USEDEP}] )
	jack? ( virtual/jack )
	smf? ( media-libs/libsmf:= )
	osc? ( >=media-libs/pyliblo-0.9.1-r1:=[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

PATCHES=( "${FILESDIR}"/${P}-boost_python.patch )

python_configure_all() {
	mydistutilsargs=(
		$(use_enable alsa alsa-seq)
		$(use_enable jack jack-midi)
		#$(use_enable smf)

	)
	python setup.py --help
}

python_install_all() {
	use doc && HTML_DOCS=( doc/ )
	use examples && dodoc -r doc/examples

	setup.py --help

	distutils-r1_python_install_all
}
