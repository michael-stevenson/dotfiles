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
typeset -U path PATH
typeset -U fpath FPATH
typeset -U manpath MANPATH

path+=($HOME/bin
       $HOME/opt/bin)

fpath+=($HOME/bin
        $HOME/opt/bin
        $CFGDIR/zsh/zle-widgets
)

manpath+=($HOME/docs/man)

alias define='sdcv -n --data-dir $HOME/docs/dictionaries'
alias config="$HOME/bin/config"

# Source all local zshenv files.  This should always
# be last in case the local files want to override something
# typically set in the master file.
for ze in $(find $CFGDIR -name 'zshenv'); do
  source ${ze}
done

