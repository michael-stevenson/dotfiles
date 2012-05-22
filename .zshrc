
# do not beep in various situations. The one that
# caused me to turn this on was searching in history
# without a match being found.  It was really annoying.
setopt nobeep

# a few general aliases
alias ll='clear; ls -aslh'
alias llt='clear; ls -aslhtr'

[[ -f /usr/local/bin/EXIF.py ]] && alias exif='/usr/local/bin/EXIF.py'

# macvim
which mvim 2> /dev/null && alias gvim='mvim'

bindkey -v
bindkey -M viins '  ' vi-cmd-mode
bindkey -M vicmd '?'  vi-history-search-backward

for p in ${fpath}; do
	for f in `ls ${p}`; do
		autoload -U $f;
	done
done

# aliases for some of the functions we just
# loaded..
alias taill='tail_latest '
alias lessl='less_latest '
alias grepl='grep_latest '

for f in `ls ~/.zsh/zle-widgets`; do
	autoload -U $f;
  	zle -N $f;
done

#bindkey -M vicmd 'c' tmux-new-window
#bindkey -M vicmd ':w' tmux-choose-window
#bindkey -M vicmd ':w' tmux-list-windows
#bindkey -M vicmd 't' tmux-rename-window
#bindkey -M vicmd ':vsp' tmux-vertical-split
#bindkey -M vicmd ':sp' tmux-horizontal-split
#bindkey -M vicmd 'W' tmux-next-pane
#bindkey -M vicmd 'n' tmux-change-window-title
#bindkey -M vicmd 'J' tmux-resize-pane
#bindkey -M vicmd 'H' tmux-resize-pane
#bindkey -M vicmd 'K' tmux-resize-pane
#bindkey -M vicmd 'L' tmux-resize-pane

# The space at the end of the alias will cause the subsequent
# argument to be alias expanded even if it's not a global
# alias.
which sudo > /dev/null && alias sudo='sudo '

# prompt
autoload -U colors 
autoload -U pkill
colors

# load site specific configuration
[[ -r ~/.local.zshrc ]] && echo "sourcing local config.." && source ~/.local.zshrc
