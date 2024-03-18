# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Meta package for armtoo build chain"
HOMEPAGE="github:/sangibeaud/armtoo"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	    app-misc/ca-certificates \
		app-arch/dpkg app-arch/pixz app-arch/lz4 \
		dev-util/patchutils dev-util/ccache dev-util/dialog dev-util/debootstrap \
		dev-lang/swig \
		dev-embedded/u-boot-tools \
		net-misc/wget  net-misc/curl \
		sys-apps/fakeroot sys-apps/pv \
		sys-devel/bc sys-devel/distcc \
		sys-fs/btrfs-progs sys-fs/f2fs-tools \
		sys-libs/ncurses \
		virtual/udev
"


