#!/bin/bash
# File:       pull_helper.sh
# Maintainer: https://github.com/EvanQuan/qvim/
# Version:    2.5.0
#
# Pull Helper
# If pulling implementation changes are made, they are made here to allow
# ~/.vim/pull.sh to be executed in old versions and still work and update
# properly.
# This is done as pull.sh pulls from master branch first, which would update
# this file first before executing this file.

settings_location=$(pwd)/settings.vim

# Change directory to make changes path relative so it works for both
# ~/.vimrc and ~/vimfiles
vim -c ":helptags doc" -c ":qa!"
cd version

settings_local_version=$(pwd)/local/settings.vim
settings_remote_version=$(pwd)/remote/settings.vim

# If settings.vim does not exist or is different than remote version,
# then open it at end
open_settings=false
if ! [ -f $settings_local_version ] || ! diff $settings_local_version $settings_remote_version > /dev/null; then
    open_settings=true
fi

# Check file versions
bash check_version.sh

# Install and update plugins with vim-plug
vim -c ":PlugUpdate" -c ":qa!"

if [ "$open_settings" = true ]; then
    vim -c ":redraw" -c "echo '-- Settings have changed since last update --' " $settings_location
fi
