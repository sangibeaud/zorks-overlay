# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib multilib-minimal

DESCRIPTION="libcurl-{gnutls,nss}.so.${SLOT} symlinks for compatibility with Debian"
HOMEPAGE="https://curl.haxx.se/"
LICENSE="MIT"
SLOT="4"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=net-misc/curl-7.16.0[${MULTILIB_USEDEP}]"

S="${WORKDIR}"

multilib_src_install() {
	local backend

	for backend in gnutls nss; do
		dosym ./libcurl.so.${SLOT} /usr/$(get_libdir)/libcurl-${backend}.so.${SLOT}
	done
}
