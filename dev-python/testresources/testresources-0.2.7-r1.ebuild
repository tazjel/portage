# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/testresources/testresources-0.2.7-r1.ebuild,v 1.1 2014/01/14 06:01:50 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Testresources, a pyunit extension for managing expensive test resources."
HOMEPAGE="https://launchpad.net/testresources"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		test? ( dev-python/nose[${PYTHON_USEDEP}]
				dev-python/testtools[${PYTHON_USEDEP}]
				dev-python/fixtures[${PYTHON_USEDEP}]
				virtual/python-unittest2[${PYTHON_USEDEP}] )"
RDEPEND=""

python_test() {
	nosetests || die "Tests failed under ${EPYTHON}"
}
