# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3

DESCRIPTION="Thin wrapper over POSIX syscalls."
HOMEPAGE="https://github.com/sionescu/libfixposix"
EGIT_REPO_URI="https://github.com/sionescu/libfixposix.git"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-libs/glibc"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

#after compile - libtool: warning: remember to run 'libtool --finish /usr/lib64'

src_prepare(){
	default
	eautoreconf
}
