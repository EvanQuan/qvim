My Vim Configuration
====================
This is my personal [Vim](https://www.vim.org/) configuration.

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
5. [Plugins](#plugins)
    - [Color Schemes](#color-schemes)
    - [Editing](#editing)
    - [File Navigation](#file-navigation)
    - [Languages](#languages)
    - [Linting](#linting)
    - [User Interface](#user-interface)
    - [Version Control](#version-control)
6. [Design Decisions](#design-decisions)

Why Use This?
------------
If you're lazy and want to use what I'm using, feel free to.

Installation
------------

Clone this repository and run `pull.sh`:

#### Mac/Linux
```bash
git clone https://github.com/EvanQuan/.vim ~/.vim
cd ~/.vim
bash pull.sh
```

#### Windows
```bash
git clone https://github.com/EvanQuan/.vim ~/vimfiles
cd ~/vimfiles
bash pull.sh
```

Hooray, that's it! You're all done!


#### Additional Things

1. For Vim versions 7.4 (or late versions of 7.3) onwards, Vim automatically
   detects `~/.vim/vimrc` as a secondary vimrc so nothing needs to be done. For
   earlier versions of Vim, create a dummy `~/.vimrc` file in your home
   directory that links to `~/.vim/vimrc`:
```bash
echo "source ~/.vim/vimrc" > ~/.vimrc
```

2. (Optional) Install Powerline and Powerline fonts
   [here](https://powerline.readthedocs.io/en/latest/installation.html).

Once Powerline fonts are installed, they need to be set in the terminal for
them to appear correctly. On Mac, I use `Meslo LG M for Powerline 14`.

3. If for some reason your terminal does not support italics, try this:
```bash
echo "xterm-256color|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color," >> xterm-256color.terminfo.txt
tic -o ~/.terminfo xterm-256color.terminfo.txt
```

4. If all the colors are weird, or the whole background is solid blue, consider
   setting `g:truecolor_enabled = 0` in `~/.vim/settings.vim` as your terminal
   may not support 24-bit color.

Updating
--------
To update everything, run `bash pull.sh`. If there is a new version of
`settings.vim` available, your local copy will be replaced with a template of
the newer version. Otherwise, your local `settings.vim` will be unchanged.

#### Mac/Linux
```bash
cd ~/.vim
bash pull.sh
```

#### Windows
```bash
cd ~/vimfiles
bash pull.sh
```

Recommendations
---------------

These don't necessarily relate to Vim, but I feel they are important to bring
up regardless.

#### Mac
I strongly recommend that you use [iTerm2](https://www.iterm2.com/), as
it is strictly better than the default terminal. It supports 24-bit color
and has a bunch of other fancy stuff.

#### Windows
Use [Git Bash](https://git-scm.com/downloads). It uses `~/.vim` just as you
would expect with Mac or Linux instead of `~/vimfiles` and behaves like a Unix
terminal. I am aware there are other good terminals for Windows out there, but
this is what I have been using. I am not well-versed in command prompt
alternatives for Windows.

#### Linux
Keep doing what you're doing. :penguin:


Plugins
-------
### Color Schemes
- [onedark.vim](https://github.com/joshdick/onedark.vim)
- [vim-one](https://github.com/rakr/vim-one)

### Editing
- [auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [betterdigraphs.vim](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/hudigraphs_utf8.vim)
- [dragvisuals](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/dragvisuals.vim)
- [listtrans](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/listtrans.vim)
- [neocomplete.vim](https://github.com/Shougo/neocomplete.vim)
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
- [tabular](https://github.com/godlygeek/tabular)
- [vim-closetag](https://github.com/alvan/vim-closetag)
- [vim-exchange](https://github.com/tommcdo/vim-exchange)
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [vim-repeat](https://github.com/tpope/vim-repeat)
- [vim-sensible](https://github.com/tpope/vim-sensible)
- [vim-speeddating](https://github.com/tpope/vim-speeddating)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-workspace](https://github.com/thaerkh/vim-workspace)
- [vmath](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/vmath.vim)

### File Navigation
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [vim-mkdir](https://github.com/pbrisbin/vim-mkdir)

### Languages
- [arm-syntax-vim](https://github.com/ARM9/arm-syntax-vim)
- [haskell-vim](https://github.com/neovimhaskell/haskell-vim)
- [html5.vim](https://github.com/othree/html5.vim)
- [prolog.vim](https://github.com/adimit/prolog.vim)
- [vim-javacomplete2](https://github.com/artur-shaik/vim-javacomplete2)
- [vim-prolog](https://github.com/mxw/vim-prolog)

### Linting
- [ale](https://github.com/w0rp/ale)
- [jedi-vim](https://github.com/davidhalter/jedi-vim)

### User Interface
- [indentLine](https://github.com/Yggdroot/indentLine)
- [lightline-buffer](https://github.com/taohexxx/lightline-buffer)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [quick-scope](https://github.com/unblevable/quick-scope)
- [vim-sleuth](https://github.com/tpope/vim-sleuth)
- [vim-togglecursor](https://github.com/jszakmeister/vim-togglecursor)

### Version Control
- [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-gitbranch](https://github.com/itchyny/vim-gitbranch)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-rhubarb](https://github.com/tpope/vim-rhubarb)

Design Decisions
----------------
**Why not use [deoplete](https://github.com/Shougo/deoplete.nvim)?**

While I acknowledge deoplete's asynchronous autocomplete is far better than what
neocomplete offers, deoplete is extremely annoying to install for Vim 8, since
is primarily designed for Neovim. Due to its required dependencies, I can't be
bothered to install those (or can't guarantee I'll be able to install them),
for any given computer I'm on.

**Why not use [Neovim](https://neovim.io/)?**

I do like the idea of Neovim, and these configurations are completely
compatible with Neovim. The only thing I don't like about Neovim is how its
integrated terminal is implemented compared to Vim. Since I use the integrated
terminal fairly often, this difference alone has deterred me from switching to
Neovim. It could be the case that this problem could be fixed through some
extra configurations I am not aware of, but until I am aware of it, I have no
plans on making the switch.

**Why not use Emacs?**

There are two parts points of comparison for this question, comparing Vim and
Emacs as software, and as editing paradigms/styles/whatever you want to call
it.

I actually acknowledge that Emacs is better software than Vim. The decision to
use Lisp for scripting is smarter than Vim's use of Vimscript, which has no use
outside of Vim. Emacs is also not constrained as a command-line editor, being
able to render images and other such things that I'm not aware of (since
I haven't spent much time looking into Emacs).

Comparing editing styles, I highly favour modal editing over the modifier key
approach that Emacs (and basically every other editor I'm aware of) uses.
Relying on modifier keys for commands, especially with pressing 3 or more keys
at the same time, [is not particularly
ergonomic](http://wiki.c2.com/?EmacsPinky).

In general, many commands are difficult to memorize, as sometimes neither the
modifier key(s) (CTRL, ALT, Command/Windows) nor the key being modified are
semantically related to the command they are trying to execute. What do the CTRL
and Z keys have anything to do with "undoing the last action"? Having
semantically-valued commands like `dsb` to **D**elete **S**urrounding
**B**rackets or `cit` to **C**hange **I**n **T**ag makes using hundreds of
commands in Vim without needing to memorize them easier.


**Why not use [Spacemacs](http://spacemacs.org/)/[Evil](https://github.com/emacs-evil/evil)/[Doom](https://github.com/hlissner/doom-emacs)?**

The startup times are too long (10 seconds or more), which is a problem if I'm
quickly editing files, especially over ssh. Being developed by large numbers of
people over many years, they have a slew of custom key mappings which I am not
familiar with, some of which I don't like. They also unavoidably miss certain
Vim key mappings that I use often (like CTRL-A and CTRL-X), by virtue of being
in Emacs.

That being said, I can understand the appeal and strongly support all these
projects. The idea of getting the best of both worlds by taking the strengths
of both Vim and Emacs is something I support, even though in practice it
doesn't work out for me.

**Configuration Thought Process**

1. Minimize the number of external dependencies as possible.
    - This eases the installation process.
    - Currently violations:
        - Vim must be installed with Python support to enable
          [jedi-vim](https://github.com/davidhalter/jedi-vim) and
          [vim-javacomplete2](https://github.com/artur-shaik/vim-javacomplete2)
          to work.
        - Vim must be installed with lua or luajit support to enable
          [neocomplete](https://github.com/Shougo/neocomplete.vim) to work.
        - [Powerline
          Fonts](https://powerline.readthedocs.io/en/latest/installation.html)
          must be installed for Powerline symbols to render properly.
    - However, failing to have Python/Lua support or Powerline fonts can all be
      accounted for in settings.vim and the virmc so nothing breaks.
2. Minimize conflicts with the default key mappings.
    - This makes things easier for others used to default Vim, or other Vim
      configurations.
    - This prevents muscle memory from getting messed up when only default Vim
      is available, or when minimal/standard Vim keymappings are available in
      other editors (Atom, Spacemacs, VSCode, Intellij, Pycharm, Eclipse,
      repl.it etc.)
3. Compatibility with older versions of Vim (< 7.3).
    - I have "safety" checks through the vimrc so that things don't break for
      older versions.
    - Some plugins I use take advantage of newer versions, but the nature of
      their backwards compatibility is out of my hands (although most if not
      all of them seem to either work or disable in older versions to avoid
      breaking).
    - This being said, I try to keep Vim up to date whenever I can so this has
      never been a real problem for me.
