# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="A helper library for Wayland compositors."
HOMEPAGE="https://github.com/Cloudef/wlc"

EGIT_REPO_URI="https://github.com/Cloudef/wlc.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="X static-libs systemd"

RDEPEND="virtual/opengl
		media-libs/mesa[wayland,gbm,gles2,egl]
		x11-libs/libdrm
		x11-libs/pixman
		x11-libs/libxkbcommon
		dev-libs/libinput
		dev-libs/wayland
		dev-libs/wayland-protocols
		X? ( x11-libs/libX11
			 x11-libs/libxcb
			 x11-libs/xcb-util-image
			 x11-libs/xcb-util-wm
			 x11-libs/libXfixes )
		systemd? ( sys-apps/systemd sys-apps/dbus )"

DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DWLC_BUILD_EXAMPLES=OFF
		-DWLC_BUILD_TESTS=OFF

		$(cmake-utils_use static-libs WLC_BUILD_STATIC)

		$(cmake-utils_use_find_package systemd Systemd)
		$(cmake-utils_use_find_package systemd Dbus)
		$(cmake-utils_use_find_package X X11)
		$(cmake-utils_use_find_package X XCB)
	)

	cmake-utils_src_configure
}
