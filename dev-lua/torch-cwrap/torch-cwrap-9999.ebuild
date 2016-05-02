# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils git-r3

DESCRIPTION="cwrap helps generate Lua/C wrappers to interface with C functions."
HOMEPAGE="https://github.com/torch/cwrap"

EGIT_REPO_URI="https://github.com/torch/cwrap.git"

LICENSE="BSD2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-lang/lua-5.1:=
dev-lang/luajit:2"
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
