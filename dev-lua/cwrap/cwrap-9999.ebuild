# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="cwrap helps generate Lua/C wrappers to interface with C functions."
HOMEPAGE="https://github.com/torch/cwrap"

EGIT_REPO_URI="https://github.com/torch/cwrap.git"

inherit git-r3

LICENSE="BSD2"
SLOT="0"
KEYWORDS=""
IUSE=""

inherit cmake-utils

#FIXME: currently hard-code lua 5.1
DEPEND=">=dev-lang/lua-5.1:="
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DLUADIR=/usr/share/lua/5.1"
	)

	cmake-utils_src_configure
}
