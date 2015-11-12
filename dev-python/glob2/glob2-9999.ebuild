# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Extended version of Python's builtin glob module."
HOMEPAGE="https://github.com/miracle2k/python-glob2"

EGIT_REPO_URI="https://github.com/miracle2k/python-glob2.git"
inherit git-r3

LICENSE="BSD"
SLOT="0"

CDEPEND=""
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

