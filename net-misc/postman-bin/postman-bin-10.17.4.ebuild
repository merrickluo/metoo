# Copyright 2020 Gianni Bombelli <bombo82@giannibombelli.it>
# Distributed under the terms of the GNU General Public License  as published by the Free Software Foundation;
# either version 2 of the License, or (at your option) any later version.

EAPI=8

inherit desktop pax-utils xdg

MY_PN="${PN/-bin/}"

DESCRIPTION="Supercharge your API workflow"
HOMEPAGE="https://www.getpostman.com"
SRC_URI="
	amd64? ( https://dl.pstmn.io/download/version/${PV}/linux64 -> ${P}-amd64.tar.gz )
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="pax_kernel"
RESTRICT="mirror strip"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN^}/app"

src_prepare() {
	mv _Postman Postman
	default
}

src_install() {
	local dir="/opt/${PN}"

	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}"/Postman

	make_wrapper "${PN}" "${dir}/Postman"
	newicon "resources/app/assets/icon.png" "${PN}.png"
	make_desktop_entry "${PN}" "Postman" "${PN}" "Development;IDE;"

	use pax_kernel && pax-mark m "${ED}/opt/${MY_PN}/${MY_PN^}"
}
