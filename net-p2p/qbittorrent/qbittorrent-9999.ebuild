# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-p2p/qbittorrent/qbittorrent-9999.ebuild,v 1.14 2013/12/30 12:55:47 hwoarang Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

EGIT_REPO_URI="git://github.com/${PN}/qBittorrent.git
https://github.com/${PN}/qBittorrent.git"

inherit python-r1 qt4-r2 git-2

DESCRIPTION="BitTorrent client in C++ and Qt"
HOMEPAGE="http://www.qbittorrent.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

IUSE="dbus +X geoip"

# python-2 is a runtime dep only, for the search engine (see INSTALL file)
CDEPEND="dev-libs/boost
	dev-qt/qtcore:4
	net-libs/rb_libtorrent
	>=dev-qt/qtsingleapplication-2.6.1_p20130904
	X? ( dev-qt/qtgui:4 )

	dbus? ( dev-qt/qtdbus:4 )"
DEPEND="${CDEPEND}
	virtual/pkgconfig"
RDEPEND="${CDEPEND}
	${PYTHON_DEPS}
	geoip? ( dev-libs/geoip )"

DOCS="AUTHORS Changelog NEWS README TODO"

src_prepare() {
	# Respect LDFLAGS
	sed -i -e 's/-Wl,--as-needed/$(LDFLAGS)/g' src/src.pro
	qt4-r2_src_prepare
}

src_configure() {
	local myconf
	use geoip     || myconf+=" --disable-geoip-database"
	use dbus      || myconf+=" --disable-qt-dbus"
	use X         || myconf+=" --disable-gui"

	# econf fails, since this uses qconf
	./configure --prefix=/usr --qtdir=/usr \
		--with-qtsingleapplication=system \
		--with-libboost-inc=/usr/include/boost \
		${myconf} || die "configure failed"
	eqmake4
}
