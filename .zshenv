#!/bin/zsh

# XDG_BASE_DIRECTORY
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export ZDOTDIR="$HOME/.config/zsh"

## misc
export LESS_TERMCAP_md="$(printf '%b' '\e[01;32m')"
export LESS_TERMCAP_me="$(printf '%b' '\e[0m')"
export LESS_TERMCAP_se="$(printf '%b' '\e[0m')"
export LESS_TERMCAP_so="$(printf '%b' '\e[01;44;33em')"
export LESS_TERMCAP_ue="$(printf '%b' '\e[0m')"
export LESS_TERMCAP_us="$(printf '%b' '\e[01;35m')"
export LS_COLORS='rs=0:di=01;34:ln=01;35:mh=00:pi=40;35:so=01;33:do=01;33:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=00;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;33:*.jpeg=01;33:*.mjpg=01;33:*.mjpeg=01;33:*.gif=01;33:*.bmp=01;33:*.pbm=01;33:*.pgm=01;33:*.ppm=01;33:*.tga=01;33:*.xbm=01;33:*.xpm=01;33:*.tif=01;33:*.tiff=01;33:*.png=01;33:*.svg=01;33:*.svgz=01;33:*.mng=01;33:*.pcx=01;33:*.mov=01;33:*.mpg=01;33:*.mpeg=01;33:*.m2v=01;33:*.mkv=01;33:*.webm=01;33:*.ogm=01;33:*.mp4=01;33:*.m4v=01;33:*.mp4v=01;33:*.vob=01;33:*.qt=01;33:*.nuv=01;33:*.wmv=01;33:*.asf=01;33:*.rm=01;33:*.rmvb=01;33:*.flc=01;33:*.avi=01;33:*.fli=01;33:*.flv=01;33:*.gl=01;33:*.dl=01;33:*.xcf=01;33:*.xwd=01;33:*.yuv=01;33:*.cgm=01;33:*.emf=01;33:*.ogv=01;33:*.ogx=01;33:*.aac=01;33:*.au=01;33:*.flac=01;33:*.m4a=01;33:*.mid=01;33:*.midi=01;33:*.mka=01;33:*.mp3=01;33:*.mpc=01;33:*.ogg=01;33:*.ra=01;33:*.wav=01;33:*.oga=01;33:*.opus=01;33:*.spx=01;33:*.xspf=01;33:';
