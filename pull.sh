#!/bin/bash
# File:       pull.sh
# Maintainer: https://github.com/EvanQuan/qvim/
# Version:    2.2.1
#
# Pull
# Designed to work even if repo pulling implementation changes by executing
# external pull helper script, which may change.
# Assumes this is being executed in ~/.vim or ~/vimfiles

# Update from master branch.
git pull origin master

# Remaining pull changes.
bash ./version/pull_helper.sh
