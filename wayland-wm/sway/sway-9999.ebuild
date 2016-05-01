# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils


DESCRIPTION="A Wayland-based replacement for the i3 window manager."
HOMEPAGE="http://swaywm.org/"

EGIT_REPO_URI="https://github.com/SirCmpwn/sway.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="swaylock swaybg swaybar swaygrab swaymsg gdk-pixbuf zsh-completion wallpaper imagemagick ffmpeg systemd"

REQUIRED_USE="swaygrab? ( || ( imagemagick ffmpeg ) )"

GUI_UTIL_DEPEND="x11-libs/pango x11-libs/cairo"

RDEPEND="dev-libs/wlc
		dev-libs/json-c
		swaybg? ( ${GUI_UTIL_DEPEND} )
		swaybar? ( ${GUI_UTIL_DEPEND} )
		swaylock? ( ${GUI_UTIL_DEPEND} virtual/pam )
		gdk-pixbuf? ( x11-libs/gdk-pixbuf[jpeg] )
		dev-libs/wayland
		dev-libs/libpcre
		x11-base/xorg-server[wayland]
		imagemagick? ( media-gfx/imagemagick[png,raw] )
		ffmpeg? ( virtual/ffmpeg )
		systemd? ( dev-libs/wlc[systemd] sys-apps/systemd )"

DEPEND="${RDEPEND}
		app-text/asciidoc"

src_configure() {
	mycmakeargs+=(
		`cmake-utils_use swaybg enable-swaybg`
		`cmake-utils_use swaybar enable-swaybar`
		`cmake-utils_use swaylock enable-swaylock`
		`cmake-utils_use swaygrab enable-swaygrab`
		`cmake-utils_use swaymsg enable-swaymsg`
		`cmake-utils_use gdk-pixbuf enable-gdk-pixbuf`
		`cmake-utils_use zsh-completion zsh-completions`
		`cmake-utils_use wallpaper default-wallpaper`

		-DCMAKE_INSTALL_SYSCONFDIR="/etc"
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	use !systemd && fperms u+s /usr/bin/sway
}
