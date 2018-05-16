# Name: install.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version: 1.0.0
#
# Initial installation setup

# Update all
bash ~/.vim/update_all.sh

# Link .vimrc with vimrc
echo "source ~/.vim/vimrc" >> ~/.vimrc
