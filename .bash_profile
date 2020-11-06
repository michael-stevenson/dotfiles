export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CONFIG_HOME=${HOME}/.local/etc
export XDG_CACHE_HOME=${HOME}/.local/var

source ${XDG_CONFIG_HOME}/bash/profile

# NOTE: if you want global things, consider just sourcing them
# from a "local" config file within XDG_CONFIG_HOME
