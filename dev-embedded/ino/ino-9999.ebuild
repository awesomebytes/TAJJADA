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

CDEPEND="net-dialup/picocom
		dev-embedded/arduino
		dev-embedded/avrdude
		dev-python/configobj
		dev-python/glob2
		dev-python/pyserial"
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"


