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

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	default
	mkdir -p "${WORKDIR}/${PF}"
	mv "${WORKDIR}/Linux_for_Tegra" "${WORKDIR}/${PF}/"
}

src_install() {
	tar -xpjf "${S}/Linux_for_Tegra/nv_tegra/nvidia_drivers.tbz2" -C "${D}"
	rm "${D}/usr/lib/xorg/modules/extensions/libglx.so"
}
