#!/bin/bash
# Name:       check_version.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    1.1.1
#
# Keep local file versions up to date with remote versions.
# Assumes this is being executed form pull_helper.sh in ~/.vim/version
# or ~/vimfiles/version directory.

printf "Updating local files:\n"

current_directory=$(pwd)
local_versions=$current_directory/local/
remote_versions=$current_directory/remote/
remote_versions_files=$remote_versions*
remote_paths_absolute=$current_directory/path/  # Has to be absolute for path exist check to work
remote_templates=$current_directory/templates/
check_mark=✔
cross_mark=✗

# printf "DEBUG Current directory: $current_directory\n"
# printf "DEBUG local versions: $local_versions\n"
# printf "DEBUG remote versions: $remote_versions\n"
# printf "DEBUG remote paths aboslute: $remote_paths_absolute\n"
# printf "DEBUG remote templates: $remote_templates\n"

# Create local versions directory if they do not exist
# Directory will now be empty, and the following loop will
# update each version individually.
if ! [ -d "$local_versions" ]; then
    printf "\tLocal versions directory not found. Created.\n"
    # Make local directory if it does not exist.
    mkdir $local_versions
fi

# Check every file that needs to be updated
# pushd "$remote_versions" > /dev/null
for file in $remote_versions_files; do
    # printf "DEBUG file: $file\n"
    # Get base name
    base_name=$(basename $file)
    # printf "DEBUG base name: $base_name\n"
    # local_version=~/.vim/version/local/$file
    local_version=$local_versions$base_name
    # printf "DEBUG local version: $local_version\n"
    # remote_version=~/.vim/version/remote/$file
    remote_version=$remote_versions$base_name
    # printf "DEBUG remote version: $remote_version\n"
    absolute_path=$remote_paths_absolute$base_name
    # printf "DEBUG absolute_path: $absolute_path\n"
    template=$remote_templates$base_name
    # printf "DEBUG template: $template\n"

    if ! [ -f $remote_version ]; then
        update_symbol=$cross_mark
        update_version="[???]"
        update_message="Remote version not found. Update failed!"
        # printf "\t$cross_mark \"$file\" remote version not found. Update failed!\n"
    elif ! [ -f $absolute_path ]; then
        update_symbol=$cross_mark
        update_version="[???]"
        update_message="Remote path not found. Update failed!"
        # printf "\t$cross_mark \"$file\" remote path to not found. Update failed!\n"
    else
        if ! [ -f $local_version ]; then
            # If the local version does not exist, create it and update the file
            update_symbol=$check_mark
            update_version="[$(<$remote_version)]"
            update_message="Local version not found. Updated!"
            # printf "\t$check_mark $file local version not found -> [$(<$remote_version)] Updated!\n"

            cp $remote_version $local_version # Update local version number
            # Update local file to match template
            if [ -f $template ]; then
                cp $template $(< $absolute_path)
            fi
        elif ! diff $local_version $remote_version > /dev/null; then
            # If the local version is different, update the version and file
            update_symbol=$check_mark
            update_version="[$(<$local_version)] -> [$(<$remote_version)]"
            update_message="Updated!"
            # printf "\t$check_mark $file [$(<$local_version)] -> [$(<$remote_version)] Updated!\n"

            cp $remote_version $local_version # Update local version number
            # Update local file to match template
            if [ -f $template ]; then
                cp $template $(< $absolute_path)
            fi
        else
            # Already updated. Do not update local file.
            update_symbol="-"
            update_version="[$(<$remote_version)]"
            update_message="Already up-to-date"
        fi
        printf "\t%s %-16s %-24s %s\n" "$update_symbol" "$base_name" "$update_version" "$update_message"
    fi
done

# Store popd so it doesn't printf to screen
# trash=popd
