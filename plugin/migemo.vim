scriptencoding utf-8

let g:migemo_path = $VIM . '/cmigemo.exe'
let g:migemo_dict_path = $VIM . '/dict/utf-8/migemo-dict'

if executable(g:migemo_path) == '0'
	echo "Error: cmigemo is not installed"
endif
if !filereadable(g:migemo_dict_path)
	echo "Error: a dictionary for migemo is not found"
endif

func MigemoSearch()
	if !exists('s:migemo_channel')
		let migemo_args = '-v -n -q -d ' . g:migemo_dict_path
		let s:migemo_job = job_start(g:migemo_path . ' ' . migemo_args)
		let s:migemo_channel = job_getchannel(s:migemo_job)
	endif
	let word = input('MIGEMO:')
	let pattern =  ch_evalraw(s:migemo_channel, word . "\n")
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

nnoremap <leader>mi :call MigemoSearch()<cr>
