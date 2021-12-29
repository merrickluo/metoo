# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop xdg

MY_PN=charles
DESCRIPTION="Web debugging proxy application."
HOMEPAGE="https://www.charlesproxy.com/"
SRC_URI="https://www.charlesproxy.com/assets/release/${PV}/${MY_PN}-proxy-${PV}_amd64.tar.gz"

LICENSE="Charles Apache-2.0 MIT GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="|| ( dev-java/openjdk-bin:11
	dev-java/openjdk:11 )"
RESTRICT="strip"

S="${WORKDIR}/charles"
PATCHES=( "${FILESDIR}/${MY_PN}-misc.patch" )

src_prepare() {
	# Collides with Wireshark
	find . -name application-vnd.tcpdump.pcap.png -delete
	rm -R lib/jdk || die
	sed -e "s/^Icon=.*/Icon=${MY_PN}-proxy/" -i etc/${MY_PN}-proxy.desktop || die
	xdg_src_prepare
	sed -e "s/@EPREFIX@/${EPREFIX}/g" -i bin/${MY_PN}
}

src_install() {
	dobin bin/${MY_PN} bin/add-to-java-cacerts.sh
	insinto /usr/share/java/${MY_PN}
	doins lib/*.jar
	insinto /usr/share/icons/hicolor
	doins -r icon/*
	insinto /usr/share/applications
	domenu etc/*.desktop
	insinto /usr/share/mime/packages
	doins etc/mime/*.xml
	einstalldocs
}
