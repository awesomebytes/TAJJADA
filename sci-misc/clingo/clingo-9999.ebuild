# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit scons-utils toolchain-funcs eutils git-r3

DESCRIPTION="Answer Set Programming grounder and solver"
HOMEPAGE="http://potassco.org/clingo"

EGIT_REPO_URI="https://github.com/potassco/clingo.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-util/re2c
		sys-devel/bison"
RDEPEND=""

src_configure() {
	MYSCONS=(
		CXX="$(tc-getCXX)"
		CXXFLAGS="${CXXFLAGS} -std=c++11"
		--build-dir=release
		WITH_THREADS="posix"
	)
	escons "${MYSCONS[@]}" configure
}

src_compile() {
	escons "${MYSCONS[@]}"
}

src_install() {
	cd "build/release"
	dobin clingo gringo reify lpconvert
}

