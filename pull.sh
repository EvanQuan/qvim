#!/bin/bash
# Name:       pull.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    2.1.0
#
# Pull

# Go to ~/.vim
cd ~/.vim
# .vim
git pull origin master
# submodules
# This, while simpler, can cause HEAD to detach, which is annoying
# git submodule update --init --remote --rebase --recursive

# This, while printing more by going through all the submodules, prevents
# HEAD from detaching
git submodule update
git submodule foreach git reset --hard
git submodule foreach git checkout master
git submodule foreach git pull origin master

# Check file versions
bash ~/.vim/version/check_version.sh

