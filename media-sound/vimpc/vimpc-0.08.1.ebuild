# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/vimpc/vimpc-0.08.1.ebuild,v 1.3 2014/01/14 13:55:03 ago Exp $

EAPI=4

DESCRIPTION="An ncurses based mpd client with vi like key bindings."
HOMEPAGE="http://vimpc.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/${PN}/Release%20${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-libs/libpcre[cxx]
	media-libs/libmpdclient"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S=${WORKDIR}/${PN}

DOCS=( AUTHORS README.md doc/vimpcrc.example )

src_configure() {
	econf --docdir="${EPREFIX}"/usr/share/doc/${PF}
}

src_install() {
	default

	# vimpc will look for help.txt
	docompress -x /usr/share/doc/${PF}/help.txt
}
