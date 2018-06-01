#!/bin/bash
# Name:       check_version.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    0.9.0
#
# Check File Versions

printf "Updating local files:\n"

local_versions=~/.vim/version/local/
remote_versions=~/.vim/version/remote/
remote_paths=~/.vim/version/path/
remote_templates=~/.vim/version/templates/
check_mark=✔
cross_mark=✗

# Create local versions if they do not exist
if ! [ -d "$local_versions" ]; then
    printf "\tLocal versions not found. Copied.\n"
    cp $remote_versions $local_versions
fi

# Debug
# let count=0
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
    template="$remote_templates$base_name"

    # Debug
    # printf "\n\t$count\n\n"
    # printf "\tbase_name: $base_name\n"
    # printf "\tlocal_file: $local_file\n"
    # printf "\tremote_file: $remote_file\n"
    # printf "\tpath: $path\n\n"

    if ! [ -f $remote_file ]; then
        printf "\t$cross_mark $file remote version not found. Update failed!\n"
    elif ! [ -f $path  ]; then
        printf "\t$cross_mark $file remote path not found. Update failed!\n"
    else
        # Update
        if [ -f $template ]; then
            cp $template $path
        else
            # Debug
            printf "\t$file does not have a template\n"
        fi
        if ! [ -f $local_file ]; then
            # If the local version does not exist, create it and update the file
            cp $remote_file $local_file
            printf "\t$check_mark $file local version not found -> [$(<$remote_file)] Updated!\n"
        elif diff $local_file $remote_file > /dev/null; then
            # If the local version is different, update the version and file
            cp $remote_file $local_file
            printf "\t$check_mark $file [$(<$local_file)] -> [$(<$remote_file)]\n"
            # bash update_file.sh $file $path
        else
            # Already updated
            printf "\t$check_mark $file [$(<$remote_file)] Already up-to-date."
        fi
    fi
    # let count=count+1
done

# Store popd so it doesn't printf to screen
trash=popd

printf "DONE\n"
