#!/bin/bash
# File:       pull.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    2.1.4
#
# Pull

# Go to ~/.vim
cd ~/.vim
# .vim
git pull origin master
# submodules
#   --rebase causes detached HEAD
#   --merge can sometimes fail to pull, rejected update
# git submodule update --init --remote --rebase --recursive

# This, while printing more and taking more time by going through all the
# submodules, prevents HEAD from detaching
# git submodule update                          # Update as normal
git submodule foreach git reset --hard          # Remove local changes
git submodule foreach git checkout master       # Change to master branch
git submodule foreach git pull origin master    # Update from master

# Check file versions
bash ~/.vim/version/check_version.sh

