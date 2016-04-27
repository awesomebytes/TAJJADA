# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Allow running ~/.xinitrc as a X session from display manager."
HOMEPAGE="https://aur.archlinux.org/packages/xinit-xsession/"
SRC_URI="https://aur.archlinux.org/cgit/aur.git/snapshot/xinit-xsession.tar.gz"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_install() {
	cd "${S}"
	install -d -m 755 "${D}"/usr/bin
    cp xinitrcsession-helper "${D}"/usr/bin/
    install -d "${D}"/usr/share/xsessions
    cp xinitrc.desktop "${D}"/usr/share/xsessions/
}
