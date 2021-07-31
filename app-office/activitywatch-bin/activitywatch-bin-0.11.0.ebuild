EAPI=7

inherit desktop xdg
MY_PN="${PN/-bin/}"

DESCRIPTION="Records what you do so that you can know how you've spent your time. All in a secure way where you control the data."
HOMEPAGE="https://github.com/ActivityWatch/activitywatch"

SRC_URI="https://github.com/ActivityWatch/activitywatch/releases/download/v${PV}/activitywatch-v${PV}-linux-x86_64.zip"
SLOT=0

RESTRICT="mirror strip"
BIN_NAME=aw-qt
BINS="
	aw-qt
	aw-watcher-afk/aw-watcher-afk
	aw-watcher-window/aw-watcher-window
	aw-server-rust/aw-server-rust
	aw-server/aw-server
"

S="${WORKDIR}/${MY_PN}"

src_install() {
	insinto /opt/${PN}
	doins -r *

	domenu ${BIN_NAME}.desktop
	for bin in $BINS; do
		fperms 755 /opt/${PN}/${bin}
	done

	dosym ../../opt/${PN}/${BIN_NAME} usr/bin/${BIN_NAME}
}
