
setopt nobeep

alias ll='clear; ls -aslhtr'

bindkey -v
bindkey -M viins "M-F17" vi-cmd-mode
bindkey -M vicmd '?' vi-history-search-backward

for p in ${fpath}; do
	for f in `ls ${p}`; do
		autoload -U $f;
	done
done

for f in `ls ${ZDOTDIR}/zle-widgets`; do
	autoload -U $f;
  	zle -N $f;
done

which sudo > /dev/null && alias sudo='sudo '

autoload -U colors 
autoload -U pkill
colors
