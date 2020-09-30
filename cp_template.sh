#!/bin/bash
#set -x
set -e
#set -v

pushd "$(dirname "$0")"

TEMPLATE_DIR="$HOME/Library/Developer/Xcode/Templates/File Templates"

if [ ! -z "$1" ]
then
    echo "Copy from $1"
    pushd $1
    find . -type d -name "*.xctemplate" -exec mkdir -p "$TEMPLATE_DIR/$1" \; -exec cp -r {} "$TEMPLATE_DIR/$1/{}" \;
    popd
else
    echo "Copy all?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) break;;
            No ) exit;;
        esac
    done
    find . -type d -name "*.xctemplate" -exec mkdir -p "$TEMPLATE_DIR/{}" \; -exec cp -r {} "$TEMPLATE_DIR/{}/.." \;
fi

popd
