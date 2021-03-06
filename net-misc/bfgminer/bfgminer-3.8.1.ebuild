# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/bfgminer/bfgminer-3.8.1.ebuild,v 1.1 2014/01/01 23:46:40 blueness Exp $

EAPI="4"

inherit eutils

DESCRIPTION="Modular Bitcoin ASIC/FPGA/GPU/CPU miner in C"
HOMEPAGE="https://bitcointalk.org/?topic=168174"
SRC_URI="http://luke.dashjr.org/programs/bitcoin/files/${PN}/${PV}/${P}.tbz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"

# Waiting for dev-libs/hidapi to be keyworded
#KEYWORDS="~amd64 ~arm ~mips ~ppc ~ppc64 ~x86"

# TODO: knc (needs i2c-tools header)
IUSE="+adl avalon bifury bitforce bfsb bigpic bitfury cpumining examples hardened hashbuster hashbuster2 icarus klondike +libusb littlefury lm_sensors metabank modminer nanofury ncurses +opencl proxy proxy_getwork proxy_stratum scrypt twinfury +udev unicode x6500 ztex"
REQUIRED_USE="
	|| ( avalon bitforce cpumining icarus modminer opencl proxy x6500 ztex )
	adl? ( opencl )
	bfsb? ( bitfury )
	bigpic? ( bitfury )
	hashbuster? ( bitfury )
	hashbuster2? ( bitfury libusb )
	klondike? ( libusb )
	littlefury? ( bitfury )
	lm_sensors? ( opencl )
	metabank? ( bitfury )
	nanofury? ( bitfury )
	scrypt? ( || ( cpumining opencl ) )
	twinfury? ( bitfury )
	unicode? ( ncurses )
	proxy? ( || ( proxy_getwork proxy_stratum ) )
	proxy_getwork? ( proxy )
	proxy_stratum? ( proxy )
	x6500? ( libusb )
	ztex? ( libusb )
"

DEPEND="
	net-misc/curl
	ncurses? (
		sys-libs/ncurses[unicode?]
	)
	>=dev-libs/jansson-2
	net-libs/libblkmaker
	udev? (
		virtual/udev
	)
	hashbuster? (
		dev-libs/hidapi
	)
	libusb? (
		virtual/libusb:1
	)
	lm_sensors? (
		sys-apps/lm_sensors
	)
	nanofury? (
		dev-libs/hidapi
	)
	proxy_getwork? (
		net-libs/libmicrohttpd
	)
	proxy_stratum? (
		dev-libs/libevent
	)
"
RDEPEND="${DEPEND}
	opencl? (
		virtual/opencl
	)
"
DEPEND="${DEPEND}
	virtual/pkgconfig
	>=dev-libs/uthash-1.9.7
	sys-apps/sed
	cpumining? (
		amd64? (
			>=dev-lang/yasm-1.0.1
		)
		x86? (
			>=dev-lang/yasm-1.0.1
		)
	)
"

src_configure() {
	local CFLAGS="${CFLAGS}"
	local with_curses
	use hardened && CFLAGS="${CFLAGS} -nopie"

	if use ncurses; then
		if use unicode; then
			with_curses='--with-curses=ncursesw'
		else
			with_curses='--with-curses=ncurses'
		fi
	else
		with_curses='--without-curses'
	fi

	CFLAGS="${CFLAGS}" \
	econf \
		--docdir="/usr/share/doc/${PF}" \
		$(use_enable adl) \
		$(use_enable avalon) \
		$(use_enable bifury) \
		$(use_enable bitforce) \
		$(use_enable bfsb) \
		$(use_enable bigpic) \
		$(use_enable bitfury) \
		$(use_enable cpumining) \
		$(use_enable hashbuster) \
		$(use_enable hashbuster2) \
		$(use_enable icarus) \
		$(use_enable klondike) \
		$(use_enable littlefury) \
		$(use_enable metabank) \
		$(use_enable modminer) \
		$(use_enable nanofury) \
		$(use_enable opencl) \
		$(use_enable scrypt) \
		$(use_enable twinfury) \
		--with-system-libblkmaker \
		$with_curses \
		$(use_with udev libudev) \
		$(use_with lm_sensors sensors) \
		$(use_with proxy_getwork libmicrohttpd) \
		$(use_with proxy_stratum libevent) \
		$(use_enable x6500) \
		$(use_enable ztex)
}

src_install() {
	emake install DESTDIR="$D"
	if ! use examples; then
		rm -r "${D}/usr/share/doc/${PF}/rpc-examples"
	fi
}
