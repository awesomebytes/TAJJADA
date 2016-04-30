# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A Wayland-based replacement for the i3 window manager."
HOMEPAGE="https://github.com/SirCmpwn/sway"

EGIT_REPO_URI="https://github.com/SirCmpwn/sway.git"

inherit git-r3

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

CDEPEND="dev-libs/wlc
		dev-libs/json-c
		x11-libs/pango
		dev-libs/wayland
		x11-libs/gdk-pixbuf"
DEPEND="${CDEPEND} dev-util/cmake"
RDEPEND="${CDEPEND}"

inherit cmake-utils
