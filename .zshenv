# At this point, only /etc/zshenv should have been executed
# and we desire to NOT allow any further "system" shell
# configurations to execute.  Unsetting this options causes
# this behavior.
# NOTE: if you want global things, consider just sourcing them
# from a "local" config that *will* be sourced later..
unset GLOBAL_RCS

export DOTDIR=$HOME/.dot
export CFGDIR=$HOME/.config
export EDITOR=vim
export VISUAL=vim

export PAGER=less
if hash most 2>/dev/null; then
  export PAGER=most
fi

export PROMPT=$'%{\e[38;2;123;23;23m%}%n%{\e[00m%}@%m[%3~]> '
#RPROMPT="%{$time_color%}%t %{$reset_color%}"


setopt null_glob

# In case we're running in a compatibility mode
typeset -U PATH path
typeset -U FPATH fpath
typeset -U MANPATH manpath
typeset -UT PYTHONPATH pythonpath

path+=($HOME/bin
       $HOME/opt/bin
			 $HOME/.cargo/bin)

fpath+=($CFGDIR/zsh/zle-widgets)

manpath+=($HOME/docs/man
	$HOME/opt/share/man
)

pythonpath+=($HOME/opt/local/python
             $HOME/opt/python
)

alias define='sdcv -n --data-dir $HOME/opt/share/dictionaries'
alias config="$HOME/opt/bin/config"

if [[ $(hash exa) -eq 0 ]]; then
	alias ll="clear; exa --sort modified -l"
else
	alias ll="clear; ls -aslhtr"
fi

# Source all local zshenv files.  This should always
# be last in case the local files want to override something
# typically set in the master file.
for ze in $(find $CFGDIR -name 'zshenv'); do
  source ${ze}
done

