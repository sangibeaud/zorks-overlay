# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3 qmake-utils

DESCRIPTION="sends and receives MIDI data (ALSA Sequencer and/or JACK MIDI) over the network"
HOMEPAGE="https://qmidinet.sourceforge.io/qmidinet-index.html"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/rncbc/qmidinet.git"
EGIT_COMMIT="qmidinet_"$(ver_rs 1- _)

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-qt/qtchooser
	dev-qt/qtgui
	dev-qt/qtwidgets
	dev-qt/qtcore"

RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare(){
	#cd $WORKDIR
	#./configure
	eautoreconf
	eapply_user
}

src_compile(){
	eqmake5 PREFIX=/usr
	emake
}

src_install(){
	emake install INSTALL_ROOT="${D}"
}


