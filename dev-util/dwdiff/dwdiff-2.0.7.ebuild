# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/dwdiff/dwdiff-2.0.7.ebuild,v 1.1 2014/01/02 09:33:14 polynomial-c Exp $

EAPI=5
inherit eutils toolchain-funcs

DESCRIPTION="A front-end for the diff program that operates at the word level instead of the line level"
HOMEPAGE="http://os.ghalkes.nl/dwdiff.html"
SRC_URI="http://os.ghalkes.nl/dist/${P}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="nls"

COMMON_DEPEND="dev-libs/icu:="
RDEPEND="${COMMON_DEPEND}
	sys-apps/diffutils"
DEPEND="${COMMON_DEPEND}
	nls? ( sys-devel/gettext )"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-2.0.7-configure_fixes.patch
	sed -i \
		-e '/INSTALL/s:COPYING::' \
		Makefile.in || die
}

src_configure() {
	./configure \
		--prefix=/usr \
		$(use_with nls gettext) || die
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"
}

src_install() {
	emake prefix="${D}/usr" docdir="${D}/usr/share/doc/${PF}" install
}
