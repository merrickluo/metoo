# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg-utils unpacker

DESCRIPTION="Wemeet - Tencent Video Conferencing"
HOMEPAGE="https://wemeet.qq.com"
SRC_URI="https://updatecdn.meeting.qq.com/cos/196cdf1a3336d5dca56142398818545f/TencentMeeting_0300000000_2.8.0.1_x86_64.publish.deb -> ${P}_x86_64.deb"

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
		x11-libs/libXrandr
		dev-libs/libbsd
		"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"
MY_PN="wemeet"
QA_PREBUILT="opt/${MY_PN}/*"

src_prepare() {
	default

	sed -i 'N;2aName[zh_CN]=腾讯会议\nComment=Tencent Meeting Linux Client\nComment[zh_CN]=腾讯会议Linux客户端\nKeywords=wemeet;tencent;meeting;' "usr/share/applications/wemeetapp.desktop"
	sed -i '4c Prefix = /usr/lib64/qt5' opt/${MY_PN}/bin/qt.conf
	sed -i "8c export QT_PLUGIN_PATH=/usr/lib64/qt5/plugins" opt/${MY_PN}/wemeetapp.sh
}

src_install() {
	insinto "/opt/${MY_PN}"
	exeinto "/opt/${MY_PN}"


	doins -r "opt/${MY_PN}/bin" "opt/${MY_PN}/icons"
	doexe "opt/${MY_PN}/wemeetapp.sh"

	insinto "/opt/${MY_PN}/lib"

	# FIXME install only part of lib, don't know how to use ins for this
	cp opt/${MY_PN}/lib/{libwemeet*,libxcast.so,libxnn*,libtquic.so,libQt5WebKit*,libjpeg*,libicu*} "${D}/opt/wemeet/lib/"

	fperms +x "/opt/${MY_PN}/bin/wemeetapp"
	fperms +x "/opt/${MY_PN}/bin/crashpad_handler"

	domenu "usr/share/applications/wemeetapp.desktop"
	newicon "opt/${MY_PN}/splash_logo3x.png" "${PN}app.png"
	for i in 16 32 64 128 256; do
		png_file="opt/wemeet/icons/hicolor/${i}x${i}/mimetypes/wemeetapp.png"
		if [ -e "${png_file}" ]; then
			newicon -s "${i}" "${png_file}" wemeetapp
		fi
	done
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
