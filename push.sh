#!/bin/bash
# File:       push.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    1.0.6
#
# Push

# Update versions
local_versions=~/.vim/version/local/
remote_versions=~/.vim/version/remote/
remote_templates=~/.vim/version/templates/

# Iterate through all file versions to prompt user if they need updating
pushd "$remote_versions" > /dev/null
for file in $remote_versions/*; do
    # Get base name
    base_name=$(basename $file)
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

printf "\nStaging all changes..."
# Store popd so it doesn't printf to screen
trash=popd
# Add everything in repo directory
git add ~/.vim
printf " DONE\n"

# Get commit message
# Used to have terminal prompt, but it did not allow for multiline messages
#   printf "\nCommit message:\n> "
#   read message
#   git commit -m "$message"
# Have vim open up so commmit message can be multiline
git commit

# Push
# Add origin as the upstream remote if not already done
git push -u origin master
