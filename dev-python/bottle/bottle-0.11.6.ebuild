# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/bottle/bottle-0.11.6.ebuild,v 1.5 2013/09/05 18:46:52 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy2_0)
inherit distutils-r1 python-r1

DESCRIPTION="A fast and simple micro-framework for small web-applications"
HOMEPAGE="http://pypi.python.org/pypi/bottle http://bottlepy.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
