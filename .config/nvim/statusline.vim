function! CurrentMode()
	let g:currentmode={
		   \ 'n'  : '[ NORMAL ]',
		   \ 'v'  : '[ VISUAL ]',
		   \ 'V'  : '[ V·LINE ]',
		   \ '' : '[ V·BLOCK ]',
		   \ 'i'  : '[ INSERT ]',
		   \ 'R'  : '[ REPLACE ]',
		   \ 'Rv' : '[ V·REPLACE ]',
		   \ 'c'  : '[ COMMAND ]',
		   \}

	return g:currentmode[mode()]
endfunction

functio! ModeColor()

	let g:modecolor={
		   \ 'n'  : '%#NormalMode#',
		   \ 'v'  : '%#VisualMode#',
		   \ 'V'  : '%#VisualMode#',
		   \ '' : '%#VisualMode#',
		   \ 'i'  : '%#InsertMode#',
		   \ 'R'  : '%#ReplaceMode#',
		   \ 'Rv' : '%#ReplaceMode#',
		   \ 'c'  : '%#CommandMode#',
		   \}

	return g:modecolor[mode()]
endfunction

function! StatusLine()

	let l:statusline=''

	" Buffer number
	let l:statusline.='%#Buffer#'
	let l:statusline.='[%n]'

	" Show current mode
	let l:statusline.=ModeColor()
	let l:statusline.=CurrentMode()

	" File path, absolute or relative to ~/
	let l:statusline.='%#File#'
	let l:statusline.=' %F'

    let l:statusline .= "%{&readonly?'!':''}"
    let l:statusline .= "%{&modified?'*':''}"

	" Truncate line here
	let l:statusline.='%<'

	" Separation point between left and right aligned items.
	let l:statusline.='%='

	let l:statusline.='%#SpellLocal#'
	let l:statusline.="%{&spell?'[SPELL]\ ':'\ '}"

	" Filetype
	let l:statusline.='%#FileType#'
	let l:statusline.="%{&filetype!=#''?&filetype.' ':'none '}"

	" Encoding & Fileformat
	let l:statusline.='%#WarningMsg#'
	let l:statusline.="%{&fileencoding!='utf-8'?'['.&fileencoding.'] ':''}"


	"setlocal statusline.=%#FileFormat#
	"setlocal statusline.=\ %-7([%{&fileformat}]%)

	let l:statusline.='%#Percent#'
	let l:statusline.='%03.p%%'

	" Location of cursor in line
	let l:statusline.=' %#Column#'
	let l:statusline.='-%c-'

	return l:statusline

endfunction

function! StatusLineNC()

	let l:statusline=''
	" Buffer number
	let l:statusline.='[%n]'

	" File name
	let l:statusline.=' %t'

    let l:statusline .= "%{&readonly?'!':''}"
    let l:statusline .= "%{&modified?'*':''}"

	" Truncate line here
	let l:statusline.='%<'

	" Separation point between left and right aligned items.
	let l:statusline.='%='

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
