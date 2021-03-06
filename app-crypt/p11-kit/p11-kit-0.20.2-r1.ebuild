# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-crypt/p11-kit/p11-kit-0.20.2-r1.ebuild,v 1.1 2014/02/15 20:44:24 alonbl Exp $

EAPI=5

inherit eutils multilib-minimal

DESCRIPTION="Provides a standard configuration setup for installing PKCS#11."
HOMEPAGE="http://p11-glue.freedesktop.org/p11-kit.html"
SRC_URI="http://p11-glue.freedesktop.org/releases/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~arm-linux ~x86-linux"
IUSE="+asn1 debug +trust"
REQUIRED_USE="trust? ( asn1 )"

RDEPEND="asn1? ( >=dev-libs/libtasn1-2.14[${MULTILIB_USEDEP}] )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

multilib_src_configure() {
	ECONF_SOURCE="${S}" econf \
		$(use_enable trust trust-module) \
		$(use_enable debug) \
		$(use_with asn1 libtasn1)
}

multilib_src_install_all() {
	prune_libtool_files --modules
}
