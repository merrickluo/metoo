EAPI=8

MY_PN="${PN//-bin/}"
MY_P="${MY_PN}-${PV}"
MY_BIN="bb"

SRC_URI="https://github.com/${MY_PN}/${MY_PN}/releases/download/v${PV}/${MY_P}-linux-amd64.tar.gz"

KEYWORDS="amd64"
DESCRIPTION="Babashka is a native Clojure interpreter for scripting with fast startup. Its main goal is to leverage Clojure in places where you would be using bash otherwise."
HOMEPAGE="https://github.com/babashka/babashka"
LICENSE="EPL-1.0"

RESTRICT="mirror bindist"
SLOT="0"
IUSE=""

S="${WORKDIR}"

QA_PRESTRIPPED="
	usr/bin/${MY_BIN}
"

src_install() {
	dobin "${MY_BIN}"
}
