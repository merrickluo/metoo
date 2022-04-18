# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dpayne/cli-visualizer"
	kEYWORDS="*"
else
	SRC_URI="https://github.com/dpayne/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~x86"
fi

DESCRIPTION="CLI based audio visualizer"
HOMEPAGE="https://github.com/dpayne/cli-visualizer"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}
	sci-libs/fftw
	dev-util/cmake"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DCMAKE_CXX_FLAGS="-DNCURSESW"
	)
	cmake_src_configure
}
