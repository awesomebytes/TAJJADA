# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="TREPL is a command-line REPL for Torch."
HOMEPAGE="https://github.com/torch/trepl"

EGIT_REPO_URI="https://github.com/torch/trepl.git"

inherit git-r3

LICENSE="BSD3"
SLOT="0"
KEYWORDS=""
IUSE=""

#FIXME: currently hard-code lua 5.1
DEPEND=">=dev-lang/lua-5.1:=
dev-lang/luajit:2
sys-libs/readline
=sci-libs/torch-9999"
RDEPEND="${DEPEND}"

src_compile() {
	cd ${WORKDIR}/${P}
	gcc -shared -fPIC ${CFLAGS} -I/usr/include/luajit-2.0 -o readline.so readline.c -lluajit-5.1 -lreadline
	gcc -shared -fPIC ${CFLAGS} -I/usr/include/luajit-2.0 -o treplutils.so utils.c -lluajit-5.1
}

src_install() {
	cd ${WORKDIR}/${P}
	for name in readline treplutils ; do
		install -Dm755 "${name}.so" "${D}/usr/lib/lua/5.1/${name}.so"
	done
	for name in init colors colorize ; do
		install -Dm644 "${name}.lua" "${D}/usr/share/lua/5.1/trepl/${name}.lua"
	done
	install -Dm755 th "${D}/usr/bin/th"
}
