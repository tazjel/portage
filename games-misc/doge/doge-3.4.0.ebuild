# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-misc/doge/doge-3.4.0.ebuild,v 1.1 2014/01/01 10:41:57 vikraman Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="wow very terminal doge"
HOMEPAGE="https://github.com/thiderman/doge https://pypi.python.org/pypi/doge/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sys-process/procps
	virtual/python-argparse[${PYTHON_USEDEP}]
"
