# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/udiskie/udiskie-0.6.2.ebuild,v 1.4 2014/03/02 23:19:18 pacho Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )
inherit distutils-r1 gnome2-utils

DESCRIPTION="An automatic disk mounting service using udisks"
HOMEPAGE="http://pypi.python.org/pypi/udiskie http://github.com/coldfix/udiskie"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~x86"
IUSE=""

RDEPEND="dev-python/dbus-python
	dev-python/notify-python
	dev-python/pygobject:2
	dev-python/pyxdg
	sys-fs/udisks"
DEPEND="app-text/asciidoc
	dev-python/setuptools"

src_prepare() {
	sed -i -e 's:gtk-update-icon-cache:true:' setup.py || die
	distutils-r1_src_prepare
}

src_compile() {
	distutils-r1_src_compile
	emake -C doc
}

src_install() {
	distutils-r1_src_install
	doman doc/${PN}.8
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
