# Personal Gentoo Overlay

This is my personal overlay, where I put Gentoo ebuilds that I make.

This includes:
- Software that I want to use but could not find a working ebuild for.
- Modified versions of ebuilds from other places, for whatever reason.
- My own personal software projects.

Basically, stuff I care about.

You are welcome to take my ebuilds from here and do absolutely anything
you want with them. After all, they are just some scripts for building stuff
with a particular distribution's tools.

## Adding with Layman

To add this overlay to your Gentoo system using Layman, do the following:

```
layman -f -o https://raw.githubusercontent.com/tajjada/overlay/master/layman-metadata.xml -a TAJJADA
```

