# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Collection of LADSPA/LV2/VST/JACK audio plugins for high-quality processing "
HOMEPAGE="http://www.zamaudio.com/?p=976"
EGIT_REPO_URI="https://github.com/zamaudio/zam-plugins.git"

if [ ${PV} = 9999 ]; then
	# nothing
	elog Cutting Edge
else
	EGIT_COMMIT="${PV}"
fi

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="-lv2 -ladspa -vst -standalone"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

no_src_prepare(){
	egit default
	egit submodule update --init
	eapply_user
}

PREFIX=/usr
LIBDIR=lib64

src_compile(){
    EMAKE_USER_FLAGS=" PREFIX=/usr LIBDIR=lib64 "
	emake ${EMAKE_USER_FLAGS} libs
	emake -C plugins/ZamSFZ ${EMAKE_USER_FLAGS}
	emake -C plugins/ZamVerb ${EMAKE_USER_FLAGS}
	emake all ${EMAKE_USER_FLAGS} 
}

src_install(){
	emake DESTDIR=${D} ${EMAKE_USER_FLAGS} install
}

