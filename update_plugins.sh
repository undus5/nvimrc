#!/bin/bash

script_dir=$(dirname $(realpath $0))

cd $script_dir

target="plugins"
backup="plugins_old"

if [ -d "$backup" ]
then
    rm -rf $target
else
    mv $target $backup
fi

mkdir $target
cd $target

printf "updating ...\n"
while IFS= read line || [ -n "$line" ]; do
    line="$(echo -e "$line" | tr -d '[:space:]')"
    url="https://github.com/${line}/archive/master.zip"
    basename="$(echo $line | sed 's/^.*\///')"
    filename="${basename}-master.zip"
    printf "\t%-32s " $line
    curl -sSL "$url" -o "$filename"
    if [ $? -eq 0 ]
    then
        unzip -q $filename
        if [ $? -eq 0 ]
        then
            rm $filename
            mv "${basename}-master" $basename
            printf "success\n"
        else
            printf "error\n"
            exit 1
        fi
    else
        printf "error\n"
        exit 1
    fi
done < $script_dir/$target.txt

rm -rf $script_dir/$backup
