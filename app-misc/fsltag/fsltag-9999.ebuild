# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{3_3,3_4,3_5} )

inherit python-r1 git-r3

DESCRIPTION="A filesystem-based file tagging program."
HOMEPAGE="https://github.com/tajjada/fsltag"

EGIT_REPO_URI="https://github.com/tajjada/fsltag.git"

LICENSE="ZLIB"
SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

src_install() {
	python_foreach_impl python_newscript fsltag.py fsltag
}
