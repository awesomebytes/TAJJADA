# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="hqx is a fast, high-quality magnification filter designed for pixel art."
HOMEPAGE="https://code.google.com/archive/p/hqx/"
SRC_URI="https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/hqx/hqx-1.1.tar.gz"

LICENSE="LGPL3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="media-libs/devil"
RDEPEND="${DEPEND}"

src_compile () {
		export MAKEOPTS="-j1"
		emake all
}
