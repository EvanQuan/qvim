#!/bin/bash
# Name:       check_version.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    1.0.2
#
# Keep local file versions up to date with remote versions.

printf "Updating local files:\n"

local_versions=~/.vim/version/local/
remote_versions=~/.vim/version/remote/
remote_versions_files=~/.vim/version/remote/*
remote_paths_absolute=~/.vim/version/path/  # Has to be absolute for path exist check to work
remote_templates=~/.vim/version/templates/
check_mark=✔
cross_mark=✗

# Create local versions if they do not exist
if ! [ -d "$local_versions" ]; then
    printf "\tLocal versions not found. Copied.\n"
    # Make local directory if it does not exist.
    mkdir $local_versions
    # Then copy remote version files into local.
    cp $remote_versions_files $local_versions
fi

# Check every file that needs to be updated
pushd "$remote_versions" > /dev/null
for file in *; do
    # Get base name
    base_name=$(basename $file)
    # local_version=~/.vim/version/local/$file
    local_version=$local_versions$base_name
    # remote_version=~/.vim/version/remote/$file
    remote_version=$remote_versions$base_name
    absolute_path=$remote_paths_absolute$base_name
    template=$remote_templates$base_name

    if ! [ -f $remote_version ]; then
        printf "\t$cross_mark $file remote version not found. Update failed!\n"
    elif ! [ -f $absolute_path ]; then
        printf "\t$cross_mark $file remote path to not found. Update failed!\n"
    else
        if ! [ -f $local_version ]; then
            # If the local version does not exist, create it and update the file
            printf "\t$check_mark $file local version not found -> [$(<$remote_version)] Updated!\n"

            cp $remote_version $local_version # Update local version number
            # Update local file to match template
            if [ -f $template ]; then
                cp $template $(< $absolute_path)
            fi
        elif ! diff $local_version $remote_version > /dev/null; then
            # If the local version is different, update the version and file
            printf "\t$check_mark $file [$(<$local_version)] -> [$(<$remote_version)] Updated!\n"

            cp $remote_version $local_version # Update local version number
            # Update local file to match template
            if [ -f $template ]; then
                cp $template $(< $absolute_path)
            fi
        else
            # Already updated. Do not update local file.
            printf "\t- $file [$(<$remote_version)] Already up-to-date.\n"
        fi
    fi
done

# Store popd so it doesn't printf to screen
trash=popd
