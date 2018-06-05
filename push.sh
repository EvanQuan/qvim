#!/bin/bash
# Name:       push.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    1.0.2
#
# Push

# Update versions
local_versions=~/.vim/version/local/
remote_versions=~/.vim/version/remote/
remote_templates=~/.vim/version/templates/

pushd "$remote_versions" > /dev/null
for file in $remote_versions/*; do
    # Get base name
    base_name=$(basename $file)
    # remote_version=~/.vim/version/remote/$file
    local_version=$local_versions$base_name
    remote_version=$remote_versions$base_name
    printf "\nUpdate $base_name [$(<$remote_version)]:\n> "
    read new_version
    if ! [ -z "$new_version" ]; then # Input is not empty
        printf "$base_name [$(<$remote_version)] -> "
        echo "$new_version" > $remote_version # Update remote
        cp $remote_version $local_version
        printf "[$(<$remote_version)] Updated!\n"
    else
        printf "$base_name [$(<$remote_version)] not updated.\n"
    fi
done

# Store popd so it doesn't printf to screen
trash=popd

# Add everything
git add ~/.vim

# Get commit message
printf "\nCommit message:\n> "
read message
git commit -m "$message"

# # Push
git push
