# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

AUTOTOOLS_AUTORECONF=true

inherit git-r3 autotools-multilib

DESCRIPTION="A JSON implementation in C"
HOMEPAGE="https://github.com/json-c/json-c/wiki"

EGIT_REPO_URI="https://github.com/json-c/json-c.git"

LICENSE="MIT"
SLOT="0/0"
KEYWORDS=""
IUSE="doc static-libs"

RDEPEND=""

# tests break otherwise
AUTOTOOLS_IN_SOURCE_BUILD=1

src_test() {
	export USE_VALGRIND=0 VERBOSE=1
	autotools-multilib_src_test
}

src_install() {
	use doc && HTML_DOCS=( "${S}"/doc/html )
	autotools-multilib_src_install

	# add symlink for projects not using pkgconfig
	dosym ../json-c /usr/include/json-c/json
}
