# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit scons-utils toolchain-funcs eutils

DESCRIPTION="Grounding tools for (disjunctive) logic programs."
HOMEPAGE="http://potassco.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/project/potassco/${PN}/${PV}/${P}-source.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	mv "${P}-source" "${P}"
}

src_prepare() {
	epatch "${FILESDIR}/include-math.patch.0"
	default
}

src_configure() {
	MYSCONS=(
		CXX="$(tc-getCXX)"
		CXXFLAGS="${CXXFLAGS} -std=c++11"
		--build-dir=release
	)
	escons "${MYSCONS[@]}" configure
}

src_compile() {
	escons "${MYSCONS[@]}"
}

src_install() {
	cd "build/release"
	dobin clingo gringo
}

