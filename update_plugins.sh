#!/bin/bash

project_root=$(dirname $(realpath $0))

cd $project_root

backup="plugins_old"

if [ -d "$backup" ]
then
    echo "error: ${backup} exists, restore it first"
    exit 1
fi

mv plugins $backup
mkdir plugins

cd plugins

printf "downloading and unpacking:\n"
while IFS= read line || [ -n "$line" ]; do
    line="$(echo -e "$line" | tr -d '[:space:]')"
    url="https://github.com/${line}/archive/master.zip"
    basename="$(echo $line | sed 's/^.*\///')"
    filename="${basename}-master.zip"
    printf "\t%-32s ..." $line
    curl -sSL "$url" -o "$filename"
    if [ $? -eq 0 ]
    then
        unzip -q $filename
        if [ $? -eq 0 ]
        then
            rm $filename
            mv "${basename}-master" $basename
            printf "\tdone\n"
        else
            printf "\tfailed\n"
            exit 1
        fi
    else
        printf "\tfailed\n"
        exit 1
    fi
done < $project_root/plugins.txt

rm -rf $project_root/$backup