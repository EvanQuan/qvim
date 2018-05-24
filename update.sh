# Name: update.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version: 1.0.2
#
# Update - keep settings.vim the same

# Go to ~/.vim
cd ~/.vim
# .vim
git pull
# submodules
git submodule update --init --remote --recursive
