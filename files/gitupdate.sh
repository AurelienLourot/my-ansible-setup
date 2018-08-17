#!/usr/bin/env bash

ROOT_DIR=~/Documents/git/

failed_repos=""
list_branches_behind=""
for i in $(find -L $ROOT_DIR -name .git)
do
    cd $(dirname $i)
    pwd
    git rpu
    result=$?
    if [[ result -ne "0" ]]
    then
        failed_repos="${failed_repos}$(pwd)\n"
    fi

    if [[ "$1" == "-p" ]]
    then
        git pull
    fi

    branches_behind=`git branch -v | grep behind`
    if [[ ! -z "$branches_behind" ]]
    then
        list_branches_behind="${list_branches_behind}$(pwd)\n${branches_behind}\n"
    fi
done

echo
echo "Failed to fetch from:"
echo -e "$failed_repos"
echo "Branches behind:"
echo -e "$list_branches_behind"
