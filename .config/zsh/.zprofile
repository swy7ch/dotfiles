#!/bin/zsh

# This file is sourced when launching a DM from startx/xinit

# environment variables
## path
export PATH="$(find $HOME/.local/bin -type d | tr '\n' ':' | sed 's/:$//'):$PATH"

## dotfiles
export DOTFILES="$HOME/.dotfiles.git"

## XDG_BASE_DIRECTORIES
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export LESSHISTFILE="-"
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/notmuchrc"
export NMBGIT="$XDG_DATA_HOME/notmuch/nmbug"
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME/android"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export TEXMFHOME="$XDG_DATA_HOME/texmf"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export OPAMROOT="$XDG_DATA_HOME/opam"
export COQBIN="$OPAMROOT/default/bin/"

## default programs
export GPG_ASKPASS="/usr/bin/pinentry-curses"
export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"
export BROWSER="firefox-bin"
export MUSIC_PLAYER="ncmpcpp"
