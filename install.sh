#!/usr/bin/env bash

if [ ! -x $(which zsh) ]
then
	echo "ZSH does not seem to be installed, exiting"
	exit 1
fi

DOTDIR=$(dirname $(readlink -f $0))
DOTDIRNAME=$(basename $DOTDIR)
DOTDIRLOC=$(dirname $DOTDIR)
LOCALDOTDIR=$DOTDIRLOC/$DOTDIRNAME.local
mkdir -p $LOCALDOTDIR

cat <<-EOENV >$HOME/.zshenv
	unset GLOBAL_RCS
	export DOTDIR=$DOTDIR
	export LOCALDOTDIR=$LOCALDOTDIR
	source $DOTDIR/zsh/zshenv
EOENV

ln -sf $DOTDIR/vim/vimrc $HOME/.vim
ln -sf $DOTDIR/zsh/zshrc $HOME/.zshrc

# create the file which will be used to track which
# runonce scripts have already been run. The actual
# running of these is handled by the zsh startup
# scripts - which needs to be reconsidered.
touch $DOTDIR/.runonce

# launch ZSH one, first time without any of the
# startup files - this allows us to source and
# execute the first run of the runonce scripts
# prior to running any of the other scripts which
# can reasonably assume the .runonce(s) to have
# already executed
zsh -d -f -i -c "
	export DOTDIR=${DOTDIR};
	source $DOTDIR/dot/runonce.zshrc;
	run_outstanding_runonce
"

exec zsh
