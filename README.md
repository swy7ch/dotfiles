# Swy7ch' personnal dotfiles

**Hello, world!** This is my dotfiles directory.
Feel free to use it at your convenience :)

I'm David. I'm a Software Engineering student from France, and a *huge* fan of
Linux, especially Arch. I also like making things simple and neat, and this is
the sole purpose of this directory: keeping my needed files in a safe place,
so that I can reinstall Arch easily without much tinkering.

## Installation

Just run

- `git clone --bare https://gitlab.com/swy7ch/dotfiles.git` for HTTPS cloning, or

- `git clone --bare git@gitlab.com:swy7ch/dotfiles.git` if you're using SSH

## ~/

Contains the files that I haven't been able to put in `~/.config`

**/!\\** X files call a few of my personnal scripts, which you can find in
`~/.local/bin`

## Programs whose config files can be found in ~/.config/

- `dunst`
- `htop`
- `neofetch`
- `neovim`
- `sxhkd`
- `zsh`
- `old`
	- `i3-gaps`
	- `polybar`
	- `termite`
	- `vim`
	- `ranger`
	- `fish-shell`

### ~/.config/root/

Where I keep the files I have to copy into the `/` folder. It is not called in
`arch_setup` as it is quite sensible

## Window manager and terminal emulator

I currently use [suckless](https://suckless.org/)' programs, i.e. `dmenu`
(binary launcher), `dwm` (window manager) and `st` (terminal emulator),
so my files are set accordingly. You can check my
[dmenu](https://gitlab.com/Swy7ch/dmenu), [dwm](https://gitlab.com/Swy7ch/dwm)
and [st](https://gitlab.com/Swy7ch/st) forks

## MIT License

This repo is licensed under MIT License, which means you can do pretty much
anything with it as long as you cite my work with MIT License. You can
re-license it, modify it, re-distribute it, be it open or close sourced.