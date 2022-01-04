# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# Inspired by https://aur.archlinux.org/packages/com.tencent.weixin/

EAPI=7
inherit unpacker xdg

DESCRIPTION="微信官方原生桌面版"
HOMEPAGE="https://weixin.qq.com/"

KEYWORDS="~amd64"

SRC_URI="https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/com.tencent.weixin_${PV}_amd64.deb"

SLOT="0"
RESTRICT="strip mirror"
LICENSE="ISC"
IUSE=""

RDEPEND="
	x11-libs/gtk+
	x11-libs/libXScrnSaver
	gnome-base/gconf
	dev-libs/nss
	sys-apps/lsb-release
	sys-apps/bubblewrap
"
DEPEND=""
BDEPEND=""

S="${WORKDIR}"

src_prepare() {
	default
	# call this in src_unpack will cause deb not fully unpacked, wired.
	unpack ${FILESDIR}/license.tar.gz

	sed -i '3c Exec=weixin %U' usr/share/applications/weixin.desktop
	rm usr/lib/license/libuosdevicea.so
}

src_install() {
	doins -r usr/

	insinto /opt/weixin
	doins -r opt/apps/com.tencent.weixin/files/weixin/*
	doins -r license

	newbin ${FILESDIR}/weixin.sh weixin
	fperms +x /opt/weixin/weixin
}
