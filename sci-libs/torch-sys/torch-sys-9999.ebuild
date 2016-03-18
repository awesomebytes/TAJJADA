# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Torch module for system functions."
HOMEPAGE="https://github.com/torch/sys"

EGIT_REPO_URI="https://github.com/torch/sys.git"

inherit git-r3

LICENSE="BSD3"
SLOT="0"
KEYWORDS=""
IUSE=""

inherit cmake-utils

#FIXME: currently hard-code lua 5.1
DEPEND=">=dev-lang/lua-5.1:=
dev-lang/luajit:2
=sci-libs/torch-9999"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DLUADIR=/usr/lib/lua/5.1"
		"-DLUADIR=/usr/share/lua/5.1"
		"-DLIBDIR=/usr/lib/lua/5.1"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=/usr/include/luajit-2.0"
		"-DLUA_LIBDIR=/usr/lib"
		"-DLUALIB=/usr/lib/libluajit-5.1.so"
		"-DLUA=/usr/bin/luajit"
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	mkdir -p "${D}"/usr/lib/lua/5.1 "${D}"/usr/share/lua/5.1
	mv "${D}"/usr/lib/* "${D}"/usr/lib/lua/5.1/
	mv "${D}"/usr/lua/* "${D}"/usr/share/lua/5.1/
	rm -rf "${D}"/usr/lua
}

