setopt null_glob

setopt nobeep
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
setopt noinc_append_history

alias ll='clear; ls -aslhtr'

bindkey -v
bindkey -M viins "M-F17" vi-cmd-mode
bindkey -M vicmd '?' vi-history-search-backward

for p in ${fpath}; do
	[[ ! -d ${p} ]] && continue
	for f in `ls ${p}`; do
		autoload -U $f;
	done
done

for f in `ls ${CFGDIR}/zsh/zle-widgets`; do
	autoload -U $f;
	zle -N $f;
done

which sudo > /dev/null && alias sudo='sudo '

autoload -U colors
autoload -U pkill
colors

autoload -U compinit
compinit

nag

for rc in $(find $CFGDIR -name 'zshrc'); do
	source $rc
done
