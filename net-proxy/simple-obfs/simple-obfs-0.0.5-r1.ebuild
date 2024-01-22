# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3
MY_PV="v${PV}"

DESCRIPTION="A simple obfuscating tool"
HOMEPAGE="https://github.com/shadowsocks/simple-obfs"
EGIT_REPO_URI="https://github.com/shadowsocks/simple-obfs.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-build/autoconf
	dev-build/libtool
	dev-libs/openssl
	dev-libs/libpcre
	dev-libs/libev
	app-text/asciidoc
	app-text/xmlto
	dev-build/automake
"
RDEPEND="${DEPEND}"

src_configure() {
	git tag -f "$PV"
	git submodule update --init --recursive
}

src_compile() {
	./autogen.sh
	econf
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
