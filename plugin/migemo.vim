scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let g:migemo_path = $VIM . '/cmigemo.exe'
let g:migemo_dict_path = $VIM . '/dict/utf-8/migemo-dict'

if executable(g:migemo_path) == '0'
	echo "Error: cmigemo is not installed"
endif
if !filereadable(g:migemo_dict_path)
	echo "Error: a dictionary for migemo is not found"
endif
let migemo_args = '-v -n -q -d ' . g:migemo_dict_path
let migemo_job = job_start(g:migemo_path . ' ' . migemo_args)
let migemo_channel = job_getchannel(migemo_job)

func MigemoSearch(channel)
	let word = input('MIGEMO:')
	let pattern =  ch_evalraw(a:channel, word . "\n")
	let @/ = pattern
	let v:errmsg = ''
	silent! normal n
	if v:errmsg != ''
		echohl ErrorMsg
		echo v:errmsg
		echohl None
	endif
	"call search(pattern)
endfunc

:nmap z :call MigemoSearch(migemo_channel)<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
