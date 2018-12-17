#!/bin/bash
# File:       push.sh
# Maintainer: https://github.com/EvanQuan/qvim/
# Version:    1.0.8
#
# Push

# Update versions
current_directory=$(pwd)
version_directory=$current_directory/version
local_versions=$version_directory/local/
remote_versions=$version_directory/remote/
remote_versions_files=$remote_versions*
remote_templates=$version_directory/templates/

# Iterate through all file versions to prompt user if they need updating
for file in $remote_versions_files; do
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

# Add everything in repo directory
git add .
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
