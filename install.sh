# Name: install.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version: 1.0.3
#
# Initial installation setup

# Update all
bash ~/.vim/complete_update.sh

# Link .vimrc with vimrc.vim
echo "source ~/.vim/vimrc.vim" > ~/.vimrc
