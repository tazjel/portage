# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libpcapnav/libpcapnav-0.8.ebuild,v 1.2 2008/03/21 15:57:56 maekke Exp $

DESCRIPTION="A libpcap wrapper library that allows navigation to arbitrary packets in a tcpdump trace file between reads, using timestamps or percentage offsets."
HOMEPAGE="http://netdude.sourceforge.net/"
SRC_URI="mirror://sourceforge/netdude/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~sparc ~x86"
IUSE="doc"

DEPEND="net-libs/libpcap"

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	rm -fr "${D}"/usr/share/gtk-doc
	dodoc AUTHORS ChangeLog README
	use doc && dohtml -r docs/*.css docs/html/*.html docs/images
}
