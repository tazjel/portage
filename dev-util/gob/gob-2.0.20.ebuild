# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/gob/gob-2.0.20.ebuild,v 1.3 2014/02/22 21:28:47 pacho Exp $

EAPI="5"
GCONF_DEBUG="no"
GNOME_ORG_MODULE="gob2"

inherit gnome2

DESCRIPTION="Preprocessor for making GTK+ objects with inline C code"
HOMEPAGE="http://www.jirka.org/gob.html"

LICENSE="GPL-2+"
SLOT="2"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE=""

RDEPEND=">=dev-libs/glib-2.4:2"
DEPEND="${RDEPEND}
	sys-devel/flex
	virtual/pkgconfig
	virtual/yacc
"
