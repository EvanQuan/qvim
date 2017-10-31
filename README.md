My Vim Configurations
==============
These are the current Vim settings I'm using. My initial goal was solely to use
Atom's One Dark colour scheme, which is still my favourite today. Over time, I
began installing plugins to add features I took for granted in the many other
editors I was used to.

Why Use This?
-----------
You shouldn't. There are many more developed configurations out there on ***thyne
intertoobz*** that have been iterated on over the years by people who actually
know what they're doing.


Installation
-----------
1. If you already have a .vim directory and want to override it, delete your current one:
```
cd ~
rm -rf .vim
```
2. If you do not currently have a .vim directory, clone this repository:
```
cd ~
git clone https://github.com/EvanQuan/.vim ~/.vim
```
3. Update the submodules:
```
cd ~/.vim
git submodule update --init --recursive
```
4. Create a dummy `.vimrc` file in your home directory that links to the "real"
   `.vimrc` file in your `.vim` directory:
```
cd ~
echo "source ~/.vim/.vimrc" >> .vimrc
```
5. If you are on Windows and are using gVim, clone for corresponding `vimfiles` and `_vimrc`:
```
cd ~
git clone https://github.com/EvanQuan/.vim ~/vimfiles
echo "source ~/vimfiles/_vimrc" >> _vimrc
cd ~/vimfiles
git submodule update --init --recursive
```
6. Ponder your putrid, insignificant existence as the heat death of the universe
slowly creeps closer to the present day.

Colour Scheme
-----------
- [onedark.vim](https://github.com/joshdick/onedark.vim)

Plugins
-------
- [auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [ctrlp.vim](https://github.com/kien/ctrlp.vim)
- [html5.vim](https://github.com/othree/html5.vim)
- [indentLine](https://github.com/Yggdroot/indentLine)
- [lineline.vim](https://github.com/itchyny/lightline.vim)
- [jedi-vim](https://github.com/davidhalter/jedi-vim)
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
- [syntastic](https://github.com/vim-syntastic/syntastic)
- [vim-closetag](https://github.com/alvan/vim-closetag)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-gitbranch](https://github.com/itchyny/vim-gitbranch)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [vim-sensible](https://github.com/tpope/vim-sensible)
- [vim-surround](https://github.com/tpop/vim-surround)

Issues
-----
- Jedi-vim does not work on PC (from the installation instructions alone)
