# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

MY_PN="dnsname"
DESCRIPTION="name resolution for containers"
HOMEPAGE="https://github.com/containers/dnsname"
SRC_URI="https://github.com/containers/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"
KEYWORDS="amd64 ~arm64"

IUSE=""
BDEPEND="dev-lang/go"
LICENSE="Apache-2.0"

src_unpack() {
	default
	mv "${MY_PN}-${PV}" "${P}"
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}
