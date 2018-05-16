# Name: update.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version: 1.0.0
#
# Update - keep settings.vim the same

# Go to ~/.vim
cd ~/.vim
# .vim
git pull origin master
# submodules
git submodule update --init --recursive
