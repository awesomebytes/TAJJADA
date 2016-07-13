# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="Qt5 fork of pavucontrol for the LXQt desktop environment."
HOMEPAGE="https://github.com/pranavg189/lxmixer"
EGIT_REPO_URI="https://github.com/pranavg189/lxmixer.git"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
		dev-qt/qtcore:5
		dev-qt/qtdbus:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		dev-qt/qtx11extras:5
		dev-libs/glib:2"

RDEPEND="${DEPEND}
		dev-qt/linguist-tools:5
		virtual/pkgconfig"
