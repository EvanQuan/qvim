My Vim Configuration
====================
These are the current Vim settings I'm using.

![screenshot](https://raw.githubusercontent.com/wiki/EvanQuan/.vim/screenshot.png)

Table of Contents
-----------------
1. [Why Use This?](#why-use-this?)
2. [Installation](#installation)
    - [Additional Things](#additional-things)
3. [Updating](#updating)
4. [Recommendations](#recommendations)
    - [Mac](#mac)
    - [Windows](#windows)
5. [Color Schemes](#color-schemes)
6. [Plugins](#plugins)

Why Use This?
------------
If you're lazy and want to use what I'm using, feel free to.

Installation
------------
Clone this repository and run `pull.sh`:
```bash
git clone https://github.com/EvanQuan/.vim ~/.vim
cd ~/.vim
bash pull.sh
```

Hooray, that's it! You're all done!


#### Additional Things

1. For Vim versions 7.4 (or late versions of 7.3) onwards, Vim automatically detects
`~/.vim/vimrc` as a secondary vimrc so nothing needs to be done. For earlier versions
of Vim, create a dummy `~/.vimrc` file in your home directory that links to `~/.vim/vimrc`:
```bash
echo "source ~/.vim/vimrc" > ~/.vimrc
```
2. If you are on Windows and are using gVim, clone for corresponding `vimfiles`
and `_vimrc`:
```bash
git clone https://github.com/EvanQuan/.vim ~/vimfiles
echo "source ~/vimfiles/vimrc" > ~/_vimrc
cd ~/vimfiles
git submodule update --init --remote --merge --recursive
bash ~/vimfiles/version/check_version.sh
```
3. (Optional) Install powerline and powerline fonts [here](https://powerline.readthedocs.io/en/latest/installation.html).

Once powerline fonts are installed, they need to be set in the terminal for them to appear correctly.
On Mac, I use `Meslo LG M for Powerline 14`.

4. If for some reason your terminal does not support italics, try this:
```bash
echo "xterm-256color|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color," >> xterm-256color.terminfo.txt
tic -o ~/.terminfo xterm-256color.terminfo.txt
```

5. If all the colors are weird, or the whole background is solid blue, consider
setting `g:truecolor_enabled = 0` in `~/.vim/settings.vim` as your terminal
may not support 24-bit color.

Updating
--------
To update everything, run `bash pull.sh`. If there is a new version of
`settings.vim` available, your local copy will be replaced with a template
of the newer version. Otherwise, your local `settings.vim` will be unchanged.

```bash
cd ~/.vim
bash pull.sh
```

Alternatively, if you are on Windows and are using gVim, run this:
```bash
cd ~/vimfiles
git pull origin master
git submodule update --init --remote --merge --recursive
bash version/check_version.sh
```

Recommendations
---------------

These don't necessarily relate to Vim, but I feel they are important to bring
up regardless.

#### Mac
I strongly recommend that you use [iTerm2](https://www.iterm2.com/), as
it is strictly better than the default terminal. It supports 24-bit color
and has a bunch of other fancy stuff. Pretty much a necessity.

#### Windows
Use [Git Bash](https://git-scm.com/downloads) instead of command prompt.
It uses `~/.vim` just as you would expect with Mac or Linux instead of
`~/vimfiles` and behaves like a Unix terminal. I am aware there are other good
terminals for Windows out there, but this is what I have been using.

Color Schemes
-------------
- [onedark.vim](https://github.com/joshdick/onedark.vim)
- [vim-one](https://github.com/rakr/vim-one)

Plugins
-------
- [ale](https://github.com/w0rp/ale)
- [arm-syntax-vim](https://github.com/ARM9/arm-syntax-vim)
- [auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [ctrlp.vim](https://github.com/kien/ctrlp.vim)
- [haskell-vim](https://github.com/neovimhaskell/haskell-vim)
- [html5.vim](https://github.com/othree/html5.vim)
- [indentLine](https://github.com/Yggdroot/indentLine)
- [jedi-vim](https://github.com/davidhalter/jedi-vim)
- [lightline-buffer](https://github.com/taohexx/lightline-buffer)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [neocomplete.vim](https://github.com/Shougo/neocomplete.vim)
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
- [powerline](https://github.com/powerline/powerline)
- [prolog.vim](https://github.com/adimit/prolog.vim)
- [quick-scope](https://github.com/unblevable/quick-scope)
- [tabular](https://github.com/godlygeek/tabular)
- [vim-closetag](https://github.com/alvan/vim-closetag)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-gitbranch](https://github.com/itchyny/vim-gitbranch)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-javacomplete2](https://github.com/artur-shaik/vim-javacomplete2)
- [vim-mkdir](https://github.com/pbrisbin/vim-mkdir)
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [vim-prolog](https://github.com/mxw/vim-prolog)
- [vim-repeat](https://github.com/tpope/vim-repeat)
- [vim-rhubarb](https://github.com/tpope/vim-rhubarb)
- [vim-sensible](https://github.com/tpope/vim-sensible)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-togglecursor](https://github.com/jszakmeister/vim-togglecursor)
- [vim-workspace](https://github.com/thaerkh/vim-workspace)
