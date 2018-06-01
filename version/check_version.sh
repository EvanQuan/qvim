#!/bin/bash
# Name:       check_version.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    0.10.0
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
    # local_version=~/.vim/version/local/$file
    local_version=$local_versions$base_name
    # remote_version=~/.vim/version/remote/$file
    remote_version=$remote_versions$base_name
    path=$remote_paths$base_name
    template=$remote_templates$base_name

    # Debug
    # printf "\n\t$count\n\n"
    # printf "\tbase_name: $base_name\n"
    # printf "\tlocal_file: $local_version\n"
    # printf "\tremote_file: $remote_version\n"
    # printf "\tpath: $path\n\n"

    if ! [ -f $remote_version ]; then
        printf "\t$cross_mark $file remote version not found. Update failed!\n"
    elif ! [ -f $path  ]; then
        printf "\t$cross_mark $file remote path not found. Update failed!\n"
    else
        if ! [ -f $local_version ]; then
            # If the local version does not exist, create it and update the file
            printf "\t$check_mark $file local version not found -> [$(<$remote_version)] Updated!\n"
            cp $remote_version $local_version
        elif ! diff $local_version $remote_version > /dev/null; then
            # If the local version is different, update the version and file
            printf "\t$check_mark $file [$(<$local_version)] -> [$(<$remote_version)] Updated!\n"
            cp $remote_version $local_version
            # bash update_file.sh $file $path
        else
            # Already updated
            printf "\t- $file [$(<$remote_version)] Already up-to-date.\n"
        fi
        # Update local file to match template
        if [ -f $template ]; then
            # cp $template $(<$path)
            # TODO: $(< $path) is returning a String with quotes with does not work with cp
            # cp $template $(< $path)
            # cp $template $(command < $path)
            cp $template $(echo $( <$path))
        fi
    fi
    # let count=count+1
done

# Store popd so it doesn't printf to screen
trash=popd

printf "DONE\n"
