#!/bin/bash
# File:       pull_helper.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    1.0.0
#
# Pull Helper
# If pulling implementation changes are made, they are made here to allow
# ~/.vim/pull.sh to be executed in old versions and still work and update
# properly.
# This is done as pull.sh pulls from master branch first, which would update
# this file first before executing this file.


# Update submodules
#   Alternative method.
#   Has nicer output (only prints changes).
# git submodule update --init --remote --merge --recursive
#   Problems
#   --rebase causes detached HEAD
#   --merge can sometimes fail to pull due to local changes, and reject update

# This, while printing more and taking more time by going through all the
# submodules, prevents HEAD from detaching
git submodule update  --init                    # Initialize if not done
git submodule foreach git checkout master       # Change to master branch
git submodule foreach git reset --hard          # Remove local changes
git submodule foreach git pull origin master    # Update from master

# Change directory to make changes path relative so it works for both
# ~/.vimrc and ~/vimfiles
cd version

# Check file versions
bash check_version.sh

