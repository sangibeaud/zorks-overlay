# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# requires proaudio overlay
EAPI=8
inherit git-r3 cmake

DESCRIPTION="Rakkarack lv2 plugins"
HOMEPAGE="http://github.com/ssj71/rkrlv2"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/ssj71/rkrlv2.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="lv2ui"

DEPEND="
   lv2ui? ( x11-libs/gtk+:2 x11-libs/gtk+:3 dev-python/PyQt4 dev-python/PyQt5 )
   "

RDEPEND=${DEPEND}
