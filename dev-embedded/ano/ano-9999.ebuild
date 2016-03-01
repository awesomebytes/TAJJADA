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
	elog "To compile programs for Arduino, you need a cross-compiler."
	elog "You can install one using the 'crossdev' tool, as follows:"
	elog "'crossdev -S -t avr' --> for the AVR-based Arduino boards."
	ewarn ""
	ewarn "'ano' does not currently support ARM/SAM-based Arduino boards."
	ewarn ""
	ewarn "There is a bug with cross-binutils for AVR (bug #147155), which"
	ewarn "can cause linker errors. Fortunately, there is an easy workaround:"
	ewarn "You must create the following symlink manually on your system:"
	ewarn "ln -s /usr/lib/binutils/avr/2.25.1/ldscripts /usr/avr/lib/ldscripts"
	ewarn "replacing '2.25.1' with the correct version of cross-binutils"
	ewarn "installed on your system. If you ever update or re-install the"
	ewarn "cross-avr/binutils package on your system, you will need to"
	ewarn "re-create the above symlink accordingly, or linker errors will occur."

	ewarn ""
	ewarn "As of 2016-03-01, AVR-gcc-5.x does not seem to work. You should"
	ewarn "install the stable (4.9.x) version of cross-gcc using the '-S'"
	ewarn "option when invoking the 'crossdev' command."
}
