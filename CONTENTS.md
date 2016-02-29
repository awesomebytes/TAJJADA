# List of ebuilds and notes about each one

## app-admin/f3

This ebuild is for the f3 program, which allows you to fix fake cheap flash
drives. There are many fake flash drives out there (particularly from nameless
Chinese manufacturers) that advertise greater capacity than they actually have.
This causes data to get overwritten when the filesystem tries to access storage
that does not actually exist, resulting in data loss. This tool allows you to
partition these flash drives to make use of whatever true capacity they have
and avoid the data loss that would otherwise happen.

I created this ebuild as a request from a friend who uses this overlay. I have
also since started using the tool myself.

## app-misc/fsltag

This ebuild is for my fsltag utility. It is a program I have written to manage
collections of files (such as images saved from the Internet) using tags,
without needing any sort of special file format to store the tags. Instead of
the tags being stored in some sort of database, or embedded into the files,
they are regular filesystem directories containing symlinks to the files.

I created this ebuild, because "fsltag" is a program I made. I use it myself.

## dev-embedded/ano

This ebuild is for "ano", a fork of the now-unsupported "ino", the commandline
Arduino development tool. With this tool, you can have a sane way of developing
for Arduino, with a sane toolchain based on Makefiles. This way, you can develop
your code using any editor, just like for any other program, and can avoid the
crappy Arduino IDE (and its Java dependencies).

I created this ebuild, because I use this tool, and it was not available in the
Gentoo portage repo.

## dev-embedded/arduino

This ebuild is a modified version of the one in Gentoo portage. It adds the
"minimal" use flag, which allows only the libraries / headers / platforms for
Arduino boards to be installed. This avoids the (crappy imo) Arduino IDE/editor
app, which depends on Java. This ebuild is great if you use something else to
develop for Arduino (e.g the "ino" commandline suite with a proper editor (like
vim)), and do not want to pull in Java on your system.

I split the arduino software into two packages: dev-embedded/arduino-ide, and
dev-embedded/arduino-libs. This ebuild simply installs them as dependencies,
depending on the status of the "minimal" USE flag.

I created this ebuild, because I don't want to have Java on my system, and,
since I use "dev-embedded/ino" for my Arduino development needs, I don't need
the crappy Arduino IDE app anyway.

## dev-embedded/arduino-ide

This ebuild is for the Arduino IDE. Included for completeness. You should install
dev-embedded/arduino instead, and it will pull in this ebuild as a dependency.

I created this ebuild to provide the complete functionality of dev-embedded/arduino.
I do not care about it personally.

## dev-embedded/arduino-libs

This ebuild is for the Arduino libraries and hardware platforms; basically the
files you need to have to build arduino programs. You should install
dev-embedded/arduino instead of this ebuild directly, and it will pull in this
ebuild as a dependency. Set USE="minimal" if you don't want the IDE.

I created this ebuild to provide the functionality of dev-embedded/arduino.

## dev-embedded/ino

This ebuild is for "ino", the commandline Arduino development tool. With this
tool, you can have a sane way of developing for Arduino, with a sane toolchain
based on Makefiles. This way, you can develop your code using any editor, just
like for any other program, and can avoid the crappy Arduino IDE (and its Java
dependencies).

I created this ebuild, because I use this tool, and it was not available in the
Gentoo portage repo.

## dev-embedded/u-boot-tools

u-boot-tools from gentoo did not build for me, and had compiler errors related to
types from stdint.h. I made a little patch that includes that missing header in
the file that needs it, and this ebuild applies that patch.

I created this ebuild, because I need u-boot-tools, and the gentoo version did not
build successfully on my system.

## dev-libs/flog

This ebuild is for my flog library. flog is a C library for flexible logging of
messages to different destinations, including console, memory buffers, and files,
with flexible filtering capabilities.

I created this ebuild, because "flog" is a library that I made. I also use it in
my own software projects.

## dev-python/glob2

This ebuild is for the glob2 python library, which is an enhanced version of
the globbing functionality found in python itself.

I created this ebuild, because "dev-embedded/ino" depends on it, and it was not
available in the Gentoo portage repo.

## games-fps/xonotic

This ebuild is for the Xonotic FPS arena multiplayer game. It is a slightly
modified version of the one from the official gentoo tree. The difference is that
it includes a sse2 use flag, which, when disabled, will apply a patch to remove
sse/sse2 stuff from the Xonotic build, allowing Xonotic to build on systems without
sse/sse2, such as non-x86 architectures.

I created this ebuild, because I wanted to play Xonotic on ARM systems/devices.

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

