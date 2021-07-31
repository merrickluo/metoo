# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop git-r3 xdg python-utils-r1

PYTHON_COMPAT=( python3_{7..9} )

DESCRIPTION="Records what you do so that you can know how you've spent your time. All in a secure way where you control the data."
HOMEPAGE="https://github.com/ActivityWatch/activitywatch"

EGIT_REPO_URI="https://github.com/ActivityWatch/activitywatch"
EGIT_REPO_BRANCH="master"

RESTRICT="network-sandbox"
SLOT=0

BDEPEND="
	virtual/rust
	>=dev-lang/python-3.7
	dev-python/pip
	>=net-libs/nodejs-12
"

DEPEND="
	>=dev-lang/python-3.7
"
