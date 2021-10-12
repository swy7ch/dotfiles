# Swy7ch' config for the Zoomer Shell
# based on Luke Smith' work (lukesmith.xyz)

# Reset tty for gpg
export GPG_TTY=$(tty)

# Enable colors and change prompt:
autoload -U colors && colors
source $XDG_CONFIG_HOME/zsh/zsh_prompt

# Home/End/Insert/Del keys
bindkey '^[[P'  delete-char 			# Delete
bindkey '^[[H'  beginning-of-line 		# Home
bindkey '^[[4~' end-of-line 			# End
bindkey '^[[5~' up-line-or-history 		# PageUp
bindkey '^[[6~' down-line-or-history 	# PageDown

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt hist_ignore_space                # Ignore commands preceeded by a space

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Command correction
setopt correctall

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Use arrows to search through history
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
precmd_dunctions() { zle-line-init ;} # Use beam shape cursor for each new prompt.

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Load zsh-history-search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='bg=red,fg=white,bold'

# opam configuration
test -r "$OPAMROOT/opam-init/init.zsh" && . "$OPAMROOT/opam-init/init.zsh" > /dev/null 2> /dev/null || true
