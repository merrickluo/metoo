# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

CRATES="
	aho-corasick-0.7.10
	ansi_term-0.11.0
	arc-swap-0.4.6
	async-std-1.6.0
	async-task-3.0.0
	atty-0.2.14
	autocfg-1.0.0
	bitflags-1.2.1
	bumpalo-3.3.0
	bytes-0.5.4
	cc-1.0.54
	cfg-if-0.1.10
	clap-2.33.1
	crossbeam-0.7.3
	crossbeam-channel-0.4.2
	crossbeam-deque-0.7.3
	crossbeam-epoch-0.8.2
	crossbeam-queue-0.2.2
	crossbeam-utils-0.7.2
	env_logger-0.7.1
	fnv-1.0.7
	fuchsia-zircon-0.3.3
	fuchsia-zircon-sys-0.3.3
	futures-0.3.5
	futures-channel-0.3.5
	futures-core-0.3.5
	futures-executor-0.3.5
	futures-io-0.3.5
	futures-macro-0.3.5
	futures-sink-0.3.5
	futures-task-0.3.5
	futures-timer-3.0.2
	futures-util-0.3.5
	gloo-timers-0.2.1
	heck-0.3.1
	hermit-abi-0.1.13
	humantime-1.3.0
	iovec-0.1.4
	itoa-0.4.5
	js-sys-0.3.40
	kernel32-sys-0.2.2
	kv-log-macro-1.0.6
	lazy_static-1.4.0
	libc-0.2.71
	libpulse-binding-2.15.1
	libpulse-sys-1.13.0
	log-0.4.8
	maybe-uninit-2.0.0
	memchr-2.3.3
	memoffset-0.5.4
	mio-0.6.22
	mio-uds-0.6.8
	miow-0.2.1
	net2-0.2.34
	nix-0.15.0
	nix-0.17.0
	num_cpus-1.13.0
	once_cell-1.4.0
	pin-project-0.4.17
	pin-project-internal-0.4.17
	pin-project-lite-0.1.6
	pin-utils-0.1.0
	piper-0.1.3
	pkg-config-0.3.17
	proc-macro-error-1.0.2
	proc-macro-error-attr-1.0.2
	proc-macro-hack-0.5.16
	proc-macro-nested-0.1.4
	proc-macro2-1.0.18
	quick-error-1.2.3
	quote-1.0.6
	redox_syscall-0.1.56
	regex-1.3.9
	regex-syntax-0.6.18
	ryu-1.0.5
	scoped-tls-hkt-0.1.2
	scopeguard-1.1.0
	send_wrapper-0.4.0
	serde-1.0.111
	serde_derive-1.0.111
	serde_json-1.0.53
	signal-hook-registry-1.2.0
	slab-0.4.2
	smol-0.1.10
	socket2-0.3.12
	strsim-0.8.0
	structopt-0.3.14
	structopt-derive-0.4.7
	syn-1.0.30
	syn-mid-0.5.0
	termcolor-1.1.0
	textwrap-0.11.0
	thread_local-1.0.1
	tokio-0.2.21
	tokio-macros-0.2.5
	unicode-segmentation-1.6.0
	unicode-width-0.1.7
	unicode-xid-0.2.0
	vec_map-0.8.2
	version_check-0.9.2
	void-1.0.2
	wasm-bindgen-0.2.63
	wasm-bindgen-backend-0.2.63
	wasm-bindgen-futures-0.4.13
	wasm-bindgen-macro-0.2.63
	wasm-bindgen-macro-support-0.2.63
	wasm-bindgen-shared-0.2.63
	web-sys-0.3.40
	wepoll-binding-2.0.2
	wepoll-sys-2.0.0
	winapi-0.2.8
	winapi-0.3.8
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	ws2_32-sys-0.2.1
	x11-2.18.2
	xcb-0.9.0
"

inherit cargo

DESCRIPTION="xautolock rewrite in Rust, with a few extra features"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://gitlab.com/jD91mZM2/xidlehook"
SRC_URI="$(cargo_crate_uris ${CRATES}) https://github.com/jD91mZM2/xidlehook/archive/refs/tags/${PV}.tar.gz"
RESTRICT="mirror"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 BSD-3-Clause BSL-1.0 MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+pulse"

DEPEND="
	x11-libs/libxcb
	x11-libs/libXScrnSaver
	pulse? ( media-sound/pulseaudio )
"
RDEPEND=""
BDEPEND="dev-lang/rust"

src_configure() {
	local myfeatures=(
		$(usev pulse)
	)
	cargo_src_configure --no-default-features
}

src_install() {
	cargo_src_install --path xidlehook-daemon/
}