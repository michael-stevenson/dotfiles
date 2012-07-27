PROMPT='%n@%m[%3~]> '
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
	/sbin
	/bin
)

fpath=(
	${fpath}
	~/.zsh/functions
	~/.zsh/zle-widgets
)

typeset -T LATEST_PATH latest_path
latest_path=(
	/var/log
)

# load site specific configuration
# only echo if interactive to prevent scp from failing
if [[ -r ~/.local.zshenv ]]; then
	[[ -o interactive ]] && echo "sourcing local environment.."
	source ~/.local.zshenv;
fi
