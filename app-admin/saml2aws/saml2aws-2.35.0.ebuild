# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

go-module_set_globals

DESCRIPTION="CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP"
HOMEPAGE="https://github.com/Versent/saml2aws"
SRC_URI="https://github.com/Versent/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""
BDEPEND="dev-lang/go"

src_unpack() {
	default
	unpack "${FILESDIR}/${P}-deps.tar.xz"
}

src_compile () {
	go build -o saml2aws ./cmd/saml2aws
}

src_install () {
	dobin saml2aws
}
