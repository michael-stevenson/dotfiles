PROMPT=$'%n@%m[%3~]> '
RPROMPT='%t'

EDITOR=vi
VISUAL=vi

manpath=( 
	${manpath} 
	/opt/local/man 
	)

path=( 	
	/opt/local/bin
	/usr/local/bin
	${path}
	/usr/local/mysql/bin
	~/bin
)

fpath=(
	${fpath}
	~/.zsh/functions
	~/.zsh/zle-widgets
	~/bin
	~/bin/drm
)

# load site specific configuration
[[ -r ~/.local.zshenv ]] && echo "sourcing local environment.." && source ~/.local.zshenv
