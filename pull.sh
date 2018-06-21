#!/bin/bash
# File:       pull.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    2.1.2
#
# Pull

# Go to ~/.vim
cd ~/.vim
# .vim
git pull origin master
# submodules
git submodule update --init --remote --merge --recursive

# This, while printing more and taking more time by going through all the
# submodules, prevents HEAD from detaching
# git submodule update
# git submodule foreach git reset --hard
# git submodule foreach git checkout master
# git submodule foreach git pull origin master

# Check file versions
bash ~/.vim/version/check_version.sh

