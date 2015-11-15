# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="NVIDIA Linux4Tegra Graphics Drivers (for Tegra K1 SoC)."
HOMEPAGE="https://developer.nvidia.com/embedded/linux-tegra"
SRC_URI="http://developer.download.nvidia.com/embedded/L4T/r21_Release_v4.0/Tegra124_Linux_R21.4.0_armhf.tbz2"

LICENSE="NVIDIA_TEGRA"
SLOT="0"
KEYWORDS="-* ~arm"
IUSE=""

CDEPEND="app-eselect/eselect-opengl
		<x11-base/xorg-server-1.17.99:="
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

src_unpack() {
	default
	mkdir -p "${WORKDIR}/${PF}"
	mv "${WORKDIR}/Linux_for_Tegra" "${S}"
}

TEGRA_UDEV_RULES="90-tegra.rules"
do_tegra_udev() {
	echo "KERNEL==\"${1}\" OWNER=\"${2}\" GROUP=\"${3}\" MODE=\"${4}\"" >> "${WORKDIR}/${TEGRA_UDEV_RULES}"
}

src_compile() {
	# Create UDEV rules for Tegra devices.

	## Root-only devices.
	do_tegra_udev "knvrm"	"root" "root" "0660"
	do_tegra_udev "knvmap"	"root" "root" "0660"

	## Video/graphics devices.
	do_tegra_udev "nvmap"	"root" "video" "0660"
	do_tegra_udev "nvram"	"root" "video" "0660"
	do_tegra_udev "nvhdcp*"	"root" "video" "0660"
	do_tegra_udev "nvhost*"	"root" "video" "0660"
	do_tegra_udev "tegra*"	"root" "video" "0660"

	# Unpack binary driver.
	I="${S}/inst"
	mkdir -p "${I}"
	tar -xpjf "${S}/Linux_for_Tegra/nv_tegra/nvidia_drivers.tbz2" -C "${I}"

	# move files to their correct locations for gentoo.

	## Create location for `eselect opengl`
	mkdir -p "${I}/usr/lib/opengl/linux4tegra"
	## Move driver libraries there.
	mv "${I}/usr/lib/arm-linux-gnueabihf/tegra" "${I}/usr/lib/opengl/linux4tegra/lib"
	## Make symlink for libGL.so
	ln -s "${I}/usr/lib/opengl/linux4tegra/lib/libGL.so.1" "${I}/usr/lib/opengl/linux4tegra/lib/libGL.so"
	## Move Xorg GLX module.
	mv "${I}/usr/lib/xorg/modules/extensions" "${I}/usr/lib/opengl/linux4tegra/"
	## Move EGL/GLES libraries.
	mv "${I}/usr/lib/arm-linux-gnueabihf/tegra-egl" "${I}/usr/lib/"
	## Remove the unneeded lib directory from the binary distribution.
	rmdir "${I}/usr/lib/arm-linux-gnueabihf/"
}

src_install() {
	rsync -aX "${S}/inst/" "${D}/"
	mkdir -p "${D}/lib/udev/rules.d/"
	cp "${WORKDIR}/${TEGRA_UDEV_RULES}" "${D}/lib/udev/rules.d/"
}

pkg_postinst() {
	"${ROOT}"/usr/bin/eselect opengl set linux4tegra
}

pkg_prerm() {
	"${ROOT}"/usr/bin/eselect opengl set --use-old xorg-x11
}

pkg_postrm() {
	"${ROOT}"/usr/bin/eselect opengl set --use-old xorg-x11
}

