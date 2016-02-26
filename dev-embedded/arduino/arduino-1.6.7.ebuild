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
IUSE="minimal"

CDEPEND="!minimal? ( dev-embedded/arduino-ide )
dev-embedded/arduino-libs"

RDEPEND="${CDEPEND}"

DEPEND="${CDEPEND}"

