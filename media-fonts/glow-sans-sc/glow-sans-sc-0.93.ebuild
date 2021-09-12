# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Glow Sans is an open source CJK typeface project based on Source Han Sans, Fira Sans and Raleway."
HOMEPAGE="https://github.com/welai/glow-sans"
S="${WORKDIR}/${PN}"

LICENSE="OFL-1.1"
SLOT="0"
IUSE="+normal compressed condensed extended wide"
KEYWORDS="*"

SRC_URI="https://github.com/welai/glow-sans/releases/download/v${PV}/GlowSansSC-Normal-v${PV}.zip
	compressed? ( https://github.com/welai/glow-sans/releases/download/v${PV}/GlowSansSC-Compressed-v${PV}.zip )
	condensed? ( https://github.com/welai/glow-sans/releases/download/v${PV}/GlowSansSC-Condensed-v${PV}.zip )
	extended? ( https://github.com/welai/glow-sans/releases/download/v${PV}/GlowSansSC-Extended-v${PV}.zip )
	wide? ( https://github.com/welai/glow-sans/releases/download/v${PV}/GlowSansSC-Wide-v${PV}.zip )
"

RESTRICT="binchecks strip"

FONT_SUFFIX="otf"
