# Swy7ch' config file for the FiSHell

# Start X at login
if status is-login
   if test -z "$DISPLAY" -a $XDG_VTNR = 1
   	exec startx -- -keeptty
   end
end

# True gruvbox colors in vim
#bash $HOME/.vim/plugins/gruvbox/gruvbox_256palette.sh

# User configuration
function fish_greeting
	set_color $fish_color_autosuggestion
	uname -msr

	command -s uptime >/dev/null
	and uptime

	set_color normal
end

# Set less colors (-> manpages)
set -xU LESS_TERMCAP_md (printf "\e[01;36m")
set -xU LESS_TERMCAP_me (printf "\e[0m")
set -xU LESS_TERMCAP_se (printf "\e[0m")
set -xU LESS_TERMCAP_so (printf "\e[01;44;33em")
set -xU LESS_TERMCAP_ue (printf "\e[0m")
set -xU LESS_TERMCAP_us (printf "\e[01;32m")
