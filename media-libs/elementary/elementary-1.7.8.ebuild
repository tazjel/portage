# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/elementary/elementary-1.7.8.ebuild,v 1.1 2013/08/06 20:01:06 tommy Exp $

EAPI=2

inherit autotools enlightenment

DESCRIPTION="Basic widget set, based on EFL for mobile touch-screen devices."
HOMEPAGE="http://trac.enlightenment.org/e/wiki/Elementary"
SRC_URI="http://download.enlightenment.org/releases/${P}.tar.bz2"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~x86"
IUSE="dbus debug emotion ethumb examples fbcon opengl quicklaunch sdl X xcb xdg static-libs"

DEPEND="
	>=dev-libs/ecore-1.7.8[evas,fbcon?,opengl?,sdl?,X?,xcb?]
	>=dev-libs/eet-1.7.8
	>=media-libs/evas-1.7.8[fbcon?,opengl?,X?,xcb?]
	>=media-libs/edje-1.7.8
	dbus? ( >=dev-libs/e_dbus-1.7.6 )
	emotion? ( >=media-libs/emotion-1.7.6 )
	ethumb? ( >=media-libs/ethumb-1.7.6 )
	xdg? ( >=dev-libs/efreet-1.7.8 )
	"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i "s:1.7.8:1.7.6:g" configure.ac
	eautoreconf
}

src_configure() {
	MY_ECONF="$(use_enable dbus edbus)
		$(use_enable debug)
		$(use_enable doc)
		--disable-ecore-cocoa
		--disable-ecore-psl1ght
		--disable-ecore-wayland
		--disable-ecore-win32
		--disable-ecore-wince
		--disable-emap
		$(use_enable emotion)
		$(use_enable ethumb)
		--disable-eweather
		$(use_enable examples build-examples)
		$(use_enable examples install-examples)
		$(use_enable fbcon ecore-fb)
		$(use_enable sdl ecore-sdl)
		--disable-web
		$(use_enable X ecore-x)
		$(use_enable quicklaunch quick-launch)
		$(use_enable xdg efreet)"

	enlightenment_src_configure
}
