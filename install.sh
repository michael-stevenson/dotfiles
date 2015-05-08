#!/usr/bin/env sh

# Check for zsh, if present continue, if not bail.
# This allows me to never have to consider ever *not*
# having it available in any script..
if [[ -x zsh ]]; then
	ZSH=$(which zsh)
	chsh -s ${ZSH}
else
	echo "ZSH does not seem to be installed; install it and try again"
fi

flag="$@"
function relink() {
  ln -sfv $flag $2 $1
}

DOTDIR=$(pwd)

# make local DOTDIR - this is where machine specific
# changes should be made as they will:
# a) not be tracked (by this repo), and
# b) will be sourced after the global config, thus overriding
BASEDOTDIR=$(basename ${DOTDIR})
DIRDOTDIR=$(dirname ${DOTDIR})
LOCALDOTDIR=${DIRDOTDIR}/${BASEDOTDIR}.local
ZDOTDIR=${DOTDIR}/zsh
mkdir -p ${LOCALDOTDIR}

# I'm not sure if there is a proper way to set ZDOTDIR for a
# login shell, so, just reverting to a minimal $HOME/.zshenv
# which trampolines over to the real thing in $DOTDIR
echo "setting up ZSH"
echo "
export DOTDIR=$DOTDIR
export LOCALDOTDIR=$LOCALDOTDIR
ZDOTDIR=\$DOTDIR/zsh
source \$ZDOTDIR/zshenv
" > $HOME/.zshenv

# I would like to find a way to override (via env)
# where vim looks for this, but it doesn't seem
# possible, $VIM seemed promising but only seems
# to get used once vim has already launched (which
# is why we get away without making links for vimrc,
# and gvimrc), need to look further into using -u
# option, but a quick search seems to indicate that
# other config files may get skipped in that scenario
relink $HOME/.vim          $DOTDIR/vim

relink $ZDOTDIR/.zshrc		 $ZDOTDIR/zshrc

# setup cron to automatically sync the dotfiles
echo "installing cron"
crontab -l 2>&1 > $DOTDIR/.tmp.crontab
echo "
# synchronize dot file changes nightly with
# repository - this entry added by the install
# script of very repository doing the syncing.. DOTDIR
0 0 * * * $DOTDIR/cron/sync_dotdir
" >> $DOTDIR/.tmp.crontab
cat ${DOTDIR}/.tmp.crontab | crontab -
rm ${DOTDIR}/.tmp.crontab

# create the file which will be used to track which
# runonce scripts have already been run. The actual
# running of these is handled by the zsh startup
# scripts - which needs to be reconsidered.
touch ${DOTDIR}/.runonce

# launch ZSH one, first time without any of the
# startup files - this allows us to source and
# execute the first run of the runonce scripts
# prior to running any of the other scripts which
# can reasonably assume the .runonce(s) to have
# already executed
zsh -d -f -i -c "
	export DOTDIR=${DOTDIR}
	export ZDOTDIR=${ZDOTDIR}
	source $ZDOTDIR/runonce.zshrc;
	run_outstanding_runonce
"
exec zsh
