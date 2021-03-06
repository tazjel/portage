# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-irc/dccserver/dccserver-0.5.ebuild,v 1.1 2014/01/14 06:42:42 patrick Exp $

DESCRIPTION="linux implementation of the mirc dccserver command"
SRC_URI="http://www.nih.at/dccserver/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""
HOMEPAGE="http://www.nih.at/dccserver/"

DEPEND=""

src_install() {
	einstall || die "einstall failed"
	dodoc AUTHORS NEWS THANKS TODO
}
