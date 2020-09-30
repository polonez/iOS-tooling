#!/bin/bash
#set -x
set -e
#set -v

pushd "$(dirname "$0")"

TARGET_DIR="$HOME/Library/Developer/Xcode/UserData/CodeSnippets"

if [ ! -z "$1" ]
then
    echo "Copy from $1"
    if [ ! -d "$TARGET_DIR" ]
    then
        mkdir -p "$TARGET_DIR"
    fi
    pushd $1
else
    echo "Copy all?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) break;;
            No ) exit;;
        esac
    done
    pushd .
fi

if [ ! -d "$TARGET_DIR" ]
then
    mkdir -p "$TARGET_DIR"
fi
find . -name "*.codesnippet" -exec cp {} $TARGET_DIR \;

popd
popd
