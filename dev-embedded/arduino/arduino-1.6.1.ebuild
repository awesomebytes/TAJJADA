# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="An open-source AVR electronics prototyping platform"
HOMEPAGE="http://arduino.cc/ https://arduino.googlecode.com/"
SRC_URI=""
LICENSE="GPL-2 GPL-2+ LGPL-2 CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+minimal"

CDEPEND="!minimal? ( =dev-embedded/arduino-ide-${PV} )
=dev-embedded/arduino-libs-${PV}"

RDEPEND="${CDEPEND}"

DEPEND="${CDEPEND}"

src_unpack() {
	mkdir -p "${WORKDIR}/${P}"
}

src_install() {
	if use minimal; then
		mkdir -p "${D}/usr/share/arduino/lib"
		echo "${PV}" > "${D}/usr/share/arduino/lib/version.txt"
	fi
	true
}

pkg_postinst() {
	elog "To compile programs for Arduino, you need a cross-compiler."
	elog "You can install one using the 'crossdev' tool, as follows:"
	elog "'crossdev -t avr' --> for the AVR-based Arduino boards, or"
	elog "'crossdev -t arm-none-eabi' --> for ARM/SAM-based boards."

	if use minimal; then
		elog ""
		elog "You have emerged this package with the 'minimal' USE flag."
		elog "Only the libraries and hardware platform files have been installed."
		elog "This is sufficient for building Arduino programs from the"
		elog "commandline using tools such as 'ano' and 'ino'."
		elog ""
		elog "If you wish to also install the Java-based Arduino IDE,"
		elog "disable the 'minimal' use flag."
		elog "I have *NOT* tested if the Arduino IDE ebuild even works, because"
		elog "I don't use it myself. If there are issues with the installation,"
		elog "please report them to me, and I will try my best to fix the ebuild."
	fi
}
