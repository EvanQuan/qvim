# Name: install.sh
# Maintainer: https://github.com/EvanQuan/.vim/
# Version: 1.0.4
#
# Initial installation setup

# Update all
bash ~/.vim/complete_update.sh

# Link .vimrc with vimrc
echo "source ~/.vim/vimrc" > ~/.vimrc
