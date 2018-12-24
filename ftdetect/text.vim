" .tex files are by default .text files unless there is latex content inside.
" This is annoying if creating and opening a new file as it then needs to be
" reponed for the file detection to work.
autocmd BufNewFile,BufRead *.tex set filetype=tex
