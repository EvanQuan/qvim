My Vim Configuration
====================
This is my personal [Vim](https://www.vim.org/) configuration.

![](https://raw.githubusercontent.com/wiki/EvanQuan/.vim/screenshot.png)

Table of Contents
-----------------
1. [Why Use This?](#why-use-this?)
2. [Installation](#installation)
3. [Troubleshooting](#troubleshooting)
    - [Vimrc is not detected](#vimrc-is-not-detected)
    - [Some characters in the UI are not rendering properly](#some-characters-in-the-ui-are-not-rendering-properly)
    - [Italic characters are not rendering](#italic-characters-are-not-rendering)
    - [Everything is blue](#everything-is-blue)
4. [Updating](#updating)
5. [Plugins](#plugins)
    - [Plugin Manager](#plugin-manager)
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


Troubleshooting
---------------

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

There are 2 solutions:
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

##### Mac
I strongly recommend [iTerm2](https://www.iterm2.com/) over the default
terminal. It supports 24-bit color and has a bunch of other fancy stuff.

##### Windows
If you're using [PuTTY](https://www.putty.org/) for ssh, use some other
terminal for ssh instead, such as:
- [Git Bash](https://git-scm.com/downloads)
- [Mintty](https://mintty.github.io/)

##### Linux
You already know what you're doing. :penguin:

2. Disable true color

Go to `settings.vim` and set `g:truecolor_enabled = 0`. The resulting
appearance will be be an altered version of the selected color scheme.

![](https://raw.githubusercontent.com/wiki/EvanQuan/.vim/no_truecolor_fixed.png)

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


Plugins
-------

### Plugin Manager
- [pathogen](https://github.com/tpope/vim-pathogen)

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
- [prolog.vim](https://github.com/adimit/prolog.vim)
- [vim-javacomplete2](https://github.com/artur-shaik/vim-javacomplete2)
- [vim-polyglot](https://github.com/sheerun/vim-polyglot)
- [vim-prolog](https://github.com/mxw/vim-prolog)

### Linting
- [ale](https://github.com/w0rp/ale)
- [jedi-vim](https://github.com/davidhalter/jedi-vim)

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

Design Decisions
----------------
**Why not use [deoplete](https://github.com/Shougo/deoplete.nvim)?**

While I acknowledge deoplete's asynchronous autocomplete is far better than
what neocomplete offers, deoplete is extremely annoying to install for Vim 8,
since is primarily designed for Neovim. Due to its required dependencies,
I can't be bothered to install those (or can't guarantee I'll be able to
install them), for any given computer I'm on.

**Why not use [Neovim](https://neovim.io/)?**

I do like the idea of Neovim, and these configurations are mostly compatible
with it. The only thing I don't like about Neovim is how its integrated
terminal is implemented compared to Vim. Since I use the integrated terminal
fairly often, this difference alone has deterred me from switching to Neovim.
It could be the case that this problem could be fixed through some extra
configurations I am not aware of, but until I am aware of it, I have no plans
on making the switch.

**Why not use Emacs?**

While this question warrants an entire discussion on its own, I can briefly
explain my view. There are two parts points of comparison for this question,
comparing Vim and Emacs as software, and as editing styles.

I actually acknowledge that Emacs is better software than Vim. The decision to
use Lisp for scripting is smarter than Vim's use of Vimscript, which has no use
outside of Vim. Emacs is also not constrained as a command-line editor, being
able to render images and other such things that I'm not aware of (since
I haven't spent much time looking into Emacs). Overall, I would say that Emacs
more configurable than Vim, which is a big plus.

However, comparing editing styles, I highly favour Vim's modal editing over
Emacs's modifier key approach. Relying on modifier keys suffers from two main
problems:
1. [It's not particularly ergonomic](http://wiki.c2.com/?EmacsPinky), which can
   contribute to repetitive strain injuries.
2. It is often not very intuitive, which makes memorizing a large number of
   commands difficult.

With Vim's modal-editing, key presses for commands can be sequentially-ordered,
and remain semantically-valued, fixing both of those problems.

Finally, straight out of the box, I find Vim's movement key-mappings and
editing commands involving text objects most useful. This plays an important
role because a significant portion of my time editing with Vim key-mappings is
not actually in Vim itself. Almost every half-decent editor and IDE out there
provides an option for Vim key-mappings (and sometimes Emacs as well). Most of
the time, these key-mappings are minimal and are not open for configuration.
For this, Vim wins me over for its default capabilities.

**Why not use [Spacemacs](http://spacemacs.org/)/[Evil](https://github.com/emacs-evil/evil)/[Doom](https://github.com/hlissner/doom-emacs)?**

The startup times are too long, which is a problem if I'm quickly editing
files, especially over ssh. Being developed by large numbers of people over
many years, they have a slew of custom key mappings which I am not familiar
with, some of which I don't like. They also unavoidably miss certain Vim key
mappings that I use often (like CTRL-A and CTRL-X), by virtue of being in
Emacs.

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
      other editors (Atom, VSCode, Intellij, Eclipse, Visual Studios, overleaf,
      repl.it etc.)
3. Compatibility with older versions of Vim (< 7.3).
    - I have "safety" checks through the vimrc so that things don't break for
      older versions.
    - I stick with [Pathogen](https://github.com/tpope/vim-pathogen) over the
      native plugin manager that comes with Vim 8 so that it is compatible with
      Vim 7.
    - Some plugins I use take advantage of newer versions, but the nature of
      their backwards compatibility is out of my hands (although most if not
      all of them seem to either work or disable in older versions to avoid
      breaking).
    - This being said, I try to keep Vim up to date whenever I can so this has
      never been a real problem for me.
