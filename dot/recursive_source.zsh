#!/usr/bin/env zsh

function recursive_source
{
	local dir=$1
	local suffix=$2

	[[ ! -d $dir ]] && return 1

	local -U files=($dir/**/*.$suffix)
	for file in ${files}
	do
		source $file
	done
}
