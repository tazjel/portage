# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-libs/ccolamd/ccolamd-2.8.0.ebuild,v 1.3 2013/07/18 14:13:46 chithanh Exp $

EAPI=5

inherit autotools-utils

DESCRIPTION="Constrained Column approximate minimum degree ordering algorithm"
HOMEPAGE="http://www.cise.ufl.edu/research/sparse/ccolamd/"
SRC_URI="http://dev.gentoo.org/~bicatali/distfiles/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"

KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ppc ~ppc64 ~sparc ~x86 ~amd64-fbsd ~amd64-linux ~x86-linux ~x86-macos"
IUSE="static-libs"

RDEPEND="sci-libs/suitesparseconfig"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
