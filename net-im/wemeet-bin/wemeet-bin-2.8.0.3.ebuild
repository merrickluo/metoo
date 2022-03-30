# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg-utils unpacker

URL_HASH=3cdd365cd90f221fb345ab73c4746e1f
DESCRIPTION="Wemeet - Tencent Video Conferencing"
HOMEPAGE="https://wemeet.qq.com"
SRC_URI="https://updatecdn.meeting.qq.com/cos/${URL_HASH}/TencentMeeting_0300000000_${PV}_x86_64_default.publish.deb -> ${P}_x86_64.deb"
LICENSE="wemeet_license"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

DEPEND="
		dev-libs/nss
		dev-util/desktop-file-utils
		media-sound/pulseaudio
		x11-libs/libX11
		dev-libs/wayland
		dev-qt/qtgui[eglfs]
		dev-qt/qtx11extras
		dev-qt/qtnetwork
		dev-qt/qtprintsupport
		dev-qt/qtopengl
		dev-qt/qtsql
		dev-qt/qtquickcontrols
		x11-libs/libXrandr
		dev-libs/libbsd
		=media-libs/libpng-compat-1.2*
		"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"
MY_PN="wemeet"
QA_PREBUILT="opt/${MY_PN}/*"

src_prepare() {
	default

	sed -i '4c Prefix = /usr/lib64/qt5' opt/${MY_PN}/bin/qt.conf
	sed -i "8c export QT_PLUGIN_PATH=/usr/lib64/qt5/plugins" opt/${MY_PN}/wemeetapp.sh
	sed -i "8a export QT_STYLE_OVERRIDE=fusion" opt/${MY_PN}/wemeetapp.sh
}

src_install() {
	insinto "/opt/${MY_PN}"
	exeinto "/opt/${MY_PN}"

	doins -r "opt/${MY_PN}/bin"
	doexe "opt/${MY_PN}/wemeetapp.sh"
	doins "opt/${MY_PN}/wemeet.svg"

	insinto "/opt/${MY_PN}/lib"
	# FIXME install only part of lib, don't know how to use ins for this
	cp opt/${MY_PN}/lib/{libwemeet*,libxcast.so,libxnn*,libtquic.so,libQt5WebKit*,libjpeg*,libicu*} "${D}/opt/wemeet/lib/"

	fperms +x "/opt/${MY_PN}/bin/wemeetapp"
	fperms +x "/opt/${MY_PN}/bin/crashpad_handler"

	domenu "usr/share/applications/wemeetapp.desktop"

	insinto /usr/share
	doins -r "opt/${MY_PN}/icons"
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
