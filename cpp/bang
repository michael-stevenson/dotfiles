#!/bin/zsh

THIS=${0}
SOURCE=${1}
shift 1
ARGS=(${*})

MAYBE_DEBUGGER=()
if [[ ${ARGS[1]} == "--debug" ]]; then
	MAYBE_DEBUGGER=("/usr/bin/gdb" "-q" "-ex" "start" "--args" )
	ARGS=${ARGS[2,-1]}
fi

COMPILER="/usr/lib/llvm/5/bin/clang++"
SWITCHES=(-x c++ -std=c++17 -O0 -ggdb3 -fcolor-diagnostics)

TEMP_DIR="/tmp/cppbang"
$(mkdir -p ${TEMP_DIR})

THIS_MD5=$(md5sum ${THIS} | awk '{print $1}')
SRC_MD5=$(md5sum ${SOURCE} | awk '{print $1}')

TEMP_BASE=${TEMP_DIR}"/"${THIS_MD5}"."${SRC_MD5}
executable="${TEMP_BASE}.bin"
compile=1;

[[ -x ${executable} && ${#MAYBE_DEBUGGER} -eq 0 ]] && compile=0;

if [[ ${compile} -ne 0 ]]; then

	TEMP_SRC=${TEMP_BASE}".src"
	trap "rm $TEMP_SRC" EXIT

	echo -n "//" > $TEMP_SRC
	cat $SOURCE >> $TEMP_SRC

	libs=($(grep "//link:" $SOURCE | awk '{print $2}' | sed s/lib/-l/g ))

	set -o pipefail
	$COMPILER $SWITCHES ${libs} -o ${executable} $TEMP_SRC |& sed s:$TEMP_SRC:$SOURCE:g

	if [ $? -ne 0 ]; then
		exit
	fi

	rm ${TEMP_SRC}

fi

exec ${MAYBE_DEBUGGER} ${executable} ${ARGS}
