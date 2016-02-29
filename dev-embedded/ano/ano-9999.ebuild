# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Commandline utilities for Arduino development. Updated fork of 'ino'."
HOMEPAGE="https://github.com/scottdarch/Arturo/"

EGIT_REPO_URI="https://github.com/scottdarch/Arturo.git"

inherit git-r3

LICENSE="MIT"
SLOT="0"

CDEPEND="${PYTHON_DEPS}
		net-dialup/picocom
		<=dev-embedded/arduino-1.6.1
		dev-embedded/avrdude
		dev-python/jinja[${PYTHON_USEDEP}]
		dev-python/configobj[${PYTHON_USEDEP}]
		dev-python/glob2[${PYTHON_USEDEP}]
		dev-python/pyserial[${PYTHON_USEDEP}]"
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

