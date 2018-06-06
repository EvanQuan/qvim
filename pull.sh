#!/bin/bash
# Name:       pull.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    2.0.1
#
# Pull

# Go to ~/.vim
cd ~/.vim
# .vim
git pull origin master
# submodules
git submodule update --init --remote --rebase --recursive

# Check file versions
bash ~/.vim/version/check_version.sh

