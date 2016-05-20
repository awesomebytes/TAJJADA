# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="SHA-3 and Keccak checksum utility"
HOMEPAGE="https://github.com/maandree/sha3sum"
EGIT_REPO_URI="https://github.com/maandree/sha3sum.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/libkeccak dev-libs/argparse"
RDEPEND="${DEPEND}"

src_compile() {
	emake command
}

src_install() {
	emake DESTDIR="${D}" install-base
}
