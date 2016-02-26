# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="The Flexible/Functional Message Logging Library for C"
HOMEPAGE="https://github.com/tajjada/flog"
SRC_URI="https://github.com/tajjada/flog/archive/v${PV}.tar.gz"

LICENSE="ZLIB"
#SLOT="${PV:0:3}"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"

DEPEND=""
RDEPEND=""

src_compile() {
	if use static-libs; then
		emake all
	else
		emake shared
	fi
}

src_install() {
	make PREFIX=${D}/usr install
}
