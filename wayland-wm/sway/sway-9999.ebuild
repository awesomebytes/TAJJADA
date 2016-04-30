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
IUSE="swaylock swaybg swaybar swaygrab swaymsg gdk-pixbuf zsh-completion wallpaper imagemagick ffmpeg systemd"

REQUIRED_USE="swaygrab? ( || ( imagemagick ffmpeg ) )"

CDEPEND="dev-libs/wlc
		dev-libs/json-c
		swaybg? ( swaybar? ( swaylock? (
				x11-libs/pango
				x11-libs/cairo
				) ) )
		swaylock? ( virtual/pam )
		gdk-pixbuf? ( x11-libs/gdk-pixbuf )
		dev-libs/wayland
		dev-libs/libpcre
		x11-base/xorg-server[wayland]
		imagemagick? ( media-gfx/imagemagick )
		ffmpeg? ( virtual/ffmpeg )
		systemd? ( dev-libs/wlc[systemd] sys-apps/systemd )"
DEPEND="${CDEPEND}
		dev-util/cmake
		app-text/asciidoc"
RDEPEND="${CDEPEND}"

inherit cmake-utils

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
	)

	cmake-utils_src_configure
}
