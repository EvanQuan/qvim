#!/bin/bash
# Name:       check_version.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    1.0.0
#
# Check File Versions

printf "Updating local files:\n"

local_versions=~/.vim/version/local/
remote_versions=~/.vim/version/remote/
remote_paths=~/.vim/version/path/

# Create local versions if they do not exist
if ! [ -d "$local_versions" ]; then
    printf "\tLocal versions not found. Copied.\n"
    cp $remote_versions $local_versions
fi

# Debug
printf "\tIterating through: $remote_versions\n"
let count=0
# Check every file that needs to be updated
pushd "$remote_versions" > /dev/null
for file in *; do
    # Get base name
    base_name=$(basename $file)
    # local_file=~/.vim/version/local/$file
    local_file="$local_versions$base_name"
    # remote_file=~/.vim/version/remote/$file
    remote_file="$remote_versions$base_name"
    path="$remote_paths$base_name"

    # Debug
    printf "\n\t$count\n\n"
    printf "\tbase_name: $base_name\n"
    printf "\tlocal_file: $local_file\n"
    printf "\tremote_file: $remote_file\n"
    printf "\tpath: $path\n\n"

    if ! [ -f $local_file ]; then
        # If the local version does not exist, create it and update the file
        # cp $remote_file $local_file
        # bash update_file.sh $file $path
        printf "\t$file [VERSION NOT FOUND] -> [$(<$remote_file)]\n"
    elif ! [ -f $remote_file ]; then
        printf "\t$file[REMOTE] does not exist. You dun goof'd\n"
    elif diff $local_file $remote_file > /dev/null; then
        # If the local version is different, update the version and file
        printf "\t$file [$(<$local_file)] -> [$(<$remote_file)]\n"
        # bash update_file.sh $file $path
    fi
    let count=count+1
done

# Store popd so it doesn't printf to screen
trash=popd

printf "DONE\n"
