# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="Paths manipulation library for Lua."
HOMEPAGE="https://github.com/torch/paths"
EGIT_REPO_URI="https://github.com/torch/paths.git"

LICENSE="BSD3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-lang/lua-5.1:=
dev-lang/luajit:2"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DLUADIR=${EPREFIX%/}/usr/lib/lua/5.1"
		"-DLUADIR=${EPREFIX%/}/usr/share/lua/5.1"
		"-DLIBDIR=${EPREFIX%/}/usr/lib/lua/5.1"
		"-DLUA_BINDIR=${EPREFIX%/}/usr/bin"
		"-DLUA_INCDIR=${EPREFIX%/}/usr/include/luajit-2.0"
		"-DLUA_LIBDIR=${EPREFIX%/}/usr/lib"
		"-DLUALIB=${EPREFIX%/}/usr/lib/libluajit-5.1.so"
		"-DLUA=${EPREFIX%/}/usr/bin/luajit"
	)

	cmake-utils_src_configure
}




