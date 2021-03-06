# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/vdr-picselshow/vdr-picselshow-0.0.2.ebuild,v 1.3 2014/01/08 15:30:21 hd_brummy Exp $

EAPI=5

inherit vdr-plugin-2

DESCRIPTION="VDR plugin: picselshow for vdr-music"
HOMEPAGE="http://www.vdr.glaserei-franz.de/"
SRC_URI="http://www.kost.sh/vdr/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE="imagemagick"

PATCHES=("${FILESDIR}/${P}-vdr-1.5.x.diff"
	"${FILESDIR}/${P}-gcc-4.4.diff"
	"${FILESDIR}/${P}-gentoo.diff")

DEPEND="imagemagick? ( media-gfx/imagemagick )
		!imagemagick? ( media-libs/imlib2 )"

RDEPEND="media-plugins/vdr-image
		=media-plugins/vdr-music-0.2.0"

src_prepare() {
	vdr-plugin-2_src_prepare

	use imagemagick && sed -i Makefile -e "s:#HAVE_MAGICK=1:HAVE_MAGICK=1:"

	sed -i example/imagesources.conf -e "s:/media/vdrdaten/bilder:/mnt/images:"

	sed -i example/imagesources.conf -e \
		"s:/VDR/etc/plugins/music/downloads/music_cover:/etc/vdr/plugins/music/downloads/music_cover:"
}

src_install() {
	vdr-plugin-2_src_install

	insinto /etc/vdr/plugins/picselshow
	doins -r picselshow/*
	doins example/*
}
