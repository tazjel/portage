# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/cmocka/cmocka-0.3.1.ebuild,v 1.5 2014/01/06 06:12:51 naota Exp $

EAPI=5

inherit cmake-utils
DESCRIPTION="A unit testing framework for C"
HOMEPAGE="http://cmocka.org/"
SRC_URI="https://open.cryptomilk.org/attachments/download/19/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~x86 ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="doc static-libs test"

DEPEND="
	doc? ( app-doc/doxygen[latex] )
"
RDEPEND=""

PATCHES=( "${FILESDIR}/${PN}-automagicness.patch" )

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with static-libs STATIC_LIB)
		$(cmake-utils_use test UNIT_TESTING)
		$(cmake-utils_use_with doc APIDOC)
	)
	cmake-utils_src_configure
}

src_install() {
	if use doc; then
		pushd "${BUILD_DIR}/doc/"
		doxygen doxy.config
		rm html/*.md5 latex/*.md5 latex/Manifest man/man3/_*
		dohtml html/*
		dodoc latex/*
		doman man/man3/*.3
		popd
	fi
	cmake-utils_src_install
}
