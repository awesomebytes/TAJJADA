# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A filesystem-based file tagging program."
HOMEPAGE="https://github.com/tajjada/fsltag"

PYTHON_COMPAT=( python{3_3,3_4} )
inherit python-r1

LICENSE="ZLIB"
SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

EGIT_REPO_URI="https://github.com/tajjada/fsltag.git"
inherit git-r3

src_install() {
	python_foreach_impl python_newscript fsltag.py fsltag
}

