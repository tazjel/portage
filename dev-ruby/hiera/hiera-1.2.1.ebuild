# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/hiera/hiera-1.2.1.ebuild,v 1.7 2014/01/06 09:28:35 ago Exp $

EAPI=5

USE_RUBY="ruby18 ruby19 ree18 jruby"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="A simple pluggable Hierarchical Database"
HOMEPAGE="http://projects.puppetlabs.com/"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""
KEYWORDS="amd64 hppa ppc sparc x86"

ruby_add_bdepend "test? ( dev-ruby/mocha )"

ruby_add_rdepend "dev-ruby/json"

all_ruby_prepare() {
	# Our json package is either the compiled version or the pure
	# version. Fix gemspec accordingly.
	sed -i -e 's/json_pure/json/' ../metadata || die
}
