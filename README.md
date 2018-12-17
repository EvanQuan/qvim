My Vim Configuration
====================
This is my personal [Vim](https://www.vim.org/) configuration.

![](https://raw.githubusercontent.com/wiki/EvanQuan/.vim/screenshot.png)

Table of Contents
-----------------
1. [Why Use This?](#why-use-this?)
2. [Installation](#installation)
3. [External Dependencies](#external-dependencies)
    - [Powerline Fonts](#powerline-fonts)
    - [Python Language Server](#python-language-server)
    - [Lua Support](#lua-support)
4. [Updating](#updating)
5. [Plugin List](#plugin-list)
    - [Plugin Manager](#plugin-manager)
    - [Color Schemes](#color-schemes)
    - [Editing](#editing)
    - [File Navigation](#file-navigation)
    - [Languages](#languages)
    - [Linting](#linting)
    - [Programming](#programming)
    - [User Interface](#user-interface)
    - [Version Control](#version-control)
6. [Troubleshooting](#troubleshooting)
    - [Plugins are not installed](#plugins-are-not-installed)
    - [Vimrc is not detected](#vimrc-is-not-detected)
    - [Some characters in the UI are not rendering properly](#some-characters-in-the-ui-are-not-rendering-properly)
    - [Italic characters are not rendering](#italic-characters-are-not-rendering)
    - [Everything is blue](#everything-is-blue)

Why Use This?
------------
If you're lazy and want to use what I'm using, feel free to. However, note that
each person's Vim configuration is tailored to that person's workflow, and not
necessarily anyone else's. This is why I recommend that people customize Vim to
best fit their own needs.

Installation
------------

Clone this repository and run `pull.sh` as follows:

```bash
git clone https://github.com/EvanQuan/qvim ~/.vim
cd ~/.vim
bash pull.sh
```

Open Vim and execute `:PlugInstall`. Close and restart Vim.

#### Windows

Bash (`.sh`) files are not executable on Windows by default. One solution is to
install [Git Bash](https://git-scm.com/downloads) or
[Cygwin](https://cygwin.com/install.html) to run `pull.sh`.
I may later make a `.bat` script to make things easier for Windows.

Hooray, that's it! You're all done!

External Dependencies
---------------------
No one likes having to install external dependencies, which is why all of mine
are optional. That being said, installing these may improve your Vim
experience.

### Powerline Fonts

By default, Powerline symbols are disabled in `settings.vim`. But if you want
to make your status line look fancy, you can install them
[here](https://powerline.readthedocs.io/en/latest/installation.html).

### Python Language Server

[ale](https://github.com/w0rp/ale) requires some extra stuff to do its linting
for Python. You can install the [Language Server
Protocol](https://github.com/palantir/python-language-server) for Python
linting with:
```bash
pip install 'python-language-server[all]'
```
or
```bash
pip3 install 'python-language-server[all]'
```
You can install [Flake8](https://flake8.pycqa.org/een/latest) for style guide
enforcement with:
```bash
python<version> -m pip install flake8
```
where `<version>` is the Python version you have installed, such as `3.4` or
`3.7`. If running `python` in your terminal already runs some version of Python
3, then no version number needs to be included.

### Lua Support

If Vim is installed without Lua support (`:echo has('lua')` responds with `1`),
then autocomplete features from
[completor.vim](https://github.com/maralla/completor.vim) or
[neocomplete](https://github.com/Shougo/neocomplete.vim) will not work.

Updating
--------

### Vimrc configuration

To update your configuration, run `bash pull.sh`. If there is a new version of
`settings.vim` available, your local copy will be replaced with a template of
the newer version. Otherwise, your local `settings.vim` will be unchanged.

```bash
cd ~/.vim
bash pull.sh
```

Open Vim and execute `:PlugInstall`

### Plugins

To update your plugins, open up Vim and execute `:PlugUpdate`. Close and
restart Vim.

Plugin List
-----------

### Plugin Manager
- [vim-plug](https://github.com/junegunn/vim-plug)

### Color Schemes
- [onedark.vim](https://github.com/joshdick/onedark.vim)
- [vim-one](https://github.com/rakr/vim-one)

### Editing
- [auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [betterdigraphs.vim](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/hudigraphs_utf8.vim)
- [completor.vim](https://github.com/maralla/completor.vim)
- [dragvisuals](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/dragvisuals.vim)
- [listtrans](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/listtrans.vim)
- [neocomplete](https://github.com/Shougo/neocomplete.vim)
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
- [tabular](https://github.com/godlygeek/tabular)
- [vim-closetag](https://github.com/alvan/vim-closetag)
- [vim-endwise](https://github.com/tpope/vim-endwise)
- [vim-exchange](https://github.com/tommcdo/vim-exchange)
- [vim-mathematize](https://github.com/EvanQuan/vim-mathematize)
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [vim-repeat](https://github.com/tpope/vim-repeat)
- [vim-sensible](https://github.com/tpope/vim-sensible)
- [vim-speeddating](https://github.com/tpope/vim-speeddating)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-workspace](https://github.com/thaerkh/vim-workspace)

### File Navigation
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [vim-mkdir](https://github.com/pbrisbin/vim-mkdir)

### Language Support
- [arm-syntax-vim](https://github.com/ARM9/arm-syntax-vim)
- [prolog.vim](https://github.com/adimit/prolog.vim)
- [vim-javacomplete2](https://github.com/artur-shaik/vim-javacomplete2)
- [vim-polyglot](https://github.com/sheerun/vim-polyglot)
- [vim-prolog](https://github.com/mxw/vim-prolog)
- [vim-pythonsense](https://github.com/jeetsukumaran/vim-pythonsense)

### Linting
- [ale](https://github.com/w0rp/ale)
- [jedi-vim](https://github.com/davidhalter/jedi-vim)

### Programming
- [vim-executioner](https://github.com/EvanQuan/vim-executioner)

### User Interface
- [indentLine](https://github.com/Yggdroot/indentLine)
- [lightline-buffer](https://github.com/taohexxx/lightline-buffer)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [quick-scope](https://github.com/unblevable/quick-scope)
- [vim-leader-guide](https://github.com/hecal3/vim-leader-guide)
- [vim-sleuth](https://github.com/tpope/vim-sleuth)
- [vim-togglecursor](https://github.com/jszakmeister/vim-togglecursor)

### Version Control
- [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-gitbranch](https://github.com/itchyny/vim-gitbranch)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-rhubarb](https://github.com/tpope/vim-rhubarb)

Troubleshooting
---------------

#### Plugins are not installed

[vim-plug](https://github.com/junegunn/vim-plug) manages the installation of
all the plugins. Open Vim and execute `:PlugInstall`. Close and restart Vim.

#### Vimrc is not detected
For Vim versions 7.4 (or late versions of 7.3) onwards, Vim automatically
detects `~/.vim/vimrc` as a secondary vimrc so nothing needs to be done. For
earlier versions of Vim, create a dummy `~/.vimrc` file in your home directory
that links to `~/.vim/vimrc`:
```bash
echo "source ~/.vim/vimrc" > ~/.vimrc
```
Better yet, just update Vim.

#### Some characters in the UI are not rendering properly

![](https://raw.githubusercontent.com/wiki/EvanQuan/.vim/no_powerline_error.png)

There are two solutions:
1. Install Powerline fonts
   [here](https://powerline.readthedocs.io/en/latest/installation.html).

Once Powerline fonts are installed, they need to be set in the terminal for
them to appear correctly. On Mac, I use `Meslo LG M for Powerline 14`.

2. Disable Powerline fonts

Go to `settings.vim` and set `g:special_symbols_enabled = 0`. The resulting
appearance will be:

![](https://raw.githubusercontent.com/wiki/EvanQuan/.vim/no_powerline_fixed.png)

#### Italic characters are not rendering

If for some reason your terminal does not support italics, enable them:
```bash
echo "xterm-256color|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color," >> xterm-256color.terminfo.txt
tic -o ~/.terminfo xterm-256color.terminfo.txt
```

#### Everything is blue

![](https://raw.githubusercontent.com/wiki/EvanQuan/.vim/no_truecolor_error.png)

There are 2 solutions:
1. Use a terminal that supports 24-bit color (also called true color).

    **Mac**

    I strongly recommend [iTerm2](https://www.iterm2.com/) over the default
    terminal. It supports 24-bit color and has a bunch of other fancy stuff.

    **Windows**

    If you're using [PuTTY](https://www.putty.org/) for ssh, use some other
    terminal for ssh instead, such as [Git Bash](https://git-scm.com/downloads)
    or [Mintty](https://mintty.github.io/).

    **Linux**

    You already know what you're doing. :penguin:

2. Disable true color

    Go to `settings.vim` and set `g:truecolor_enabled = 0`. The resulting
    appearance will be be an altered version of the selected color scheme.

![](https://raw.githubusercontent.com/wiki/EvanQuan/.vim/no_truecolor_fixed.png)
