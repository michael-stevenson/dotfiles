#!/bin/zsh

COMPILER="/usr/lib/llvm/5/bin/clang++"
SWITCHES=(-x c++ -std=c++17 -O3)

TEMP=`mktemp`
if [ $? -ne 0 ]; then
	exit
fi

trap "rm $TEMP" EXIT

echo -n "//" >> $TEMP
cat $1 >> $TEMP

set -o pipefail
executable="${TEMP}.cppbang"
$COMPILER $SWITCHES -o ${executable} $TEMP |& sed s:$TEMP:$1:g

if [ $? -ne 0 ]; then
	exit
fi

trap "rm $TEMP; rm $executable" EXIT
exec ${executable}
