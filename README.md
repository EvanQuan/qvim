My Vim Configurations
==============
These are the current Vim settings I'm using. It uses Atom's One Dark
color scheme (alternatively Solarized, if enabled in the settings) and
has some common plugins for ease of use.

Table of Contents
---------------
1. [Why Use This?](#why-use-this?)
2. [Installation](#installation)
    - [Settings](#settings)
    - [Powerline](#powerline)
3. [Updating](#updating)
4. [Color Schemes](#color-schemes)
5. [Plugins](#plugins)

Why Use This?
-----------
You shouldn't. There are many more developed Vim config files out there on
***thyne intertoobz*** that have been iterated on over the years by people who
actually know what they're doing.

Installation
-----------

1. Clone this repository:
```bash
cd ~
git clone https://github.com/EvanQuan/.vim ~/.vim
```
2. Update the submodules:
```bash
cd ~/.vim
git submodule update --init --recursive
```
3. Create a dummy `.vimrc` file in your home directory that links to the "real"
   `.vimrc` file in your `.vim` directory:
```bash
echo "source ~/.vim/vimrc" >> ~/.vimrc
```
4. If you are on Windows and are using gVim, clone for corresponding `vimfiles`
and `_vimrc`:
```bash
git clone https://github.com/EvanQuan/.vim ~/vimfiles
echo "source ~/vimfiles/.vimrc" >> ~/_vimrc
cd ~/vimfiles
git submodule update --init --recursive
```
5. (Optional) Install powerline and powerline fonts [here](https://powerline.readthedocs.io/en/latest/installation.html).

6. If for some reason your terminal does not support italics, try this:
```bash
echo "xterm-256color|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color," >> xterm-256color.terminfo.txt
tic -o ~/.terminfo xterm-256color.terminfo.txt
```

### Settings
The `vimrc` file requires an external `settings.vim` file in order to
work properly. Consider changing the values in `settings.vim` if there are
problems with how the color scheme or lightline is rendering.

Create a `settings.vim` file into your `~/.vim` directory by copying `settings_template.vim`.
```bash
cp ~/.vim/settings_template.vim ~/.vim/settings.vim
```
It will **NOT** be tracked by git, allowing its settings to be specific to each machine:

### Powerline
Lightline uses powerline for the separator and subseparator symbols. If the
separators and subseparators render with `separators_enabled`, but not
the correct size, or are shifted upwards:

1. If on Mac and using iTerm2, go to
```
iTerm2 -> Preferences -> Profiles -> Text -> Use a different font for non-ASCII text
```
and change the non-ASCII font to one of the various powerline fonts of the
same size as ASCII font. Currently, I have it set to `ProFont for Powerline`.

Updating
--------

Keep `vimrc`, `settings.vim` and the submodules up to date with their
respective repositories:
```bash
git pull origin master
git submodule update --init --recursive
cp ~/.vim/settings_template.vim ~/.vim/settings.vim
```

Color Schemes
-----------
- [onedark.vim](https://github.com/joshdick/onedark.vim)
- [Solarized](https://github.com/vim-scripts/Solarized)

Plugins
-------
- [arm-syntax-vim](https://github.com/ARM9/arm-syntax-vim)
- [auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [ctrlp.vim](https://github.com/kien/ctrlp.vim)
- [haskell-vim](https://github.com/neovimhaskell/haskell-vim)
- [html5.vim](https://github.com/othree/html5.vim)
- [indentLine](https://github.com/Yggdroot/indentLine)
- [jedi-vim](https://github.com/davidhalter/jedi-vim)
- [lightline-buffer](https://github.com/taohex/lightline-buffer)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
- [powerline](https://github.com/powerline/powerline)
- [tabular](https://github.com/godlygeek/tabular)
- [syntastic](https://github.com/vim-syntastic/syntastic)
- [vim-closetag](https://github.com/alvan/vim-closetag)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-gitbranch](https://github.com/itchyny/vim-gitbranch)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-javacomplete2](https://github.com/artur-shaik/vim-javacomplete2)
- [vim-mkdir](https://github.com/pbrisbin/vim-mkdir)
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [vim-prolog](https://github.com/mxw/vim-prolog)
- [vim-repeat](https://github.com/tpope/vim-repeat)
- [vim-sensible](https://github.com/tpope/vim-sensible)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-workspace](https://github.com/thaerkh/vim-workspace)
