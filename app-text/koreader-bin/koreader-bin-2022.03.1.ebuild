# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# Inspired by https://aur.archlinux.org/packages/com.tencent.weixin/

EAPI=8
inherit desktop xdg-utils

DESCRIPTION="An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices "
HOMEPAGE="https://koreader.rocks/"

SRC_URI="https://github.com/koreader/koreader/releases/download/v${PV}/koreader-appimage-x86_64-linux-gnu-v${PV}.AppImage"
KEYWORDS="~amd64"
SLOT="0"
RESTRICT="mirror strip"
LICENSE="ISC"
IUSE=""
S=${WORKDIR}

src_install() {
	dobin ${FILESDIR}/koreader
	domenu ${FILESDIR}/koreader.desktop
	doicon ${FILESDIR}/koreader.svg

	insinto /opt/koreader
	newins ${DISTDIR}/koreader-appimage-x86_64-linux-gnu-v${PV}.AppImage koreader.AppImage
	fperms 755 /opt/koreader/koreader.AppImage
}
