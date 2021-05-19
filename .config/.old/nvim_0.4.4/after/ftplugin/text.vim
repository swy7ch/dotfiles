" Author        : swytch
" Created       : 06/05/2020
" License       : GPLv3
" Description   : text filetype config

setlocal spell spelllang=fr,en_us
set expandtab
noremap <leader><Enter> :w! \| :!sent % &<CR><CR>
