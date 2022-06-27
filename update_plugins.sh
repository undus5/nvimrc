#!/usr/bin/env bash

dirname() {
    # Usage: dirname "path"
    local tmp=${1:-.}

    [[ $tmp != *[!/]* ]] && {
        printf '/\n'
        return
    }

    tmp=${tmp%%"${tmp##*[!/]}"}

    [[ $tmp != */* ]] && {
        printf '.\n'
        return
    }

    tmp=${tmp%/*}
    tmp=${tmp%%"${tmp##*[!/]}"}

    printf '%s\n' "${tmp:-/}"
}

strip_all() {
    # Usage: strip_all "string" "pattern"
    printf '%s\n' "${1//$2}"
}

test_command() {
    if [[ ! $(command -v $1) ]]; then
        echo "error: $1 command not found"
        exit 1
    fi
}

lstrip() {
    # Usage: lstrip "string" "pattern"
    printf '%s\n' "${1##$2}"
}

test_command unzip

script_dir=$(dirname $(realpath $0))
update_dir=${script_dir}/update
plugin_dir=${script_dir}/plugins

if [[ -d $update_dir ]]
then
    rm -rf $update_dir
fi
mkdir $update_dir

printf "downloading and unpacking plugins ...\n"
while IFS= read line || [ -n "$line" ]; do
    line=$(strip_all "$line" "[[:space:]]")
    # url="https://github.com/${line}/archive/master.zip"
    url="https://ghproxy.com/https://github.com/${line}/archive/master.zip"
    basename=$(lstrip "$line" "*/")
    archive_path=${update_dir}/${basename}-master.zip
    printf "\t%-32s " $line
    curl -sSL $url -o $archive_path
    if [[ $? == 0 ]]; then
        unzip -q -d $update_dir $archive_path
        if [[ $? == 0 ]]; then
            rm $archive_path
            mv ${update_dir}/${basename}-master ${update_dir}/${basename}
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

printf "updating plugins ... "
rm -rf $plugin_dir
mv $update_dir $plugin_dir
printf "success\n"
