# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="cwrap helps generate Lua/C wrappers to interface with C functions."
HOMEPAGE="https://github.com/szagoruyko/loadcaffe"

EGIT_REPO_URI="https://github.com/szagoruyko/loadcaffe.git"

inherit git-r3

LICENSE="BSD2"
SLOT="0"
KEYWORDS=""
IUSE=""

inherit cmake-utils

#FIXME: currently hard-code lua 5.1
DEPEND=">=dev-lang/lua-5.1:=
dev-lang/luajit
dev-libs/protobuf"
RDEPEND="${DEPEND}"

BUILD_DIR="${WORKDIR}/${P}/build"

src_install() {
	cmake-utils_src_install

	# Move Lua C module
	mkdir -p "${D}/usr/lib/lua/5.1"
	mv "${D}/usr/lib/libloadcaffe.so" "${D}/usr/lib/lua/5.1/"

	# Move pure Lua modules
	mkdir -p "${D}/usr/share/lua/5.1"
	mv "${D}/usr/lua/loadcaffe" "${D}/usr/share/lua/5.1/"
	rm -rf "${D}/usr/lua"
}
