# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lua/luaexpat/luaexpat-1.2.0-r1.ebuild,v 1.7 2014/02/22 17:42:17 jer Exp $

EAPI=4

inherit multilib toolchain-funcs flag-o-matic eutils

DESCRIPTION="LuaExpat is a SAX XML parser based on the Expat library."
HOMEPAGE="http://www.keplerproject.org/luaexpat/"
SRC_URI="http://matthewwild.co.uk/projects/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~hppa x86"
IUSE=""

RDEPEND=">=dev-lang/lua-5.1[deprecated]
	dev-libs/expat"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	sed -i -e "s#^LUA_LIBDIR=.*#LUA_LIBDIR=$(pkg-config --variable INSTALL_CMOD lua)#" "${S}/config"
	sed -i -e "s#^LUA_DIR=.*#LUA_DIR=$(pkg-config --variable INSTALL_LMOD lua)#" "${S}/config"
	sed -i -e "s#^LUA_INC=.*#LUA_INC=$(pkg-config --variable INSTALL_INC lua)#" "${S}/config"
	sed -i -e "s#^EXPAT_INC=.*#EXPAT_INC=/usr/include#" "${S}/config"
	sed -i -e "s#^LUA_VERSION_NUM=.*#LUA_VERSION_NUM=501#" "${S}/config"
	epatch "${FILESDIR}/${PV}-destdir-ldflags.patch"
}

src_compile() {
	append-flags -fPIC
	emake \
		CFLAGS="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}" \
		CC="$(tc-getCC)" \
		LD="$(tc-getCC) -shared"
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README
	dohtml -r doc/*
}
