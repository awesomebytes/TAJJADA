# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Command-line argument parser library, like getopt, except better."
HOMEPAGE="https://github.com/maandree/argparser"
EGIT_REPO_URI="https://github.com/maandree/argparser.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake c
}

src_install() {
	emake DESTDIR="${D}" install-c
}
