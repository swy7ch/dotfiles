" groff filetype config
" Licence GPLv3

inoremap <buffer> à \[`a]
inoremap <buffer> 'A \[`A]
inoremap <buffer> â \[^a]
inoremap <buffer> Â \[^A]
inoremap <buffer> ç \[,c]
inoremap <buffer> CC \[,C]
inoremap <buffer> é \['e]
inoremap <buffer> 'E \['E]
inoremap <buffer> è \[`e]
inoremap <buffer> ê \[^e]
inoremap <buffer> Ê \[^E]
inoremap <buffer> ï \[¨i]
inoremap <buffer> î \[^i]
inoremap <buffer> Î \[^I]
inoremap <buffer> oe \[oe]
inoremap <buffer> ô \[^o]
inoremap <buffer> Ô \[^O]
inoremap <buffer> û \[^u]
inoremap <buffer> ù \[`u]
" Espace insécable devant etc
inoremap <buffer> <Space>etc \~etc.
" Espace insécable devant ':'
inoremap <buffer> <Space>: \~:
" Centered point
inoremap <buffer> .. \[u00B7]
" Italics
inoremap <buffer> II \*[IT]\*[PREV]<Esc>F\i
" Bold
inoremap <buffer> BB \*[BD]\*[PREV]<Esc>F\i
" Bold + Italics
inoremap <buffer> BI \*[BDI]\*[PREV]<Esc>F\i
" Real dashes
" - short one
inoremap <buffer> -- \[en]
" -- long one
inoremap <buffer> __ \[em]
