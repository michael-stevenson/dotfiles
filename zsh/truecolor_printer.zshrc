#!/usr/bin/env zsh

function make_truecolor_printer
{
	local name=$1
	local red=$2
	local green=$3
	local blue=$4

	printer=$(cat <<-EOF

		function $name
		{
			printf '\x1b[38;2;%d;%d;%dm' $red $green $blue
			echo -n "\$@"
			printf '\x1b[0m'
		}

	EOF
	)

	eval "$printer"
}
