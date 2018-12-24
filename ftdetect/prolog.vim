" Normally .pro files detect as idlang files. As GNU Prolog detects Prolog
" files with .pro and .pl extensions, I have decided to override .pro as
" I have no use for idlang and .pl is reserved for Perl files.
"
" I am aware that .prolog guarantees the file to be detected for Prolog, but
" again, for the sake of convenience, .pro files work easier for GNU Prolog.
"
autocmd BufNewFile,BufRead *.pro set filetype=prolog
