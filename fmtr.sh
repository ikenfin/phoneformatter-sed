#!/usr/bin/env bash

# ftmr.sh
# This file is part of project known as "PhoneFormatter"
# ftmr.sh is a wrapper for sed script that do the things works
# ikenfin 2017

inputData="-"
outputData="-"
removeDuplicates=1
mode=0

SED=$(which sed)
SORT=$(which sort)
UNIQ=$(which uniq)
CAT=$(which cat)

PWD=$(pwd)

# variable that will contain result *nix command to execute
COMMAND=""

# little help for users
function usage
{
    cat <<USAGE_TEXT
Usage: $0 [OPTIONS]

Options:

-i\t\tdata source. By default - STDIN
-o\t\tresult path. By default - STDOUT
-e\t\toutput only error data
-a\t\toutput data and errors together
-d\t\tdon't remove duplicates

Example:

cat ~/raw_phones.csv | ./$0

USAGE_TEXT
}

while [ "$1" != "" ]; do
    case $1 in
        -i )    shift
                inputData=$1
                echo "$inputData"
                ;;
        -o )    shift
                outputData=$1
                echo "$outputData"
                ;;
        -e )    mode=1
                ;;
        -a )    mode=2
                ;;
        -d )    removeDuplicates=0
                ;;
        * )     usage
                exit 1
    esac
    shift
done

COMMAND="cat ${inputData}"

COMMAND="${COMMAND} | ${SED} -r -f ${PWD}/sed/processor.sed | ${SED} -r -f ${PWD}/sed/post_processor.sed"

if [ "$mode" = 0 ]; then
    COMMAND="${COMMAND} | grep -E \"^[[:digit:]]{11}$\""
elif [ "$mode" = 1 ]; then
    COMMAND="${COMMAND} | grep -Ev \"^[[:digit:]]{11}$\""
fi

if [ "$removeDuplicates" = 1 ]; then
    COMMAND="${COMMAND} | ${SORT} | ${UNIQ}"
fi

if [ "$outputData" != "-" ]; then
    COMMAND="${COMMAND} > ${outputData}"
fi

# Ok, lets run the stuff
eval ${COMMAND}
