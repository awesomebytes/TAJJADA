# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Commandline utilities for Arduino development."
HOMEPAGE="https://github.com/amperka/ino"

EGIT_REPO_URI="https://github.com/amperka/ino.git"

inherit git-r3

LICENSE="MIT"
SLOT="0"

CDEPEND="${PYTHON_DEPS}
		net-dialup/picocom
		dev-embedded/arduino
		dev-embedded/avrdude
		dev-python/jinja[${PYTHON_USEDEP}]
		dev-python/configobj[${PYTHON_USEDEP}]
		dev-python/glob2[${PYTHON_USEDEP}]
		dev-python/pyserial[${PYTHON_USEDEP}]"
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

pkg_postinst() {
	ewarn "ino has been abandoned/unsupported by the upstream developers"
	ewarn "for years now, and has not been updated to support new versions"
	ewarn "of Arduino. Most recent versions of Arduino will *NOT* work."
    ewarn ""
	ewarn "You should try to use 'Arturo'/'ano' instead, which is a fork of"
	ewarn "the original ino by another developer, to continue development, and"
	ewarn "supports more recent versions of Arduino (up to 1.6.1), as available"
	ewarn "in the TAJJADA overlay. An ebuild is available as 'dev-embedded/ano'."
}
