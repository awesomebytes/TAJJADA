# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="Fight Flash Fraud, or Fight Fake Flash"
HOMEPAGE="http://oss.digirati.com.br/f3/"
EGIT_REPO_URI="https://github.com/AltraMayor/f3"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+experimental"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	export CFLAGS="${CFLAGS} -fgnu89-inline"
	emake all
	if use experimental; then
		emake experimental
	fi
}

src_install() {
	emake install PREFIX="$D/usr/"
	if use experimental; then
		emake install-experimental PREFIX="$D/usr/"
	fi
}
