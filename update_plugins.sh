#!/bin/bash

script_dir=$(dirname $(realpath $0))
update_dir="${script_dir}/update"

if [ -d "$update_dir" ]
then
    rm -rf $update_dir
fi

mkdir $update_dir

printf "downloading and unpacking plugins ...\n"
while IFS= read line || [ -n "$line" ]; do
    line="$(echo -e "$line" | tr -d '[:space:]')"
    url="https://github.com/${line}/archive/master.zip"
    basename="$(echo $line | sed 's/^.*\///')"
    archive_path="${basename}-master.zip"
    printf "\t%-32s " $line
    curl -sSL $url -o $archive_path
    if [ $? -eq 0 ]
    then
        unzip -q -d $update_dir $archive_path
        if [ $? -eq 0 ]
        then
            rm $archive_path
            mv "${update_dir}/${basename}-master" ${update_dir}/${basename}
            printf "success\n"
        else
            printf "error\n"
            exit 1
        fi
    else
        printf "error\n"
        exit 1
    fi
done < $script_dir/plugins.txt

echo "updating plugins ..."
mv $update_dir ${script_dir}/plugins
echo "success"
