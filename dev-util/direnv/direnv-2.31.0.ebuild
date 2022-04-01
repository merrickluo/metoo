# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="Direnv is an environment switcher for the shell."
HOMEPAGE="http://direnv.net"
SRC_URI="https://github.com/direnv/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

BDEPEND="dev-lang/go"


src_unpack() {
	default
	unpack ${FILESDIR}/${P}-deps.tar.xz
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}
