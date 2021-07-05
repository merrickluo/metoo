# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop git-r3 xdg

DESCRIPTION="MTG Arena Tool is a collection browser, a deck tracker and a statistics manager. "
HOMEPAGE="https://github.com/Manuel-777/MTG-Arena-Tool"
EGIT_REPO_URI="https://github.com/Manuel-777/MTG-Arena-Tool.git"
EGIT_REPO_BRANCH="master"

# Necessary to download dependencies.
RESTRICT="network-sandbox"
SLOT="0"
KEYWORDS="~amd64"
DEPEND="
net-libs/nodejs
<=sys-fs/fuse-2.9.9-r1
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

APPIMAGE_VER=5.5.21
APPIMAGE_NAME=MTG-Arena-Tool-${APPIMAGE_VER}.AppImage

src_compile() {
	npm install
	npm run dist
}

src_install() {
	newicon -s 512 src/assets/icons/icon-512.png mtg-arena-tool.png
	domenu ${FILESDIR}/${PN}.desktop

	insinto /opt/${PN}
	newins dist/${APPIMAGE_NAME} ${PN}
	fperms +x /opt/${PN}/${PN}
	dosym ../../opt/${PN}/${PN} usr/bin/${PN}
}
