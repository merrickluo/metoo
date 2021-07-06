# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3

DESCRIPTION="Nyxt (formerly Next) browser - Be productive."
HOMEPAGE="https://github.com/atlas-engineer/nyxt"
EGIT_REPO_URI="https://github.com/atlas-engineer/nyxt.git"

# TODO: Necessary to download dependencies. Otherwise, create dev-lisp packages.
RESTRICT="network-sandbox"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-text/enchant
	dev-db/sqlite
	dev-lisp/sbcl
	dev-lisp/asdf
	sys-libs/libfixposix
	x11-misc/xclip
	net-libs/webkit-gtk
"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

src_compile(){
	export SBCL_HOME=/usr/lib64/sbcl
	echo $SBCL_HOME
	emake all
}

src_install(){
	emake \
		DESTDIR="${D}" \
		PREFIX="/usr" \
		install
}

pkg_postinst(){
	elog "if page not render "
	elog "\"export WEBKIT_DISABLE_COMPOSITING_MODE=1\""
	elog " and try again"
}
