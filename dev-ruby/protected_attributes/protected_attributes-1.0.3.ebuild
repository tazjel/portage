# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/protected_attributes/protected_attributes-1.0.3.ebuild,v 1.1 2013/10/09 05:15:49 graaff Exp $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_TEST="test"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Protect attributes from mass-assignment in ActiveRecord models"
HOMEPAGE="https://github.com/rails/protected_attributes"
SRC_URI="https://github.com/rails/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SLOT="1"

LICENSE="MIT"

KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "
	=dev-ruby/activemodel-4*
"

ruby_add_bdepend "test? (
	=dev-ruby/actionpack-4*
	=dev-ruby/activerecord-4*
	dev-ruby/mocha
	dev-ruby/sqlite3
)"
