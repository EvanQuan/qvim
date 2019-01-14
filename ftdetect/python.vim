" This is not a standard file extension for Python 2 files, but I decided to
" make it myself for my own uses. Works well with the vim-executioner plugin
" to determine whether to use Python 2 or 3 for a given file.
"
autocmd BufNewFile,BufRead *.py2 set filetype=python
