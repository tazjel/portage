# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ox/ox-2.1.0.ebuild,v 1.1 2014/02/05 00:13:30 mrueg Exp $

EAPI=5
USE_RUBY="ruby18 ruby19 ruby20 ruby21"

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="A fast XML parser and Object marshaller"
HOMEPAGE="http://www.ohler.com/ox/ https://github.com/ohler55/ox"
SRC_URI="https://github.com/ohler55/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext/ox extconf.rb || die
}

each_ruby_compile() {
	emake V=1  -Cext/ox
	cp ext/ox/ox$(get_modname) lib/ || die
}

each_ruby_test() {
	${RUBY} test/tests.rb || die
}
