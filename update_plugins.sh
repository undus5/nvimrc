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
update_dir=${script_dir}/updates
plugin_list=${script_dir}/plugins.txt

clear_updates() {
    if [[ -d $update_dir ]]
    then
        rm -rf $update_dir
    fi
}

upgrade_plugins() {
    clear_updates
    mkdir $update_dir

    plugin_dir=${script_dir}/plugins

    printf "downloading and unpacking plugins ...\n"
    total=0
    count=0
    while IFS= read line || [ -n "$line" ]; do
        line=$(strip_all "$line" "[[:space:]]")
        if [[ -z $line ]]; then
            continue
        fi
        total=$total+1
        url="https://github.com/${line}/archive/master.zip"
        basename=$(lstrip "$line" "*/")
        archive_path=${update_dir}/${basename}.zip
        printf "%-32s " $line
        curl -sSL $url -o $archive_path
        if [[ $? == 0 ]]; then
            unzip -q -d $update_dir $archive_path
            if [[ $? == 0 ]]; then
                rm $archive_path
                count=$count+1
                printf "success\n"
            else
                printf "error\n"
                exit 1
            fi
        else
            printf "error\n"
            exit 1
        fi
    done < $plugin_list

    if [[ $count == $total ]]; then
        printf "updating plugins ... "
        mv $plugin_dir ${plugin_dir}_old
        mv $update_dir $plugin_dir
        if [[ $? == 0 ]]; then
            # rm -rf ${plugin_dir}_old
            printf "success\n"
        else
            printf "error\n"
        fi
    fi
}

upgrade_plugins
