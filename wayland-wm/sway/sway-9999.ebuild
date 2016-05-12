# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="i3-compatible Wayland window manager."
HOMEPAGE="http://swaywm.org/"

EGIT_REPO_URI="https://github.com/SirCmpwn/sway.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="X swaylock swaybg swaybar swaygrab swaymsg gdk-pixbuf zsh-completion wallpaper imagemagick ffmpeg systemd"

REQUIRED_USE="swaygrab? ( || ( imagemagick ffmpeg ) )"

SWAY_UTIL_DEPEND="x11-libs/pango x11-libs/cairo"

CDEPEND="dev-libs/wlc
		dev-libs/json-c
		dev-libs/libpcre
		dev-libs/libinput
		x11-libs/libxkbcommon
		dev-libs/wayland
		swaybg? ( ${SWAY_UTIL_DEPEND} )
		swaybar? ( ${SWAY_UTIL_DEPEND} )
		swaylock? ( ${SWAY_UTIL_DEPEND} virtual/pam )
		gdk-pixbuf? ( x11-libs/gdk-pixbuf[jpeg] )
		X? ( dev-libs/wlc[X] )
		systemd? ( dev-libs/wlc[systemd] sys-apps/systemd )"

RDEPEND="${CDEPEND}
		X? ( x11-base/xorg-server[wayland] )
		imagemagick? ( media-gfx/imagemagick[png] )
		ffmpeg? ( media-video/ffmpeg )"

DEPEND="${CDEPEND}
		app-text/asciidoc"

src_configure() {
	local mycmakeargs=(
		-Denable-swaybar=$(usex swaybar)
		-Denable-swaybg=$(usex swaybg)
		-Denable-swaygrab=$(usex swaygrab)
		-Denable-swaylock=$(usex swaylock)
		-Denable-swaymsg=$(usex swaymsg)

		-Ddefault-wallpaper=$(usex wallpaper)

		-Denable-gdk-pixbuf=$(usex gdk-pixbuf)
		-Dzsh-completions=$(usex zsh-completion)

		-DCMAKE_INSTALL_SYSCONFDIR="/etc"
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	use !systemd && fperms u+s /usr/bin/sway
}
