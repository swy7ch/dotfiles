function! CurrentMode()
	let g:currentmode={
		\ 'n'	: '[ NRM ]',
		\ 'v'	: '[ VIS ]',
		\ 'V'	: '[ V·L ]',
		\ ''	: '[ V·B ]',
		\ 'i'	: '[ INS ]',
		\ 'R'	: '[ RPL ]',
		\ 'Rv'	: '[ V·R ]',
		\ 'c'	: '[ CMD ]',
		\}

	return g:currentmode[mode()]
endfunction

function! ModeColor()
	let g:modecolor={
		\ 'n'	: '%#NormalMode#',
		\ 'v'	: '%#VisualMode#',
		\ 'V'	: '%#VisualMode#',
		\ ''	: '%#VisualMode#',
		\ 'i'	: '%#InsertMode#',
		\ 'R'	: '%#ReplaceMode#',
		\ 'Rv'	: '%#ReplaceMode#',
		\ 'c'	: '%#CommandMode#',
		\}

	return g:modecolor[mode()]
endfunction

function! FileName()
	let g:name=' '
	if winwidth(0)>90
		let g:name.='%F'
	else
		let g:name.='%t'
	endif

	return g:name
endfunction

function! StatusLine()
	let l:statusline=''

	" Buffer number
	let l:statusline.='%#Buffer#'
	let l:statusline.='[%n]'

	" Show current mode
	let l:statusline.=ModeColor()
	let l:statusline.=CurrentMode().'%*'

	" File path, absolute or relative to ~/
	let l:statusline.='%#File#'
	let l:statusline.=FileName()

	" File status
	let l:statusline .= "%{&readonly?' [RO]':''}"
	let l:statusline .= "%{&modified?' [MO]':''}"

	" Truncate line here
	let l:statusline.='%<'

	" Separation point between left and right aligned items.
	let l:statusline.='%=%* '

	let l:statusline.='%#SpellLocal#'
	let l:statusline.="%{&spell?'[SPELL] ':''}%*"

	" Filetype
	let l:statusline.='%#FileType#'
	let l:statusline.="%{&filetype!=#''?&filetype.' ':'no ft '}%*"

	" Encoding & Fileformat
	"let l:statusline.='%#WarningMsg#'
	"let l:statusline.="%{&fileencoding!='utf-8'?'['.&fileencoding.'] ':''}%*"

	" Depth
	let l:statusline.='%#Percent#'
	let l:statusline.='%03.p%%%* '

	" Location of cursor in line
	let l:statusline.='%#Column#'
	let l:statusline.='-%03.c-'

	return l:statusline
endfunction

function! StatusLineNC()
	let l:statusline=''

	" Buffer number
	let l:statusline.='[%n]'

	" File name and status
	let l:statusline.=' %t'

	let l:statusline .= "%{&readonly?' [MO]':''}"
	let l:statusline .= "%{&modified?' [RO]':''}"

	" Truncate line here
	let l:statusline.='%<'

	" Separation point between left and right aligned items.
	let l:statusline.='%='

	" Depth
	let l:statusline.='%#Percent#'
	let l:statusline.='%03.p%%'

	return l:statusline
endfunction

function! UpdateInactiveWindows()
	for winnum in range(1, winnr('$'))
		if winnum != winnr()
			call setwinvar(winnum, '&statusline', '%!StatusLineNC()')
		endif
	endfor
endfunction

function! RefreshStatusLine(mode)
	if a:mode == "active"
		setlocal statusline=%!StatusLine()
	else
		setlocal statusline=%!StatusLineNC()
	endif
endfunction
