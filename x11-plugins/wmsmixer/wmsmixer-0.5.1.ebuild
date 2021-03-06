# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=0

inherit eutils
IUSE=""
DESCRIPTION="fork of wmmixer adding scrollwheel support and other features"
HOMEPAGE="https://www.dockapps.net/wmsmixer"
SRC_URI="https://www.dockapps.net/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc ppc64 sparc x86"

RDEPEND="x11-libs/libXpm
	x11-libs/libXext
	x11-libs/libX11"
DEPEND="${RDEPEND}
	x11-base/xorg-proto"

src_compile() {
	g++ ${CFLAGS} -I/usr/X11R6/include -c -o wmsmixer.o wmsmixer.cc
	rm -f wmsmixer
	g++ ${LDFLAGS} -o wmsmixer ${CFLAGS} -L/usr/X11R6/lib wmsmixer.o -lXpm -lXext -lX11
}

src_install() {
	insinto /usr/bin
	insopts -m0655
	doins wmsmixer
	dodoc README README.wmmixer
}
