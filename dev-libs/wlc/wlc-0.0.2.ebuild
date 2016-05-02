# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils multilib

DESCRIPTION="A helper library for Wayland compositors."
HOMEPAGE="https://github.com/Cloudef/wlc"

SRC_URI="https://github.com/Cloudef/wlc/releases/download/v${PV}/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"

RDEPEND="virtual/opengl
		media-libs/mesa[gbm,gles2,egl]
		x11-libs/libdrm
		x11-libs/pixman
		x11-libs/xcb-util-image
		x11-libs/xcb-util-wm
		dev-libs/wayland
		dev-libs/wayland-protocols
		x11-libs/libX11
		x11-libs/libxcb
		x11-libs/libXfixes
		x11-libs/libxkbcommon
		dev-libs/libinput
		systemd? ( sys-apps/systemd sys-apps/dbus )"

DEPEND="${RDEPEND}"
