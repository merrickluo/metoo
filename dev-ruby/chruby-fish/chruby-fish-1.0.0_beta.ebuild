# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=" Thin wrapper around chruby to make it work with the Fish shell "
HOMEPAGE="https://github.com/JeanMertz/chruby-fish"

BETA_VER=1
MPV="$(ver_rs 3 '-').${BETA_VER}"

SRC_URI="https://github.com/JeanMertz/chruby-fish/archive/refs/tags/v${MPV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
RESTRICT="test"

DEPEND="app-shells/fish dev-ruby/chruby"
RDEPEND="${DEPEND}"

src_unpack() {
	default
	mv ./"${PN}-${MPV}" ./"${P}" || die
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}
