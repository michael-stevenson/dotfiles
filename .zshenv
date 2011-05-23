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
# only echo if interactive to prevent scp from failing
if [[ -r ~/.local.zshenv ]]; then
	[[ -o interactive ]] && echo "sourcing local environment.."
	source ~/.local.zshenv;
fi
