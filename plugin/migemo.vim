scriptencoding utf-8

func FindDict()
	for path in [
							\'dict/utf-8/migemo-dict',
							\'/usr/share/cmigemo/utf-8/migemo-dict',
							\]
		if filereadable(path)
			return path
		endif
	endfor
	return ''
endfunc

let g:migemo_dict_path = FindDict()

if executable('cmigemo') == '0'
	echo "Error: cmigemo is not installed"
endif
if !filereadable(g:migemo_dict_path)
	echo "Error: a dictionary for migemo is not found"
endif

func MigemoSearch()
	if !exists('s:migemo_channel')
		let migemo_args = '-v -n -q -d ' . g:migemo_dict_path
		let s:migemo_job = job_start('cmigemo ' . migemo_args)
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
