# Run any .runonce that have not previously been run.
# Keep the state of whether each has been previously
# run by adding it to a list; this relieves us of
# having to modify the actual file somehow (or deleting
# it) - thus avoiding inadvertently poisoning git with
# unintended changes.
runonce() {
	[[ -o interactive ]] && echo "---------> $1"
	$(chmod u+x $1)
	[[ -x $1 ]] && ${1}
	if [[ $? -eq 0 ]]; then
		$(echo $file >> $DOTDIR/.runonce)
	else
		[[ -o interactive ]] && echo "failed with $?; will be reattempted later"
	fi
	[[ -o interactive ]] && echo "<--------- $1"
}

run_outstanding_runonce() {
	typeset -U files
	files=($(ls $DOTDIR/**/*.runonce))
	fin=($(cat $DOTDIR/.runonce))
	for file in $files
	do
		[[ ${fin[(i)$file]} -gt ${#fin} ]] && runonce $file
	done
}

runonce_requires() {
	[[ -x $(which $1) ]] && return 0
	echo "missing DOT requirement: ${1}"
	exit 127
}
