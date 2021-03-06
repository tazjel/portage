# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/libusb/libusb-1-r1.ebuild,v 1.13 2014/02/02 10:00:33 ssuominen Exp $

EAPI=5
inherit multilib-build

DESCRIPTION="Virtual for libusb"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="1"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~arm-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE=""

RDEPEND="|| ( >=dev-libs/libusb-1.0.18:1[${MULTILIB_USEDEP}] >=dev-libs/libusbx-1.0.17:1[${MULTILIB_USEDEP}] >=dev-libs/libusb-1.0.9-r2:1[${MULTILIB_USEDEP}] >=sys-freebsd/freebsd-lib-9.1_rc3-r1[usb,${MULTILIB_USEDEP}] )"
DEPEND=""
