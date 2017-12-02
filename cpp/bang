#!/bin/zsh

SOURCE=${1}
shift 1
ARGS=(${*})

MAYBE_DEBUGGER=()
if [[ ${ARGS[1]} == "--debug" ]]; then
	MAYBE_DEBUGGER=("/usr/bin/gdb" "-q" "-ex" "start" "--args" )
	ARGS=${ARGS[2,-1]}
fi

COMPILER="/usr/lib/llvm/5/bin/clang++"
SWITCHES=(-x c++ -std=c++17 -O3 -fcolor-diagnostics)

TEMP=`mktemp`
if [ $? -ne 0 ]; then
	exit
fi

trap "rm $TEMP" EXIT

echo -n "//" >> $TEMP
cat $SOURCE >> $TEMP

set -o pipefail
executable="${TEMP}.cppbang"
$COMPILER $SWITCHES -o ${executable} $TEMP |& sed s:$TEMP:$SOURCE:g

if [ $? -ne 0 ]; then
	exit
fi

trap "rm $TEMP; rm $executable" EXIT
exec ${MAYBE_DEBUGGER} ${executable} ${ARGS}
