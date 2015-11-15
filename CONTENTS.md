# List of ebuilds and notes about each one

## app-misc/fsltag

This ebuild is for my fsltag utility. It is a program I have written to manage
collections of files (such as images saved from the internet) using tags,
without needing any sort of special file format to store the tags. Instead of
the tags being stored in some sort of database, or embedded into the files,
they are regular filesystem directories containing symlinks to the files.

I created this ebuild, because "fsltag" is a program I made. I use it myself.

## dev-embedded/arduino

This ebuild is a modified version of the one in gentoo portage. It adds the
"minimal" use flag, which allows only the libraries / headers / platforms for
Arduino boards to be installed. This avoids the (crappy imo) Arduino IDE/editor
app, which depends on java. This ebuild is great if you use something else to
develop for Arduino (e.g the "ino" commandline suite with a proper editor (like
vim)), and do not want to pull in java on your system.

I created this ebuild, because I don't want to have java on my system, and,
since I use "dev-embedded/ino" for my Arduino development needs, I don't need
the crappy Arduino IDE app anyway.

## dev-embedded/ino

This ebuild is for "ino", the commandline Arduino development tool. With this
tool, you can have a sane way of developing for Arduino, with a sane toolchain
based on Makefiles. This way, you can develop your code using any editor, just
like for any other program, and can avoid the crappy Arduino IDE (and its java
dependencies).

I created this ebuild, because I use this tool, and it was not available in the
gentoo portage repo.

## dev-python/glob2

This ebuild is for the glob2 python library, which is an enhanced version of
the globbing functionality found in python itself.

I created this ebuild, because "dev-embedded/ino" depends on it, and it was not
available in the gentoo portage repo.

## sci-electronics/kicad

This ebuild is for the latest bzr version of kicad. It is based on existing
ebuilds found in other overlays, but updated to be compatible with new kicad
versions (dependencies have changed and those other ebuilds no longer work).
This ebuild also uses the system-installed boost libraries rather than the
ones bundled with the kicad distribution (which are not compatible with GCC5).

It does **not** install component libraries. You should get those separately.
The "github" USE flag could be useful for this.

I created this ebuild, because I use KiCAD, and there was no sane way to
install a recent version of it on Gentoo systems.

## x11-drivers/l4t-drivers

This ebuild is for the NVIDIA Linux4Tegra drivers for graphics on the Tegra K1
SoC. It installs the xorg drivers, including GLX, and OpenGL/EGL/GLES support.
It only installs the graphics stuff and generic configurations from the official
driver distribution. This allows it to be compatible with any Tegra K1 platform,
including the Chromebooks, and [most likely] the Jetson TK1 board. The official
driver distribution from NVIDIA contains various Jetson-specific files; these
are **not** installed by this ebuild.

These drivers are only compatible with the Linux Kernel 3.10 distribution for
your system. Get kernel sources from NVIDIA if you have a Jetson, or from Google
for a Chromebook.

I created this ebuild, because I have an Acer Chromebook 13, which has a Tegra
K1 SoC. I needed these drivers, and wanted an elegant way to install them
through the package manager. I don't have a Jetson TK1, so I have not tested
if this ebuild works on that platform, but I don't see why it wouldn't.

