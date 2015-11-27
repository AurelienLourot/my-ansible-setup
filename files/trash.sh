#!/bin/bash

trashDir=~/trash/
mkdir -p $trashDir

for i in "$@"
do
    # if there is already a folder/file with the same name in the pre-trash, we move it to the real
    # trash:
    target=$trashDir/$(basename "$i")
    if [ -d "$target" ] || [ -f "$target" ]
    then
        trash-put "$target"
    fi

    mv -t $trashDir "$i"
done
