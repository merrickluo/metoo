# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="A scalable overlay networking tool with a focus on performance, simplicity and security"
HOMEPAGE="https://github.com/slackhq/nebula"
SRC_URI="https://github.com/slackhq/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE=""
BDEPEND="dev-lang/go"
LICENSE="MIT"

src_unpack() {
	default
	unpack ${FILESDIR}/${P}-deps.tar.xz
}

src_compile() {
	make bin
}

src_install() {
	dobin nebula
	dobin nebula-cert

	newinitd ${FILESDIR}/nebula.initd nebula

	insinto /etc/nebula
	doins ${FILESDIR}/config.yaml
}
