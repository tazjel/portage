# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/gnome-user-share/gnome-user-share-3.10.1.ebuild,v 1.3 2014/02/22 21:59:42 pacho Exp $

EAPI="5"
GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit gnome2 multilib

DESCRIPTION="Personal file sharing for the GNOME desktop"
HOMEPAGE="https://git.gnome.org/browse/gnome-user-share"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bluetooth"

# FIXME: could libnotify be made optional ?
# FIXME: selinux automagic support
RDEPEND="
	>=dev-libs/glib-2.28:2
	>=x11-libs/gtk+-3:3
	>=gnome-base/nautilus-2.91.7
	media-libs/libcanberra[gtk3]
	>=www-apache/mod_dnssd-0.6
	>=www-servers/apache-2.2[apache2_modules_dav,apache2_modules_dav_fs,apache2_modules_authn_file,apache2_modules_auth_digest,apache2_modules_authz_groupfile]
	>=x11-libs/libnotify-0.7:=
	bluetooth? (
		>=app-mobilephone/obex-data-server-0.4
		>=net-wireless/gnome-bluetooth-3.9.3:2
		>=net-wireless/bluez-4.18 )
"
DEPEND="${RDEPEND}
	!<gnome-base/gnome-control-center-3.9
	app-text/yelp-tools
	app-text/docbook-xml-dtd:4.1.2
	>=dev-util/intltool-0.35
	sys-devel/gettext
	virtual/pkgconfig
"

src_configure() {
	gnome2_src_configure \
		$(use_enable bluetooth) \
		ITSTOOL=$(type -P true) \
		--with-httpd=apache2 \
		--with-modules-path=/usr/$(get_libdir)/apache2/modules/
}

src_install() {
	gnome2_src_install

	# FIXME: looks like upstream forgot about this
	rm "${D}"/etc/xdg/autostart/gnome-user-share-obexpush.desktop || die
}
