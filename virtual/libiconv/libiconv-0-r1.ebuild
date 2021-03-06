# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/libiconv/libiconv-0-r1.ebuild,v 1.7 2014/03/02 22:41:05 pacho Exp $

EAPI=4

inherit multilib-build

DESCRIPTION="Virtual for the GNU conversion library"
HOMEPAGE=""
SRC_URI=""
LICENSE=""
SLOT="0"
KEYWORDS="~alpha amd64 arm ~arm64 hppa ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~ppc-aix ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~hppa-hpux ~ia64-hpux ~x86-interix ~amd64-linux ~arm-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris ~x86-winnt"
IUSE="elibc_glibc elibc_uclibc elibc_musl"
DEPEND=""

# - Don't put elibc_glibc? ( sys-libs/glibc ) to avoid circular deps between
# that and gcc
RDEPEND="!elibc_glibc? ( !elibc_uclibc? ( !elibc_musl? ( dev-libs/libiconv[${MULTILIB_USEDEP}] ) ) )"
