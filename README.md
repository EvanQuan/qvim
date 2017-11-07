My Vim Configurations
==============
These are the current Vim settings I'm using. It uses Atom's One Dark
colorscheme (alterantively Solarized, if enabled in the settings) and has some common
plugins for ease of use.

Table of Contents
---------------
1. [Why Use This?](#why-use-this?)
2. [Installation](#installation)
    - [Settings](#settings)
    - [Powerline](#powerline)
4. [Colour Schemes](#colour-schemes)
5. [Plugins](#plugins)

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
6. (Optional) Install powerline and powerline fonts [here](https://powerline.readthedocs.io/en/latest/installation.html).

### Settings
The `.vimrc` file requires an external `settings.vim` file in order to work properly.
Consider changing the values if there are problems with how
the colour scheme or lightline is rendering.

Copy this as `settings.vim` into your `.vim` directory.
It will **NOT** be tracked in git, allowing it to be device-specific:
```
"_____Settings_____
" 24-bit color (True color)
"   Many terminals don't support 24-bit color and will screw up the color
"   scheme if true color is enabled.
"   If disabled, the colour scheme will work but will be slightly
"   different from what is should be (less ideal).
let truecolor_enabled = 1
" Powerline
"   If powerline fonts are not installed on device, unicode characters for
"   lightline will not render correctly. Disable to have default lightline
"   separators and supseparators.
let special_symbols_enabled = 1
" Colour scheme
"   Affects overall colour scheme and lightline colour scheme
"   0 is None
"   1 is One Dark
"   2 is Solarized
let colorscheme_type = 1
" Hard wrap
" Automatically wraps text to the next line at wrap_width.
" Can be convenient in some instances like in LaTeX,  but can be sometimes
" annoying when programming.
" If enabled, has visual marker of 79 lines.
let wrap_enabled = 0
" Show invisibles
"   Render placeholders for invivisble characters, such as tabs, spaces and
"   newlines
let show_invisibles_enabled = 1'
```

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

Colour Schemes
-----------
- [onedark.vim](https://github.com/joshdick/onedark.vim)
- [Solarized](https://github.com/vim-scripts/Solarized)

Plugins
-------
- [auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [ctrlp.vim](https://github.com/kien/ctrlp.vim)
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
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [vim-repeat](https://github.com/tpope/vim-repeat)
- [vim-sensible](https://github.com/tpope/vim-sensible)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-workspace](https://github.com/thaerkh/vim-workspace)
