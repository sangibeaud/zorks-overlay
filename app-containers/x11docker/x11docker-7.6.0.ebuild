EAPI=8

DESCRIPTION="run GUI applications in containers"
HOMEPAGE="https://github.com/mviereck/x11docker"
SRC_URI="https://github.com/mviereck/x11docker/archive/refs/tags/v7.6.0.tar.gz -> $P.tar.gz"
LICENSE="MIT"
SLOT=0
KEYWORDS="amd64"

RDEPEND="x11-base/xorg-server[xcsecurity]
	 x11-misc/xclip
	 x11-apps/xrandr
	 x11-apps/xhost
	 x11-apps/xdpyinfo
	 app-containers/catatonit
	 x11-wm/xpra"

PATCHES="$FILESDIR/$PN-packaged.patch"

src_install()
{
  dobin $PN
}
