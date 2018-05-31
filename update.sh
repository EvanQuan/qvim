#!/bin/bash
# Name:       update.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version:    2.0.0
#
# Update

# Go to ~/.vim
cd ~/.vim
# .vim
git pull
# submodules
git submodule update --init --remote --recursive

# Check file versions
bash ~/.vim/version/check_version.sh

