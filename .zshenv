# At this point, only /etc/zshenv should have been executed
# and we desire to NOT allow any further "system" shell
# configurations to execute.  Unsetting this options causes
# this behavior.
unset GLOBAL_RCS

export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CONFIG_HOME=${HOME}/.local/etc
export XDG_CACHE_HOME=${HOME}/.local/var

source ${XDG_CONFIG_HOME}/zsh/zshenv

# NOTE: if you want global things, consider just sourcing them
# from a "local" config file within XDG_CONFIG_HOME
