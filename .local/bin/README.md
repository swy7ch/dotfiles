# Swy7ch' personnal scripts

**Hello, world!** This is my scripts directory. Feel free to use it at your convenience :)

**/!\\** Those scripts are POSIX-compliant (hence `#! /usr/bin/env sh`), they are supposed to be run with such shell (BaSH, zsh, dash...); FISH, for example, might cause problems (with `if` statements, for instance) if a script is run directly in a terminal; I recommend launching background scripts within `.xinit` to avoid those issues

## Scripts

- arch_setup : my personnal machine setup script
- AC_notify : send a notification when the computer is plugged/unplugged
- audio-notify : send a notification when audio level is changed
- backlight : change backlight level
- backlight_notify : send a notification when backlight level is changed
- bat_notify : send a notification when battery runs low
- bibinput : add a **.bib** entry through `dmenu`
- bibshow : retrieve a **.bib** reference and copy to `xclip`
- brightup : raise the keyboard brightness
- colorblocks : show the system colors through colored squares
- compiler : compile a file / runs a script if the filetype is supported
- displayselect : handle a multimonitor setup
- dmenupass : `dmenu` prompt for password, when needed
- dmenuprompt : ask for a binary choice through `dmenu`
- dmenumount : mount USB drives through a `dmenu` prompt
- dmenuumount : unmount USB drives through a `dmenu` prompt
- dmenuopen : fuzzy-find a file and open it with appropriate application
- dot : git wrapper to manage dotfiles
- dwmbar : set the statusbar and updates every minute
- fetch : display basic system infos
- maker : create a basic makefile for **C/C++** project
- mom : create a `groff/mom` file with generic metadata
- mommerge : merge all **.mom** files of a directory and compiles it
- refbar : refresh `dwm` statusbar
- setbg : set the wallpaper using `xwallpaper`
- texclear : remove `LaTeX` compilation files
- texer : create a **.tex** file with generic metadata + input packages
- webupdate : update the files on my website

## arch_setup

This is the shell script I run just after I installed Arch. It does few things:

- Install the apps I use
- Download my personnal repos
- Compile my WM (`dwm`), my binary launcher (`dmenu`) and my terminal emulator (`st`), which are part of the [suckless](https://suckless.org/) project.

