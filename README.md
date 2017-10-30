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
1. If you do not have a .vim directory, clone this repository:
```
git clone https://github.com/EvanQuan/.vim ~/.vim
```
2. Update the submodules:
```
git submodule update --init
```
3. Create a dummy `.vimrc` file in your home directory that links to the "real"
   `.vimrc` file in your `.vim` directory:
```
cd ~
echo "source ~/.vim/.vimrc" >> .vimrc
```
4. Ponder your putrid, insignificant existence as the heat death of the universe
inevitably creeps closer.
