# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/d-feet/d-feet-0.3.8.ebuild,v 1.3 2014/02/22 21:25:19 pacho Exp $

EAPI="5"
GCONF_DEBUG="no"
PYTHON_COMPAT=( python2_7 )

inherit autotools gnome2 python-single-r1

DESCRIPTION="D-Feet is a powerful D-Bus debugger"
HOMEPAGE="http://live.gnome.org/DFeet"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	>=dev-libs/glib-2.34:2
	>=dev-libs/gobject-introspection-0.9.6
	>=dev-python/pygobject-3.3.91:3[${PYTHON_USEDEP}]
	>=sys-apps/dbus-1
	>=x11-libs/gtk+-3.9.4:3[introspection]
	x11-libs/libwnck:3[introspection]
"
DEPEND="
	${PYTHON_DEPS}
	app-text/yelp-tools
	>=dev-util/intltool-0.40.0
	test? ( dev-python/pep8 )
"

src_prepare() {
	python_fix_shebang .

	# Do not run update-desktop-database (sandbox violation)
	sed -e '/^UPDATE_DESKTOP/s:=.*:=true:' \
		-i data/Makefile.am data/Makefile.in || die

	gnome2_src_prepare
}

src_configure() {
	gnome2_src_configure \
		$(use_enable test tests)
}
