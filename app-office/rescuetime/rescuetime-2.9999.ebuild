# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Source overlay: https://github.com/BlueManCZ/edgets

EAPI=7
inherit desktop unpacker xdg-utils

DESCRIPTION="A service that provides the user with the knowledge of how they spend their time while on the computer."
HOMEPAGE="https://www.rescuetime.com"
SRC_URI="https://www.rescuetime.com/installers/rescuetime_current_amd64.deb"

LICENSE="RescueTime"
SLOT="0"
KEYWORDS="~amd64"
IUSE="xscreensaver xtest"

RDEPEND="app-misc/ca-certificates
	dev-db/sqlite
	dev-qt/qtgui
	dev-qt/qtsql
	sys-libs/glibc
	sys-libs/libstdc++-v3
	x11-libs/libXext
	xscreensaver? ( x11-libs/libXScrnSaver )
	xtest? ( x11-libs/libXtst )
	x11-libs/libX11"

S="${WORKDIR}/usr"

QA_PREBUILT="*"

src_install() {
	insinto "/usr/share/${PN}"
	doins -r "share/${PN}"

	exeinto "/usr/bin"
	doexe "bin/${PN}"

	make_desktop_entry ${PN} ${PN^} ${PN} "System;Utility;"
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
