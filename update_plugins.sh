#!/bin/bash

script_dir=$(dirname $(realpath $0))

cd $script_dir

backup="plugins_old"

if [ -d "$backup" ]
then
    echo "error: ${backup} exists, restore it first"
    exit 1
fi

target="plugins"

mv $target $backup
mkdir $target

cd $target

printf "downloading and unpacking:\n"
while IFS= read line || [ -n "$line" ]; do
    line="$(echo -e "$line" | tr -d '[:space:]')"
    url="https://github.com/${line}/archive/master.zip"
    basename="$(echo $line | sed 's/^.*\///')"
    filename="${basename}-master.zip"
    printf "\t%-32s ... " $line
    curl -sSL "$url" -o "$filename"
    if [ $? -eq 0 ]
    then
        unzip -q $filename
        if [ $? -eq 0 ]
        then
            rm $filename
            mv "${basename}-master" $basename
            printf "done\n"
        else
            printf "failed\n"
            exit 1
        fi
    else
        printf "failed\n"
        exit 1
    fi
done < $script_dir/$target.txt

rm -rf $script_dir/$backup