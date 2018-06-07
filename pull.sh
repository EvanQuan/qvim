#!/bin/bash
# Name:       pull.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    2.0.2
#
# Pull

# Go to ~/.vim
cd ~/.vim
# .vim
git pull origin master
# submodules
# git submodule update --init --remote --rebase --recursive
git submodule update
git submodule foreach git checkout master
git submodule foreach git pull origin master

# Check file versions
bash ~/.vim/version/check_version.sh

