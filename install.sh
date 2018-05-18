# Name: install.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version: 1.0.1
#
# Initial installation setup

# Update all
bash ~/.vim/update_all.sh

# Link .vimrc with vimrc.vim
echo "source ~/.vim/vimrc.vim" >> ~/.vimrc
