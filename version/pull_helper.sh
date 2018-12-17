#!/bin/bash
# File:       pull_helper.sh
# Maintainer: https://github.com/EvanQuan/qvim/
# Version:    2.0.1
#
# Pull Helper
# If pulling implementation changes are made, they are made here to allow
# ~/.vim/pull.sh to be executed in old versions and still work and update
# properly.
# This is done as pull.sh pulls from master branch first, which would update
# this file first before executing this file.

# Change directory to make changes path relative so it works for both
# ~/.vimrc and ~/vimfiles
cd version

# Check file versions
bash check_version.sh

