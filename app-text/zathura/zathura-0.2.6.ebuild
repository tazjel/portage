# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/zathura/zathura-0.2.6.ebuild,v 1.3 2013/11/27 10:34:17 ssuominen Exp $

EAPI=5

inherit eutils fdo-mime multilib toolchain-funcs virtualx
[[ ${PV} == 9999* ]] && inherit git-2

DESCRIPTION="A highly customizable and functional document viewer"
HOMEPAGE="http://pwmt.org/projects/zathura/"
if ! [[ ${PV} == 9999* ]]; then
SRC_URI="http://pwmt.org/projects/${PN}/download/${P}.tar.gz"
fi
EGIT_REPO_URI="git://git.pwmt.org/${PN}.git"
EGIT_BRANCH="develop"

LICENSE="ZLIB"
SLOT="0"
if ! [[ ${PV} == 9999* ]]; then
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
else
KEYWORDS=""
fi
IUSE="+doc +deprecated magic sqlite test"

RDEPEND=">=dev-libs/glib-2.28:2
	x11-libs/cairo:=
	deprecated? ( >=dev-libs/girara-0.1.8:2 )
	!deprecated? ( >=dev-libs/girara-0.1.8:3 )
	magic? ( sys-apps/file )
	sqlite? ( dev-db/sqlite:3 )"
DEPEND="${RDEPEND}
	sys-devel/gettext
	virtual/pkgconfig
	doc? ( dev-python/docutils )
	test? ( dev-libs/check )"

pkg_setup() {
	myzathuraconf=(
		ZATHURA_GTK_VERSION=$(usex deprecated 2 3)
		WITH_MAGIC=$(usex magic 1 0)
		WITH_SQLITE=$(usex sqlite 1 0)
		PREFIX="${EPREFIX}"/usr
		LIBDIR='${PREFIX}'/$(get_libdir)
		RSTTOMAN="$(use doc && type -P rst2man.py)"
		CC="$(tc-getCC)"
		SFLAGS=""
		VERBOSE=1
		DESTDIR="${D}"
	)
}

src_compile() {
	emake "${myzathuraconf[@]}"
}

src_test() {
	Xemake "${myzathuraconf[@]}" test
}

src_install() {
	emake "${myzathuraconf[@]}" install
	dodoc AUTHORS
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
