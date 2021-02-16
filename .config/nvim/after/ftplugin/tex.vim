" Author        : swytch
" Created       : 06/05/2020
" License       : GPLv3
" Description   : tex filetype config

" spellcheck enabled
setlocal spell spelllang=fr

" Caps
inoremap <buffer> AA À
inoremap <buffer> CC Ç
inoremap <buffer> EE É
" Unbreakable space before 'etc'
inoremap <buffer> <Space>etc \,etc.
" Unbreakable space before ':'
inoremap <buffer> <Space>: \,:
" Centered point
inoremap <buffer> .. \textperiodcentered
" But don't overreact
inoremap <buffer> ... ...
" Italics
inoremap <buffer> II \textit{}<Esc>i
" Bold
inoremap <buffer> BB \textbf{}<Esc>i
" Bold + Italics
inoremap <buffer> BI \textit{\textbf{}}<Esc>hi
" Smallcaps
inoremap <buffer> SC \fsc{}<Esc>i
